import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String name;
  final String uid;
  final String username;
  
  UserModel(
      {required this.email,
      required this.name,
      required this.username,
      required this.uid});

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "name": name,
        "username": username,
      };

  static UserModel? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
    );
  }
}
