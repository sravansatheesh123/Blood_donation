// import 'package:bldprjct/dbmanager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db.dart';
// import 'home.dart';
import 'intro.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  TextEditingController userctrlr = TextEditingController();
  TextEditingController agectrlr = TextEditingController();
  TextEditingController phctrlr = TextEditingController();
  TextEditingController emctrlr = TextEditingController();
  TextEditingController bdctrlr = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final DatabaseService dbDonnerManager = DatabaseService();
  Donner? dnnr;
  late List<Donner> donlist;
  late int updateIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red
          ,
          title:
          Center(child: Text("BLOOD DONATION")),
          actions: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search),),
                IconButton(onPressed: () {}, icon: Icon(Icons.more),)
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
        body:
        Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: userctrlr,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Enter Name",
                    iconColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (String? value) {
                    if (value!.length == 0) {
                      return "Name is empty";
                    }
                    if (value.contains("@")) {
                      return "it is not a valid name";
                    }
                  },
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Age",
                    iconColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.timeline),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  controller: agectrlr,
                  validator: (val) =>
                  val!.isNotEmpty ? null : "Age Should not be Empty",
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phone number",
                    iconColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.phone),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  controller: phctrlr,
                  validator: (val) =>
                  val!.isNotEmpty ? null : "Phone number Should not be Empty",
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    iconColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.mail),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  controller: emctrlr,
                  validator: (val) =>
                  val!.isNotEmpty ? null : "Email Should not be Empty",
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Blood Group",
                    iconColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.bloodtype_rounded),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  controller: bdctrlr,
                  validator: (val) =>
                  val!.isNotEmpty ? null : "Blood Group Should not be Empty",
                ),
                Padding(padding: EdgeInsets.all(6)),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        dbDonnerManager.insertDonner(Donner(name: userctrlr
                            .text,
                            age: agectrlr.text,
                            ph: phctrlr.text,
                            email: emctrlr.text,
                            bgrup: bdctrlr.text)).then((onValue) {
                          userctrlr.clear();
                          agectrlr..clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeP()),
                          );
                        });
                      }
                    },
                    child: Text("REGISTER",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold))),

              ],

            ),
          ),
        ),
      ),
    );
  }
  void submitDoner(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      final age = int.tryParse(agectrlr.text);
      if (age == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid age entered. Please enter a valid number.'),
        ));
        return;
      }

      if (dnnr == null) {
        Donner dr = Donner(name: userctrlr.text,  ph: phctrlr.text, email: emctrlr.text, age:agectrlr.text, bgrup: bdctrlr.text,  );
        dbDonnerManager.insertDonner(dr).then((value) {
          userctrlr .clear();
          phctrlr.clear();
          emctrlr.clear();
          agectrlr.clear();
          bdctrlr.clear();
          print("Doner Data added to database $value");
        });
      } else {
        dnnr?.age = agectrlr.text;
        dnnr?.name = userctrlr.text;
        dnnr?.bgrup = bdctrlr.text;
        dnnr?.ph = phctrlr.text;
        dnnr?.ph = emctrlr.text;


        dbDonnerManager.updatedonner(dnnr!).then((value) {
          setState(() {
            donlist[updateIndex].name = userctrlr.text;
            donlist[updateIndex].age = agectrlr.text;
            donlist[updateIndex].bgrup = bdctrlr.text;
            donlist[updateIndex].email = emctrlr.text;
            donlist[updateIndex].ph = phctrlr.text;

          });
          userctrlr.clear();
          agectrlr.clear();
          bdctrlr.clear();
          emctrlr.clear();
          phctrlr.clear();

          dnnr = null;
        });
      }
    }
  }
}