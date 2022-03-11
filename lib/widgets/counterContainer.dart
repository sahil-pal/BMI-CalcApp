import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterContainer extends StatelessWidget {

  late String heading;
  late int value;
  Function fn;

  CounterContainer(Function this.fn,String this.heading,int this.value);

  _getStyle(double size,Color color,{FontWeight fontWeight = FontWeight.bold}){
    return GoogleFonts.oswald(fontSize: size,color: color,fontWeight: fontWeight);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(heading,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                Text(value.toString(),style: GoogleFonts.oswald(fontSize: 45,fontWeight: FontWeight.bold,color : Colors.green)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade400,
                          shape: CircleBorder()
                        ),
                      onPressed: ()=>{fn(-1)}, 
                      child: Text('-',style: _getStyle(30,Colors.purple),)
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade400,
                          shape: CircleBorder()
                      ),
                      onPressed: ()=>{
                      fn(1)
                    }, child: Text('+',style: _getStyle(30,Colors.purple),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      flex: 1,
    );
  }
}