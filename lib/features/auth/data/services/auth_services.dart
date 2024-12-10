
import 'package:firebase_auth/firebase_auth.dart';


class AuthServices{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password)async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e.toString()+"Saria");
      rethrow;
    }
  }

  

  Future<User?> loginUser(String email, String password)async{
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch(e){
      rethrow;
    }
  }

  Future<void> signOutUser()async{
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
}