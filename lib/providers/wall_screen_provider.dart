import 'package:flutter/widgets.dart';

import '../model/wall_entry.dart';
import '../config/firestore_services.dart';

class wallScreenProvider extends ChangeNotifier{
  late wall_entry _entry;
  List<wall_entry> _entries =[];
  DatabaseServices service = DatabaseServices();

  //getter
  List<wall_entry> get entires => _entries;
  wall_entry get entry => _entry;

  Future<void> addEntry() async {
    service.addEntry(_entry);
  }

  Future<void> getEntries() async {
    service.retrieveEntries();
    notifyListeners();
  }
}