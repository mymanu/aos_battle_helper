import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';

class WarScroll extends StatefulWidget {
  WarScroll({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  //List<bool> erledigtList = [];
  //bool ownPhase = true;
  Color phaseColor = Colors.yellow.shade800;

  //String phaseColorString = "White";

  @override
  _WarScroll createState() => _WarScroll();
}

class _WarScroll extends State<WarScroll> {
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
      body: Container(
        //transform: Matrix4.rotationZ(0.1),
        child: Column(
          //1. Column für 4 Rows
          children: [
            //1. Row für Kreis und Name der Einheit
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Move + [value]"),
                    Text("Save + [value]"),
                    Text("Control + [value]"),
                    Text("Health + [value]"),
                  ],
                ),
                SizedBox(width: 600),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Held der Armee",
                      style: TextStyle(height: 2.5, fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            //2. Row für Fernkampf-Waffen
            Row(
              children: [
                Column(
                    children: [
                      Text("Icon")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Shooting Weapons")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Rng"),
                      Text("1")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Att"),
                      Text("5")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Hit"),
                      Text("3+")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Wnd"),
                      Text("2+")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Rnd"),
                      Text("1")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Dmg"),
                      Text("3")
                    ]
                ),
              ],
            ),

            SizedBox(height: 10),

            //3. Row für Nahkampf-Waffen
            Row(
              children: [
                Column(
                    children: [
                      Text("Icon")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Melee Weapons")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Rng"),
                      Text("1")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Att"),
                      Text("5")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Hit"),
                      Text("3+")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Wnd"),
                      Text("2+")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Rnd"),
                      Text("1")
                    ]
                ),
                SizedBox(width: 5),
                Column(
                    children: [
                      Text("Dmg"),
                      Text("3")
                    ]
                ),
              ],
            ),

            SizedBox(height: 30),

            //4. Row für Schlüsselworte
            Row(children: [
              Column(
                children: [
                  Text("Keywords")
                ],
              ),
              SizedBox(width: 30),
              Column(
                children: [
                  Text("Hero, Cavalry"),
                  Text("Great Alliance, Faction"),
                ],
              ),
            ]
            ),
          ],
        ),
      ),
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
