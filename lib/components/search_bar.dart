import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const SearchBar({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: searchController,
              ),
            ),
            GestureDetector(
              child: SizedBox(
                width: 50.0,
                child: Center(child: Image.asset('assets/search.png', width: 45.0, height: 45.0,),),
              ),
            ),
          ],
        ));
  }
}
