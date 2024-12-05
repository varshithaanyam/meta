// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:smetasphere/auth/AuthPage.dart';
// import 'package:smetasphere/pages/home_page.dart';
// // ignore: unused_import
// import 'package:smetasphere/pages/login_page.dart';
// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:StreamBuilder
// //<User?>
// (
//         stream:FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot){
//           if(snapshot.hasData){
//             return HomePage();
//           }else{
//             return AuthPage();
//           }
//         },
//       )

//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smetasphere/auth/AuthPage.dart';
import 'package:smetasphere/pages/home_page.dart';
// ignore: unused_import
import 'package:smetasphere/pages/login_page.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage();
          }else{
            return AuthPage();
          }
        },
      )

    );
  }
}
