import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/protien_model.dart';


class PopularCard extends StatelessWidget {
  final ProteinSource source;
  const PopularCard({Key? key, required this.source}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 350,
            height: 80,
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // Set your desired border color here
                width: 2, // Set the border width
              ),
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${source.name}",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff1D1617))),
                    Text('${source.weight} | ${source.totalProtein} Protein | ${source.totalCalories}Cal',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.normal,color: Color(0xff7B6F72)),)
                  ],
                ),
                Container(
                  width: 91,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: Color(0xffF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  child: Center(
                      child:Text('0gm',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff318D35)),)
                  ),
                )
              ],
            ),
          ),
        ),
      );

  }
}