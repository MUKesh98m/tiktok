import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/model/user.dart';
import 'package:tiktok/view/screens/auth/login_screens.dart';
import 'package:tiktok/view/screens/home.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //image Picker
  File? proimg;
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final img = File(image.path);
    this.proimg = img;
  }

  //User State Persistance
  late Rx<User?> _user;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    //RX - Obserable Keyword
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialview);
  }

  _setInitialview(User? user) {
    if (user == null) {
      Get.offAll(() => login1());
    } else {
      Get.offAll(() => homepage());
    }
  }

//User Registration
  Future<void> SignUp(
      String email, String username, String password, File image) async {
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);
        myUser user = myUser(
            name: username,
            email: email,
            profilePhoto: downloadUrl,
            uid: credential.user!.uid);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            'Error Creating Account', "Please Enter All required Fills");
      }
      Get.snackbar(' Registration!', "User Registration Succesfully Completed");
    } catch (e) {
      print(e);
      Get.snackbar('Error Occured', e.toString());
    }
  }

  //Image upload code
  Future<String> _uploadProPic(File? image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('ProfilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image!);
    TaskSnapshot snapshot = await uploadTask;
    String imageDWrl = await snapshot.ref.getDownloadURL();
    return imageDWrl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Login in", "Please enter all the Fields ");
      }
    } catch (e) {
      Get.snackbar("Error Logging in", e.toString());
    }
  }
}