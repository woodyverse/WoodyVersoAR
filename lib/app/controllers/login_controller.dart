import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woodyversoar/app/api/api.dart';
import 'package:woodyversoar/app/api/services/responseapi_sevice.dart';
import 'package:woodyversoar/app/models/login_model.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';
import 'package:woodyversoar/app/views/login/login_view.dart';

class LoginController {
  // ? Save login
  saveLogin(ResponseAPIService res) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("API:status", res.response["status"]);
    _prefs.setString("API:id", res.response["id"]);
    _prefs.setString("API:login", res.response["login"]);
  }

  saveToken(ResponseAPIService res) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("API:token", res.response["token"]);
  }

  // ? Delete login
  deleteLogin(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
    );
  }

  // ? Requests
  Future<ResponseAPIService> postLogin(PostLoginModel postLoginModel) async {
    ResponseAPIService res = ResponseAPIService();

    await API().post("login", false, postLoginModel.toJson()).then((value) {
      res = ResponseAPIService(response: value.response);
    });

    if (res != null && res.response["sucess"] == true) {
      saveLogin(res);
      await postToken(
          PostTokenModel(postLoginModel.login, postLoginModel.password));
    }

    return res;
  }

  Future<ResponseAPIService> postToken(PostTokenModel postTokenModel) async {
    ResponseAPIService res = ResponseAPIService();

    await API().post("token", false, postTokenModel.toJson()).then((value) {
      res = ResponseAPIService(response: value.response);
    });

    if (res != null && res.response["sucess"] == true) {
      saveToken(res);
    }

    return res;
  }

  Future<ResponseAPIService> postCreateUser(
      PostCreateUserModel postCreateUserModel) async {
    ResponseAPIService res = ResponseAPIService();

    await API()
        .post("create-user", false, postCreateUserModel.toJson())
        .then((value) {
      res = ResponseAPIService(response: value.response);
    });

    if (res != null && res.response["sucess"] == true) {
      await postToken(PostTokenModel(
          postCreateUserModel.login, postCreateUserModel.password));
    }

    return res;
  }
}
