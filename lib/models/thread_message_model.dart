import 'package:cloud_firestore/cloud_firestore.dart';

class ThreadMessageModel {
  String id;
  String threadId;
  String message;
  String userName;
  String userImage;
  int likes;
  
  

  ThreadMessageModel({
    required this.id,
    required this.threadId,
    required this.message,
    required this.userName,
    required this.userImage,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'threadName': threadId,
      'threadId': message,
      'userName': userName,
      'userImage': userImage,
      'likes': likes,
    };
  }

  ThreadMessageModel.fromMap(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc.id,
      threadId = doc.data()!['threadId'] ?? '',
      message = doc.data()!['message'] ?? '',
      userName = doc.data()!['userName'] ?? '',
      userImage = doc.data()!['userImage'] ?? '',
      likes = doc.data()!['likes'] ?? 0;

  ThreadMessageModel.empty()
    : id = '',
      threadId = '',
      message = '',
      userName = '',
      userImage ='',
      likes = 0;
}