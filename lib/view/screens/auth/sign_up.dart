import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/view/widgets/glich.dart';

import '../../widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _setasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
                child: Text("Welcome To TikTok",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                myIcon: Icons.email,
                myLabelText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _setasswordController,
                myIcon: Icons.password,
                myLabelText: 'Set Password',
                toHide: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _confirmpasswordController,
                myIcon: Icons.password,
                myLabelText: 'Confirm Password',
                toHide: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text("Login"),
                ))
          ],
        ),
      ),
    );
  }
}