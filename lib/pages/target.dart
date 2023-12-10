import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class  Target extends StatelessWidget {
  const Target({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 255,
              height: 89,
              // color: Colors.red,
              child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Today you have consumed\n', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 16,color: Colors.black,),),
                      TextSpan(text: ' 860 calories', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 32,color: Color(0xffB94762)),),
                      TextSpan(text: 'so far', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 16,color: Colors.black,),),

                    ],
                  )
              ),
            ),
            Center(
              child: CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 1350,
                lineWidth: 20.0,
                percent: (860/1000),
                center: RichText(
                  text: TextSpan(children:[
                    TextSpan(text: '860 cal', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 16,color: Color(0xffC9385A),fontStyle: FontStyle.italic),),
                    TextSpan(text: '/1000 cal', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 16,color: Color(0xff3D4FED),fontStyle: FontStyle.italic),),
                  ]
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
                text: TextSpan(children:[
                  TextSpan(text: 'You are ', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 20,color: Color(0xff000000)),),
                  TextSpan(text: '160 calories ', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 20,color: Color(0xff4A63EC),),),
                  TextSpan(text: 'behind \n   to achieve your Target🎯', style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 20,color: Color(0xff000000)),),
                ]
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(bottom: 53),
              child:ElevatedButton(
                onPressed: () {
                  //   Navigator.push(
                  //       context ,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               HomePage()));
                }, //This prop for beautiful expressions
                child: Text(
                  "Update it For Today",
                  style: GoogleFonts.poppins(fontSize: 16,fontWeight:FontWeight.bold ),), // This child can be everything. I want to choose a beautiful Text Widget
                style: ElevatedButton.styleFrom(
                  // textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  minimumSize: Size(315, 60), //change size of this beautiful button
                  // We can change style of this beautiful elevated button thanks to style prop
                  primary: Color(0xff4A63EC), // we can set primary color
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
      ),

    );
  }

  AppBar appBar(context){
    return AppBar(
      title: const Text('Target🎯 ',
        style: TextStyle(
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

}
