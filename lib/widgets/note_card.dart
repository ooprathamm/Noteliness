import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:noteliness/model/wall_entry.dart';

import '../constants/colors.dart';

class NoteCard extends StatelessWidget {
  final wall_entry entry;

  const NoteCard({super.key, required this.entry});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        color: myColors.Grey,
        child: ListTile(
          onTap: (){},
          contentPadding: const EdgeInsets.all(15),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              children:[
                SizedBox(
                  child: Image.network(entry.file_url),
                  height: 175,
                  width: 300,
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                Text(
                  entry.title,
                  softWrap: true,
                  style: const TextStyle(
                    color: myColors.White,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
