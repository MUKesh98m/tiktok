

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constant.dart';
import 'package:get/get.dart';
import 'package:tiktok/view/screens/addcaption_screen.dart';
import 'dart:io';

class addVideoScreen extends StatelessWidget {
  const addVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: () => showDialogOt(context),
        ),
      ),
    );
  }

  showDialogOt(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(children: [
        SimpleDialogOption(
          child: Text("Gellery"),
          onPressed: () {
            videoPicker(ImageSource.gallery, context);
          },
        ),
        SimpleDialogOption(
          child: Text("Camera"),
          onPressed: () {
            videoPicker(ImageSource.camera, context);
          },
        ),
        SimpleDialogOption(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }

  videoPicker(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => addCaption_screen(
                  videoFile: File(video.path), videopath: video.path)));
    } else {
      Get.snackbar("Error in Selecting Video", "Please choose Another Video");
    }
  }
}