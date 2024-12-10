import 'package:flutter/material.dart';

class AccountSettingsProvider extends ChangeNotifier{

  String? _newUsername;
  String? get newUsername => _newUsername;

  Future<void> changeAccountName(BuildContext context, Widget widget) async{
    final String? username = await showDialog(
      context: context, 
      builder: (context)=> widget
      );
    if(username != null){
      _newUsername = username;
    }
  }

  Future<void> changeAccountPassword(BuildContext context, Widget widget)async{
    final String? password = await showDialog(
      context: context,
      builder: (context)=>widget
      );
  }

}