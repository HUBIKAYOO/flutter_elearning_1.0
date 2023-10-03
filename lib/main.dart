import 'package:flutter/material.dart';
import 'package:flutter_conn_database/menu.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        home: menu(),
      ),
    );
  }
}

