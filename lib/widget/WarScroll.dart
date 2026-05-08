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
      // Ab hier Original Code mit vielen Rows

      body: Container( //Test Schriftgröße erhöhen: style: TextStyle(height: 2.5, fontSize: 25),
        //transform: Matrix4.rotationZ(0.1),

        //1. Column für 6 Rows
        child: Column(
          children: [
            //1. Row für Kreis und Name der Einheit
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ //Kreis-Werte nacheinander mit \n
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

            //2. Row für Fernkampf-Titelleiste
            Row(
              children: [
                Text("Icon"),
                SizedBox(width: 5),
                Text("Shooting Weapons"),
                SizedBox(width: 5),
                Text("Rng"),
                SizedBox(width: 5),
                Text("Att"),
                SizedBox(width: 5),
                Text("Hit"),
                SizedBox(width: 5),
                Text("Wnd"),
                SizedBox(width: 5),
                Text("Rnd"),
                SizedBox(width: 5),
                Text("Dmg"),
              ],
            ),
            SizedBox(height: 5),

            //3. Row für Fernkampf-Waffe 1
            Row(
              children: [
                SizedBox(width: 33), //Leerfläche des Icons füllen
                Text("Shooting Weapon 1"),
                SizedBox(width: 9),
                Text("1"),
                SizedBox(width: 19),
                Text("5"),
                SizedBox(width: 11),
                Text("3+"),
                SizedBox(width: 10),
                Text("2+"),
                SizedBox(width: 19),
                Text("1"),
                SizedBox(width: 24),
                Text("3"),
              ],
            ),
            SizedBox(height: 15),

            //4. Row für Nahkampf-Titelleiste
            Row(
              children: [
                Text("Icon"),
                SizedBox(width: 5),
                Text("Melee Weapons"),
                SizedBox(width: 5),
                Text("Rng"),
                SizedBox(width: 5),
                Text("Att"),
                SizedBox(width: 5),
                Text("Hit"),
                SizedBox(width: 5),
                Text("Wnd"),
                SizedBox(width: 5),
                Text("Rnd"),
                SizedBox(width: 5),
                Text("Dmg"),
              ],
            ),
            SizedBox(height: 5),

            //5. Row für Nahkampf-Waffe 1
            Row(
              children: [
                SizedBox(width: 33), //Leerfläche des Icons füllen
                Text("Melee Weapon 1"),
                SizedBox(width: 9),
                Text("1"),
                SizedBox(width: 19),
                Text("5"),
                SizedBox(width: 11),
                Text("3+"),
                SizedBox(width: 10),
                Text("2+"),
                SizedBox(width: 19),
                Text("1"),
                SizedBox(width: 24),
                Text("3"),
              ],
            ),
            SizedBox(height: 10),

            SizedBox(height: 30),

            //6. Row für Schlüsselworte
            Row(
              children: [
                Column(children: [Text("Keywords")]),
                SizedBox(width: 30),
                Row(
                  children: [
                    Text("Hero, Cavalry \nGreat Alliance, Faction"),
                  ],
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
