import 'package:bloodproject/homepage.dart';
import 'package:bloodproject/secondhome.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
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
      Container(
        child:
        Positioned(
          child: Image.network("https://content.presspage.com/uploads/1873/1920_donatingblood.jpg?10000",height:500
                , width:MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
        ),
    ),
          Positioned(top: 600,
            left: 70,
            height: 50,
            width:300 ,

            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ), onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => homepage()
              ),);
            },
                child: const Text("login",style: TextStyle(color: Colors.white),)),
          ),
      Positioned(top: 680,
        left: 70,
        height: 50,
        width:300 ,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ), onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => secondhome()
          ),);
        },
            child: const Text("signup",style: TextStyle(color: Colors.white),)),
      ),

    ],
    ),
    ),
    );
  }
}
