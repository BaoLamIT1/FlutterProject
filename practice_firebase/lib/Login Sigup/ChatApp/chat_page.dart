import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ChatApp/message_screen.dart';
import '../Screen/home_screen.dart';
import '../Screen/login.dart';

class ChatPage extends StatefulWidget {
  final String email;
  const ChatPage({super.key, required this.email});

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          MaterialButton(
            onPressed: () {
              _auth.signOut().whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              });
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MessageScreen(email: widget.email),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[100],
                    hintText: 'Message',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 8.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Message cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _messageController.text = value ?? '';
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_messageController.text.trim().isNotEmpty) {
                    _fs.collection('Messages').add({
                      'message': _messageController.text.trim(),
                      'time': FieldValue.serverTimestamp(),
                      'email': widget.email,
                    });

                    _messageController.clear();
                  }
                },
                icon: Icon(Icons.send_sharp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
