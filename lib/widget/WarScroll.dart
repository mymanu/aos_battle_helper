import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';
import 'dart:math' as math;

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

      //TODO SliverGrid konfigurieren
      /*
        body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, right: 0, bottom: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal,
                  child: Text('Beispiel'), //child: Text('Grid Item $index'),
                );
              }, childCount: 2),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 10, right: 0, bottom: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal,
                  child: Text('Grid Item $index'),
                );
              }, childCount: 20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
            ),
          ),
        ],
      ),

      */
      // Ab hier Original Code mit vielen Rows. Idee: transform: Matrix4.rotationZ(0.1),
      body: Center( //War Container
        //1. Column für 6 Rows
        child: Column(
          children: [
            //Idee Kreis mit Tabelle drin
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(20),
              // Padding to keep text away from edges
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
          child: Transform.rotate(
            angle: math.pi / 4, // 45 degrees in radians
              child: Center(
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.symmetric(
                    inside: BorderSide(color: Colors.blue.withOpacity(0.5)),
                  ),
                  children: [
                    TableRow(
                      children: [
                        Center(child: Text('A1')),
                        Center(child: Text('B1')),
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('A2')),
                        Center(child: Text('B2')),
                      ],
                    ),
                  ],
                ),
              ),
          ),

            ),

            // Idee Kreis getrennt durch 2 Linien
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white, // Circle color
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: 7,
                ), // Optional border
              ),
              child: Stack(
                children: [
                  // Horizontal Line
                  Center(
                    child: Container(
                      height: 5, // Thickness
                      color: Colors.orangeAccent,
                    ),
                  ),
                  // Vertical Line
                  Center(
                    child: Container(
                      width: 5, // Thickness
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: 0.5,
                        // Rotation in radians (e.g., 0.5 is approx 28.6 degrees)
                        child: const Text(
                          "Test 1",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //1. Row für Kreis und Name der Einheit
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Kreis-Werte nacheinander mit \n
                    Text("Move: + [value]"),
                    Text("Save: + [value]"),
                    Text("Control: + [value]"),
                    Text("Health: + [value]"),
                  ],
                ),
                SizedBox(width: 600),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unit Name",
                      style: TextStyle(height: 2.5, fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            //TODO Anzahl der Rows in einer Tabelle flexibel machen anhand einer Liste
            //https://medium.com/@punithsuppar7795/creating-an-interactive-table-in-flutter-5b203d1cf875
            //https://stackoverflow.com/questions/77487563/i-want-to-insert-the-row-at-the-top-on-data-table-when-i-click-on-addnew-but-it

            //Table für Fernkampf
            Table(
              children: [
                TableRow(
                  children: [
                    Icon(Icons.sports_football),
                    Text("Shooting Weapons"),
                    Text("Rng"),
                    Text("Att"),
                    Text("Hit"),
                    Text("Wnd"),
                    Text("Rnd"),
                    Text("Dmg"),
                    Text("Ability"),
                  ],
                ),
                TableRow(
                  children: [
                    Text(""),
                    Text("Ratatatata"),
                    Text("10\""),
                    Text("3"),
                    Text("4+"),
                    Text("2+"),
                    Text("1"),
                    Text("3"),
                    Text("Shoot in Combat"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            //Table für Nahkampf
            Table(
              children: [
                TableRow(
                  children: [
                    Icon(Icons.sports_martial_arts),
                    Text("Melee Weapons"),
                    Text(""),
                    Text("Att"),
                    Text("Hit"),
                    Text("Wnd"),
                    Text("Rnd"),
                    Text("Dmg"),
                    Text("Ability"),
                  ],
                ),
                TableRow(
                  children: [
                    Text(""),
                    Text("Ratatatata"),
                    Text(""),
                    Text("3"),
                    Text("4+"),
                    Text("2+"),
                    Text("1"),
                    Text("3"),
                    Text("Crit Mortal"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 200),

            //6. Row für Schlüsselworte
            Row(
              children: [
                Column(children: [Text("Keywords")]),
                SizedBox(width: 30),
                Row(
                  children: [Text("Hero, Cavalry \nGreat Alliance, Faction")],
                ),
              ],
            ),
          ],
        ),
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
