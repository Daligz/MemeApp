import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Authentication {

  static final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasPermission(final String message) async {
    try {
      return await _auth.authenticate(
          localizedReason: message,
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            biometricOnly: true,
            stickyAuth: true
          )
      );
    } on PlatformException  { return false; }
  }
}