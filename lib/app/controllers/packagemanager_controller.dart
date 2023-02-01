import 'package:woodyversoar/app/api/api.dart';
import 'package:woodyversoar/app/api/services/responseapi_sevice.dart';
import 'package:woodyversoar/app/models/packagemanager_model.dart';
import 'package:woodyversoar/app/updates/packagemanager_update.dart';

class PackageManagerController {
  Future<PostWoodyversoArPacksUpdate?> postWoodyversoArPacks(
      PostWoodyversoArPacksModel postWoodyversoArPacksModel) async {
    ResponseAPIService res = ResponseAPIService();

    await API()
        .post(
      "woodyverso-ar-packs-by-tag",
      true,
      postWoodyversoArPacksModel.toJson(),
    )
        .then((value) {
      res = ResponseAPIService(response: value.response);
    });

    PostWoodyversoArPacksUpdate? postWoodyversoArPacksUpdate;
    if (res != null && res.response["sucess"] == true) {
      postWoodyversoArPacksUpdate =
          PostWoodyversoArPacksUpdate.fromJson(res.response);
    }

    return postWoodyversoArPacksUpdate;
  }
}
