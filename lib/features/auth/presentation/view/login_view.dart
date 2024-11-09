import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/constants/svg_icons.dart';

import 'package:todo_app/app/views/widgets/custom_form_field.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/features/auth/presentation/widgets/login_with.dart';
import 'package:todo_app/features/auth/presentation/widgets/text_row.dart';
import 'package:todo_app/features/auth/presentation/view_model/local_auth_view_model.dart';
import 'package:todo_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:todo_app/app/utils/utils_functions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void onPressed(){}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final localAuthViewModel = Provider.of<LocalAuthViewModel>(context, listen: false);
      if(!localAuthViewModel.hasBiometrics){
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
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      appBar: AppBar(),
      body: MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (context)=> LocalAuthViewModel()),
          ChangeNotifierProvider(create: (context)=> AuthViewModel())
        ],
        child: ChangeNotifierProvider<AuthViewModel>(
          create: (context)=> AuthViewModel(),
          child: Consumer<LocalAuthViewModel>(
            builder: (context, localAuthViewModel, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Consumer<AuthViewModel>(
                  builder: (context, authProvider, child){
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    Text(AppStrings.login, style: styles.lato32w700),
                    SizedBox(height: 60.w),
          
                    // Username field
                    CustomFormField(
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterYourEmail,
                      controller: _emailController,
                    ),
                    SizedBox(height: 40.h),
          
          
                    CustomFormField(
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterYourPassword,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 50.h),
          
                    // Login button
                    Button(width: double.infinity, buttonText: AppStrings.login, onPressed: (){authProvider.loginUser(_emailController.text, _passwordController.text);},),
                    SizedBox(height: 25.h),
          
                    // Social login options
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("OR", style: styles.lato16w600),
                        SizedBox(height: 25.h),
                        LoginWith(
                          loginWith: AppStrings.loginWithGoogle,
                          svgPath: SvgIcons.google,
                          onPressed: onPressed,
                        ),
                        SizedBox(height: 15.h),
                        LoginWith(
                          loginWith: AppStrings.loginWithApple,
                          svgPath: SvgIcons.apple,
                          onPressed: onPressed,
                        ),
                        SizedBox(height: 25.h),
                        TextRow(
                          onPressed: onPressed,
                          firstText: AppStrings.dontHaveAnAccount,
                          secondText: AppStrings.register,
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ],
                );
                  },
                  )
              );
            },
          ),
        ),
      ),
    );
  }
}