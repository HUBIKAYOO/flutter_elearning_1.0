import 'package:flutter/material.dart';
import 'package:flutter_conn_database/select/Developer.dart';
import 'package:flutter_conn_database/select/course.dart';


class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(children: [  MyHomePage(),developer()]),
          backgroundColor: Colors.pink,
          bottomNavigationBar: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home_filled),
            ),
            Tab(
              icon: Icon(Icons.manage_accounts),
              )
            ]),
        ));
  }
}