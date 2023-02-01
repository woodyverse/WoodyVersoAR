class PostWoodyversoArPacksUpdate {
  bool? sucess;
  List<ItemPack>? listPacks;

  PostWoodyversoArPacksUpdate(
    this.sucess,
    this.listPacks,
  );

  PostWoodyversoArPacksUpdate.fromJson(Map<String, dynamic> json) {
    sucess = json["sucess"];
    if (json["packs"] != null) {
      listPacks = List.empty(growable: true);
      json["packs"].forEach((value) {
        listPacks?.add(ItemPack.fromJson(value));
      });
    }
  }
}

class ItemPack {
  String? companyId;
  String? companyTag;
  List<ItemPackage>? listPackages;

  ItemPack(
    this.companyId,
    this.companyTag,
    this.listPackages,
  );

  ItemPack.fromJson(Map<String, dynamic> json) {
    companyId = json["company-id"];
    companyTag = json["company-tag"];
    if (json["packages"] != null) {
      listPackages = List.empty(growable: true);
      json["packages"].forEach((value) {
        listPackages?.add(ItemPackage.fromJson(value));
      });
    }
  }
}

class ItemPackage {
  String? id;
  String? description;
  String? type;
  String? trigger;
  String? content;

  ItemPackage();

  ItemPackage.fromJson(Map<String, dynamic> json) {
    id = json["1"];
    description = json["sucess"];
    type = json["type"];
    trigger = json["trigger"];
    content = json["content"];
  }
}
