import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Image myImage;

  _userSharedFunction()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = preferences.getString('email');

    Timer(
        const Duration(seconds:2),(){
      Navigator.pushReplacementNamed(context,email == null ?'/': '/homescreen');
    }
    );
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    myImage= Image.asset('assets/Image/logo.png');
    _userSharedFunction();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height:height*0.4,
            ),
            Text(
              "Endeavour",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'urita',
                  fontSize: height * 0.06 + width * 0.002),
            ),
            SizedBox(
              height:height*0.4,
            ),
            Text(
              'By',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: height * 0.009 + width * 0.02,
                fontFamily: 'ibmmedium',
              ),
            ),
            SizedBox(height:height*0.019),
            Container(
                height:40,
                width:170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/Image/logo.png'),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
