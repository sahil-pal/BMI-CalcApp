import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Output extends StatelessWidget {
  
  late double _BMI;
  late String _BMICategories;
  late IconData iconData;
  
  Output(double BMI,String BMICategories,bool flag){
    this._BMI = BMI;
    this._BMICategories = BMICategories;
    if(flag){
      iconData = Icons.female_outlined;
    }
    else{
      iconData = Icons.male_sharp;
    }
  }

  _getStyle(double size,Color color,FontWeight fontweight ){
    return GoogleFonts.oswald(fontSize: size,color: color,fontWeight: fontweight);
  }

  _getResultBox(String label,value){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15),
          color : Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(label.toUpperCase(),style: _getStyle(25,Colors.red,FontWeight.bold),),
              Text(value.toString(),style: _getStyle(25,Colors.purple,FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child :Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _getResultBox('bmi value',_BMI.toStringAsPrecision(4)),
          _getResultBox('bmi category',_BMICategories),
          Container(child: Icon(iconData,size: 50,),),
        ],
      )
    );
  }
}