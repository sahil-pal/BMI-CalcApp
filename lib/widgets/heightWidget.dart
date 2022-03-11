import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightWidget extends StatelessWidget {

  TextEditingController tc;
  String label;
  HeightWidget(TextEditingController this.tc,String this.label);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Height',style: GoogleFonts.pacifico(fontSize:25)),
              TextField(
                controller: tc,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                label: Text(label.toUpperCase(),style: GoogleFonts.roboto(fontSize:18,color:Colors.orange,fontWeight:FontWeight.bold)),
                hintText: 'Type Here...',
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}