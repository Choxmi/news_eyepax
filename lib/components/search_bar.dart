import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:news_eyepax/utilities/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final bool dirty;
  final Function onSearch;
  final Function? onChange;
  final String? hint;
  const SearchBar(
      {Key? key,
      required this.searchController,
      required this.dirty,
      required this.onSearch,
      this.hint, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (val) {
                      if(onChange != null) {
                        onChange!(val);
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint ?? '',
                      hintStyle: const TextStyle(color: Color(0xFF818181)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onSearch();
                },
                child: SizedBox(
                  width: 50.0,
                  child: Center(
                    child: Image(
                      image: !dirty
                          ? const Svg('assets/search.svg')
                          : const Svg('assets/close.svg'),
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
