import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';
import 'dart:math' as math;

class WarScrollManu extends StatefulWidget {
  WarScrollManu({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  //List<bool> erledigtList = [];
  //bool ownPhase = true;
  Color phaseColor = Colors.yellow.shade800;

  //String phaseColorString = "White";

  @override
  _WarScrollManu createState() => _WarScrollManu();
}

class _WarScrollManu extends State<WarScrollManu> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    //TODO ab Hier wird das UI der WarScrolls gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: calculateTextColor(widget.phaseColor)),
        ),
        centerTitle: true,
        backgroundColor: widget.phaseColor,
        actions: <Widget>[
          ElevatedButton(
            // Menü Button
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.blueGrey.shade800,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              _navigateToMenu(context, widget.settings);
            },
            child: Text("Menü"),
          ),
        ],
      ),

      // Ab hier Original Code mit vielen Rows. Idee: transform: Matrix4.rotationZ(0.1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                child:
                // Idee Kreis getrennt durch 2 Linien
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white, // Circle color
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.yellow.shade700,
                      width: 7,
                    ), // Optional border
                  ),
                  child: Stack(
                    children: [
                      // left top to right bottom
                      Transform.rotate(
                        angle: math.pi / 4, // 45 degrees in radians
                        child: Center(
                          child: Container(
                            height: 5, // Thickness
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi / 4,
                        // right top to left bottom
                        child: Center(
                          child: Container(
                            width: 5, // Thickness
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: Column(
                          children: [
                            Text(
                              "Move",
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "10\"",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: -10,
                        child: Row(
                          children: [
                            Transform.rotate(
                              angle: math.pi * 1.5,
                              child: Text(
                                "Health",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("6", style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 130,
                        child: Row(
                          children: [
                            Text("4+", style: TextStyle(color: Colors.red)),
                            SizedBox(width: 10),
                            Transform.rotate(
                              angle: math.pi * 0.5,
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 135,
                        left: 70,
                        child: Column(
                          children: [
                            Text("2", style: TextStyle(color: Colors.red)),
                            SizedBox(width: 10),
                            Text(
                              "Control",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text("Unit Name", style: TextStyle(height: 2.5, fontSize: 25)),
              Spacer(),
            ],
          ),
          SizedBox(height: 20),

          //TODO Anzahl der Rows in einer Tabelle flexibel machen anhand einer Liste
          //https://medium.com/@punithsuppar7795/creating-an-interactive-table-in-flutter-5b203d1cf875
          //https://stackoverflow.com/questions/77487563/i-want-to-insert-the-row-at-the-top-on-data-table-when-i-click-on-addnew-but-it

          //Table für Fernkampf
          Table(
            border: TableBorder.all(color: Colors.white, width: 0.5),
            children: [
              TableRow(
                children: [
                  Icon(Icons.sports_football),
                  Center(child: Text("Shooting Weapons")),
                  Center(child: Text("Rng")),
                  Center(child: Text("Att")),
                  Center(child: Text("Hit")),
                  Center(child: Text("Wnd")),
                  Center(child: Text("Rnd")),
                  Center(child: Text("Dmg")),
                  Center(child: Text("Ability")),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Text("")),
                  Center(child: Text("Ratatatata")),
                  Center(child: Text("10\"")),
                  Center(child: Text("3")),
                  Center(child: Text("4+")),
                  Center(child: Text("2+")),
                  Center(child: Text("1")),
                  Center(child: Text("3")),
                  Center(child: Text("Shoot in Combat")),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),

          //Table für Nahkampf
          Table(
            border: TableBorder.all(color: Colors.white, width: 0.5),
            children: [
              TableRow(
                children: [
                  Icon(Icons.sports_martial_arts),
                  Center(child: Text("Melee Weapons")),
                  Text(""),
                  Center(child: Text("Att")),
                  Center(child: Text("Hit")),
                  Center(child: Text("Wnd")),
                  Center(child: Text("Rnd")),
                  Center(child: Text("Dmg")),
                  Center(child: Text("Ability")),
                ],
              ),
              TableRow(
                children: [
                  Text(""),
                  Center(child: Text("Schlitz")),
                  Center(child: Text("")),
                  Center(child: Text("3")),
                  Center(child: Text("4+")),
                  Center(child: Text("2+")),
                  Center(child: Text("1")),
                  Center(child: Text("3")),
                  Center(child: Text("Crit Mortal")),
                ],
              ),
            ],
          ),

          SizedBox(height: 200),

          //6. Row für Schlüsselworte
          Row(
            children: [
              Column(children: [Text("Keywords")]),
              Spacer(),
              Row(children: [Text("Hero, Cavalry \nGreat Alliance, Faction")]),
              Spacer(),
            ],
          ),
        ],
      ),
      //End Container
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }
}
