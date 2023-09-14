// ignore_for_file: use_build_context_synchronously, import_of_legacy_library_into_null_safe
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../User_provider/register_user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  //text controllers

  final TextEditingController registerEmail = TextEditingController();
  final TextEditingController registerName = TextEditingController();
  final TextEditingController registerPass = TextEditingController();

  void showFlushBar(BuildContext context, Widget icon, String txt, String war) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 58, 62, 89),
      duration: const Duration(seconds: 2),
      icon: icon,
      titleText: Text(
        war,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'ibmmedium',
        ),
      ),
      message: txt,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
    ).show(context);
  }

  void navi() {
    Navigator.of(context).pushReplacementNamed('/homescreen');
  }

  Future save() async {
    var res = await http.post("http://192.168.1.5:4590/signin",
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body.contains("email"));

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', user.email);

    if (res.body.contains("email")) {
      navi();
    } else {
      var t = res.body.split(":");
      var y = t[1].split("}");
      Widget icon = const Icon(
        Icons.error_outline,
        color: Colors.white,
      );
      showFlushBar(context, icon, y[0], 'Login Error!');
      print(y[0]);
    }
  }

  RegisterUser user = RegisterUser('', '', '');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    //----------------------------------android----------------------------------
    //name
    final nameField = TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter name';
        }
        return null;
      },
      onChanged: (value) {
        user.name = value;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: Colors.grey[300],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: height * 0.0017,
            color: const Color.fromARGB(255, 252, 143, 128),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Enter your name',
        hintStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
            width: height * 0.01 + width * 0.02,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //email
    final emailField = TextFormField(
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        user.email = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.grey[300],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: height * 0.0017,
            color: const Color.fromARGB(255, 252, 143, 128),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Enter your email',
        hintStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
            width: height * 0.01 + width * 0.02,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //pass
    final passField = TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: true,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        user.password = value;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.grey[300],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: height * 0.0017,
            color: const Color.fromARGB(255, 252, 143, 128),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Enter your password',
        hintStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
            width: height * 0.01 + width * 0.02,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //button
    final regisButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            save();
          }
        },
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: height * 0.03 + width * 0.002,
              color: Colors.white,
              fontFamily: 'urita'),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: height * 0.18,
                width: width * 0.999,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 143, 128),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: height * 0.07),
                    Center(
                      child: Text(
                        "Registeration",
                        style: TextStyle(
                            fontFamily: 'urita',
                            fontSize: height * 0.04 + width * 0.002),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.06),
              Text(
                'Welcome Onboard!',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'ibmmedium',
                    fontSize: height * 0.02 + width * 0.02),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Lets help you meet up your tasks',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: height * 0.009 + width * 0.02,
                  fontFamily: 'ibmmedium',
                ),
              ),
              SizedBox(height: height * 0.06),
              SizedBox(
                height: height * 0.1,
                width: width * 0.9,
                child: nameField,
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.1,
                width: width * 0.9,
                child: emailField,
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.1,
                width: width * 0.9,
                child: passField,
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: width * 0.7,
                height: height * 0.08,
                child: regisButton,
              ),
              SizedBox(height: height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: width * 0.06 + height * 0.002,
                      fontFamily: "urita",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text(
                      "Signin",
                      style: TextStyle(
                        fontSize: width * 0.07 + height * 0.002,
                        fontFamily: 'urita',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
