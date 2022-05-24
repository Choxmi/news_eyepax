import 'package:flutter/material.dart';
import 'package:news_eyepax/api/user_api.dart';
import 'package:news_eyepax/components/lazy_container.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: usernameController,
                ),
                TextFormField(controller: nameController,),
                TextFormField(controller: passwordController,),
                TextButton(onPressed: () async {
                  UserAPI.registerUser(username: usernameController.text, password: passwordController.text, name: nameController.text);
                }, child: const Text('Register'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}