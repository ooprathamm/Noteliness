import 'package:flutter/material.dart';

import '../model/books_entry.dart';
import '../config/firestore_services.dart';

class bookScreenProvider extends ChangeNotifier{
  late books_entry _entry;
  List<books_entry> _entries =[];
  DatabaseServices service = DatabaseServices();

  //getter
  List<books_entry> get entries => _entries;
  books_entry get entry => _entry;

  Future<List<books_entry>> getEntries() async {
    return await service.retrieveBookEntries();
  }
}