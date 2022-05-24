import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/api/user_api.dart';
import 'package:news_eyepax/components/alert.dart';
import 'package:news_eyepax/components/lazy_container.dart';
import 'package:news_eyepax/model/response.dart';
import 'package:news_eyepax/screens/dashboard.dart';
import 'package:news_eyepax/screens/registration.dart';
import 'package:news_eyepax/utilities/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LazyContainer(
          isLoading: isLoading,
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Hero(
                      tag: 'logo',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    controller: usernameController,
                    decoration: textDecoration.copyWith(hintText: 'Username'),
                  ),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: textDecoration.copyWith(hintText: 'Password'),
                  ),
                  Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                      onPressed: () async {
                        Response res = await UserAPI.loginUser(
                            username: usernameController.text,
                            password: passwordController.text);
                        Alert.showAlert(context, res);
                        if (res.status == RESPONSE_CODE.success) {
                          Navigator.pushNamedAndRemoveUntil(context, Dashboard.id,
                              ModalRoute.withName(Dashboard.id));
                        }
                      },
                      child: Text('Login', style: GoogleFonts.nunito().copyWith(color: primaryColor),),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Registration.id);
                      },
                      child: Text('Register', style: GoogleFonts.nunito(),),
                    ),
                  ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
