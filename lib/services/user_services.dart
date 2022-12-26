import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thread_app/models/user_model.dart';

import '../utils/generate_random.dart';

class UserServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(User createdUser) async {
    String anonId = await GenerateRandom().generateRandomAnonId();
    UserModel user = UserModel(
      id: createdUser.uid,
      anonymousId: anonId,
      anonymousName: 'anon.$anonId',
      email: createdUser.email!,
      image: GenerateRandom().generateRandomImage(),
      favoriteList: [],
      likedMessagesList: []
    );

    _db.collection('users').doc(user.id).set(user.toMap());
  }

  Stream<UserModel> getCurrentUser(String uid) {    
    return _db
      .collection('users')
      .doc(uid)
      .snapshots()
      .map((snapshot) => UserModel.fromMap(snapshot));
  }

  Future<bool> isIdUnique(String id) async {
    QuerySnapshot query = await FirebaseFirestore.instance
    .collection('users')
    .where('anonymousId', isEqualTo: id)
    .get();
    return !query.docs.isNotEmpty;
  }
}