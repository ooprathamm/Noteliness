import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';

class BooksScreen extends StatefulWidget{
  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(Title: "Books"),
            Center(
              child: Text("Books Screen",style: TextStyle(color: myColors.White),),
            )
          ],
        ),
      ),
    );
  }
}