

import 'package:flutter/material.dart';

import 'addpage.dart';
import 'db.dart';
import 'editpage.dart';

class HomeP extends StatefulWidget {
  const HomeP({super.key});

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  String _selectedValue = 'Nothing selected';
  final DatabaseService dbStudentManager = DatabaseService();
  TextEditingController userctrlr = TextEditingController();
  TextEditingController agectrlr = TextEditingController();
  TextEditingController phctrlr = TextEditingController();
  TextEditingController emctrlr = TextEditingController();
  TextEditingController bdctrlr = TextEditingController();
  Donner? dnnr;
  late List<Donner> donlist;
  late int updateIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("GIVE BLOOD"),
          actions: [
            CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.g3udaH10H5ksI60tV93_ZQHaHa?pid=ImgDet&w=175&h=175&c=7&dpr=1.5')),
            // PopupMenuButton(
            //     onSelected: (String value) {
            //       setState(() {
            //         _selectedValue = value;
            //       });
            //       // do something with the selected value here
            //     },
            //     color: Colors.black,
            //     itemBuilder: (BuildContext ctx) =>
            //     [
            //       const PopupMenuItem(value: '1', child: Text('ABOUT')),
            //       const PopupMenuItem(value: '2', child: Text('PAYMENTS')),
            //       const PopupMenuItem(value: '3', child: Text('SETTINGS')),
            //       const PopupMenuItem(value: '4', child: Text('LOGOUT')),
            //     ]),
          ]),
      body: FutureBuilder(
        future: dbStudentManager.getDonnerList(),
        builder: (BuildContext context, AsyncSnapshot<List<Donner>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DonerDetails()));
                  },
                  title: Text("${snapshot.data![index].name}"),
                  subtitle: Text("${snapshot.data![index].bgrup}"),
                  trailing: SizedBox(
                    width: 100,
                    height: 50,
                    //   child: Row(
                    //     children: [
                    //       IconButton(
                    //
                    //       onPressed: ()  {
                    //
                    // },
                    //   icon: Icon(Icons.edit),
                    // ),
                    //       IconButton(
                    //           onPressed: () {
                    //
                    //           },
                    //           icon: Icon(
                    //             Icons.delete,
                    //           )),
                    //
                    //     ],
                    //   ),
                  ),
                  leading: CircleAvatar(
                    child: Text("${snapshot.data![index].name[0]}"),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addpage()),
          );
        },
        child: Icon(Icons.add),
      ),

      //
      // Positioned(bottom: 20, right: 30,
      //     child: IconButton(onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => addpage()),
      //       );
      //     }, icon: Icon(Icons.add, color: Colors.blueAccent,),)),
      // ]
    );
  }
}