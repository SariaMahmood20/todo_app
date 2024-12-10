import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/app/utils/utils_functions.dart';
import 'package:todo_app/features/auth/data/services/user_details_service.dart';
import 'package:todo_app/app/navigation/route_names.dart';

class UserDetailsViewModel extends ChangeNotifier {
  final UserDetailsService _userServices = UserDetailsService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  User? user = FirebaseAuth.instance.currentUser;

  String _username = "";
  String get username => _username;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _setUsername(String username){
    _username = username;
    notifyListeners();
  }

  Future<void> addUser({
    required String firstName,
    required String lastName,
    required String username,
    required BuildContext context
  }) async {
    _setLoading(true);
    _setError(null);
    try {
      await _userServices.addDetails(firstName, lastName, username);
      notifyListeners();
      GoRouter.of(context).pushReplacementNamed(RouteNames.naviation);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateUser({required String username}) async {
    _setLoading(true);
    _setError(null);
    try {
      await _userServices.updateDetail(username);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchUsername() async {
    _setLoading(true);
    _setError(null);
    try {
      final fetchedUsername = await _userServices.fetchUsername();
      _setUsername(fetchedUsername!);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updatePassword(
    BuildContext context, String currentPassword, String newPassword) async {
  _setLoading(true);
  _setError(null);
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Debug: Check current user
      print("User ID: ${user.uid}, Email: ${user.email}");

      String email = user.email ?? "";
      AuthCredential credential = EmailAuthProvider.credential(
          email: email, password: currentPassword);

      // Reauthenticate
      await user.reauthenticateWithCredential(credential);

      // Update password
      await user.updatePassword(newPassword);

      notifyListeners();
      UtilsFunctions.showFlushBar(
          context, false, "Password Updated Successfully");
    } else {
      UtilsFunctions.showFlushBar(context, true, "No user is signed in");
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase-specific errors
    UtilsFunctions.showFlushBar(context, true, e.message.toString());
    print("FirebaseAuthException: ${e.code}, ${e.message}");
  } catch (e) {
    // Handle unexpected errors
    UtilsFunctions.showFlushBar(context, true, "An unexpected error occurred.");
    print("Error: $e");
  } finally {
    _setLoading(false);
  }
}

}
