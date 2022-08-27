import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileButton extends StatelessWidget {
  profileButton({Key? key, required this.profileImageUrl, required String profilePhotoUrl}) : super(key: key);
  String profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Stack(children: [
        Positioned(
            child: Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1661227798~exp=1661228398~hmac=4d92d1b31bc4eeeecca52a2da11a98986333dd1dc7d203b8a3432e85a66d8913"),
                fit: BoxFit.cover,
              )),
        ))
      ]),
    );
  }
}