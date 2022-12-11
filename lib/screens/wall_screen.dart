import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../widgets/appbar.dart';
import '../widgets/floating_button.dart';
import '../widgets/info_dialogue.dart';
import '../widgets/no_notes.dart';
import '../widgets/note_card.dart';
import '../widgets/note_not_found.dart';
import '../widgets/progress_bar.dart';

class WallScreen extends StatefulWidget{
  @override
  State<WallScreen> createState() => _WallScreenState();
  }

class _WallScreenState extends State<WallScreen>{
  bool _isSearch = false;
  final _searchTextController = TextEditingController();
  List<Map<String,dynamic>> searchedForNotes = [];
  List<Map<String,dynamic>> notes =[];

  void addSearchedForNotesToList(String searchedNotes) {
    searchedForNotes = notes
        .where((note) => note['title'].toLowerCase().startsWith(searchedNotes))
        .toList();
    setState(() {});
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearch = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearch = false;
    });
  }

  Widget myMainAppBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notes",
            style: GoogleFonts.nunito(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 43),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                icon: const Icon(Icons.search_outlined),
                click: () {
                  _startSearch();
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
        controller: _searchTextController,
        onChanged: (searchedNotes) {
          addSearchedForNotesToList(searchedNotes);
        },
        style: GoogleFonts.nunito(
            color: myColors.White,
            fontWeight: FontWeight.normal,
            fontSize: 18),
        cursorColor: myColors.White,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              _searchTextController.text.isEmpty
                  ? Navigator.pop(context)
                  : _clearSearch();
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
              color: MyColors.myWhite,
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

  Widget buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _searchTextController.text.isEmpty
            ? notes.length
            : searchedForNotes.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return NoteCard(
            text: _searchTextController.text.isEmpty
                ? notes[index]['title']
                : searchedForNotes[index]['title'],
            data: _searchTextController.text.isEmpty
                ? notes[index]['data']
                : searchedForNotes[index]['data'],
            onPressed: () => Navigator.pushNamed(
              context,
              noteScreen,
              arguments: _searchTextController.text.isEmpty
                  ? notes[index]
                  : searchedForNotes[index],
            ),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
  
