import 'package:responsi_123200024/view/home.dart';
import 'package:responsi_123200024/view/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:project/menu_utama.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String valueUsername = "";
  String valuePassword = "";
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          leading: IconButton(
            icon: Icon(Icons.login_rounded),
            onPressed: () {},
          ),
          title: Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 110),
              width: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: TextFormField(
                      enabled: true,
                      controller: _usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: '   Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      enabled: true,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: '   Password',
                      ),
                    ),
                  ),
                  Card(
                    //color: Color(0xff19376D),
                    child: Container(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // background
                        ),
                        onPressed: () {
                          if (_usernameController.text != '' &&
                              _passwordController.text != '') {
                            getCredential();
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Login Failed"),
                                    content: const Text(
                                        "Username atau password kosong"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Close"))
                                    ],
                                  );
                                });
                          }
                        },
                        child: Text("Sign In"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "Belum punya akun?",
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  getCredential() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      bool status = sharedPreferences.getBool("status")!;
      print(status);
      if (status == false) {
        setState(() {
          username = sharedPreferences.getString("username")!;
          password = sharedPreferences.getString("password")!;
        });
        if (username == _usernameController.text &&
            password == _passwordController.text) {
          setState(() {
            sharedPreferences.setBool("status", true);
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return const PageListData();
              }));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Login Failed"),
                  content: const Text("Username or Password is wrong"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"))
                  ],
                );
              });
        }
      } else {
        _usernameController.clear();
        _passwordController.clear();
      }
    });
  }
}
