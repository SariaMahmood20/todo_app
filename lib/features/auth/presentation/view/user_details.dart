import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/navigation/route_names.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/app/views/widgets/custom_form_field.dart';
import 'package:todo_app/app/views/widgets/my_appbar.dart';
import 'package:todo_app/features/auth/presentation/view_model/user_details_view_model.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => UserDetailsViewState();
}

class UserDetailsViewState extends State<UserDetailsView> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: MyAppbar(appbarTitle: "User Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
                width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50.h,),
                  Text(
                    "User Details",
                    style: styles.lato40w700,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: CustomFormField(
                            controller: _firstNameController,
                            isPassword: false,
                            hintText: "Enter your first name",
                            labelText: "First Name"),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Expanded(
                        child: CustomFormField(
                            controller: _lastNameController,
                            isPassword: false,
                            hintText: "Enter your last name",
                            labelText: "Last Name"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomFormField(
                      controller: _usernameController,
                      isPassword: false,
                      hintText: "Enter the username",
                      labelText: "Username"),
                  SizedBox(
                    height: 30.h,
                  ),
                  Consumer<UserDetailsViewModel>(
                    builder: (context, provider, child) {
                      return Button(
                        width: double.infinity,
                        buttonText: AppStrings.edit,
                        onPressed: () {
                          provider.addUser(
                              firstName: _firstNameController.text,
                              context: context,
                              lastName: _lastNameController.text,
                              username: _usernameController.text);
                          GoRouter.of(context)
                              .pushReplacementNamed(RouteNames.naviation);
                        });
                    },
                  )
                ],
              ),
            )
        ),
      );
  }
}
