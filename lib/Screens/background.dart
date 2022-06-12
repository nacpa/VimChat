
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatvim/consts/Dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              WavyHeader(),
              Positioned(top: Dim.Hight20*5,right: Dim.Hight30*2,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/logo.png'),
                      height: Dim.Hight10*15,
                    ),
                    TypewriterAnimatedTextKit(repeatForever: false,
                      text: ['ViMcHaT'],
                      textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: Dim.Hight10*4.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(top: Dim.Hight10*22.5,right: Dim.Hight10*7,child: Container(height: Dim.Hight20*5,width:Dim.Hight20*5 ,
                decoration: BoxDecoration(color: Colors.deepOrangeAccent,borderRadius: BorderRadius.circular(Dim.Hight10*4.5),image: DecorationImage(image: AssetImage('assets/images/clock.png'))),

              ))
            ],
          ),
          SizedBox(height: Dim.Hight10*5.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(Dim.Hight10*0.5),
                  child: GestureDetector( onTap: (){
                    Get.toNamed('LoginScreen',
                    );
                  },
                    child: Container(height: Dim.Hight10*6.0,width:Dim.Width10*25.0,decoration: BoxDecoration(gradient: LinearGradient(
                        colors: orangeGradients,
                        begin: Alignment.topLeft,
                        end: Alignment.center),borderRadius: BorderRadius.circular(Dim.Hight10*3.0)),
                      child:Center(child: Text('Login',style: TextStyle(letterSpacing: 2,fontSize: Dim.Hight10*2.5,color: Colors.white,fontWeight: FontWeight.w900),))),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(5.0),
                  child: GestureDetector(onTap: ()=>Get.toNamed('Registrationscreen') ,
                    child: Container(height: Dim.Hight10*6.0,width:Dim.Width10*25.0,decoration: BoxDecoration(gradient: LinearGradient(
                        colors: orangeGradients,
                        begin: Alignment.topLeft,
                        end: Alignment.center),borderRadius: BorderRadius.circular(Dim.Hight10*3.0)),
                      child:Center(child: Text('Signup',style: TextStyle(letterSpacing: 2,fontSize: Dim.Hight10*2.5,color: Colors.white,fontWeight: FontWeight.w900),))),
                  ),
                ),

              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              WavyFooter(),
              CirclePurple(),
              CircleBlue(),
            ],
          )
        ],
      ),
    );
  }
}














const List<Color> orangeGradients = [
  Color(0xFFF2A0537),
  Color(0xFF4A12EB),
  Color(0xFFFD7267),
];

const List<Color> aquaGradients = [
  Color(0xFFAD2DDA),
  Color(0xFB6DBE3),
];

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: orangeGradients,
              begin: Alignment.topLeft,
              end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}

class WavyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: aquaGradients,
              begin: Alignment.center,
              end: Alignment.bottomRight),
        ),
        height: MediaQuery.of(context).size.height / 3,
      ),
    );
  }
}

class CirclePurple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-70.0, 90.0),
      child: Material(
        color: Colors.purple,
        child: Padding(padding: EdgeInsets.all(Dim.Hight10*12.0)),
        shape: CircleBorder(side: BorderSide(color: Colors.blueGrey, width: Dim.Width10*1.5)),
      ),
    );
  }
}

class CircleBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, 210.0),
      child: Material(
        color: Colors.indigo[800],
        child: Padding(padding: EdgeInsets.all(Dim.Hight10*14.0)),
        shape: CircleBorder(side: BorderSide(color: Colors.deepOrangeAccent, width: Dim.Width10*1.5)),
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


