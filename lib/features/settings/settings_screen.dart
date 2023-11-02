import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => showAboutDialog(
              context: context,
              applicationVersion: "1.0",
              applicationLegalese: "All rights reserved. Please don't copy me.",
            ),
            title: const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text("About this app....."),
          ),
          const AboutListTile(
            applicationVersion: "1.0",
            applicationLegalese: "All rights reserved. Please don't copy me.",
          )
        ],
      ),
      /*
      body: const Column(
        children: [
          CupertinoActivityIndicator(
            radius: 40,
          ),
          CircularProgressIndicator(),
          CircularProgressIndicator.adaptive(),
        ],
      ),
      */
      /*
      body: ListWheelScrollView(
        itemExtent: 200,
        // offAxisFraction: 1.5,
        // diameterRatio: 10,
        // magnification: 1.5,
        // useMagnifier: true,
        children: [
          for (var x in [1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: const Text("Pick me"),
              ),
            )
        ],
      ),
      */
    );
  }
}
