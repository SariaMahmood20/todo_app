import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/features/auth/presentation/view_model/local_auth_view_model.dart';
import 'package:todo_app/app/views/widgets/button.dart';

class FingerPrintAuth extends StatelessWidget {
  const FingerPrintAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final _localAuthViewModel = LocalAuthViewModel();

    return ChangeNotifierProvider<LocalAuthViewModel>(
      create: (context)=> LocalAuthViewModel(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Consumer<LocalAuthViewModel>(
          builder: (context, localAuthProvider, child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                SvgPicture.asset(
                  SvgIcons.fingerPrint,
                  color: localAuthProvider.isAuthFailed? Colors.red: Colors.white,
                  height: 78.h,
                  width: 78.w,
                ),
                SizedBox(height: 5.h,),
                Text(
                  textAlign: TextAlign.center,
                  localAuthProvider.isAuthFailed? "Your fingerprint is not matched. Please try again later!!": "Please hold your finger at the fingerprint scanner to verify your identity",
                  style: styles.lato20w400.copyWith(color: localAuthProvider.isAuthFailed?Colors.red: Colors.white),
                ),
                SizedBox(height: 25.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){}, child: Text(AppStrings.cancel, style: styles.lato20w600.copyWith(color: styles.neutralColor),)),
                    Button(width: 153.w, buttonText: AppStrings.usePassword, onPressed: (){},)
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}