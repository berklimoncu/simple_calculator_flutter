import 'package:flutter/material.dart';
import 'package:hw5/colors.dart';
import 'package:hw5/widgets/calculatorButton.dart';
import 'package:math_expressions/math_expressions.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final List<String> buttons = [
    'C',
    '+',
    'DEL',
    '=',
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '0',
    '.',
    '=',
  ];

  var tfController = TextEditingController();
  String takenValue = "";
  double result = 0;
  

  callback(newTakenValue) {
    setState(() {
      
      if (newTakenValue == 'C') { // In case of clear button
        takenValue = '';
        result = 0;
      } else if (newTakenValue == 'DEL') { //In case of delete button 
        if (takenValue != '') { // If entered value previously is different than empty string
          takenValue = takenValue.substring(0, takenValue.length - 1);
        }
      } else if (newTakenValue == '+') { //In case of + button
        if (takenValue != '') { // If entered value previously is different than empty string
          if (takenValue[takenValue.length - 1] != '+') {
            takenValue += newTakenValue;
          }
        }
      } else if (newTakenValue == '=') { // In case of == button
        
        if (takenValue.length!=0 && takenValue[takenValue.length - 1] != '+' && takenValue[takenValue.length - 1] != '.') { //If calculation is incomplete then make final calculation
          Parser p = Parser();
          Expression exp = p.parse(takenValue);
          ContextModel cm = ContextModel();
          result = exp.evaluate(EvaluationType.REAL, cm);
        }
      } else {
        takenValue += newTakenValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenRes = MediaQuery.of(context);
    final double height = screenRes.size.height;
    final double width = screenRes.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(width / 30),
            child: Container(
                width: width,
                height: height / 6,
                decoration: BoxDecoration(
                  color: xColor,
                  borderRadius: BorderRadius.all(Radius.circular(width / 20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      takenValue,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 24,
                      ),
                    ),
                    Text(
                      result != 0 ? result.toString() : "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 24,
                      ),
                    ),
                  ],
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      width: width ,
                      height: height,
                      button: buttons[0],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width,
                      height: height,
                      button: buttons[1],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width,
                      height: height ,
                      button: buttons[2],
                      callback: callback,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[4],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width,
                      height: height,
                      button: buttons[5],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height,
                      button: buttons[6],
                      callback: callback,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      width: width,
                      height: height ,
                      button: buttons[7],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[8],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[9],
                      callback: callback,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[10],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[11],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[12],
                      callback: callback,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[13],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[14],
                      callback: callback,
                    ),
                    CalculatorButton(
                      width: width ,
                      height: height ,
                      button: buttons[15],
                      callback: callback,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
