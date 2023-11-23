import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /*
  bool _notification = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: false,
            onChanged: (value) => () {},
            title: const Text("Auto Mute"),
            subtitle: const Text("Videos will be muted by default."),
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) => () {},
            title: const Text("Auto Play"),
            subtitle: const Text("Videos will be played by default."),
          ),
          /*
          SwitchListTile(
            value: context.watch<PlaybackConfigViewModel>().muted,
            onChanged: (value) =>
                context.read<PlaybackConfigViewModel>().setMuted(value),
            title: const Text("Auto Mute"),
            subtitle: const Text("Videos will be muted by default."),
          ),
          SwitchListTile(
            value: context.watch<PlaybackConfigViewModel>().autoplay,
            onChanged: (value) =>
                context.read<PlaybackConfigViewModel>().setAutoplay(value),
            title: const Text("Auto Play"),
            subtitle: const Text("Videos will be played by default."),
          ),
          */
          /*
          SwitchListTile(
            value: context.watch<VideoChangeNotifier>().isMuted,
            onChanged: (value) =>
                context.read<VideoChangeNotifier>().toggleIsMuted(),
            title: const Text("Auto Mute"),
            subtitle: const Text("Videos will be muted by default."),
          ),
          */
          /*
          ValueListenableBuilder(
            valueListenable: videoChangeNotifier,
            builder: (context, value, child) => SwitchListTile(
              value: videoChangeNotifier.value,
              onChanged: (value) {
                videoChangeNotifier.value = !videoChangeNotifier.value;
              },
              title: const Text("Auto Mute"),
              subtitle: const Text("Videos will be muted by default."),
            ),
          ),
          */
          /*
          AnimatedBuilder(
            animation: videoChangeNotifier,
            builder: (context, child) => SwitchListTile(
              value: videoChangeNotifier.value,
              onChanged: (value) {
                videoChangeNotifier.value = !videoChangeNotifier.value;
              },
              title: const Text("Auto Mute"),
              subtitle: const Text("Videos will be muted by default."),
            ),
          ),
          */
          /*
          SwitchListTile(
            value: VideoConfigData.of(context).autoMute,
            onChanged: (value) {
              VideoConfigData.of(context).toggleMuted();
            },
            title: const Text("Auto Mute"),
            subtitle: const Text("Videos will be muted by default."),
          ),
          */
          /*
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),dgor
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
          /*
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
          */
          /*
          ListTile(
            title: const Text("Log out (iOS)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(FontAwesomeIcons.skull),
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          */
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please dooooont gooooo"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Not log out"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes plz."),
                    )
                  ],
                ),
              );
            },
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
