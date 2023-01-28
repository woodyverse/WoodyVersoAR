class PostLoginModel {
  String login;
  String password;

  PostLoginModel(
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

class PostCreateUserModel {
  String login;
  String email;
  String nome;
  String password;
  String password_check;

  PostCreateUserModel(
    this.login,
    this.email,
    this.nome,
    this.password,
    this.password_check,
  );

  Map<String, dynamic> toJson() {
    return {
      "login": login,
      "email": email,
      "nome": nome,
      "password": password,
      "password_check": password_check,
    };
  }
}
