import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/api/user_api.dart';
import 'package:news_eyepax/components/alert.dart';
import 'package:news_eyepax/components/lazy_container.dart';
import 'package:news_eyepax/model/response.dart';
import 'package:news_eyepax/screens/login.dart';
import 'package:news_eyepax/utilities/constants.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  static const String id = 'registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LazyContainer(
          isLoading: isLoading,
          child: Form(
            key: _formKey,
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
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: textDecoration.copyWith(hintText: 'Username'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: textDecoration.copyWith(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: textDecoration.copyWith(hintText: 'Password'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      Response res = await UserAPI.registerUser(
                          username: usernameController.text,
                          password: passwordController.text,
                          name: nameController.text);
                      Alert.showAlert(context, res);
                      if (res.status == RESPONSE_CODE.success) {
                        Navigator.pushNamed(context, Login.id);
                      }
                    },
                    child: Text(
                      'Register',
                      style: GoogleFonts.nunito().copyWith(color: primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.nunito(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
