import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/info_dialogue.dart';
import '../constants/colors.dart';

class MyAppBar extends StatelessWidget {
  final String Title;

  const MyAppBar({required this.Title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'nav'),
            child: Text(
              Title,
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
}

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback click;

  const MyButton({super.key, required this.icon, required this.click});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(10),
            ),
            backgroundColor: MaterialStateProperty.all(myColors.Grey),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: click,
        child: icon,
      ),
    );
  }
}
