import 'package:flutter/material.dart';
import 'package:localization_app/localization/app_localization.dart';
import 'package:localization_app/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) =>const SecondScreen())));
              },
              icon: const Icon(Icons.settings))
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalization.of(context)!.translate('AppName')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalization.of(context)!.translate('WelcomeText'),
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
