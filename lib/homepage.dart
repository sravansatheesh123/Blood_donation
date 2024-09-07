import 'package:bloodproject/intro.dart';
import 'package:bloodproject/secondhome.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                child: Image.asset('assets/images/8d54d0e2bf9ca5638cf5e6cfa18d69b1-removebg-preview.png', height: 300,width:300)) ,
    // Positioned(top: 320,left: 200,right: 200,
    // child: Text("GIVE THE GIFT OF LIFE:",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
    Positioned(top:250,left: 100,
    child: Text("DONATE BLOOD & SAVE LIFE",style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w500),),),
            Positioned(top: 280,left:70,height: 300,width: 300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Username TextField
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Password TextField
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 5),
                    Positioned(top: 450,left: 500,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Colors.white,
                          ), onPressed: () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HomeP()),);
                      },
                          child: const Text("Login",style: TextStyle(color: Colors.red,)),),
                    ),


                    Positioned(top:500 ,
                      child: TextButton(
                        onPressed: () {Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>secondhome()),);
                        },
                        child: const Text(
                          'forgot password',style: TextStyle(fontSize: 15,color:  Colors.white),),),
                    ),
                    Positioned(top: 100,left: 400,
                      child: Text("DO YOU  HAVE AN ACCOUNT?",style: TextStyle(color: Colors.white),)
                    ),
                    // Login Button
                  ],
                ),
              ),
            ),
            Positioned(bottom: 360,left: 180,
              child: TextButton(
                onPressed: () {Navigator.push(
                  context, MaterialPageRoute(builder: (context) => secondhome()),);

                },
                child: const Text('signup',style:TextStyle(color: Colors.red),),),
            ),
          ],),


      ),

    );
  }
}

