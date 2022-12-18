import 'package:cloud_firestore/cloud_firestore.dart';

class wall_entry {
  final String title;
  wall_entry({required this.title});
  
  Map<String,dynamic> toMap() {
    return {
      'title': title
    };
  }

  factory wall_entry.fromMap(Map data) {
    return wall_entry(
        title: data['title'],
    );
  }

}