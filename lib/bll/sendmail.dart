import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:unitycargo/resources/app_authentication.dart';
import 'package:unitycargo/resources/mail_data.dart';
import 'package:unitycargo/utils/app_urls.dart';

class SendMail {
  Future<bool> Send(Mail mail) async {
    bool isSuccess = false;
    String path = url + "send-mail";
    var appAuthentication = AppAuthentication();
    String token = await appAuthentication.getTokenAdmin();

    var data = {
      "email": mail.emailTo,
      "subject": mail.subject,
      "message": mail.message,
    };
    var response = await http.post(Uri.parse(path), body: data, headers: {
      "accept": "application/json",
      "Authorization": "Bearer " + token,
      "token": token,
    });
    var res = json.decode(response.body);
    print(res);
    if (res == true) {
      isSuccess = true;
    }
    return isSuccess;
  }
}
