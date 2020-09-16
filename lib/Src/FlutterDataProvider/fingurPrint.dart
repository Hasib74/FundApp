/*
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class FingurPrint {
  bool canCheckBiometrics;
  var localAuth = LocalAuthentication();

  FingurPrint() {
    checkBiometrics();
  }

  checkBiometrics() async {
    canCheckBiometrics = await localAuth.canCheckBiometrics;

    print("Can check fingut print ${canCheckBiometrics}");
  }

  Future<bool> actionFingur() async {
    bool didAuthenticate;
    try {
      didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: 'Please authenticate to show account balance',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Handle this exception here.

        print("Error ${e}");
      }
    }

    print("Fingur print ${didAuthenticate}");
    return didAuthenticate;
  }
}
*/
