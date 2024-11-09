import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:todo_app/features/auth/data/services/auth_services.dart';

class AuthViewModel extends ChangeNotifier{
  final AuthServices _authServices = AuthServices();
  bool _isLoading = false;
  String? _errorMessage ;
  User? _user;

  AuthViewModel(){
    _user = _authServices.getCurrentUser();
  }

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

  void _setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message){
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> registerUser(String email, String password)async{
    _setLoading(true);
    _setError(null);
    try{
      await _authServices.registerUser(email, password);
      _user = _authServices.getCurrentUser();
      notifyListeners();
    }catch(e){
      _setError("Failed to create an account: ${e.toString()}");
    }finally{
      _setLoading(false);
    }
  }

  Future<void> loginUser(String email, String password)async{
    _setLoading(true);
    _setError(null);
    try{
      _user = await _authServices.loginUser(email, password);
      notifyListeners();
    }catch(e){
      _setError("Failed to login: ${e.toString()}");
    }finally{
      _setLoading(false);
    }
  }

  Future<void> signOutUser()async{
    _setLoading(true);
    _setError(null);
    try{
     await  _authServices.signOutUser();
      _user = null;
    }catch(e){
      _setError("Failed to logout: ${e.toString()}");
    }finally{
      _setLoading(false);
    }
  }

  bool _isUserLoggedIn(){
    return _user != null;
  }
}