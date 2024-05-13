import 'package:dio/dio.dart';
import 'package:flutter_mvvm/utils/constants.dart';
import 'package:flutter_mvvm/models/user.dart';

class UsersService {
  Dio dio = Dio();

  UsersService();

  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get('$BASE_URL/users');
      if (response.statusCode == 200) {
        final List<User> users = [];
        for (var json in response.data) {
          users.add(User.fromJson(json));
        }
        return users;
      } else {
        // Handle unexpected status codes
        throw DioException(
          response: response,
          error: 'Unexpected status code: ${response.statusCode}',
          requestOptions: response.requestOptions,
        );
      }
    } catch (e) {
      // Handle Dio errors
      throw DioException(
        error: 'Failed to load users: $e',
        requestOptions: RequestOptions(path: '$BASE_URL/users'),
      );
    }
  }
}
