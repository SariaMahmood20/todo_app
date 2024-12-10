import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserDetailsService {
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addDetails(String firstName, String lastName, String username) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw FirebaseAuthException(code: 'user-not-found', message: 'No user is signed in.');
      }
      await _userRef.child(user.uid).set({
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
      });
    } catch (e, stackTrace) {
      print("Error adding details: $e");
      print("StackTrace: $stackTrace");
      rethrow;
    }
  }

  Future<void> updateDetail(String username) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw FirebaseAuthException(code: 'user-not-found', message: 'No user is signed in.');
      }
      await _userRef.child(user.uid).update({
        "username": username,
      });
    } catch (e, stackTrace) {
      print("Error updating username: $e");
      print("StackTrace: $stackTrace");
      rethrow;
    }
  }

  Future<String?> fetchUsername() async {
  try {
    User? user = _auth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(code: 'user-not-found', message: 'No user is signed in.');
    }

    final snapshot = await _userRef.child(user.uid).child("username").get();
    if (snapshot.exists) {
      return snapshot.value as String; // Return the username directly
    } else {
      throw Exception("Username not found!");
    }
  } catch (e, stackTrace) {
    print("Error fetching username: $e");
    print("StackTrace: $stackTrace");
    rethrow;
  }
}

}
