class PostInfoUserUpdate {
  bool? sucess;
  int? status;
  String? login;
  String? email;
  String? id;
  String? nome;

  PostInfoUserUpdate(
    this.sucess,
    this.status,
    this.login,
    this.email,
    this.id,
    this.nome,
  );

  PostInfoUserUpdate.fromJson(Map<String, dynamic> json) {
    sucess = json["sucess"];
    status = json["status"];
    login = json["login"];
    email = json["email"];
    id = json["id"];
    nome = json["nome"];
  }
}
