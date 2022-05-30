import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.text, required this.color, required this.goToPage});
  final Text text;
  final Color color;
  //final Function onpresed;
  String goToPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            print('hello');
            Navigator.pushNamed(context, goToPage);
          },
          minWidth: 200.0,
          height: 42.0,
          child: text,
        ),
      ),
    );
  }
}
