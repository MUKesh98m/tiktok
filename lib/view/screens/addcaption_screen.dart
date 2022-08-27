import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/constant.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/upload_video_controller.dart';
import 'package:tiktok/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';

class addCaption_screen extends StatefulWidget {
  File videoFile;
  String videopath;
  addCaption_screen(
      {Key? key, required this.videoFile, required this.videopath})
      : super(key: key);

  @override
  State<addCaption_screen> createState() => _addCaption_screenState();
}

class _addCaption_screenState extends State<addCaption_screen> {
  late VideoPlayerController videoPlayerController;
  VideoUploadController videoUploadController =
      Get.put(VideoUploadController());
  TextEditingController songNameController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoPlayerController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextInputField(
                        controller: songNameController,
                        myIcon: Icons.music_note,
                        myLabelText: "Song Name"),
                    SizedBox(
                      height: 10,
                    ),
                    TextInputField(
                        controller: captionController,
                        myIcon: Icons.closed_caption,
                        myLabelText: "Caption"),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        videoUploadController.uploadVideo(
                            songNameController.text,
                            captionController.text,
                            widget.videopath);
                      },
                      child: Text("Upload"),
                      style: ElevatedButton.styleFrom(primary: buttonColor),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}