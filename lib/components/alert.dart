import 'package:flutter/material.dart';
import 'package:news_eyepax/model/response.dart';
import 'package:news_eyepax/utilities/constants.dart';

class Alert {
  static void showAlert(BuildContext context, Response response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColor,
        content: Text(response.message),
      ),
    );
  }
}
