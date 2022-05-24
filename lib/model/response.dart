import 'package:news_eyepax/utilities/constants.dart';

class Response {
  final RESPONSE_CODE status;
  final String message;
  final String description;
  final dynamic data;

  Response({
    required this.status,
    required this.message,
    required this.description,
    this.data
  });

  // Convert a User into a Map
  Map<String,dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'description': description,
      'data': data
    };
  }

  // Display response details
  @override
  String toString() {
    return 'Response{status: $status, message: $message, description: $description, data: ${data.toString()}';
  }

}