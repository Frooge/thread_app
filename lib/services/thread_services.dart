import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thread_app/models/thread_message_model.dart';
import 'package:thread_app/models/thread_model.dart';

import '../utils/generate_random.dart';

class ThreadServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addMessage(String threadId, {required String message, required String name, required String image}) async {
    ThreadMessageModel threadMessage = ThreadMessageModel(
      threadId: threadId,
      message: message,
      userName: name,
      userImage: image,
      likes: 0,
      timestamp: Timestamp.now()
    );
    await _db.collection('threadMessages').add(threadMessage.toMap());
  }

  Stream<List<ThreadModel>> getThreadList() {
    var ref = _db.collection('threads');

    return ref.snapshots().map((list) =>
      list.docs.map((doc) => ThreadModel.fromMap(doc)).toList());
  }

  Stream<List<ThreadMessageModel>> getThreadMessages(String threadId) {
    var ref = _db.collection('threadMessages').where('threadId', isEqualTo: threadId);

    return ref.snapshots().map((list) =>
      list.docs.map((doc) => ThreadMessageModel.fromMap(doc)).toList());
  }

  Future<String> getThreadName(String threadId) async {
    var doc = await _db
      .collection('threads')
      .doc(threadId)
      .get();
    return doc.data()!['threadName'];
  }
}