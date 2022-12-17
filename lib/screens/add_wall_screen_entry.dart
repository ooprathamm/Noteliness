import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/floating_button.dart';
import '../widgets/info_dialogue.dart';
import '../widgets/my_dialog.dart';
import '../widgets/text_field.dart';
import 'package:noteliness/model/wall_entry.dart';

class addWallScreenEntry extends StatelessWidget{
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: myColors.DarkGrey,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(padding: EdgeInsets.fromLTRB(38,0,0,0)),
                MyFloatingButton(
                  icon: const Icon(Icons.camera_alt),
                  clk: () {  },
                ),
                const Padding(padding: EdgeInsets.fromLTRB(25,0,0,0)),
                MyFloatingButton(
                  icon: const Icon(Icons.file_copy), clk: () {  },
                ),
                const Padding(padding: EdgeInsets.fromLTRB(25,0,0,0)),
                MyFloatingButton(
                  icon: const Icon(Icons.cancel),
                  clk: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.fromLTRB(25,25,0,0)),
          ],
        ),
      ),
    );
  }
}


