
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/screens/landings/otp_screen.dart';
import 'package:whatsapp_clone/utils/reuse_widgets.dart';

final authRepositryProvider = Provider((ref) => AuthRepositry(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthRepositry {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const AuthRepositry({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    // i am using build context so that i can send the context
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          }, //,whenever the user got verified he has to get login with the credentials for android and ios
          verificationFailed: (e) {
            //when verification failed
            throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            Navigator.pushNamed(context, OTPscreen.routeName,
                arguments: verificationId);
          }), //when the code sent this function will be clicked
          codeAutoRetrievalTimeout:
              (String verificationId) {}); //auto resoulition might timed out
    } on FirebaseAuthException catch (e) {
      showSnackbar(context: context, content: e.message!);
    }
  }
}
