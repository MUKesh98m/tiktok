import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;
  myUser({
    required this.name,
    required this.email,
    required this.profilePhoto,
    required this.uid,
  });

  //App to Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid
    };
  }

  //Firebase(Map)  to App(user)

  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
        name: snapshot['name'],
        email: snapshot['email'],
        profilePhoto: snapshot['profilePhoto'],
        uid: snapshot['uid']);
  }
}