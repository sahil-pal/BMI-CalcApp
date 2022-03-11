import 'package:bmi_calc_app/widgets/genderWidget.dart';
import 'package:bmi_calc_app/widgets/heightWidget.dart';
import 'package:bmi_calc_app/widgets/output.dart';

import '/widgets/counterContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _age = 18;
  int _weight = 50;
  double BMI = 0;
  String BMICategory = '';
  // true - male and false - female
  bool gender = true;
  TextEditingController heightTC = TextEditingController();

  _setAgeValue(int value){
    this._age += value;
    setState(() {
      
    });
  }
  _setWeightValue(int value){
    this._weight += value;
    setState(() {
      
    });
  }

  _setGenderValue(bool flag){
    gender = flag;
    setState(() {
      
    });
  }

  _calcBMI(){
    print('weight : $_weight height : ${heightTC.text}');
    BMI = _weight/((double.parse(heightTC.text)/100)*(double.parse(heightTC.text)/100));
    _getCategory();
    setState(() {
      
    });
  }

  _getCalulateButton(){
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 15)
                ),
                onPressed: _calcBMI,
                child: Center(child: Text('calculate'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),))
              ),
        );
  }

  _getCategory(){
    if(BMI < 18.5){
      BMICategory = 'Under Weight';
    }
    else if(BMI < 24.9 && BMI > 18.5){
      BMICategory = 'Normal Weight';
    }
    else if(BMI > 24.9 && BMI < 29.9){
      BMICategory = 'Over Weight';
    }
    else{
      BMICategory = 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(padding: const EdgeInsets.all(8.0),child: Icon(Icons.menu,color: Colors.black,),),
        title: Center(child: Text('bmi calculator'.toUpperCase(),style: GoogleFonts.oswald(fontSize : 25,fontWeight : FontWeight.bold,color: Colors.black),)),
        actions: [Padding(padding: const EdgeInsets.all(8.0),child: Icon(Icons.dark_mode_rounded,color: Colors.grey,),)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CounterContainer(_setAgeValue, 'Age (In Years)', _age),
                CounterContainer(_setWeightValue, 'Weight (In kgs)', _weight)
              ],
            ),
            HeightWidget(heightTC, 'Enter Height in cms'),
            GenderWidget(gender,_setGenderValue),
            _getCalulateButton(),
            Output(BMI,BMICategory,gender)
          ],
        ),
      ),
    );
  }
}