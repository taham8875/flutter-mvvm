import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserIndex extends StatelessWidget {
  const UserIndex({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return _ui(userViewModel);
  }

  Widget _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (userViewModel.error.isNotEmpty) {
      return Center(
        child: Text(userViewModel.error),
      );
    }

    return ListView.builder(
      itemCount: userViewModel.users.length,
      itemBuilder: (context, index) {
        final user = userViewModel.users[index];
        return ListTile(
          title: Text(
            user.name ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            user.email ?? '',
          ),
        );
      },
    );
  }
}
