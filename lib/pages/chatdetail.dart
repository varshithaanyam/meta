import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDetailPage extends StatefulWidget {
  final String chatId;

  const ChatDetailPage({Key? key, required this.chatId}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch the messages in this chat
  Future<List<Map<String, dynamic>>> _getMessages() async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc('your-user-id') // Replace with the logged-in user's ID
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  // Send a message
  Future<void> _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      final message = {
        'senderId': 'your-user-id', // Replace with logged-in user ID
        'message': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      };

      // Send the message to Firestore
      await _firestore
          .collection('users')
          .doc('your-user-id') // Replace with logged-in user ID
          .collection('chats')
          .doc(widget.chatId)
          .collection('messages')
          .add(message);

      // Clear the input field
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _getMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error loading messages'));
                }

                final messages = snapshot.data ?? [];
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Text(message['message']),
                      subtitle: Text(message['senderId']), // Display sender info
                    );
                  },
                );
              },
            ),
          ),

          // Message Input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(hintText: 'Enter your message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
