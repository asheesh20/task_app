import 'package:flutter/material.dart';

class Username extends StatelessWidget {
  const Username({super.key, required this.username});

  final String? username;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(username!),
    );
  }
}
