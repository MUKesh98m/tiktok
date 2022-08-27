import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/video_controller.dart';
import '../widgets/TikTokVideoPlayer.dart';
import '../widgets/albumRotater.dart';
import '../widgets/profileButton.dart';


class DisplayVideo_Screen extends StatelessWidget {
  DisplayVideo_Screen({Key? key}) : super(key: key);
  final VideoController videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  TikTokVideoPlayer(
                    videoUrl: data.videoUrl,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.username,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text(
                          data.caption,
                        ),
                        Text(
                          data.songName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 400,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          profileButton(
                            profilePhotoUrl: data.profilePic, profileImageUrl: '',
                          ),

                          Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 45,
                                color: Colors.white,
                              ),
                              Text(
                                data.likes.length.toString(),
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.reply,
                                size: 45,
                                color: Colors.white,
                              ),
                              Text(
                                data.shareCount.toString(),
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.comment,
                                size: 45,
                                color: Colors.white,
                              ),
                              Text(
                                data.commentsCount.toString(),
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(height: 20,),
                              Column(
                                children: [
                                  AlbumRotator(profilePicUrl: data.profilePic)

                                ],
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
      }
      ),
    );
  }
}