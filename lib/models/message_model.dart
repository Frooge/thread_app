import 'package:cloud_firestore/cloud_firestore.dart';

class ThreadMessageModel {
  String id;
  String threadId;
  String message;
  String userName;
  String userImage;
  Timestamp timestamp;
  int likes;
  
  

  ThreadMessageModel({
    this.id = '',
    required this.threadId,
    required this.message,
    required this.userName,
    required this.userImage,
    required this.likes,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'threadId': threadId,
      'message': message,
      'userName': userName,
      'userImage': userImage,
      'likes': likes,
      'timestamp': timestamp,
    };
  }

  ThreadMessageModel.fromMap(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc.id,
      threadId = doc.data()!['threadId'] ?? '',
      message = doc.data()!['message'] ?? '',
      userName = doc.data()!['userName'] ?? '',
      userImage = doc.data()!['userImage'] ?? '',
      likes = doc.data()!['likes'] ?? 0,
      timestamp = doc.data()!['timestamp'] ?? Timestamp.now();

  ThreadMessageModel.empty()
    : id = '',
      threadId = '',
      message = '',
      userName = '',
      userImage ='',
      likes = 0,
      timestamp = Timestamp.fromDate(DateTime.now());
}