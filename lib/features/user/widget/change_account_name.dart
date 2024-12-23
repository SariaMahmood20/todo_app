import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/custom_form_field.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/features/auth/presentation/view_model/user_details_view_model.dart';

class ChangeAccountName extends StatefulWidget {

  const ChangeAccountName({super.key,});

  @override
  State<ChangeAccountName> createState() => _ChangeAccountNameState();
}

class _ChangeAccountNameState extends State<ChangeAccountName> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<UserDetailsViewModel>(
      builder: (context, userProvider, child){
        return AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.changeAccountName, style: styles.lato16w700,),
            SizedBox(height: 7.h,),
            const Divider()
          ],
        ),
        content: SizedBox(
          height: 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomFormField(controller: controller, isPassword: false, hintText: AppStrings.changeAccountName, labelText: "Account Name"),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: (){}, child: Text(AppStrings.cancel, style: styles.lato16w400.copyWith(color: styles.neutralColor),)),
                  Button(width: 120.w, buttonText: AppStrings.edit, onPressed: (){userProvider.updateUser(username: controller.text);})
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