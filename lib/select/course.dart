import 'package:flutter/material.dart';
import 'package:flutter_conn_database/insert/form_screen.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/select/DetailScreen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elearning"),
      ),
      body: Consumer(builder: (context, TransactionProvider provider, widget) {
        List<Transactions> filteredTransactions = provider.transactions
              .where((transaction) => transaction.name != null && transaction.name.isNotEmpty )
              .toList();
        var count = provider.transactions.length;
        if (count <= 0) {
          return Center(
            child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, int index) {
                Transactions data = filteredTransactions[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: Text(data.number + " " + data.name),
                    subtitle: Text("อ."+data.teacher),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(number:data.number,name:data.name)),
                      );
                    },
                  ),
                );
              }
              );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return FormScreen();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
