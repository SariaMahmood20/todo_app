import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/focus/data/model/focus_model.dart';

class FocusService{
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> addFocus(DateTime day, DateTime minutes)async{
    try{
      User? user = _firebaseAuth.currentUser;
      if(user==null){
        return;
      }
      String focusId = _firebaseDatabase.ref("focuses").push().key!;
      await _firebaseDatabase.ref("focuses").child(user.uid).child(focusId).set({"Day": day, "Minutes": minutes});
    }catch(e){
      rethrow;
    }
  }

  Future<List<FocusModel>> getFocuses()async{
    List<FocusModel> focuses = [];
    try{
      User? user = _firebaseAuth.currentUser;
      if(user==null){
        return [];
      }
      final snapshot = await _firebaseDatabase.ref("focuses").child(user.uid).get();
      if(snapshot.exists){
        Map<dynamic, dynamic>date = snapshot.value as Map<dynamic, dynamic>;
        date.forEach((key, value){
          focuses.add(FocusModel.fromJson(Map<String, dynamic>.from(value)));
        });
      }
    }catch(e){
      rethrow;
    }
    return focuses;
  }

  Future<void> removeFocus(String focusId)async{
    try{
      User? user = _firebaseAuth.currentUser;
      if(user==null){
        return;
      }
      await _firebaseDatabase.ref("focuses").child(user.uid).child(focusId).remove();
    }catch (e){
      rethrow;
    }
  }

  Future<void> updateFocus(String focusId, FocusModel updatedFocus)async{
    try{
      User? user = _firebaseAuth.currentUser;
      if(user==null){
        return;
      }
      await _firebaseDatabase.ref("focuses").child(user.uid).child(focusId).update(updatedFocus.toJson());
    }catch(e){
      rethrow;
    }
  }

}