import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthViewModel extends ChangeNotifier{
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isAuthenticating = false;
  bool _hasBiometrics = false;
  bool _isAuthFailed = false;

  bool get isAuthenticating => _isAuthenticating;
  bool get hasBiometrics => _hasBiometrics;
  bool get isAuthFailed => _isAuthFailed;

  LocalAuthViewModel(){
    _checkBiometricsAvailability();
  }

  Future<void> _checkBiometricsAvailability() async{
    try{
      _hasBiometrics = await _localAuth.canCheckBiometrics;
      notifyListeners();
    }catch(e){
      rethrow;
    }
  }

  Future<void> authenticate()async{
    _isAuthenticating = true;
    _isAuthFailed = false;
    notifyListeners();
    try{
      final authenticated = await _localAuth.authenticate(
        localizedReason: "Authnticate to Proceed",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true
        )
      );

      _isAuthenticating = false;
      _isAuthFailed = !authenticated;
      notifyListeners();
    }catch(e){
      _isAuthenticating = false;
      _isAuthFailed = true;
      notifyListeners();
    }
  }
}