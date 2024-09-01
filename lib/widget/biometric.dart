import 'package:flutter/material.dart';

import 'package:local_auth/local_auth.dart';

class Biometric extends StatefulWidget {
  const Biometric({Key? key}) : super(key: key);

  @override
  _BiometricState createState() => _BiometricState();
}

class _BiometricState extends State<Biometric> {
  late final LocalAuthentication myAuthentication;
  bool authState = false;

  @override
  void initState() {
    super.initState();
    myAuthentication = LocalAuthentication();
    myAuthentication.isDeviceSupported().then((bool myAuth) => setState(() {
          authState = myAuth;
        }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Flutter biometric Auth demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: authentication,
              child: const Text(
                'Authenticate',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> authentication() async {
    try {
      bool isAuthenticate = await myAuthentication.authenticate(
        localizedReason: 'Local Authentication',
        options:
            const AuthenticationOptions(stickyAuth: true, biometricOnly: true),
      );
      print("Authentication Status is : $isAuthenticate");
    }  catch (e) {
      print(e);
    }
    if(!mounted){
      return;
    }
  }
}
