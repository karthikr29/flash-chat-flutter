import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenId = '/wlc';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.teal,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        speed: Duration(milliseconds: 150),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              buttonText: 'Log In',
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.screenId);
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              buttonText: 'Register',
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.screenId);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.symmetric(vertical: 16.0),
// child: Material(
// elevation: 5.0,
// color: Colors.lightBlueAccent,
// borderRadius: BorderRadius.circular(30.0),
// child: MaterialButton(
// onPressed: () {
// Navigator.pushNamed(context, LoginScreen.screenId);
// },
// minWidth: 200.0,
// height: 42.0,
// child: Text(
// 'Log In',
// ),
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.symmetric(vertical: 16.0),
// child: Material(
// color: Colors.blueAccent,
// borderRadius: BorderRadius.circular(30.0),
// elevation: 5.0,
// child: MaterialButton(
// onPressed: () {
// Navigator.pushNamed(context, RegistrationScreen.screenId);
// },
// minWidth: 200.0,
// height: 42.0,
// child: Text(
// 'Register',
// ),
// ),
// ),
// )
