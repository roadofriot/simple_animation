import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ImageRotate(),
  ));
}

class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() =>  _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =  AnimationController(
      vsync: this,
      duration:  Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      color: Colors.black,
      child:  AnimatedBuilder(
        animation: animationController,
        child:  Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:  Image.asset('images/oom.png'),
        ),
        builder: (BuildContext context, Widget _widget) {
          return  Transform.rotate(
            angle: animationController.value * 6.3,
            child: _widget,
          );
        },
      ),
    );
  }
}