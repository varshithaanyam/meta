// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// // ignore: unused_import
// import 'package:smetasphere/pages/login_page.dart';
// import 'package:smetasphere/auth/main_page.dart';
// import 'firebase_options.dart';


// // void main() async{
// //   WidgetsFlutterBinding.ensureInitialized();
// // await Firebase.initializeApp(
// //   options: DefaultFirebaseOptions.currentPlatform,
// // );
// // runApp(const MyApp());
 
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// //import 'package:new_metasphere/login_page.dart';
// import 'package:smetasphere/auth/AuthPage.dart';
// import 'package:smetasphere/firebase_options.dart';


//  void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//    runApp(const MainApp());
//  }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AuthPage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:smetasphere/pages/login_page.dart';
import 'package:smetasphere/auth/main_page.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

