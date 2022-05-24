import 'package:news_eyepax/model/response.dart';
import 'package:news_eyepax/utilities/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBOperations {
  // Get database reference
  Future<Database> _getDatabase() async {
    return openDatabase(
        join(await getDatabasesPath(), 'news.db'),
        onCreate: (db, version) => db.execute('CREATE TABLE users(username VARCHAR(20) PRIMARY KEY, name TEXT, password TEXT, logged TINYINT)'),
        version: 1
    );
  }

  // Insert object to database
  Future<Response> addRecord({required String table, required Map<String, dynamic> map}) async {
    late Response response;
    late RESPONSE_CODE code;
    late String message;
    late String description;
    try {
      final db = await _getDatabase();
      await db.insert(table, map);
      code = RESPONSE_CODE.success;
      message = 'Record added successfully';
      description = 'Database insertion successful';
    } on DatabaseException catch(e) {
      if(e.getResultCode() == 1555) {
        code = RESPONSE_CODE.serverError;
        message = 'Record already exist';
        description = 'Duplicate entry found';
      } else {
        code = RESPONSE_CODE.serverError;
        message = 'Database Error';
        description = 'Database error : ${e.getResultCode()}';
      }
    } catch(e) {
      code = RESPONSE_CODE.serverError;
      message = 'Server Error';
      description = 'Unknown error occured';
    }
    response = Response(
        status: code,
        message: message,
        description: description
    );
    return response;
  }

  // Get database rows
  Future<Response> getRecords({ required String table, String? where, List<String>? args }) async {
    RESPONSE_CODE status = RESPONSE_CODE.success;
    String message = 'Records received';
    String description = 'Database get request successful';
    List<Map<String, dynamic>> data = [];
    try {
      final db = await _getDatabase();
      data = await db.query(table, where: where, whereArgs: args);
    } catch(e) {
      status = RESPONSE_CODE.serverError;
      message = 'Database error';
      description = e.toString();
    }
    return Response(status: status, message: message, description: description, data: data);
  }
}