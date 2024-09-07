import 'dart:async';

import 'package:bloodproject/homepage.dart';
import 'package:bloodproject/intro.dart';
import 'package:flutter/material.dart';

class secondhome extends StatelessWidget {
  const secondhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Container(
        height: MediaQuery
        .of(context)
        .size
        .height,
    width: MediaQuery
        .of(context)
        .size
        .width,
    child: Stack(
    children: [
    Positioned(top: 30,left: 100,
    height: 200,width: 200,
    child: Image.asset('assets/images/images__3_-removebg-preview.png',),),
      // Positioned(top: 570,left: 680,
      //   //  height: 17,width: 38,
      //   child: TextButton(
      //     onPressed: () {Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => homepage()),);


          // child: const Text('login',style:TextStyle(color: Colors.red),

      //     ),
      //   ),
      // ),

      Positioned(top: 530,left: 170,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.red,
            ), onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) =>HomeP()),);
        },
            child: const Text("signup",style: TextStyle(color: Colors.white),)),
      ),

      Positioned(top: 10,left: 5,height: 30,width: 30,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => homepage()),);
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
          ),),
      ),
    Positioned(top: 250,left:80,height: 300,width: 300,
    child: Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
    children: [
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter your username',
    labelText: 'full name',
    prefixIcon: Icon(Icons.person,color: Colors.red,),
    ),
    ),
    SizedBox(height: 10),
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter your email',
    labelText: 'email',
    prefixIcon: Icon(Icons.email,color: Colors.white),
    ),
    ),
    SizedBox(height: 10),
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter your password',
    labelText: 'passsword',
    prefixIcon: Icon(Icons.lock,color: Colors.red),
    ),
    ),
    SizedBox(height: 10),
    TextField(
    decoration: InputDecoration(
    hintText: ' conform password',
    labelText: 'conform password',
    prefixIcon: Icon(Icons.lock,color: Colors.white),
    ),
    ),
      Positioned(top: 480,left: 100,
          child: CheckBoxWidget()),
    ]
    ),),),
    ],
    ),),
    );
  }
}
class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: isChecked,
          activeColor: Colors.red,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Text( 'I accept the policy and terms',style:TextStyle(color: Colors.white),
    ),
    ]
    );
    }}