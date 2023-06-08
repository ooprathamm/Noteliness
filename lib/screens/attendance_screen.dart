import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/info_dialogue.dart';

class AttendanceScreen extends StatefulWidget{
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>{

  Widget myMainAppBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'nav'),
            child: Text(
              "Attendance",
              style: GoogleFonts.nunito(
                  color: Colors.white, fontWeight: FontWeight.w500, fontSize: 43),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
          child: Column(
            children: [
              myMainAppBar(),
              Center(
                child: Text("Attendance Screen",style: TextStyle(color: myColors.White),),
              )
            ],
          ),
      ),
    );
  }
}