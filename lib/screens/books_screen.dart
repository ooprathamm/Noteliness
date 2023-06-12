import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/books_screen_provider.dart';
import '../widgets/appbar.dart';
import '../model/books_entry.dart';
import '../widgets/book_card.dart';
import '../widgets/info_dialogue.dart';
import '../widgets/note_not_found.dart';
import '../widgets/progress_bar.dart';

class BooksScreen extends StatefulWidget{
  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>{
  Future<List<books_entry>>? books;
  bool isSearchBarVisible = false;
  String searchString ='';
  Widget myMainAppBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'nav'),
            child: Text(
              "Books",
              style: GoogleFonts.nunito(
                  color: Colors.white, fontWeight: FontWeight.w500, fontSize: 43),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                icon: const Icon(Icons.search_outlined),
                click: () {
                  setState(() {
                    isSearchBarVisible = !isSearchBarVisible;
                  });
                },
              ),
              const SizedBox(
                width: 20,
              ),
              MyButton(
                icon: const Icon(Icons.info_outline_rounded),
                click: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => const MyInfoDialog());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedSearchInput() {

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      padding: const EdgeInsets.all(14),
      child: TextField(
        onChanged: (searchedBook) {
          setState(() {
            searchString = searchedBook;
          });
        },
        style: GoogleFonts.nunito(
            color: myColors.White,
            fontWeight: FontWeight.normal,
            fontSize: 18),
        cursorColor: myColors.White,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isSearchBarVisible=!isSearchBarVisible;
                searchString = "";
              });
            },
            icon: const Icon(
              Icons.clear,
              color: myColors.White,
            ),
          ),
          filled: true,
          fillColor: myColors.Grey,
          hintText: 'Search by the keyword...',
          hintStyle: GoogleFonts.nunito(
              color: myColors.White,
              fontWeight: FontWeight.normal,
              fontSize: 16),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    bookScreenProvider provider = Provider.of<bookScreenProvider>(context);
    books = bookScreenProvider().getEntries();
    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
        child: Column(
          children: [
            myMainAppBar(),
            FutureBuilder(
              future: books,
              builder: (BuildContext context, AsyncSnapshot<List<books_entry>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const MyProgressBar();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final List<books_entry> filteredBooks = snapshot.data!.where((
                      book) {
                    return book.book_name.toLowerCase().contains(searchString
                        .toLowerCase());
                  }).toList();

                  if (filteredBooks.isEmpty) {
                    return const NoteNotFound();
                  }
                  else {
                    return Expanded(
                      child: RefreshIndicator(
                        backgroundColor: myColors.Grey,
                        color: myColors.White,
                        onRefresh: () async {
                          setState(() {

                          });
                        },
                        child: ListView.builder(
                          //gridDelegate: null,
                          itemCount: filteredBooks.length,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var reversedList = filteredBooks.reversed.toList();
                            return BookCard(entry: reversedList[index]);
                          },
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}