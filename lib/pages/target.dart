import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../models/protien_model.dart';
import '../provider/ProteinListProvider.dart';
import '../provider/targetProvider.dart';

class Target extends StatelessWidget {
  final double? goal;

  const Target({Key? key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProteinSource> list = Provider.of<ProteinListProvider>(context).proteinSources;
    double sumOfQuantities = list.fold(0, (sum, item) => sum + ((item.quantity!* item.totalCalories!)/item.weight! ?? 0));
    sumOfQuantities = double.parse(sumOfQuantities.toStringAsFixed(1));
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Color(0xffFFFFFF),
      body: Consumer<TargetProvider>(
        builder: (context, targetProvider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 255,
                  height: 89,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Today you have consumed\n',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' ${sumOfQuantities} calories',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                            color: Color(0xffB94762),
                          ),
                        ),
                        TextSpan(
                          text: 'so far',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: CircularPercentIndicator(
                    radius: 130.0,
                    animation: true,
                    animationDuration: 1350,
                    lineWidth: 20.0,
                    percent: (sumOfQuantities / targetProvider.goal!),
                    center: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${sumOfQuantities} cal',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Color(0xffC9385A),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: '/${targetProvider.goal} cal',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Color(0xff3D4FED),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Color(0xffD9D9D9),
                    progressColor: Color(0xff4A63EC),
                  ),
                ),
                Container(
                  width: 282,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'You are ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xff000000),
                          ),
                        ),
                        TextSpan(
                          text: '${targetProvider.goal!-sumOfQuantities} cals ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xff4A63EC),
                          ),
                        ),
                        TextSpan(
                          text: 'behind to achieve your Target🎯',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Update it For Today",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(315, 60),
                      primary: Color(0xff4A63EC),
                      onPrimary: Colors.white,
                      onSurface: Colors.blue,
                      elevation: 5,
                      side: BorderSide(
                        color: Colors.white,
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99),
                      ),
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      title: const Text(
        'Target🎯 ',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leadingWidth: 75,
      leading: Row(
        children: [
          SizedBox(width: 20),
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
            ),
          ),
        ],
      ),
    );
  }
}
