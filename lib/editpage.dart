// import 'package:bldprjct/dbmanager.dart';
import 'package:flutter/material.dart';

import 'db.dart';

class DonerDetails extends StatefulWidget {
  const DonerDetails({super.key});

  @override
  State<DonerDetails> createState() => _DonerDetailsState();
}

class _DonerDetailsState extends State<DonerDetails> {
  final DatabaseService dbDonerManager = DatabaseService();

  late Future<List<Donner>> donerListFuture;

  @override
  void initState() {
    super.initState();
    _loadDonerList(); // Initialize the donor list
  }

  void _loadDonerList() {
    setState(() {
      donerListFuture = dbDonerManager.getDonnerList();
    });
  }

  showAlertDialog(BuildContext context, Donner doner) {
    TextEditingController userctrlr = TextEditingController(text: doner.name);
    TextEditingController agectrlr = TextEditingController(text: doner.age);
    TextEditingController bdctrlr = TextEditingController(text: doner.bgrup);
    TextEditingController emctrlr = TextEditingController(text: doner.email);
    TextEditingController phctrlr = TextEditingController(text: doner.ph);

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.red[100],
      title: const Text("Update Donor"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Name"),
            controller: userctrlr,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Age"),
            controller: agectrlr,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Blood Group"),
            controller: bdctrlr,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Email"),
            controller: emctrlr,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Phone"),
            controller: phctrlr,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[300]
          ),
          onPressed: () {
            Donner updatedDonner = Donner(
              id: doner.id, // Keep the same ID
              name: userctrlr.text,
              age: agectrlr.text,
              bgrup: bdctrlr.text,
              email: emctrlr.text,
              ph: phctrlr.text,
            );

            // Call the update method
            dbDonerManager.updatedonner(updatedDonner).then((value) {
              // Reload donor list after update
              _loadDonerList(); // Ensure donor list is refreshed
              Navigator.of(context).pop();
            });
          },
          child: const Text("Update", style: TextStyle(color: Colors.black)),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          title: const Text("Blood Bank"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder(
            future: donerListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading donors.'));
              } else if (snapshot.hasData) {
                List<Donner> donerlist = snapshot.data as List<Donner>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: donerlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    Donner dr = donerlist[index];
                    return Card(
                      color: Colors.red[200],
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('ID: ${dr.id}'),
                                  Text('Name: ${dr.name}'),
                                  Text('Age: ${dr.age}'),
                                  Text('Blood Group: ${dr.bgrup}'),
                                  Text('Email: ${dr.email}'),
                                  Text('Phone: ${dr.ph}'),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showAlertDialog(context, dr);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              dbDonerManager.deletedonner(dr.id).then((value) {
                                _loadDonerList(); // Refresh list after deletion
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text('No Donors Found'));
            },
          ),
        ),
      ),
    );
  }
}