import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/controllers/auth_controlle.dart';
import 'package:tiktok/view/widgets/glich.dart';

import '../../widgets/text_input.dart';

class login1 extends StatelessWidget {
  login1({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
                child: Text("TikTok Clone",
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
                controller: _passwordController,
                myIcon: Icons.password,
                myLabelText: 'Password',
                toHide: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .login(_emailController.text, _passwordController.text);
                },
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