import 'package:cloud_firestore/cloud_firestore.dart';

class wall_entry {
  final String title;
  wall_entry({required this.title});
  
  Map<String,dynamic> toMap() {
    return {
      'title': title
    };
  }

  wall_entry.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
    : title = doc['title'];

}