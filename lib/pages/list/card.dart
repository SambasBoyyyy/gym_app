import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/protien_model.dart';

class PopularCard extends StatefulWidget {
  final ProteinSource source;
  const PopularCard({Key? key, required this.source}) : super(key: key);

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  void initState() {
    print(widget.source.isSelected);
    super.initState();
  }
  void _showUpdateQuantityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double? newQuantity = widget.source.quantity;
        String quantityText = widget.source.quantity!.toStringAsFixed(2);// Initialize with current quantity
        return AlertDialog(
          title: Text('Quantity'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter new quantity'),
            onChanged: (value) {
              double? newQuantity = double.tryParse(value);
              if (newQuantity != null) {
                quantityText = newQuantity.toStringAsFixed(1);
              }
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Update quantity when the 'Update' button is pressed
                setState(() {
                  if (newQuantity != null && double.parse(quantityText)<1000) {
                    widget.source.quantity = double.parse(quantityText);
                    widget.source.isSelected = !widget.source.isSelected!;
                  }
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                // Update quantity when the 'Update' button is pressed
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(widget.source.isSelected==true){
          setState(() {

              widget.source.quantity = 0;
              widget.source.isSelected = !widget.source.isSelected!;

          });
        }
        else{
          _showUpdateQuantityDialog(context);
        }

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 350,
            height: 80,
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.source.isSelected != null
                    ? widget.source.isSelected!
                    ? Colors.green
                    : Colors.white
                    : Colors.red, // Set your desired border color here
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
                    Text(
                      "${widget.source.name}",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1D1617),
                      ),
                    ),
                    Text(
                      '${widget.source.weight} | ${widget.source.totalProtein} Protein | ${widget.source.totalCalories}Cal',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff7B6F72),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 94,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: Color(0xffF3F3F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.source.quantity} gm',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff318D35),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
