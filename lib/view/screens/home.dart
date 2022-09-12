import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:tiktok/view/screens/auth/add_data.dart';
import 'package:tiktok/view/screens/auth/drawer.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final controllername = TextEditingController();

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeinput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    timeinput.text = "";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text("TODO"), backgroundColor: Colors.teal),
        drawer: drawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    content: Text("Add Daily Work detail"),
                    actions: [
                      SingleChildScrollView(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.person),
                                      labelText: 'Enter Task'),
                                  controller: controllername,
                                ),
                                TextField(
                                  controller:
                                      timeinput, //editing controller of this TextField
                                  decoration: InputDecoration(
                                      icon: Icon(
                                          Icons.timer), //icon of text field
                                      labelText:
                                          "Pick Time" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      print(pickedTime
                                          .format(context)); //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      //converting to DateTime so that we can further format on different pattern.
                                      print(
                                          parsedTime); //output 1970-01-01 22:53:00.000
                                      String formattedTime =
                                          DateFormat('HH:mm a')
                                              .format(parsedTime);
                                      print(formattedTime); //output 14:59:00
                                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                                      setState(() {
                                        timeinput.text =
                                            formattedTime; //set the value of text field.
                                      });
                                    } else {
                                      print("Time is not selected");
                                    }
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.date_range),
                                      labelText: 'Pick date'),
                                  controller: dateInput,
                                  onTap: () async {
                                    datewise();
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat.yMMMd('en_US')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      setState(() {
                                        dateInput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('student')
                                          .add({
                                        'name': controllername.text,
                                        'timeInput': timeinput.text,
                                        'dateInput': dateInput.text
                                      });
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  homepage()));
                                    },
                                    child: Text("Click Me"))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
        body: Scaffold(
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('student')
                .orderBy('dateInput', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 30, top: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          // color: Colors.red,
                          child: Text(
                            document['dateInput'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Card(
                            child: Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          // color: Colors.red,
                                          child: Text(document['name']),
                                        )),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(right: 20),
                                          width: 100,
                                          // color: Colors.yellow,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                      document['timeInput'])),
                                              Expanded(
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "student")
                                                            .doc(document[
                                                                'name'])
                                                            .delete();
                                                      },
                                                      child: Icon(
                                                        Icons.circle_outlined,
                                                        size: 20,
                                                      ))),
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                          ))
                    ],
                  ));
                }).toList(),
              );
            },
          ),
        ));
  }

  datewise() {
    DateTime now = new DateTime.now();
    var currentdate = new DateTime(now.year, now.month, now.day);
    final docuser = FirebaseFirestore.instance
        .collection('student')
        .doc('dateInput')
        .snapshots();
    if (dateInput == docuser) {
      // Fluttertoast.showToast(msg: "Item doesn't exist in the db");
      print("Item exists in the db");
    } else if (dateInput == currentdate) {
      print(" Value Is same");
    } else {
      print("Item does't exists in the db");
    }
  }
}