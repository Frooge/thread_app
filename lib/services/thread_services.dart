// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thread_app/models/message_model.dart';
import 'package:thread_app/models/thread_model.dart';

import '../utils/generate_random.dart';

class ThreadServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addMessage(String threadId, {required String message, required String name, required String image}) {
    _db.collection('threadMessages').doc(threadId).collection('messages').add(
      ThreadMessageModel(
        threadId: threadId,
        message: message,
        userName: name,
        userImage: image,
        likes: 0,
        timestamp: Timestamp.now()
      ).toMap());
  }

  void addThread({required String name}) {
    String threadId = GenerateRandom().generateRandomThreadId();
    _db.collection('threads').add(
      ThreadModel(
        favorites: 0,
        threadId: threadId,
        threadName: '${name}.${threadId}'
      ).toMap());
  }

  void toggleFavoriteThread(String threadId, {required String userId, required List<dynamic> likeList}) {
    if(likeList.contains(threadId)) {
      _db.collection('threads').doc(threadId).update({'favorites': FieldValue.increment(-1)});
      _db.collection('users').doc(userId).update({'favoriteList': FieldValue.arrayRemove([threadId])});
    } else {
      _db.collection('threads').doc(threadId).update({'favorites': FieldValue.increment(1)});
      _db.collection('users').doc(userId).update({'favoriteList': FieldValue.arrayUnion([threadId])});
    }
  }

  void toggleLikeMessage(String messageId, {required String threadId, required String userId, required List<dynamic> likedMessagesList}) {
    if(likedMessagesList.contains(messageId)) {
      _db.collection('threadMessages').doc(threadId).collection('messages').doc(messageId).update({'likes': FieldValue.increment(-1)});
      _db.collection('users').doc(userId).update({'likedMessagesList': FieldValue.arrayRemove([messageId])});
    } else {
      _db.collection('threadMessages').doc(threadId).collection('messages').doc(messageId).update({'likes': FieldValue.increment(1)});
      _db.collection('users').doc(userId).update({'likedMessagesList': FieldValue.arrayUnion([messageId])});
    }
  }

  Stream<List<ThreadModel>> getThreadList({required String query}) {
    var ref = _db.collection('threads')
    .where('threadName', isGreaterThanOrEqualTo: query)
    .where('threadName', isLessThan: '${query}z');

    return ref.snapshots().map((list) =>
    list.docs.map((doc) => ThreadModel.fromMap(doc)).toList());
  }

  Stream<List<ThreadMessageModel>> getThreadMessages(String threadId) {
    var ref = _db.collection('threadMessages').doc(threadId).collection('messages').orderBy('timestamp', descending: true);

    return ref.snapshots().map((list) =>
      list.docs.map((doc) => ThreadMessageModel.fromMap(doc)).toList());
  }
}