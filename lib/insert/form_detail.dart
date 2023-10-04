import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDetail extends StatefulWidget {
  final String number;
  const FormDetail({required this.number});

  @override
  State<FormDetail> createState() => _FormDetailState();
}

class _FormDetailState extends State<FormDetail> {
  String x = "";
  void initState() {
    super.initState();
    // ดึงค่า number และกำหนดให้กับตัวแปร x
    x = widget.number;
    // Initialize the description controller with the transaction's description
    // _descriptionController.text = widget.transaction.description;
  }

  final nameController = TextEditingController();
  final detailController = TextEditingController();

  File? _imageFile; // เพิ่มตัวแปร _imageFile
  final ImagePicker _imagePicker = ImagePicker(); // เพิ่มตัวแปร _imagePicker

  // คำสั่งยืนยันรูปภาพและเปลี่ยนสถานะตัวแปร _imageFile
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  // String? _filePath;
  // // ฟังก์ชันสำหรับเปิดตัวเลือกไฟล์
  // Future<void> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'doc', 'docx'],
  //   );

  //   if (result != null) {
  //     setState(() {
  //       _filePath = result.files.single.name;
  //     });
  //   }
  // }
  // void _clearFile(){
  //   setState(() {
  //     _filePath = null;
  //   });
  // }

  List<String> documents = [];
  List<String> selectedDocumentNames = [];

  void _pickDocument() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        documents.addAll(result.files.map((file) => file.path!).toList());
        selectedDocumentNames
            .addAll(result.files.map((file) => file.name!).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("เพิ่มข้อมูล")),
      body: SingleChildScrollView(
          child: Form(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(255, 75, 135, 1), width: 2),
                  borderRadius: BorderRadius.circular(7)),
              margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              width: 400,
              height: null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 40, bottom: 10),
                    height: null,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        label: Text(
                          "หัวข้อ",
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 40, bottom: 10),
                    height: null,
                    width: null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: null,
                          width: 207,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  Color.fromARGB(234, 204, 204, 204), // สีขอบๆ
                              width: 2.0, // ความหนาขอบๆ
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            onTap: () {
                              _pickImage(); // เมื่อคลิกที่ภาพเพื่อเลือกรูป
                            },
                            child: Stack(
                              children: [
                                _imageFile != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            5), // เพิ่มขอบโค้งของรูปภาพ
                                        child: Image.file(
                                          _imageFile!,
                                          width: 207,
                                          height: null,
                                          fit: BoxFit
                                              .cover, // ปรับขนาดรูปภาพให้พอดีกับ Container
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            5), // เพิ่มขอบโค้งของ Container
                                        child: Container(
                                          width: 207,
                                          height: 207,
                                          color: Color.fromARGB(
                                              255, 255, 193, 213),
                                          child: Center(
                                            child: Icon(
                                              Icons.add_photo_alternate,
                                              color: Color.fromARGB(
                                                  255, 255, 75, 135),
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                if (_imageFile != null)
                                  Positioned(
                                    top: 1, // ระยะขอบบนของรูปภาพ
                                    right: 1, // ระยะขอบซ้ายของรูปภาพ
                                    child: InkWell(
                                      onTap: _clearImage,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        IntrinsicWidth(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 75, 135),
                            ),
                            onPressed: _pickDocument,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons
                                      .upload, // You can change the icon as needed
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  selectedDocumentNames.isNotEmpty
                                      ? (selectedDocumentNames.last.length <= 15
                                          ? selectedDocumentNames.last
                                          : selectedDocumentNames.last
                                                  .substring(0, 15) +
                                              "...")
                                      : 'เพิ่มไฟล์',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                if (selectedDocumentNames.isNotEmpty)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedDocumentNames.clear();
                                        documents.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: detailController,
                          decoration:
                              InputDecoration(label: Text("รายละเอียด")),
                          textInputAction: TextInputAction.newline,
                          maxLines: null,
                          minLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              width: 400,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 75, 135, 1),
                    minimumSize: Size(300, 50)),
                onPressed: () {
                  var dname = nameController.text;
                  var detail = detailController.text;

                  Transactions statement = Transactions(
                    number: x,
                    dname: dname,
                    detail: detail,
                    documents: documents,
                    imageFile: _imageFile,
                    name: "",
                    teacher: "",
                  );
                  var provider =
                      Provider.of<TransactionProvider>(context, listen: false);
                  provider.addTransaction(statement);
                  Navigator.pop(context);
                  print(x);
                  print(detail);
                  print(_imageFile);
                },
                child: Text(
                  'บันทึก',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ), // ข้อความบนปุ่ม
              ),
            )
          ],
        ),
      )),
    );
  }
}
