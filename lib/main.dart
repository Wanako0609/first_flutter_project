import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'theme.dart';
import 'activity/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Application',
      theme: MyTheme().theme1,
      home: const MyMainPage(),
    );
  }
}

class MyMainPage extends StatelessWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mon Reseau Social'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: MyColumLogin(),
          ),
        ));
  }
}

class MyColumLogin extends StatefulWidget {
  const MyColumLogin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyColumLogin();
}

class _MyColumLogin extends State<MyColumLogin> {
  //variable
  final _emailReturn = TextEditingController();
  final _passwordReturn = TextEditingController();

  String email = "";
  String password = "";

  String? errorEmailMessage;
  String? errorPasswordMessage;
  String result = "";

  //fonction
  void voidfield(String email, String password) {
    setState(() {
      errorEmailMessage = null;
      errorPasswordMessage = null;
    });

    if (email.trim().isEmpty) {
      setState(() {
        errorEmailMessage = "Vous devez remplir le champs";
      });
    } else {
      if (email.length < 3) {
        setState(() {
          errorEmailMessage = "Vous devez avoir minimum 3 caracteres !";
        });
      } else if (email.length > 40) {
        setState(() {
          errorEmailMessage = "Vous devez avoir moins de 40 caracteres !";
        });
      } else {
        if (password.trim().isEmpty) {
          setState(() {
            errorPasswordMessage = "Vous devez remplir le champs";
          });
        } else {
          if (password.length < 3) {
            setState(() {
              errorPasswordMessage = "Vous devez avoir minimum 3 caracteres !";
            });
          } else if (password.length > 40) {
            setState(() {
              errorPasswordMessage =
                  "Vous devez avoir moins de 40 caracteres !";
            });
          } else {
            connexion(email, password);
          }
        }
      }
    }
  }

  void connexion(String email, String password) {
    String userEmail = "test";
    String userPassword = "test";
    if ((email == userEmail) & (password == userPassword)) {
      setState(() {
        result = "connexion reussi !";
        gotoHomePage();
      });
    } else {
      setState(() {
        result = "Mauvais Mot de passe ou mauvaise Email";
      });
    }
  }

  void gotoHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MyHomePage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Connexion',
          style: TextStyle(fontSize: 40),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Email", errorText: errorEmailMessage),
            controller: _emailReturn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Mot de passe", errorText: errorPasswordMessage),
            controller: _passwordReturn,
            obscureText: true,
          ),
        ),
        ElevatedButton(
          onPressed: (() {
            voidfield(_emailReturn.text, _passwordReturn.text);
          }),
          child: const Text("Connexion", style: TextStyle(fontSize: 15)),
        ),
        Text(
          result,
          style: const TextStyle(color: Colors.red),
        ),
        const Divider(
          thickness: 2,
        ),
        ElevatedButton(
          onPressed: () {},
          child:
              const Text('Se crée un compte !', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
