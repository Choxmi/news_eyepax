import 'package:flutter/material.dart';
import 'package:news_eyepax/components/search_bar.dart';

class Search extends StatefulWidget {
  final String? text;
  const Search({Key? key, this.text}) : super(key: key);
  static const String id = 'search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: SearchBar(
                          searchController: controller,
                          dirty: false,
                          hint: 'Type to search',
                          onSearch: () {
                            Navigator.pushNamed(context, Search.id,);
                          },
                          onChange: (val) {

                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
