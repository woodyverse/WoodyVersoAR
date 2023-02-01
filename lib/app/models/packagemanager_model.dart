class PostWoodyversoArPacksModel {
  String tag;

  PostWoodyversoArPacksModel(this.tag);

  Map<String, dynamic> toJson() {
    return {
      "tag": tag,
    };
  }
}
