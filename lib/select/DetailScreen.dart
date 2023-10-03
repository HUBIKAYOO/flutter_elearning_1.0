import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/insert/form_detail.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String number,name;
  DetailScreen({required this.number,required this.name});
  

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController _descriptionController = TextEditingController();
  String x = "",name="";
  void initState() {
    super.initState();
    // ดึงค่า number และกำหนดให้กับตัวแปร x
    x = widget.number;
    name = widget.name;
    // Initialize the description controller with the transaction's description
    // _descriptionController.text = widget.transaction.description;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, widget) {
          // var count = provider.transactions.length;
          // if (count <= 0) {
          //   return Center(
          //     child: Text(
          //       "ไม่พบข้อมูล",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   );
          // }else{
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
                        border: Border.all(
                            color: Color.fromRGBO(255, 75, 135, 1), width: 2),
                        borderRadius: BorderRadius.circular(7)),
                    margin: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    width: 400,
                    height: null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 400,
                          color: Color.fromRGBO(255, 75, 135, 1),
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 40, bottom: 10),
                          height: null,
                          child: Text(
                            data.dname,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 67, 67, 67),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 40, bottom: 10, top: 10),
                          height: null,
                          width: null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.imageFile != null
                              ? Container(
                                height: null,
                                width: 110,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(
                                        234, 204, 204, 204), // สีขอบๆ
                                    width: 2.0, // ความหนาขอบๆ
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      5), // เพิ่มขอบโค้งของรูปภาพ
                                  child: Image.file(
                                    data.imageFile,
                                    width: 100,
                                    height: null,
                                    fit: BoxFit
                                        .cover, // ปรับขนาดรูปภาพให้พอดีกับ Container
                                  ),
                                ),
                              )
                              :SizedBox(width: 11,),
                              
                              Text("ไฟล์"),
                              SizedBox(height: 10,),
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