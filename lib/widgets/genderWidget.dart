import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderWidget extends StatelessWidget {
  bool flag;
  Function fn;

  GenderWidget(bool this.flag,Function this.fn);

  _getStyle(double size,Color color,{FontWeight fontWeight = FontWeight.bold}){
    return GoogleFonts.oswald(fontSize: size,color: color,fontWeight: fontWeight);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Gender',style: _getStyle(25, Colors.blue),)],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("I'm",style: _getStyle(50, Colors.black,fontWeight: FontWeight.bold),),
                Text("Male",style: _getStyle(30, Colors.orange,fontWeight: FontWeight.bold),),
                Switch(
                  value: flag,
                  onChanged: (bool value) {
                    fn(value);
                    print('Changed gender flag to : $value');
                  },
                 activeTrackColor: Colors.lightGreenAccent,
                 activeColor: Colors.green,
                ),
                Text("Female",style: _getStyle(30, Colors.pink,fontWeight: FontWeight.bold),),
              ],)
            ],
          ),
        )
      )
    );
  }
}