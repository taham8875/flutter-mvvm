import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Function()? onTap;
  const UserCard({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(
          user.name ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          user.email ?? '',
        ),
      ),
    );
  }
}
