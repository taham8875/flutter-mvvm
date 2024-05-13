import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/user.dart';
import 'package:flutter_mvvm/services/users_service.dart';

class UserViewModel extends ChangeNotifier {
  final UsersService _usersService;

  UserViewModel(this._usersService) {
    getUsers();
  }

  List<User> _users = [];
  List<User> get users => _users;

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  Future<void> getUsers() async {
    _loading = true;
    _error = '';
    notifyListeners();

    try {
      _users = await _usersService.getUsers();
    } on DioException catch (e) {
      _error = e.message ?? 'An error occurred';
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    _loading = true;
    _error = '';
    notifyListeners();

    try {
      await _usersService.addUser(user);
      _users.add(user);
    } on DioException catch (e) {
      _error = e.message ?? 'An error occurred';
    }

    _loading = false;
    notifyListeners();
  }
}