import 'package:flutter/material.dart';
import 'package:flutter_mvvm/services/users_service.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';
import 'package:flutter_mvvm/views/users/create.dart';
import 'package:flutter_mvvm/views/users/index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(UsersService()),
        ),
      ],
      child: MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Users'),
                backgroundColor: Colors.grey[400],
              ),
              body: const UserIndex(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const UserCreate();
                  }));
                },
                child: const Icon(Icons.add),
              ),
              );
          }
        )
      ),
    );
  }
}
