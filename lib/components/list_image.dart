import 'package:flutter/material.dart';
import 'package:news_eyepax/utilities/constants.dart';

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
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: imgPath == 'null' ? defaultNewsImage :imgPath,
            fit: BoxFit.fitWidth,
            height: 1000,
            imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: defaultNewsImage,
                  fit: BoxFit.fitWidth,
                  height: 1000,);
            },
        ),
      ),
    );
  }
}
