import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:todo_app/features/auth/data/models/user-model.dart';

class UserDetailsService{
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref("users");
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  Future<void> addDetails(String firstName, String lastName, String username)async{
    try{
      User? user = _auth.currentUser;
      if(user == null){
        return;
      }
      await _userRef.child(user.uid).set({"first_name": firstName, "last_name": lastName, "username": username});
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateDetail(String username)async{
    try{
      User? user = _auth.currentUser;
      if(user == null){
        return;
      }
      await _userRef.child(user.uid).set({"username": username});
    }catch(e){
      print(e.toString());
    }
  }
}