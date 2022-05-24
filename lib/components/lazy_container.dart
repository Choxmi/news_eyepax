import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_eyepax/utilities/constants.dart';

class LazyContainer extends StatelessWidget {
  final bool isLoading;
  final Widget? child;
  const LazyContainer({Key? key, required this.isLoading, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading ? const SpinKitFadingCube(color: primaryColor,) : child,
    );
  }
}
