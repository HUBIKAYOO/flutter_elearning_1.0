class Transactions{
  String name;
  String number;
   String teacher;

   String dname;
  final imageFile;
  List<String> documents;
  String detail;

  
  Transactions(
    { 
      required this.name,
      required this.number,
      required this.teacher,

      required this.dname,
      required this.imageFile,
      required this.documents,
      required this.detail,
    }
  );
}

