import 'package:flutter/material.dart';

class developer extends StatelessWidget {
  const developer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ผู้พัฒนา"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: null,
                    child: Center(
                        child: Container(
                      height: null,
                      width: 210,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(234, 204, 204, 204), // สีขอบๆ
                          width: 2.0, // ความหนาขอบๆ
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(7.0), // ปรับมุมโค้งของรูปภาพ
                        child: Image.asset(
                          "assets/images/imron.JPG",
                          // width: 150, // ปรับขนาดรูปภาพตามที่คุณต้องการ
                          // height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      padding: EdgeInsets.only(left: 15,right: 15),
                     
                      // color: Colors.amber,
                      width: 400,
                      height: null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 25,
                                        ),
                                        SizedBox(height: 70),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ชื่อ-สกุล",
                                    style: TextStyle(fontSize: 17,color: Color.fromARGB(234, 84, 84, 84)),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "อิมรอน วาเลาะ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                          Container(height: 1, color: Color.fromARGB(234, 204, 204, 204),margin: EdgeInsets.only(bottom: 20),),

                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.contact_page,
                                          size: 25,
                                        ),
                                        SizedBox(height: 65),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "รหัสนักศึกษา",
                                    style: TextStyle(fontSize: 17,color: Color.fromARGB(234, 84, 84, 84)),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "406459028",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                          Container(height: 1, color: Color.fromARGB(234, 204, 204, 204),margin: EdgeInsets.only(bottom: 20),),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.school,
                                          size: 25,
                                        ),
                                        SizedBox(height: 65),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "คณะ",
                                    style: TextStyle(fontSize: 17,color: Color.fromARGB(234, 84, 84, 84)),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "วิทยาศาสตร์เทศโนโลยีเเละเกษตร",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                          Container(height: 1, color: Color.fromARGB(234, 204, 204, 204),margin: EdgeInsets.only(bottom: 20),),

                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.bookmark,
                                          size: 25,
                                        ),
                                        SizedBox(height: 65),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "สาขา",
                                    style: TextStyle(fontSize: 17,color: Color.fromARGB(234, 84, 84, 84)),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "วิทยาการคอมพิวเตอร์",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                          Container(height: 1, color: Color.fromARGB(234, 204, 204, 204),margin: EdgeInsets.only(bottom: 20),),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 25,
                                        ),
                                        SizedBox(height: 65),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "วิทยาเขต",
                                    style: TextStyle(fontSize: 17,color: Color.fromARGB(234, 84, 84, 84)),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "มหาวิทยาลัยราชภัฏยะลา",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                          Container(height: 1, color: Color.fromARGB(234, 204, 204, 204),margin: EdgeInsets.only(bottom: 20),),

                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 25,
                                        ),
                                        SizedBox(height: 65),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "เบอร์โทรศัพท์",
                                    style: TextStyle(fontSize: 17,color: Color.fromARGB(234, 84, 84, 84)),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "098-735-5512",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                          Container(height: 1, color: Color.fromARGB(234, 204, 204, 204),margin: EdgeInsets.only(bottom: 20),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        );
  }
}
