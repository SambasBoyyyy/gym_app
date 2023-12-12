import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/provider/ProteinListProvider.dart';
import 'package:provider/provider.dart';
import '../stats/Stats.dart';
import '../goal.dart';
import '../target.dart';
import 'card.dart';



class Protien_list extends StatefulWidget {
  const Protien_list({Key? key}) : super(key: key);

  @override
  State<Protien_list> createState() => _ListState();
}

class _ListState extends State<Protien_list> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          color:Color(0xffF2F3F5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(
                    context ,
                    MaterialPageRoute(
                        builder: (context) =>
                            Goal()));
              },
              icon: Image.asset(
                "assets/flags.png",

              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(
                    context ,
                    MaterialPageRoute(
                        builder: (context) =>
                            Target()));
              },
              icon: Image.asset(
                "assets/target.png",

              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(
                    context ,
                    MaterialPageRoute(
                        builder: (context) =>
                            Stats()));
              },
              icon:Image.asset(
                "assets/bars.png",

              ),
            ),
          ],
        ),
      ),
      body:Center(
        child: Consumer<ProteinListProvider>(
    builder: (context, listProvider, child) {
      return Container(
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),

            Text('Food Category', style: GoogleFonts.inter(fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xff4581DC))),
            SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                ChoiceChip(
                  // backgroundColor: Color(0xffE8E8E8),
                  disabledColor: Color(0xffE8E8E8),
                  selectedColor: Color(0xffE1E6F2),
                  label: Text('Raw', style: GoogleFonts.inter(fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
                  selected: listProvider.selectedCategory == 'raw',
                  onSelected: (isSelected) {
                    listProvider.updateSelectedProteinSources('raw');
                  },


                ),
                SizedBox(width: 18,),
                ChoiceChip(
                  disabledColor: Color(0xffE8E8E8),
                  selectedColor: Color(0xffE1E6F2),
                  label: Text('Cooked', style: GoogleFonts.inter(fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
                  selected: listProvider.selectedCategory == 'cooked',
                  onSelected: (isSelected) {
                    listProvider.updateSelectedProteinSources('cooked');
                  },
                ),
                SizedBox(width: 18,),
                ChoiceChip(
                  disabledColor: Color(0xffE8E8E8),
                  selectedColor: Color(0xffE1E6F2),
                  label: Text('Other', style: GoogleFonts.inter(fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
                  selected: listProvider.selectedCategory == 'other',
                  onSelected: (isSelected) {
                    listProvider.updateSelectedProteinSources('other');
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Select Foods For Today', style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4C7CC5))),
            ),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listProvider.getFilteredProteinSources().length,
                itemBuilder: (context, index) {
                  final source = listProvider.getFilteredProteinSources()[index];
                  return PopularCard(source: source);
                },
              ),
            ),


          ],
        ),
      );
    }
        ),
      ),


    );
  }
}

