import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class AddData extends StatelessWidget {
  final controllername = TextEditingController();
  final controllersarname = TextEditingController();
  final controllerage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Add Your TODO"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'First name'),
                  controller: controllername,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Last name'),
                  controller: controllersarname,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Enrollment'),
                  controller: controllerage,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('student').add({
                        'name': controllername.text,
                        'Sarname': controllersarname.text,
                        'Enrollment': controllerage.text
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => homepage()));
                    },
                    child: Text("Click Me"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}