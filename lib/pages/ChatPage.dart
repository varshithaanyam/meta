// // ignore: unused_import
// import 'dart:js';

// import 'package:flutter/material.dart';
// // ignore: unused_import
// import 'package:flutter/foundation.dart';
// import 'package:smetasphere/auth/AuthPage.dart';
// import 'package:smetasphere/pages/com.dart';
// import 'package:smetasphere/pages/user_tile.dart';

// import 'Chat_Services.dart';
// class ChatPage extends StatelessWidget {
//   final ChatServices _chatServices = ChatServices();
// final AuthPage _authService = AuthPage();
//    ChatPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:Text('Metasphere'),
//       ),
//       body: _buildUserList(),
//     );
//   }
//   Widget _buildUserList() {
//     return StreamBuilder(
//       stream: _chatServices.getUsersStream(), 
//       builder: (context, snapshot){
//          if (snapshot.hasError){
//           return const Text("Error");
//          }
//          if(snapshot.connectionState == ConnectionState.waiting){
//           return const Text("Loading...");
//          }
//          return ListView(
//           children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
//          );
//       },
//       );
//   }
//   // Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
//   //   if(userData["email"] != _authServices.getCurrentUser()!.email){
//   //     return UserTile(text: userData["email"],
//   //    onTap: (){
//   //     Navigator.push(context, MaterialPageRoute(builder: (context) =>  com(receiverEmail: userData["email"], receiverID: userData["uid"],

//   //     ),
//   //     ),
//   //     );
//   //    }
//   //    );
//   //   }
//   //   else{
//   //     return Container();
//   //   }
//   // }
//   Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
//   if (userData["email"] != _authService.getCurrentUser()!.email) { // Fixed _authServices to _authService
//     return UserTile(
//       text: userData["email"],
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => com(
//               receiverEmail: userData["email"],
//               receiverID: userData["uid"],
//             ),
//           ),
//         );
//       },
//     );
//   } else {
//     return Container();
//   }
// }

// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smetasphere/pages/com.dart';
import 'package:smetasphere/pages/login_page.dart';
import 'package:smetasphere/pages/user_tile.dart';
import 'Chat_Services.dart';
class ChatPage extends StatelessWidget {
  final AuthService _authService = AuthService();
   final ChatServices _chatService = ChatServices();

  @override
  Widget build(BuildContext context) {
    final currentUser = _authService.getCurrentUser();

    if (currentUser == null) {
      // Handle the case when no user is logged in
      return Scaffold(
        body: Center(
          child: Text("Please log in to access the chat."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Metasphere'),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    final currentUser = _authService.getCurrentUser();
    if (userData["email"] != currentUser?.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => com(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

// class ChatPage extends StatelessWidget {
//   final ChatServices _chatServices = ChatServices();

//   ChatPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = FirebaseAuth.instance.currentUser; // Fetch the current user

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Metasphere'),
//       ),
//       body: currentUser != null
//           ? _buildUserList(currentUser.email!)
//           : const Center(
//               child: Text("No user is logged in."),
//             ),
//     );
//   }

//   Widget _buildUserList(String currentUserEmail) {
//     return StreamBuilder(
//       stream: _chatServices.getUsersStream(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(child: Text("Error fetching user data."));
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (!snapshot.hasData || snapshot.data == null) {
//           return const Center(child: Text("No users available."));
//         }

//         final users = snapshot.data as List<Map<String, dynamic>>;
//         return ListView(
//           children: users
//               .map((userData) => _buildUserListItem(userData, currentUserEmail, context))
//               .toList(),
//         );
//       },
//     );
//   }

//   Widget _buildUserListItem(
//       Map<String, dynamic> userData, String currentUserEmail, BuildContext context) {
//     if (userData["email"] != currentUserEmail) {
//       return UserTile(
//         text: userData["email"],
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => com(
//                 receiverEmail: userData["email"],
//                 receiverID: userData["uid"],
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Container(); // Skip rendering the current user
//     }
//   }
// }
