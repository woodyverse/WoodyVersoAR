class PostInfoUserModel {
  String id;

  PostInfoUserModel(this.id);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
