import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path/path.dart' as path;

import '../model/books_entry.dart';
import '../constants/colors.dart';

class BookCard extends StatelessWidget{
  final books_entry entry;

  const BookCard({super.key, required this.entry});

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
                  builder: (_)=> ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SfPdfViewer.network(entry.book_url),
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
                    child: Expanded(
                      child: SfPdfViewer.network(
                          entry.book_url,
                          canShowScrollHead: false,
                          canShowScrollStatus: false),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                        entry.book_name,
                        softWrap: true,
                        style: const TextStyle(
                          color: myColors.White,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                    ),
                      ),
                      IconButton(
                          onPressed: () async {
                            final directory = await DownloadsPath.downloadsDirectory();
                            String savePath = path.join(
                                directory!.path,'${entry.book_name.replaceAll(' ', '').split('').join()}.pdf');
                            try {
                              Dio dio = Dio();
                              await dio.download(entry.book_url, savePath);
                            } catch (error) {
                              print('Error downloading file: $error');
                            }
                          },
                          icon: const Icon(Icons.download),
                      )
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}