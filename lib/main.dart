import 'dart:async';

import 'package:bloodproject/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HOME(),
    );
  }
}
class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME>with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();

    Timer(Duration(seconds: 8),
            () =>
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>login()
              )
            )
    );

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
        Stack(
          children: [
            FadeTransition(
              opacity: _animation,
              child: Center(
                child:
                Image.asset("assets/images/jjj.png",height: 400,width: 400),
              ),
            ),
            Positioned(top: 650,left:36,
              child: Row(
                children: [
                  Text("GIVE THE GIFT OF LIFE:",style:TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                 Text("DONATE BLOOD & SAVE LIFE",style:TextStyle(color: Colors.red,fontSize:16,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            // Positioned(top: 650,left: 100,
            //   child: Text("DONATE BLOOD & SAVE LIFE",style:TextStyle(color: Colors.red,fontSize:14,fontWeight: FontWeight.w500),
            //   ),
            // ),


          ],
        ),
    ),);
  }

}
