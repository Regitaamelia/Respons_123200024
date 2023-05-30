import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsi_123200024/view/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
            'Sign Up',
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
                    child: Container(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // background
                        ),
                        onPressed: () {
                          if (_usernameController.text != null &&
                              _passwordController.text != null) {
                            _register(false);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const LoginPage();
                                }));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => const CupertinoAlertDialog(
                                  title: Text("Error"),
                                  content: Text("Ada yg kosong"),
                                ));
                          }
                        },
                        child: Text("Sign Up"),
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
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sudah punya akun?",
                        style: TextStyle(
                          color: Colors.grey[400],
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

  _register(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = value;
    prefs.setBool('status', status);
    prefs.setString('username', _usernameController.text);
    prefs.setString('password', _passwordController.text);
    prefs.commit();

    print(prefs.getString('username'));
    print(prefs.getString('password'));
    print(prefs.getBool('status'));
  }
}
