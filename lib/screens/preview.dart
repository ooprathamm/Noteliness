import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:noteliness/config/firestore_services.dart';
import 'package:noteliness/model/wall_entry.dart';
import 'package:noteliness/providers/wall_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

import '../constants/colors.dart';
import '../widgets/text_field.dart';
class Preview extends StatefulWidget{
  final File file;
  const Preview({super.key, required this.file});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final DatabaseServices services =DatabaseServices();
  String _uploadedFileURL = "";
  late bool _isButtonDisabled;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled=false;
  }

  @override
  Widget build(BuildContext context) {
    final wallentryProvider = Provider.of<wallScreenProvider>(context);
    TextEditingController titleController = TextEditingController();
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        height: 270,
        decoration: BoxDecoration(
          color: myColors.DarkGrey,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.fromLTRB(0,10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image.file(widget.file)
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0,10,0,0)),
            MyTextField(

              hintText:  _isButtonDisabled ?"Uploading...":"Title...",
              fontSize: 22,
              controller: titleController,
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0,10,0,0)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.fromLTRB(90,0,0,0)),
                MyCustomFloatingButton1(
                    icon:  _isButtonDisabled ?const Icon(Icons.cloud_upload):const Icon(Icons.done),
                    clk:  _isButtonDisabled ?(){}:() async {

                      setState(() {
                        _isButtonDisabled = true;
                      });
                      String fileName = basename(widget.file.path);
                      var storageReference = await FirebaseStorage.instance.ref().child('wall_entries/$fileName');
                      await storageReference.putFile(widget.file);
                      await storageReference.getDownloadURL().then((value) {
                        setState(() {
                          _uploadedFileURL= value;
                        });
                      });
                      wall_entry entry = wall_entry(title: titleController.text,file_url: _uploadedFileURL);
                      bool success = await wallentryProvider.addEntry(entry: entry);
                      if(success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Entry was recorded!'),));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Some error occured'),));
                      }
                      Navigator.pushNamed(context, 'wall_screen');
                }),
                const Padding(padding: EdgeInsets.fromLTRB(25,0,0,0)),
                MyCustomFloatingButton2(
                    icon: const Icon(Icons.cancel),
                    clk: () {
                     Navigator.pushNamed(context, 'wall_screen');
                    })
              ]
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomFloatingButton1 extends StatelessWidget {
  final VoidCallback clk;
  final Icon icon;

  const MyCustomFloatingButton1({super.key, required this.clk, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
          color: myColors.DarkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
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

class MyCustomFloatingButton2 extends StatelessWidget {
  final VoidCallback clk;
  final Icon icon;

  const MyCustomFloatingButton2({super.key, required this.clk, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
          color: myColors.DarkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
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
        backgroundColor: myColors.Red,
        elevation: 8,
        onPressed: clk,
        child: icon,
      ),
    );
  }
}