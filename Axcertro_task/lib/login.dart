import 'package:flutter/material.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0A43),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back icon to white
        ),
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: SizedBox(),
        ),
      ),


      backgroundColor: Color(0xFF0B0A43), // Changed background color here

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "LogIn",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white, // Changed text color here
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    fillColor: Colors.white, // Changed background color here
                    filled: true,
                    labelStyle: TextStyle(color: Colors.black), // Changed label text color here
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    fillColor: Colors.white, // Changed background color here
                    filled: true,
                    labelStyle: TextStyle(color: Colors.black), // Changed label text color here
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color

                    ),
                    child: Text('Login',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Not a member text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?', style: TextStyle(color: Colors.white)), // Changed text color here
                  TextButton(
                    onPressed: () {
                      // Add your navigation logic here
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Changed text color here
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}
