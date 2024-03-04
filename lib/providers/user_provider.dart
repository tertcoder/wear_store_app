import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    StreamProvider<DocumentSnapshot<Map<String, dynamic>>>((ref) {
  final user = FirebaseAuth.instance.currentUser!;
  final userStream = _fetchUserDocument(user.uid);
  return userStream;
});

Stream<DocumentSnapshot<Map<String, dynamic>>> _fetchUserDocument(String uid) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .snapshots()
      .handleError((error) {
    print("Error fetching user details: $error");
    return null;
  });
}
