import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w98app/servieces/api_repository.dart';
import 'package:w98app/ui/pages/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'W98 App',
      home: RepositoryProvider(
        create: (context) => Api(),
        child: const MainPage(),
      ),
    );
  }
}
