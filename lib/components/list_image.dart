import 'package:flutter/material.dart';

class ListImage extends StatelessWidget {
  final String imgPath;
  const ListImage({Key? key, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 7,
        child: Image.network(
            imgPath,
            fit: BoxFit.fitWidth,
            height: 1000
        ),
      ),
    );
  }
}
