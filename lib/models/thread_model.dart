import 'package:cloud_firestore/cloud_firestore.dart';

class ThreadModel {
  String id;
  int favorites;
  String threadId;
  String threadName;

  ThreadModel({
    required this.id,
    required this.favorites,
    required this.threadId,
    required this.threadName,
  });

  Map<String, dynamic> toMap() {
    return {
      'favorites': favorites,
      'threadId': threadId,
      'threadName': threadName,
    };
  }

  ThreadModel.fromMap(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc.id,
      favorites = doc.data()!['favorites'] ?? 0,
      threadId = doc.data()!['threadId'] ?? '',
      threadName = doc.data()!['threadName'] ?? '';

  ThreadModel.empty()
    : id = '',
      favorites = 0,
      threadId = '',
      threadName = '';
}