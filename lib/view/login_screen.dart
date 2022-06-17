import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Utils.flushBarErrorMessage('No internet Connection', context);
                Utils.toastMessage('Click Me');
              },
              child: Text('click Me'),
            )
          ],
        ),
      ),
    );
  }
}
