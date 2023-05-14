import 'package:carparking/common_widget/auth_check.dart';
import 'package:carparking/firebase_options.dart';
import 'package:carparking/screens/admin/admin_home.dart';
import 'package:carparking/screens/admin/blockList.dart';
import 'package:carparking/screens/admin/login.dart';
import 'package:carparking/screens/admin/profile.dart';
import 'package:carparking/screens/auth/login.dart';
import 'package:carparking/screens/auth/user_register.dart';
import 'package:carparking/screens/user/blocked.dart';
import 'package:carparking/screens/user/home_screen.dart';
import 'package:carparking/screens/user/profile.dart';
import 'package:carparking/screens/user/slote.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'authCheck',
      routes: {
        'authCheck': (context) => AuthCheck(),
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'home': (context) => const HomeScreen(),
        'slot': (context) => const SlotScreen(),
        'Profile': (context) => const ProfileScreen(),
        'AdminLogin': (context) => const AdminLogin(),
        'AdminHome': (context) => const AdminHome(),
        'AdminProfile': (context) => const AdminProfileScreen(),
        'blackList': (context) => const BlocList(),
        'blockedScreen': (context) => const BlockedScreen(),
      },
    );
  }
}
