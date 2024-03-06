import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.all(15),
        child: const Center(child: Text('Profile Screen'),),
      )
    );
  }
}
