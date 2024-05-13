
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/user.dart';

class UserShow extends StatelessWidget {
  final User user;

  const UserShow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Website: ${user.website}'),
          ],
        ),
      ),
    );
  }
}
