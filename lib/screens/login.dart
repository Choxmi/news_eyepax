import 'package:flutter/material.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(controller: usernameController,),
                TextFormField(controller: passwordController,),
                TextButton(onPressed: () async {
                  Response res = await UserAPI.loginUser(username: usernameController.text, password: passwordController.text);
                  Alert.showAlert(context, res);
                  if(res.status == RESPONSE_CODE.success) {
                    Navigator.pushNamedAndRemoveUntil(context, Dashboard.id, ModalRoute.withName(Dashboard.id));
                  }
                }, child: const Text('Login'),),
                TextButton(onPressed: (){ Navigator.pushNamed(context, Registration.id); }, child: const Text('Register'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
