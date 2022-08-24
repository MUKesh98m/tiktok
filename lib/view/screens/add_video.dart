import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constant.dart';
import 'package:get/get.dart';

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
            videoPicker(ImageSource.gallery);
          },
        ),
        SimpleDialogOption(
          child: Text("Camera"),
          onPressed: () {
            videoPicker(ImageSource.camera);
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

  videoPicker(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
    } else {
      Get.snackbar("Error in Selecting Video", "Please choose Another Video");
    }
  }
}