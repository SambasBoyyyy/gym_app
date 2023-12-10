import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list/list.dart';



class Goal extends StatelessWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: Color(0xffFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                width: 257,
                height: 140,
                margin: EdgeInsets.only(top: screenHeight>900? 240:100 ),
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("      Set Your\nCalorie Goal \n    For Today",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 30,height: 1)),
              ),
              // SizedBox(height: 53,),
              Container(
                height: 40,
                width: 158,
                margin: EdgeInsets.only(left: 16,right: 16),

                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 40,
                          spreadRadius: 0.0
                      )
                    ]
                ),
                child: TextField(
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(

                        hintText: "Set Target ",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xff858C95)
                        ),
                        fillColor: Color(0xffF7F8F8),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        alignLabelWithHint: true,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none

                        )
                    )
                ),
              ),
              // SizedBox(height: 216,),
              Container(
                // margin: EdgeInsets.only(bottom: 53),
                child:ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context ,
                        MaterialPageRoute(
                            builder: (context) =>
                                Protien_list()));
                  }, //This prop for beautiful expressions
                  child: Text(
                    "Next",
                    style: GoogleFonts.poppins(fontSize: 16,fontWeight:FontWeight.bold ),), // This child can be everything. I want to choose a beautiful Text Widget
                  style: ElevatedButton.styleFrom(
                    // textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    minimumSize: Size(290, 50), //change size of this beautiful button
                    // We can change style of this beautiful elevated button thanks to style prop
                    primary: Color(0xff4581DC), // we can set primary color
                    onPrimary: Colors.white, // change color of child prop
                    onSurface: Colors.blue, // surface color
                    //shadow prop is a very nice prop for every button or card widgets.
                    elevation: 5, // we can set elevation of this beautiful button
                    side: BorderSide(
                        color: Colors.white, //change border color
                        width: 0, //change border width
                        style: BorderStyle.none), // change border side of this beautiful button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          99), //change border radius of this beautiful button thanks to BorderRadius.circular function
                    ),
                    tapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}