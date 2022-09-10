import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/resources/first_step.dart';
import 'package:unitycargo/resources/second_step.dart';

import 'user_data.dart';

class AppAuthentication {
  Future verifySignup(firstname, lastname, email, telephone, password) async {
    if (firstname == "") {
      return "Firsname is required";
    }

    if (lastname == "") {
      return "Lastname is required";
    }

    if (email == "") {
      return "Email is required";
    }

    if (telephone == "") {
      return "Telephone is required";
    }

    if (password == "") {
      return "Please enter your password";
    }

    if (password.toString().length < 8) {
      return "Please must be more 8 or more characters";
    }

    return "valid";
  }

  Future verifyLogin(email, password) async {
    if (email == "") {
      return "Email is required";
    }

    if (password == "") {
      return "Please enter your password";
    }
    return "valid";
  }

  Future verifyForgotPassword(email) async {
    if (email == "") {
      return "Email is required";
    }

    return "valid";
  }

  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token").toString();
  }

  Future setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  Future storeTokenVariable(String value, String identifier) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(identifier, value);
  }

  Future getTokenVariable(String identifier) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(identifier).toString();
  }

  Future removeTokenVariable(String identifier) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(identifier);
  }

  Future logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("token");
  }

  Future checkUser(BuildContext context) async {
    var isUser = await getToken();
    if (isUser == "null") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())));
    }
    return true;
  }

  Future navigatePage(BuildContext context, page) async {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => page)));
  }

  Future navigatePageReal(BuildContext context, page) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => page)));
  }

  Future verifyProfileUpdate(User user) async {
    if (user.firstname == "") {
      return "Firstname cannot be empty";
    }

    if (user.lastname == "") {
      return "Lastname cannot be empty";
    }

    if (user.phone == "") {
      return "Telephone cannot be empty";
    }

    return "valid";
  }

  Future validPasswordChange(old, new_, confirm) async {
    if (old == "" || new_ == "" || confirm == "") {
      return "All fields are required";
    }

    if (new_.length < 8) {
      return "Password must be 8 character or more";
    }

    if (new_ != confirm) {
      return "Confirm password not matched";
    }

    return "valid";
  }

  Future validateFirstStep(FirstStep firstStep) async {
    if (firstStep.firstname == "") {
      return "Sender firstname cannot be empty";
    }

    if (firstStep.lastname == "") {
      return "Sender lastname cannot be empty";
    }

    if (firstStep.email == "") {
      return "Sender email cannot be empty";
    }

    if (firstStep.telephone == "") {
      return "Sender telephone cannot be empty";
    }

    if (firstStep.email == "") {
      return "Sender email cannot be empty";
    }

    if (firstStep.telephone == "") {
      return "Sender address cannot be empty";
    }

    if (firstStep.postal == "") {
      return "Sender postal cannot be empty";
    }

    if (firstStep.date == "") {
      return "Pick up date cannot be empty";
    }

    if (firstStep.time == "") {
      return "Pick up time cannot be empty";
    }

    if (firstStep.noofboxes == "") {
      return "Please select No. of boxes";
    }

    if (firstStep.commodityType == "Select Commodity Type") {
      return "Please select commodity type";
    }

    if (firstStep.itemType == "Select Package Type") {
      return "Please select commodity type";
    }
    return "valid";
  }

  Future validateSecondStep(SecondStep secondStep) async {
    if (secondStep.firstname == "") {
      return "Sender firstname cannot be empty";
    }

    if (secondStep.lastname == "") {
      return "Sender lastname cannot be empty";
    }

    if (secondStep.phone1 == "") {
      return "Sender telephone cannot be empty";
    }

    if (secondStep.address == "") {
      return "Sender address cannot be empty";
    }

    if (secondStep.city == "") {
      return "City cannot be empty";
    }

    if (secondStep.state == "Select State") {
      return "Please select state";
    }

    return "valid";
  }
}
