import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/controllers/auth_controlle.dart';
import 'package:tiktok/view/widgets/glich.dart';

import '../../widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _usernamecontroller = new TextEditingController();
  TextEditingController _setasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(
                  child: Text(
                "Welcome To TikTok",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1661227798~exp=1661228398~hmac=4d92d1b31bc4eeeecca52a2da11a98986333dd1dc7d203b8a3432e85a66d8913"),
                      backgroundColor: Colors.deepPurple,
                      radius: 60,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.black,
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _usernamecontroller,
                  myIcon: Icons.person,
                  myLabelText: 'Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  myIcon: Icons.email,
                  myLabelText: 'Username',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _setasswordController,
                  myIcon: Icons.lock,
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
                  myIcon: Icons.lock,
                  myLabelText: 'Confirm Password',
                  toHide: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthController.instance.SignUp(
                        _usernamecontroller.text,
                        _emailController.text,
                        _setasswordController.text,
                        AuthController.instance.proimg!);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text("Login"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}