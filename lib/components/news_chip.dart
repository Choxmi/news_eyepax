import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/utilities/constants.dart';

class NewsChip extends StatelessWidget {
  final bool selected;
  final String title;
  final Function onPressed;
  const NewsChip({Key? key, required this.selected, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: (){onPressed(title);},
        child: Chip(label: Text(title, style: GoogleFonts.nunito().copyWith(color: selected ? Colors.white : Colors.black87,),),
          shape: StadiumBorder(side: BorderSide(color: selected ? selectedBorderColor: borderColor,),), backgroundColor: selected? primaryColor : Colors.white,),
      ),
    );
  }
}
