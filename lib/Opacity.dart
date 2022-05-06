import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class WaveCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    debugPrint(size.width.toString());
    final path = new Path()
      ..moveTo(size.width * .6, 0)
      ..quadraticBezierTo(
        size.width * .7,
        size.height * .08,
        size.width * .9,
        size.height * .05,
      )
      ..arcToPoint(
        Offset(
          size.width * .93,
          size.height * .15,
        ),
        radius: Radius.circular(size.height * .05),
        largeArc: true,
      )
      ..cubicTo(
        size.width * .6,
        size.height * .15,
        size.width * .5,
        size.height * .46,
        0,
        size.height * .3,
      )
      ..lineTo(0, 0)
      ..close();


    return path;


  }



  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class WaveCliper1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    debugPrint(size.width.toString());
    var path =new Path();
    path.lineTo(0, size.height*0.7);


    path.cubicTo(
      size.width *0.5,
      size.height * .6,
      size.width * .5,
      size.height * .9,
      size.width,
      size.height);




    path.lineTo(0, 0);
    path.close();

    return path;


  }





  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
class WaveCliper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    debugPrint(size.width.toString());
    var path =new Path();
    path.lineTo(0, size.height/2);

    var firstStart= Offset(size.width*0.3, size.height*0.65);
    var firstEnd= Offset(size.width*0.6, size.height*(0.5));
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart=Offset(size.width*0.8, size.height*0.4);
    var secondEnd=Offset(size.width*0.9, size.height*0.3);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);


    var secondStart1=Offset(size.width*0.7, size.height*0.15);
    var secondEnd1=Offset(size.width*1/2, size.height/6);
    path.conicTo(secondStart1.dx, secondStart1.dy, secondEnd1.dx, secondEnd1.dy,20);


    path.lineTo(0, 0);
    path.close();

    return path;


  }





  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    var path = new Path();
    path.lineTo(0, size.height * 0.3);

    path.quadraticBezierTo(size.width * 0.35, size.height * 0.4, size.width * 0.7, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.19, size.width * 0.9, size.height * 0.15);
    path.quadraticBezierTo(size.width , size.height * 0.05, size.width * 0.6, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}