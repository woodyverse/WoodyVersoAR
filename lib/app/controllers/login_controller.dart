import 'package:shared_preferences/shared_preferences.dart';
import 'package:woodyversoar/app/api/api.dart';
import 'package:woodyversoar/app/api/services/responseapi_sevice.dart';
import 'package:woodyversoar/app/models/login_model.dart';

class LoginController {
  // ? Save login
  saveToken(ResponseAPIService res) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("API:token", res.response["token"]);
  }

  // ? Requests
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
}
