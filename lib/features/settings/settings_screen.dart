import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          /*
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1998),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = showDateRangePicker(
                context: context,
                firstDate: DateTime(1998),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text("What is your birthday?"),
          ),
          */
          SwitchListTile.adaptive(
            value: _notification,
            onChanged: _onNotificationChanged,
            title: const Text("Enable Notifications"),
          ),
          CupertinoSwitch(
            value: _notification,
            onChanged: _onNotificationChanged,
          ),
          Switch(
            value: _notification,
            onChanged: _onNotificationChanged,
          ),
          Checkbox(
            value: _notification,
            onChanged: _onNotificationChanged,
          ),
          CheckboxListTile.adaptive(
            checkColor: Colors.black,
            activeColor: Colors.red,
            value: _notification,
            onChanged: _onNotificationChanged,
            title: const Text("Enable notifications"),
          ),
          const AboutListTile(),
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
