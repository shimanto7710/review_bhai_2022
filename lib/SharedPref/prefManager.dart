import 'package:review_bhai_2022/api/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {


  String name = "name";
  String number = "number";



  Future setPhone(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', value);
  }

  Future<String> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone') ?? "";
  }

  setIsLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginData', value);
  }

  setIsCompletedInfo(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('completedInfo', value);
  }

  Future<bool> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loginData') ?? false;
  }

  Future<bool> getIsCompletedInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('completedInfo') ?? false;
  }


  Future setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', value);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";
  }

  setUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', value);
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId') ?? "";
  }

}
