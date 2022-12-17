import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/floating_button.dart';
import '../widgets/my_dialog.dart';
import '../widgets/text_field.dart';
import 'package:noteliness/model/wall_entry.dart';

class addWallScreenEntry extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              saveclk: () async {
                await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return MyDialog(
                        text: 'Save',
                        titleText: "Save changes ?",
                        title: titleController.text,
                      );
                    });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    MyTextField(
                      hintText: "Title",
                      fontSize: 40,
                      controller: titleController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


