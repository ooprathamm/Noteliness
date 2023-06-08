import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../constants/colors.dart';
import '../widgets/floating_button.dart';
import '../screens/preview.dart';

class addWallScreenEntry extends StatelessWidget{
  final ImagePicker _imgPicker = ImagePicker();
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
                const Padding(padding: EdgeInsets.fromLTRB(25,0,0,0)),
                MyFloatingButton(
                  icon: const Icon(Icons.camera_alt),
                  clk: () async {
                    final XFile? image = await _imgPicker.pickImage(source: ImageSource.camera);
                    File photofile = File(image!.path);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Preview(file: photofile));
                  },
                ),
                const Padding(padding: EdgeInsets.fromLTRB(25,0,0,0)),
                MyFloatingButton(
                  icon: const Icon(Icons.file_copy),
                  clk: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      File pickedFile = File(result!.files.single.path.toString());
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Preview(file: pickedFile));
                    } else {
                      // User canceled the picker
                    }
                },
                ),
                const Padding(padding: EdgeInsets.fromLTRB(25,0,0,0)),
                MyCustomFloatingButton(
                  icon: const Icon(Icons.cancel),
                  clk: () {
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0,0,25,0)),
              ],
            ),
            const Padding(padding: EdgeInsets.fromLTRB(25,25,0,0)),
          ],
        ),
      ),
    );
  }
}



class MyCustomFloatingButton extends StatelessWidget {
  final VoidCallback clk;
  final Icon icon;

  const MyCustomFloatingButton({super.key, required this.clk, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: const BoxDecoration(
          color: myColors.DarkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(-2, 1),
            )
          ]),
      child: FloatingActionButton(
        backgroundColor: myColors.Green,
        elevation: 8,
        onPressed: clk,
        child: icon,
      ),
    );
  }
}

