import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class wall_entry{
  String? ID = "id";
  String? TITLE = "title";

  wall_entry({this.ID,this.TITLE});

  Map<String,dynamic> createMap() {
    return {
      'ID' : ID,
      'TITLE' : TITLE
    };
  }

   wall_entry.fromFirestore(Map<String,dynamic> firestoreMap):
      ID = firestoreMap['ID'],
      TITLE = firestoreMap['TITLE'];
}