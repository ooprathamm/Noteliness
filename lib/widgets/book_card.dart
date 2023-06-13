import 'package:flutter/material.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../widgets/progress_bar.dart';
import '../model/books_entry.dart';
import '../constants/colors.dart';

class BookCard extends StatelessWidget{
  final books_entry entry;

  const BookCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    FileViewController? controller;
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
                  Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Text(
                    entry.book_name,
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