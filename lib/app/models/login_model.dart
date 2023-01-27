class PostTokenModel {
  String login;
  String password;

  PostTokenModel(
    this.login,
    this.password,
  );

  Map<String, dynamic> toJson() {
    return {
      "login": login,
      "password": password,
    };
  }
}
