import 'package:flutter/material.dart';
import 'package:flutter_mvvm/views/users/_form.dart';

class UserCreate extends StatelessWidget {
  const UserCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: UserForm(),
      ),
    );
  }
}