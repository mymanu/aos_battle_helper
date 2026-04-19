import 'package:flutter/material.dart';

import '../classes/settings.dart';

class HeroPhase extends StatefulWidget {
  HeroPhase({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  List<bool> erledigtList = [];
  bool ownPhase = true;
  Color phaseColor = Colors.orange.shade800;

  @override
  _HeroPhase createState() => _HeroPhase();
}

class _HeroPhase extends State<HeroPhase> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    //TODO ab Hier wird das UI gebaut, ab hier kannst du dich dann austoben
    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: <Widget>[
          Text(
            widget.ownPhase
                ? 'Meine ' + widget.title
                : 'Gegnerische ' + widget.title,
          ),
          Switch(
            // This bool value toggles the switch.
            value: widget.ownPhase,
            activeThumbColor: widget.phaseColor,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                widget.ownPhase = value;
              });
            },
          ),
        ],
      ),
      body: Text("Hallo"),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
