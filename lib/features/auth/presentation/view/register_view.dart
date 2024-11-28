import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/app/views/widgets/custom_form_field.dart';
import 'package:todo_app/features/auth/presentation/view_model/local_auth_view_model.dart';
import 'package:todo_app/features/auth/presentation/view_model/auth_view_model.dart';

import 'package:todo_app/features/auth/presentation/widgets/login_with.dart';
import 'package:todo_app/features/auth/presentation/widgets/text_row.dart';
import 'package:todo_app/app/utils/utils_functions.dart';
import 'package:todo_app/app/navigation/route_names.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localAuthViewModel =
          Provider.of<LocalAuthViewModel>(context, listen: false);
      if (!localAuthViewModel.hasBiometrics) {
        UtilsFunctions.fingerprintAuthentication(context);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Consumer<LocalAuthViewModel>(
            builder: (context, localAuthProvider, child) {
              return Consumer<AuthViewModel>(
                builder: (context, authProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(
                        AppStrings.register,
                        style: styles.lato32w700,
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomFormField(
                          isPassword: false,
                          labelText: AppStrings.email,
                          hintText: AppStrings.enterYourEmail,
                          controller: _emailController),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomFormField(
                          labelText: AppStrings.password,
                          isPassword: true,
                          hintText: AppStrings.enterYourPassword,
                          controller: _passwordController),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomFormField(
                          labelText: AppStrings.confirmPassword,
                          isPassword: true,
                          hintText: AppStrings.enterYourPassword,
                          controller: _confirmController),
                      SizedBox(
                        height: 50.h,
                      ),
                      Button(
                        width: double.infinity,
                        buttonText: AppStrings.register,
                        onPressed: () {
                          authProvider.registerUser(
                              _emailController.text, _passwordController.text, context);
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OR",
                            style: styles.lato16w600,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          LoginWith(
                              loginWith: AppStrings.registeWithGoogle,
                              svgPath: SvgIcons.google,
                              onPressed: () {}),
                          SizedBox(
                            height: 15.h,
                          ),
                          LoginWith(
                              loginWith: AppStrings.registerWithApple,
                              svgPath: SvgIcons.apple,
                              onPressed: () {}),
                          SizedBox(
                            height: 25.h,
                          ),
                          TextRow(
                              path: RouteNames.login,
                              firstText: AppStrings.alreadyHaveAnAccount,
                              secondText: AppStrings.login)
                        ],
                      )
                    ],
                  );
                },
              );
            },
          )),
    ));
  }
}
