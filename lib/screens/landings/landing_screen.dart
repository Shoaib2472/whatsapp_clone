import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/commons/custom_button.dart';
import 'package:whatsapp_clone/screens/landings/login_screens.dart';


class landing_screen extends StatelessWidget {
  const landing_screen({Key? key}) : super(key: key);
  void navigateToLog(BuildContext context) {
    //we use build context as we are not in stateful class
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Welcome To Whatsapp',
            style: TextStyle(fontSize: 33),
          ),
          SizedBox(
            height: size.height / 9,
          ),
          Image.asset(
            'assets/bgicon.png',
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(
            height: size.height / 9,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Read Our privacy Policy. Tap " Agree and continue" to accept the Terms and Service',
              style: TextStyle(
                color: greycolor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: size.width * 0.75,
            child: CustomButton(
              text: 'Agree and Continue',
              onPressed: () {
                navigateToLog(context);
              },
            ),
          )
        ],
      )),
    );
  }
}
