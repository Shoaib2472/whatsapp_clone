import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp_clone/repositry/auth_repositry.dart';


final authControllerProvider = Provider((ref) {
  final authRepositry = ref.watch(authRepositryProvider);
  return  AuthController(authRepositry);
});

class AuthController {
  final AuthRepositry authRepositry;

  AuthController(this.authRepositry);
  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepositry.signInWithPhone(context, phoneNumber);
  }
}
