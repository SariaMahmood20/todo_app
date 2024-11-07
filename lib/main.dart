import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/resources/app_theme.dart'; // Import the new AppTheme file
import 'package:provider/provider.dart';

import 'package:todo_app/features/auth/presentation/view/login_view.dart';
import 'package:todo_app/features/auth/presentation/view_model/local_auth_view_model.dart';
import 'package:todo_app/splash.dart';
import 'package:todo_app/features/auth/presentation/view/register_view.dart';
import 'package:todo_app/app/views/widgets/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAZ8O8YUjhmWQ8hi6wueaaJH8fJXg4c9do",
      appId: "1:490397383942:android:9c3b2089c59ecde112b287",
      messagingSenderId: "490397383942",
      projectId: "uptodo-70ce1",
      databaseURL: "https://uptodo-70ce1-default-rtdb.firebaseio.com/",
    ),
  );
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
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
            ChangeNotifierProvider(create: (_)=>LocalAuthViewModel())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme, // Use the predefined light theme from AppTheme
            darkTheme: darkTheme, // Use the predefined dark theme from AppTheme
            themeMode: ThemeMode.system, // Follow system theme settings
            home: MyBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
