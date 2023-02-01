import 'package:woodyversoar/app/api/api.dart';
import 'package:woodyversoar/app/api/services/responseapi_sevice.dart';
import 'package:woodyversoar/app/models/profile_model.dart';
import 'package:woodyversoar/app/updates/profile_update.dart';

class ProfileController {
  // ? Requests

  Future<PostInfoUserUpdate?> postInfoUser(
      PostInfoUserModel postInfoUserModel) async {
    ResponseAPIService res = ResponseAPIService();

    await API()
        .post(
      "info-user",
      true,
      postInfoUserModel.toJson(),
    )
        .then((value) {
      res = ResponseAPIService(response: value.response);
    });

    PostInfoUserUpdate? postInfoUserUpdate;
    if (res != null && res.response["sucess"] == true) {
      postInfoUserUpdate = PostInfoUserUpdate.fromJson(res.response);
    }

    return postInfoUserUpdate;
  }
}
