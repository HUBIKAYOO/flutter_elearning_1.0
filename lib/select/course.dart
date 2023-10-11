import 'package:flutter/material.dart';
import 'package:flutter_conn_database/insert/form_course.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/select/DetailCourse.dart';
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
            .where((transaction) =>
                transaction.name != "no")
            .toList();
        var count = filteredTransactions.length;
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
                return Container(
                 
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: Color.fromARGB(255, 255, 189, 211),
                            spreadRadius: 2,
                            blurRadius: 10)
                      ]),
                  margin: const EdgeInsets.only(top: 10,left: 20,right: 20),
                  child: ListTile(
                    title: Text(data.number + " : " + data.name),
                    subtitle: Text("อ." + data.teacher),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                number: data.number, name: data.name)),
                      );
                    },
                  ),
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return FormCourse();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
