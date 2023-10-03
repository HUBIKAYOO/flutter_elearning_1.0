import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final teacherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างรายวิชา"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(top: 15),
            // color: Colors.amber,
            width: 300,
            height: 500,
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: numberController,
                  decoration: InputDecoration(
                      labelText: "รหัสรายวิชา",
                      prefixIcon: Icon(Icons.pin),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0)))),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "รายวิชา",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      prefixIcon: Icon(Icons.menu_book_sharp)),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: teacherController,
                  decoration: InputDecoration(
                      labelText: "อาจารย์",
                      prefixIcon: Icon(Icons.person_add_alt_1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      var number = numberController.text;
                      var name = nameController.text;
                      var teacher = teacherController.text;

                      var dname = "";
                      var detail = "";
                      var _imageFile = "";
                      


                      Transactions statement = Transactions(
                          number: number, 
                          name: name, 
                          teacher: teacher,
                          
                          dname: dname,
                          detail: detail,
                          imageFile:_imageFile,
                          
                          );
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "บันทึก",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 75, 135, 1),
                        minimumSize: Size(300, 50))),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
