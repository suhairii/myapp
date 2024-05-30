// Suggested code may be subject to a license. Learn more: ~LicenseLog:1653943019.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1646302327.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1485708464.
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You are on the Third Page',
            ),
          ],
        ),
      ),
    );
  }
}
