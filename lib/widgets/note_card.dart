import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
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
          onTap: () async {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_)=>FullScreenWidget(
                  child: Hero(
                    tag: "customTag",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        entry.file_url,
                      ),
                    ),
                  ),
                )
              ),
            );
          },
          contentPadding: const EdgeInsets.all(10),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              children:[
                Container(
                  height: 200,
                  width: 355,
                  child: FittedBox(
                    child: Image.network(entry.file_url),
                    fit: BoxFit.fill,
                  ),
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
