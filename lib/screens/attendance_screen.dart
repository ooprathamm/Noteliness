import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';

class AttendanceScreen extends StatefulWidget{
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
          child: Column(
            children: [
              MyAppBar(Title: "Attendance"),
              Center(
                child: Text("Attendance Screen",style: TextStyle(color: myColors.White),),
              )
            ],
          ),
      ),
    );
  }
}