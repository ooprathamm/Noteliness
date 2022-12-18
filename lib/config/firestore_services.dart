import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/wall_entry.dart';

class DatabaseServices{

  final FirebaseFirestore _db =FirebaseFirestore.instance;

  Future<void> addEntry(wall_entry entry) async {
    await _db.collection("wall_entries").doc('wall_entries_doc').update({
      "wallEntries" : FieldValue.arrayUnion([entry.toMap()])
    });
  }

  Future<List<wall_entry>> retrieveEntries() async {
   var snapshot = await _db.collection('wall_entries').doc('wall_entries_doc').get();
   Map<String,dynamic> data = snapshot.data()!;
   List<dynamic> entriesData = data['wallEntries'];
   List<wall_entry> entries = [];
   for (var entry in entriesData) {
     wall_entry element = wall_entry.fromMap(entry);
     entries.add(element);
   }
   return entries;
  }
}