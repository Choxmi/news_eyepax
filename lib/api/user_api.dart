import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:news_eyepax/model/response.dart';
import 'package:news_eyepax/model/user.dart';
import 'package:news_eyepax/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_eyepax/utilities/db_operations.dart';

// User related operations
class UserAPI {

  // Check user already logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final String? loggedUser = prefs.getString('user');
    if(loggedUser != null) {
      //TODO: Verify logged in user with database
      return true;
    }
    return false;
  }

  // Register new user
  static Future<Response> registerUser({required String username, required String password, required String name}) async {
    var pwBytes = utf8.encode(password);
    print(sha1.convert(pwBytes).toString());
    User user = User(name: name, username: username, password: sha1.convert(pwBytes).toString(), logged: false);
    DBOperations ops = DBOperations();
    Response out = await ops.addRecord(table: 'users', map: user.toMap());
    return out;
  }

  // Login user
  static Future<Response> loginUser({ required String username, required String password }) async {
    DBOperations ops = DBOperations();
    Response res = await ops.getRecords(table: 'users', where: 'username = ?', args: [username]);
    if(res.status != RESPONSE_CODE.success) {
      return res;
    }
    List<Map<String, dynamic>> records = res.data;
    print(records);
    if(records.isNotEmpty) {
      var pwBytes = utf8.encode(password);
      print(sha1.convert(pwBytes).toString());
      if(records[0]['password'] == sha1.convert(pwBytes).toString()) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('user', records[0]['username']);
        //TODO: Update user logged in field
        res = Response(status: RESPONSE_CODE.success, message: 'Login successful', description: 'Login successful');
      } else {
        res = Response(status: RESPONSE_CODE.validationError, message: 'Check credentials', description: 'No record found');
      }
    } else {
      res = Response(status: RESPONSE_CODE.validationError, message: 'Check credentials', description: 'No record found');
    }
    print(res);
    return res;
  }

  // Logout user
  static Future<Response> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    //TODO: Update user logged in field
    return Response(status: RESPONSE_CODE.success, message: 'User logged out', description: 'User logged in successful');
  }

}