import 'package:flutter/material.dart';
import 'package:news_eyepax/model/response.dart';

class Alert {
  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  static void showAlert(BuildContext context, Response response) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}