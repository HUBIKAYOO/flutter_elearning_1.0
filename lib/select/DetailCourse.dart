import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/insert/form_detail.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String number, name;
  DetailScreen({required this.number, required this.name});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController _descriptionController = TextEditingController();
  String x = "", name = "";
  void initState() {
    super.initState();
    // ดึงค่า number และกำหนดให้กับตัวแปร x
    x = widget.number;
    name = widget.name;
    // Initialize the description controller with the transaction's description
    // _descriptionController.text = widget.transaction.description;
  }

  Future<void> _viewPDF(BuildContext context, String filePath) async {
    final result = await OpenFile.open(filePath);
    if (result.type != ResultType.done) {
      // Handle the error, if any
      // For example, you can show an error message
      print('Error opening PDF: ${result.message}');
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _viewImage(BuildContext context, String filePath) async {
    try {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: InteractiveViewer(
              boundaryMargin: EdgeInsets.all(20.0), // Margin for boundary
              minScale: 0.1, // Minimum scale value
              maxScale: 4.0, // Maximum scale value
              child: Image.file(File(filePath)),
            ),
          );
        },
      );
    } catch (e) {
      print('Error viewing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, widget) {
          List<Transactions> filteredTransactions = provider.transactions
              .where((transaction) => transaction.number == x)
              .toList();
          var count = filteredTransactions.length;
          if (count <= 1) {
            return Center(
              child: Text(
                "ไม่พบข้อมูล",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: filteredTransactions.length - 1,
                itemBuilder: (context, index) {
                  Transactions data = filteredTransactions[index];
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: Color.fromARGB(255, 255, 189, 211),
                            spreadRadius: 2,
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(7),
                      // border: Border.all(
                      //     color: Color.fromRGBO(255, 75, 135, 1), width: 2),
                    ),
                    margin: EdgeInsets.only(
                      top: 15,
                      left: 20,
                      right: 20,
                    ),
                    width: 400,
                    height: null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(7)),
                              color: Colors.white),

                          width: 400,
                          // color: Color.fromRGBO(255, 75, 135, 1),
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 40, bottom: 10),
                          height: null,
                          child: Text(
                            data.dname,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(7),
                                  bottomRight: Radius.circular(7)),
                              color: Colors.white),
                          padding: EdgeInsets.only(
                              left: 10, right: 40, bottom: 10, top: 10),
                          height: null,
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.imageFile != null)
                                data.imageFile != null
                                    ? GestureDetector(
                                        onTap: () {
                                          _viewImage(
                                              context, data.imageFile.path);
                                        },
                                        child: Container(
                                          height: null,
                                          width: 208,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  221, 123, 123, 123),
                                              width: 2.0, // ความหนาขอบๆ
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                5), // เพิ่มขอบโค้งของรูปภาพ
                                            child: Image.file(
                                              data.imageFile,
                                              width: 208,
                                              height: null,
                                              fit: BoxFit
                                                  .cover, // ปรับขนาดรูปภาพให้พอดีกับ Container
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 30,
                                      ),
                              if (data.imageFile != null)
                                SizedBox(
                                  height: 10,
                                ),
                              if (data.documents.isNotEmpty)
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 208,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromRGBO(
                                        255, 75, 135, 1), // Border radius
                                  ),
                                  child: Center(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: data.documents.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final file = data.documents[index];
                                        final fileName = file.split('/').last;
                                        final displayFileName =
                                            fileName.length <= 17
                                                ? fileName
                                                : fileName.substring(0, 17) +
                                                    "...";

                                        return GestureDetector(
                                          onTap: () {
                                            _viewPDF(context, file);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.file_present_outlined,
                                                  color: Colors
                                                      .white), // Add your desired icon here
                                              SizedBox(
                                                  width:
                                                      10), // Adjust the spacing between icon and text
                                              Text(
                                                displayFileName,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (data.documents.isNotEmpty)
                                SizedBox(
                                  height: 10,
                                ),
                              Text(
                                data.detail,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          }

          // }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return FormDetail();
          // },));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormDetail(number: x)),
          );
          print(x);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
// class DetailScreen extends StatelessWidget {
//   final String number;
//   DetailScreen({required this.number});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("รายวิชา"),
//       ),
//       body: Consumer<TransactionProvider>(builder: (context, provider, widget) {
//         // var count = provider.transactions.length;
//         // if (count <= 0) {
//         //   return Center(
//         //     child: Text(
//         //       "ไม่พบข้อมูล",
//         //       style: TextStyle(fontSize: 20),
//         //     ),
//         //   );
//         // }else{
//            List<Transactions> filteredTransactions = provider.transactions
//               .where((transaction) => transaction.number == number)
//               .toList();
//           return ListView.builder(
//             itemCount: filteredTransactions.length,
//               itemBuilder: (context, index){
//                 Transactions data = filteredTransactions[index];
//                 return Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(255, 75, 135, 1), width: 2),
//                           borderRadius: BorderRadius.circular(7)),
//                       margin: EdgeInsets.only(
//                           top: 20, left: 20, right: 20, bottom: 10),
//                       width: 400,
//                       height: null,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 400,
//                             color: Color.fromRGBO(255, 75, 135, 1),
//                             padding: EdgeInsets.only(
//                                 top: 10, left: 10, right: 40, bottom: 10),
//                             height: null,
//                             child: Text(
//                               "บทที่1 : "+data.dname,
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Color.fromARGB(221, 67, 67, 67),fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(
//                                 left: 10, right: 40, bottom: 10),
//                             height: null,
//                             width: null,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("รูป"),
//                                 Text("ไฟล์"),
//                                 Text(data.detail,style: TextStyle(fontSize: 15),)
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//               }
//           );
//         // }
//       },),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //     //   return FormDetail();
//       //     // },));

//       //     var data;
//       //     Navigator.push(
//       //                   context,
//       //                   MaterialPageRoute(
//       //                       builder: (context) =>
                                

//       //                           FormDetail(name: data.name)
//       //                           ),
//       //                 );
//       //   },
//       //   child: Icon(Icons.add),
//       // ),
//   );
//   }
// }



// Scaffold(
//       appBar: AppBar(
//         title: Text("ประวัติส่วนตัว"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
            
//             Padding(
//               padding: const EdgeInsets.only(top: 25),
//             ),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "ข้อมูลส่วนตัว",
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: Color.fromARGB(95, 47, 46, 46),
//                     ),
//                   ),
//                   Container(
//                     child: Material(
//                       elevation: 4.0, // ความสูงของเงาด้านนอก
//                       borderRadius: BorderRadius.circular(10.0), // เพิ่มขอบมน
//                       child: Column(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(top: 5),
//                             padding: const EdgeInsets.all(20.0),
//                             width: 350,
//                             height: null,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Color.fromARGB(95, 47, 46, 46), // สีขอบ
//                                 width: 2.0, // ความหนาขอบ
//                               ),
//                               borderRadius:
//                                   BorderRadius.circular(10.0), // เพิ่มขอบมน
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ขื่อ-สกุล :" + widget.transaction.name,
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 Text(
//                                     "รหัสนักศึกษา :" +
//                                         widget.transaction.number,
//                                     style: TextStyle(fontSize: 18)),
//                                 Text("สาขา :" + widget.transaction.name,
//                                     style: TextStyle(fontSize: 18)),
//                                 Text("เบอร์ :" + widget.transaction.number,
//                                     style: TextStyle(fontSize: 18)),
                                
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );






// SingleChildScrollView(
      //         child: Container(
      //           child: Column(
      //             children: [
      //               Container(
      //                 decoration: BoxDecoration(
      //                     border: Border.all(
      //                         color: Color.fromRGBO(255, 75, 135, 1), width: 2),
      //                     borderRadius: BorderRadius.circular(7)),
      //                 margin: EdgeInsets.only(
      //                     top: 20, left: 20, right: 20, bottom: 10),
      //                 width: 400,
      //                 height: null,
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                       width: 400,
      //                       color: Color.fromRGBO(255, 75, 135, 1),
      //                       padding: EdgeInsets.only(
      //                           top: 10, left: 10, right: 40, bottom: 10),
      //                       height: null,
      //                       child: Text(
      //                         "บทที่1 : การละครั่งหนึ่ง",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             color: Color.fromARGB(221, 67, 67, 67),fontWeight: FontWeight.bold),
      //                       ),
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.only(
      //                           left: 10, right: 40, bottom: 10),
      //                       height: null,
      //                       width: null,
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text("รูป"+widget.transaction.number),
      //                           Text("ไฟล์"),
      //                           Text("รายละเอียด",style: TextStyle(fontSize: 15),)
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return FormDetail();
      //     },));
      //   },
      //   child: Icon(Icons.add),
      // ),