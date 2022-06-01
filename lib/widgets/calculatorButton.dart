import 'package:flutter/material.dart';
import 'package:hw5/colors.dart';

class CalculatorButton extends StatefulWidget {
  double width;
  double height;
  String button;

  final Function(String) callback;

  CalculatorButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.button,
      required this.callback})
      : super(key: key);

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isOperator(String operator) {
    if (operator == 'C' ||
        operator == '+' ||
        operator == 'DEL' ||
        operator == '=') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width/5,
      height: widget.width/5,
      child: ElevatedButton(
        onPressed: () {widget.callback(widget.button);}, 
        style: ElevatedButton.styleFrom(
          primary: isOperator(widget.button) ? Colors.orange : numberButton
        ),
        child: Text(
          widget.button,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.button=='DEL' ? widget.width/20:widget.width/12.5
          ),
        ),
      
      ),
    );

  
  }
}
