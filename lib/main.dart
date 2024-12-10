import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/resources/app_theme.dart'; // Import the new AppTheme file
import 'package:provider/provider.dart';

import 'package:todo_app/app/navigation/routes.dart';
import 'package:todo_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:todo_app/features/auth/presentation/view_model/local_auth_view_model.dart';
import 'package:todo_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:todo_app/features/auth/presentation/view_model/user_details_view_model.dart';
import 'package:todo_app/features/focus/presentation/view_model/focus_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCFwEabtqwNFbLMez0fxGwA2RB5VfgqUJE", 
      appId: "1:375823925981:android:acb5bbbfa83c1c7b6bd134", 
      messagingSenderId: "375823925981", 
      projectId: "uptodoapp-c53ad",
      databaseURL: "https://uptodoapp-c53ad-default-rtdb.firebaseio.com/"
      )
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 895),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>HomeViewModel()),
            ChangeNotifierProvider(create: (_)=>AuthViewModel()),
            ChangeNotifierProvider(create: (_)=>LocalAuthViewModel()),
            ChangeNotifierProvider(create: (_)=>UserDetailsViewModel()),
            ChangeNotifierProvider(create: (_)=>FocusViewModel())
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme, // Use the predefined light theme from AppTheme
            darkTheme: darkTheme, // Use the predefined dark theme from AppTheme
            themeMode: ThemeMode.system, // Follow system theme settings
            routerConfig: Routes().router,
          ),
        );
      },
    );
  }
}
