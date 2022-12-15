import 'package:cloud_firestore/cloud_firestore.dart';

class wall_entry {
  final String id;
  final String title;

  wall_entry({required this.id,required this.title});
  
  Map<String,dynamic> toMap() {
    return {
      'id' : id,
      'title': title
    };
  }

  wall_entry.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> doc)
    : id = doc['id'],
      title = doc['title'];

}