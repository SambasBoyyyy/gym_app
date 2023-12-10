import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/protien_model.dart';
import '../list/card.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  DateTime selectedDate = DateTime.now();
  List<ProteinSource> proteinSources = [] ;
  List<ProteinSource> selectedProteinSources = [];
  String selectedCategory = 'raw';// Initialize selectedDate with today's date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff596FE1), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xff596FE1), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
     var style = GoogleFonts.poppins(
      color: Color(0xff7B6F72),
      fontSize: 10,
    );
    return Text(meta.formattedValue, style: style);
  }

  void parseProteinSources(String jsonStr) {
    List<dynamic> jsonList = json.decode(jsonStr);
    proteinSources = jsonList.map((json) => ProteinSource.fromJson(json)).toList();
    updateSelectedProteinSources(selectedCategory);
  }

  void updateSelectedProteinSources(String category) {
    setState(() {
      selectedCategory = category;
      selectedProteinSources =
          proteinSources.where((source) => source.category == category).toList();
    });
  }

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/protein_sources.json');
    setState(() {
      parseProteinSources(jsonString);
    });
    //print(proteinSources.toString());
  }

  @override
  void initState() {
    loadJsonAsset();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('E, d MMM yyyy').format(selectedDate);

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Color(0xffFFFFFF),
      body:Center(
        child: Container(
          width: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Graphical Analysis',style: GoogleFonts.poppins(
                    color: Color(0xff1D1617),
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  Container(
                    width: 91,
                    height: 36,
                    decoration: ShapeDecoration(
                      color: Color(0xff525FD8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                    ),
                    child: Center(
                        child:Text('Last 30 Days',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),)
                    ),
                  )
                ],
              ),
              Graph(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Meal Consumption List',style: GoogleFonts.poppins(
                      color: Color(0xff1D1617),
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  ),),
                  Container(
                    width: 50,
                    height: 30,
                    decoration: ShapeDecoration(
                      color: Color(0xff6683E3 ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                    ),
                    child: Center(
                        child:Text('Edit',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),)
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context); // Call _selectDate method on icon click
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 10),
                      Icon(Icons.calendar_month,size: 22,color: Color(0xff7B6F72),),
                      SizedBox(width: 10), // Add some space between the icon and text
                      Text(formattedDate,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff7B6F72)),), // Show the selected date here
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: selectedProteinSources.length,
                  itemBuilder: (context, index) {
                    final source = selectedProteinSources[index];
                    return PopularCard(source: source);
                  },
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
  AppBar appBar(context){
    return AppBar(
      title:  Text('Analytics ',
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leadingWidth: 75,
      leading: Row(
        children: [
          SizedBox(width: 20), // Adjust the width of SizedBox for desired spacing
          GestureDetector(
            onTap: () {
              // Your onTap functionality
            },
            child: Container(
              height: 32,
              width: 32,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              ),
              // child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
              //   height: 20,
              //   width: 20,),
            ),
          ),
        ],
      ),
      // actions: [
      //   GestureDetector(
      //     onTap: (){},
      //     child: Container(
      //
      //       width: 37,
      //       margin: EdgeInsets.all(10),
      //       alignment: Alignment.center,
      //       decoration:  BoxDecoration(
      //         color: Color(0xffF7F8F8),
      //         borderRadius: BorderRadius.circular(10),
      //
      //       ),
      //       child: SvgPicture.asset('assets/icons/dots.svg',
      //         height: 5,
      //         width: 5,),
      //
      //     ),
      //   ),
      // ],
    );
  }

Graph(context){
    return Center(
      child: Container(
        width: 325,
        height: 200,
        child: LineChart(
          swapAnimationDuration : const Duration(milliseconds: 200),
          LineChartData(
            minX: 1,
            maxX: 30,
            minY: 0,
            maxY: 2500,
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color(0xffADA4A5),
                  strokeWidth: 0.8,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.transparent,
                  strokeWidth: 0,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.white, width: 1),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitles,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitles,
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 300),
                  FlSpot(2, 867),
                  FlSpot(4, 557),
                  FlSpot(6, 245),
                  FlSpot(8, 485),
                  FlSpot(9, 34),
                  FlSpot(11, 1900),
                  FlSpot(26, 0),
                  FlSpot(30, 844),

                ],
                isCurved: true,
                color:Color(0xff596FE1),
                barWidth: 3,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color:Color(0xffB3C2FF),
                ),
              ),
            ],
          ),

        ),
      ),
    );
}



}
