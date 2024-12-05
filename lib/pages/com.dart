// // 
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:smetasphere/pages/Chat_Services.dart';
// // class com extends StatelessWidget {
// //   final String receiverEmail;
// //   final String receiverID;

// //   com({super.key, required this.receiverEmail, required this.receiverID});

// //   final TextEditingController _messageController = TextEditingController();
// //   final ChatServices _chatService = ChatServices();
// //   final AuthService _authServices = AuthService();

// //   void sendMessage() async {
// //     if (_messageController.text.isNotEmpty) {
// //       await _chatService.sendMessage(receiverID, _messageController.text);
// //       _messageController.clear();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (receiverEmail == null || receiverID == null) {
// //       return Scaffold(
// //         body: Center(
// //           child: Text("Invalid user details."),
// //         ),
// //       );
// //     }

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(receiverEmail),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(child: _buildMessageList()),
// //           _buildUserInput(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMessageList() {
// //     String senderID = _authServices.getCurrentUser()!.uid;

// //     return StreamBuilder(
// //       stream: _chatService.getMessages(receiverID, senderID),
// //       builder: (context, snapshot) {
// //         if (snapshot.hasError) {
// //           return const Text("Error");
// //         }
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Text("Loading..");
// //         }
// //         return ListView(
// //           children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildMessageItem(DocumentSnapshot doc) {
// //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// //     return Text(data["message"]);
// //   }

// //   Widget _buildUserInput() {
// //     return Row(
// //       children: [
// //         Expanded(
// //           child: TextField(
// //             controller: _messageController,
// //             hintText: "Type a Message",
// //             obscureText: false,
// //           ),
// //         ),
// //         IconButton(
// //           onPressed: sendMessage,
// //           icon: Icon(Icons.arrow_upward),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class com extends StatelessWidget {
// //   final String receiverEmail;
// //   final String receiverID;

// //   com({
// //     super.key,
// //     required this.receiverEmail,
// //     required this.receiverID,
// //   });

// //   final TextEditingController _messageController = TextEditingController();
// //   final ChatServices _chatService = ChatServices();

// //   void sendMessage() async {
// //     if (_messageController.text.trim().isNotEmpty) {
// //       await _chatService.sendMessage(receiverID, _messageController.text.trim());
// //       _messageController.clear();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text(receiverEmail)),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: _buildMessageList(),
// //           ),
// //           _buildUserInput(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMessageList() {
// //     final user = FirebaseAuth.instance.currentUser;

// //     if (user == null) {
// //       return const Center(
// //         child: Text("You are not logged in."),
// //       );
// //     }

// //     String senderID = user.uid;

// //     return StreamBuilder(
// //       stream: _chatService.getMessages(receiverID, senderID),
// //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //         if (snapshot.hasError) {
// //           return const Center(child: Text("Error loading messages."));
// //         }

// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Center(child: CircularProgressIndicator());
// //         }

// //         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //           return const Center(child: Text("No messages yet."));
// //         }

// //         return ListView(
// //           children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildMessageItem(DocumentSnapshot doc) {
// //     final data = doc.data() as Map<String, dynamic>?;
// //     if (data == null || !data.containsKey('message') || !data.containsKey('senderID')) {
// //       return const SizedBox.shrink();
// //     }

// //     final String message = data['message'] ?? 'Unknown message';
// //     final String senderID = data['senderID'] ?? 'Unknown sender';
// //     final String currentUserID = FirebaseAuth.instance.currentUser?.uid ?? '';

// //     bool isSender = senderID == currentUserID;

// //     return Align(
// //       alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
// //       child: Container(
// //         padding: const EdgeInsets.all(8.0),
// //         margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
// //         decoration: BoxDecoration(
// //           color: isSender ? Colors.blue[100] : Colors.grey[300],
// //           borderRadius: BorderRadius.circular(8.0),
// //         ),
// //         child: Text(message),
// //       ),
// //     );
// //   }

// //   Widget _buildUserInput() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
// //       child: Row(
// //         children: [
// //           Expanded(
// //             child: TextField(
// //               controller: _messageController,
// //               decoration: const InputDecoration(
// //                 hintText: "Type a message",
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: sendMessage,
// //             icon: const Icon(Icons.arrow_upward),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smetasphere/pages/Chat_Services.dart';
//import 'package:smetasphere/pages/auth/AuthService.dart';
import 'package:smetasphere/pages/login_page.dart';

class com extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  com({super.key, required this.receiverEmail, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatService = ChatServices();
  final AuthService _authServices = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authServices.getCurrentUser()!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error loading messages.");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        return ListView(
          reverse: true, // Show latest messages at the bottom
          children: snapshot.data!.docs.map<Widget>((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data["message"]),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(hintText: "Type a message..."),
          ),
        ),
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
