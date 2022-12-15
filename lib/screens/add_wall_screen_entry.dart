import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/floating_button.dart';
import '../widgets/my_dialog.dart';
import '../widgets/text_field.dart';
import 'package:noteliness/model/wall_entry.dart';

class addWallScreenEntry extends StatelessWidget{
  late final Map<String, dynamic> note;

 // const addWallScreenEntry({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
    TextEditingController(text: note['title']);
    bool isChanged() {
      if (note['title'] != titleController.text) {
        return true;
      } else {
        return false;
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return isChanged() ? await onPop(context) : true;
      },
      child: Scaffold(
        floatingActionButton: MyFloatingButton(
          clk: () async {
            note['id'] == -1
                ? Navigator.pop(context)
                : await showDialog<bool>(
                context: context,
                builder: (context) {
                  return DeleteDialog(id: note['id']);
                });
          },
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.white,
          ),
        ),
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
                          id: note['id'],
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
      ),
    );
  }
}

Future<bool> onPop(BuildContext context) async {
  final value = await showDialog<bool>(
      context: context,
      builder: (context) {
        return const MyDialog(
            text: 'Keep',
            titleText: "Are your sure you want discard your changes ?");
      });
  return value == true;
}
}