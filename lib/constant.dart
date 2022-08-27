import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tiktok/view/screens/add_video.dart';
import 'package:tiktok/view/screens/display_screens.dart';

// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  DisplayVideo_Screen(),
  Text('Home'),
  addVideoScreen(),
  Text('Message'),
  Text('Profile')
];