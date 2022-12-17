import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/wall_entry.dart';

class DatabaseServices{

  final FirebaseFirestore _db =FirebaseFirestore.instance;

  Future<void> addEntry(wall_entry entry) async {
    await _db.collection("wall_entries").add(entry.toMap());
  }

  Future<void> deleteEntry(wall_entry entry) async {
    await _db.collection("wall_entries").doc(entry.title).delete();
  }

  Future<List<wall_entry>> retrieveEntries() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db.collection("wall_entries").get();
    return snapshot.docs
        .map((docSnapshot) => wall_entry.fromJson(docSnapshot.data())).toList();
  }
}