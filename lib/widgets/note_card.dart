import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:noteliness/model/wall_entry.dart';
import 'package:noteliness/widgets/progress_bar.dart';

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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: entry.file_url,
                      placeholder: (context, url) => const Center(child: SizedBox(height: 35,width: 35,child: MyProgressBar())),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  child: CachedNetworkImage(
                    imageUrl: entry.file_url,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                            ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: SizedBox(height: 35,width: 35,child: MyProgressBar())),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
