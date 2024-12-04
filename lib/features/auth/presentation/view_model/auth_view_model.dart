import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart'; // Add GoRouter import

import 'package:todo_app/app/navigation/route_names.dart';
import 'package:todo_app/app/utils/utils_functions.dart';
import 'package:todo_app/app/views/widgets/bottom_navigation_bar.dart';
import 'package:todo_app/features/auth/data/services/auth_services.dart';

class AuthViewModel extends ChangeNotifier {
  File? image;
  final AuthServices _authServices = AuthServices();
  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  AuthViewModel() {
    _user = _authServices.getCurrentUser();
  }

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> registerUser(String email, String password, BuildContext context) async {
    _setLoading(true);
    _setError(null);
    try {
      await _authServices.registerUser(email, password);
      _user = _authServices.getCurrentUser();
      UtilsFunctions.showFlushBar(context, false, "Registered Successfullt");
      notifyListeners();
      // Navigate to another screen (e.g., Home) after successful registration
      context.go(RouteNames.naviation); // Update the route according to your GoRouter setup
    } catch (e) {
      UtilsFunctions.showFlushBar(context, true, "Failed to create an account: ${e.toString()}");
      _setError("${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loginUser(String email, String password, BuildContext context) async {
    _setLoading(true);
    _setError(null);
    try {
      _user = await _authServices.loginUser(email, password);
      UtilsFunctions.showFlushBar(context, false, "Login Successfully");
      notifyListeners();
      // Navigate to another screen (e.g., Home) after successful login
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MyBottomNavigationBar())) ;
    } catch (e) {
      UtilsFunctions.showFlushBar(context, true, "Failed to login: ${e.toString()}");
      _setError("${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOutUser(BuildContext context) async {
    _setLoading(true);
    _setError(null);
    try {
      await _authServices.signOutUser();
      _user = null;
    } catch (e) {
      UtilsFunctions.showFlushBar(context, true, "Failed to logout: ${e.toString()}");
      _setError("${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  bool _isUserLoggedIn() {
    return _user != null;
  }
}
