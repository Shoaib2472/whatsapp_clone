
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/commons/custom_button.dart';


class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  Country?
      country; //those who are declared here will only be accesible here only
  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) { //for country picker
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phone.text.trim();
    if (country != null && phoneNumber.isNotEmpty) { //it will handle if the user use space
      ref.read(authControllerProvider).signInWithPhone(context, '+${country!.phoneCode}${phoneNumber}');
    }
  }

  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Phone Number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text('Whatsapp Will need to verify your phone number'),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  pickCountry();
                },
                child: const Text('Pick Country')),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                if (country != null) Text('+${country!.phoneCode}'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.7, //it is taking the 70% of the width
                  child: TextFormField(
                    controller: phone,
                    decoration: const InputDecoration(hintText: 'Enter Phone Number'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.6,
            ),
            SizedBox(
              width: 90,
              child: CustomButton(text: 'Next', onPressed: () {}),
            )
          ],
        ),
      )),
    );
  }
}
