import 'package:aos_battle_helper/widget/WarScroll.dart';
import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HeroPhase.dart';
import 'Preparation.dart';
import 'SettingsWidgetPath.dart';
import 'StartofBattle.dart';
import 'ArmyImport.dart';
import 'SettingsWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    List<Color> buttonColors = [
      Colors.orange.shade800,
      Colors.indigoAccent,
      Colors.redAccent,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.grey,
      Colors.grey,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //SizedBox(height: 25),
              const Text(
                'Menu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              /*const Text(
                  'You have pushed the button in the right corner this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),*/
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Start Game',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToPreparation(context, widget.settings);
                },
              ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Army import',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToArmyImport(context, widget.settings);
                },
              ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToSettings(context, widget.settings);
                },
              ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Path Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToPathSettings(context, widget.settings);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void _navigateToPreparation(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Preparation(title: "Preparation", settings: settings),
      ),
    );
  }

  void _navigateToArmyImport(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArmyImport(title: "Army import", settings: settings),
      ),
    );
  }

  void _navigateToSettings(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsWidget(title: "Settings", settings: settings),
      ),
    );
  }

  void _navigateToPathSettings(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsWidgetPath(title: "Path Settings", settings: settings),
      ),
    );
  }

  void _navigateToWarScroll(BuildContext context, Settings settings) {
    Unit unit = Unit("ExampleUnit");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WarScroll(title: "Warscroll", settings: settings, unit: unit),
      ),
    );
  }

}
