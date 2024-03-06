import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.all(15),
        child: const Center(child: Text('Chat Screen'),),
      )
    );
  }
}
