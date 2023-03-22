import 'package:unitycargo/resources/user_data.dart';

class ResponseData {
  final bool success;
  final String message;
  final String token;
  String user_role;

  ResponseData(this.success, this.message, this.token, this.user_role);
}
