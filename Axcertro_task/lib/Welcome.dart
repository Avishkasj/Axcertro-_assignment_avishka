
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'login.dart';


class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image(
                  image: AssetImage(
                    'lib/assets/logo2.png',
                  ),
                  height: 400,
                ),
              ),

              Text(
                "E-Commerce App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "For Associate Software Developer (Flutter Specialized) test 02",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,

                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0, // set the border weight to 2.0
                              color: Colors.white,
                            ),
                            fixedSize: Size(150, 50),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Login()));
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0, // set the border weight to 2.0
                              color: Colors.white,
                            ),
                            fixedSize: Size(150, 50),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}