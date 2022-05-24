import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/api/user_api.dart';
import 'package:news_eyepax/components/alert.dart';
import 'package:news_eyepax/components/breaking_news.dart';
import 'package:news_eyepax/components/lazy_container.dart';
import 'package:news_eyepax/components/search_bar.dart';
import 'package:news_eyepax/components/top_news.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/model/response.dart';
import 'package:news_eyepax/screens/login.dart';
import 'package:news_eyepax/screens/search.dart';
import 'package:news_eyepax/utilities/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String id = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = true;
  TextEditingController searchController = TextEditingController();
  List<Article> articles = [];

  @override
  void initState() {
    UserAPI.isLoggedIn().then((value) {
      if (!value) {
        // Navigate to login
        Navigator.pushNamedAndRemoveUntil(
            context, Login.id, ModalRoute.withName(Login.id));
        return;
      }
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyContainer(
        isLoading: loading,
        child: SafeArea(
          bottom: false,
          child: Column(
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
                            searchController: searchController,
                            dirty: false,
                            hint: 'Type to search',
                            onSearch: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Search(text: searchController.text,),),);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            showCupertinoDialog(context: context, builder: (BuildContext modalContext){
                              return CupertinoAlertDialog(
                                title: Text('Logout',style: GoogleFonts.nunito().copyWith(fontSize: 20.0),),
                                content: Text('Are you sure you want to logout?',style: GoogleFonts.nunito(),),
                                actions: [
                                  CupertinoDialogAction(
                                      child: Text('Logout',style: GoogleFonts.nunito().copyWith(color: primaryColor, fontWeight: FontWeight.w200),),
                                      onPressed: () async
                                      {
                                        Response res = await UserAPI.logoutUser();
                                        Navigator.of(context).pop();
                                        Alert.showAlert(context, res);
                                        Navigator.pushNamedAndRemoveUntil(context, Login.id, ModalRoute.withName(Login.id));
                                      }
                                  ),
                                  CupertinoDialogAction(
                                      child: Text('Cancel',style: GoogleFonts.nunito().copyWith(color: Colors.blueAccent),),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      }
                                  )
                                ],
                              );
                            },
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              CupertinoIcons.person_alt_circle,
                              color: primaryColor,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              const BreakingNews(),
              const TopNews(),
            ],
          ),
        ),
      ),
    );
  }
}
