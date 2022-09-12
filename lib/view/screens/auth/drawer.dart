import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/home.dart';

import 'add_data.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            height: 100,
          ),
          ListTile(
            title: Text("Add"),
            leading: Icon(Icons.add_task),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddData()));
            },
          ),
          ListTile(
            title: Text("Update Student detail"),
            leading: Icon(Icons.update),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => homepage()));
            },
          ),
          ListTile(
            title: Text("Delet Student Detail"),
            leading: Icon(Icons.delete),
          ),
          ListTile(
            title: Text("Share Data"),
            leading: Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}