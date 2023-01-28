import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woodyversoar/app/controllers/login_controller.dart';
import 'package:woodyversoar/app/models/login_model.dart';
import 'package:woodyversoar/app/routes/initalert_route.dart';
import 'package:woodyversoar/app/routes/termsofuse_route.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordCheck = TextEditingController();

  bool enableLogin = false;
  bool enableRegister = false;

  bool awaitRequest = false;

  ///
  _postLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        awaitRequest = true;
      });
      String email = _email.text;
      String password = _password.text;

      await LoginController()
          .postLogin(PostLoginModel(
        email,
        password,
      ))
          .then((value) {
        if (value.response["sucess"] == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeView();
              },
            ),
          );
        } else {
          String errorMensage = value.response["msg"];

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                "$errorMensage",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
        setState(() {
          awaitRequest = false;
        });
      }).onError((error, stackTrace) {
        String errorMensage = "Erro ao fazer login! Contate um adminstrador.";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              errorMensage,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        );
      });
    }
  }

  _postCreateUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        awaitRequest = true;
      });
      String login = _email.text;
      String email = _email.text;
      String nome = _name.text;
      String password = _password.text;
      String password_check = _passwordCheck.text;

      await LoginController()
          .postCreateUser(
              PostCreateUserModel(login, email, nome, password, password_check))
          .then((value) {
        if (value.response["sucess"] == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeView();
              },
            ),
          );
        } else {
          String errorMensage = value.response["msg"];

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                errorMensage,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
        setState(() {
          awaitRequest = false;
        });
      }).onError((error, stackTrace) {
        String errorMensage =
            "Erro ao criar cadastro! Contate um adminstrador.";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              errorMensage,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        );
      });
    }
  }

  ///
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) TermsOfUseRoute().welcomeDialog(context);
    });
  }

  ///
  Widget loginWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 25,
        ),
        child: Wrap(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        enableLogin = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      TextFormField(
                        controller: _email,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite o email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Senha",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      TextFormField(
                        controller: _password,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.visiblePassword,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite a senha";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  child: ElevatedButton(
                    onPressed: () {
                      awaitRequest ? null : _postLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    child: awaitRequest
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            "Confirmar",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        enableRegister = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Cadastro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      TextFormField(
                        controller: _name,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite o nome";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      TextFormField(
                        controller: _email,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite o email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Senha",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      TextFormField(
                        controller: _password,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.visiblePassword,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite a senha";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirme a senha",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      TextFormField(
                        controller: _passwordCheck,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.visiblePassword,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite a senha";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  child: ElevatedButton(
                    onPressed: () {
                      awaitRequest ? null : _postCreateUser();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    child: awaitRequest
                        ? const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            "Confirmar",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svgs/LogoWoodyverso.svg",
                  width: 225,
                  height: 225,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 175,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        enableLogin = true;
                        enableRegister = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 175,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        enableLogin = false;
                        enableRegister = true;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Cadastro",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: enableLogin,
                  child: loginWidget(),
                ),
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: enableRegister,
                  child: registerWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
