import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String anonymousId;
  String anonymousName;
  String email;
  String image;
  List<dynamic> favoriteList;
  List<dynamic> likedMessagesList;

  UserModel({
    required this.id,
    required this.anonymousId,
    required this.anonymousName,
    required this.email,
    required this.image,
    required this.favoriteList,
    required this.likedMessagesList
  });

  Map<String, dynamic> toMap() {
    return {
      'anonymousId': anonymousId,
      'anonymousName': anonymousName,
      'email': email,
      'image': image,
      'favoriteList': favoriteList,
      'likedMessagesList': likedMessagesList
    };
  }

  UserModel.fromMap(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc.id,
      anonymousId = doc.data()!['anonymousId'] ?? '',
      anonymousName = doc.data()!['anonymousName'] ?? '',
      email = doc.data()!['email'] ?? '',
      image = doc.data()!['image'] ?? '',
      favoriteList = doc.data()!['favoriteList'] ?? [],
      likedMessagesList = doc.data()!['likedMessagesList'] ?? [];

  UserModel.empty()
    : id = '',
      anonymousId = '',
      anonymousName = '',
      email = '',
      image = '',
      favoriteList = [],
      likedMessagesList = [];
}