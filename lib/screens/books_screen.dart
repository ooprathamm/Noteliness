import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';
import '../model/books_entry.dart';

class BooksScreen extends StatefulWidget{
  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>{
  Future<List<books_entry>>? books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(Title: "Books"),
            FutureBuilder(
              future: books,
            )
          ],
        ),
      ),
    );
  }
}