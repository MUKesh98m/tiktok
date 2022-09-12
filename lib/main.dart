import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/controllers/auth_controlle.dart';
import 'package:tiktok/view/screens/auth/login_screens.dart';
import 'package:tiktok/view/screens/auth/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'TikTok Clone',
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}