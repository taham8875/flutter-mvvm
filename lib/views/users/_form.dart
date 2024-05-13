import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/user.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  const UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User();
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (value) {
              user.name = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (value) {
              user.email = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (user.name == null || user.email == null) {
                return;
              }
              userViewModel.addUser(user);
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}