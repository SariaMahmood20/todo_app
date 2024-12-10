import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/custom_form_field.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/features/auth/presentation/view_model/user_details_view_model.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<UserDetailsViewModel>(
      builder: (context, userProvider, child){
        return AlertDialog(
        title: Column(
          children: [
            Text(
              AppStrings.changeAccountPassword,
              style: styles.lato16w700,
            ),
            SizedBox(height: 7.h,),
            const Divider()
          ],
        ),
        content: SizedBox(
          height: 220.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFormField(controller: _oldPasswordController, isPassword: false, hintText: AppStrings.enterOldPassword, labelText: "Old Password"),
              SizedBox(height: 20.h,),
              CustomFormField(controller: _newPasswordController, isPassword: false, hintText: AppStrings.enterNewPassword, labelText: "New Password"),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: (){}, child: Text(AppStrings.cancel, style: styles.lato16w600.copyWith(color: styles.neutralColor),)),
                  Button(width: 150.w, buttonText: AppStrings.edit, onPressed: (){userProvider.updatePassword(context, _oldPasswordController.text, _newPasswordController.text);})
                ],
              )
            ],
          ),
        ),
      );
      },
    );
  }
}