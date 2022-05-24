import 'package:flutter/material.dart';

enum RESPONSE_CODE { success, validationError, serverError }

const defaultNewsImage = 'https://www.droid-life.com/wp-content/uploads/2018/05/download-google-news-1200x660.jpg';

const primaryColor = Color(0xFFFF3A44);
const selectedBorderColor = Color(0xFFFFB3B6);
const borderColor = Color(0xFFF0F1FA);

const textDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: selectedBorderColor),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  hintStyle: TextStyle(color: Color(0xFF818181)),
);

const List<String> categories = ['business','entertainment','general','health','science','sports','technology'];