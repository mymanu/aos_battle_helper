import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'HomePage.dart';
import 'dart:math' as math;

class WarScroll extends StatefulWidget {
  WarScroll({
    super.key,
    required this.title,
    required this.settings,
    required this.unit,
  });

  Settings settings;
  String title;

  Unit unit;

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

    List<Weapon> meleeWeaponList = [];
    List<Weapon> shootingWeaponList = [];

    for (Weapon weapon in widget.unit.weapons) {
      if (weapon.range.contains("-")) {
        meleeWeaponList.add(weapon);
      } else {
        shootingWeaponList.add(weapon);
      }
    }

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
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.unit.move,
                              style: TextStyle(color: Colors.black, fontSize: 15),
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
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.unit.health,
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 130,
                        child: Row(
                          children: [
                            Text(
                              widget.unit.save,
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(width: 10),
                            Transform.rotate(
                              angle: math.pi * 0.5,
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.black, fontSize: 15),
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
                            Text(
                              widget.unit.control,
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Control",
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text(
                widget.unit.name,
                style: TextStyle(height: 2.5, fontSize: 25),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 20),

          //TODO Anzahl der Rows in einer Tabelle flexibel machen anhand einer Liste
          //https://medium.com/@punithsuppar7795/creating-an-interactive-table-in-flutter-5b203d1cf875
          //https://stackoverflow.com/questions/77487563/i-want-to-insert-the-row-at-the-top-on-data-table-when-i-click-on-addnew-but-it

          //Table für Fernkampf
          DataTable(
            border: TableBorder.all(color: Colors.white, width: 0.5),
            columns: [
              DataColumn(label: Icon(Icons.sports_football)),
              DataColumn(label: Text("Shooting Weapons")),
              DataColumn(label: Text("Rng")),
              DataColumn(label: Text("Att")),
              DataColumn(label: Text("Hit")),
              DataColumn(label: Text("Wnd")),
              DataColumn(label: Text("Rnd")),
              DataColumn(label: Text("Dmg")),
              DataColumn(label: Text("Ability")),
            ],
            rows: List<DataRow>.generate(shootingWeaponList.length, (index) {
              return DataRow(
                cells: [
                  DataCell(Text("")),
                  DataCell(Text(shootingWeaponList[index].name)),
                  DataCell(Text(shootingWeaponList[index].range)),
                  DataCell(Text(shootingWeaponList[index].attack)),
                  DataCell(Text(shootingWeaponList[index].hit)),
                  DataCell(Text(shootingWeaponList[index].wound)),
                  DataCell(Text(shootingWeaponList[index].rend)),
                  DataCell(Text(shootingWeaponList[index].damage)),
                  DataCell(Text(shootingWeaponList[index].ability)),
                ],
              );
            }),
          ),

          SizedBox(height: 20),
          //Table für Nahkampf
          DataTable(
            border: TableBorder.all(color: Colors.white, width: 0.5),
            columns: [
              DataColumn(label: Icon(Icons.sports_martial_arts)),
              DataColumn(label: Text("Melee Weapons")),
              DataColumn(label: Text("")),
              DataColumn(label: Text("Att")),
              DataColumn(label: Text("Hit")),
              DataColumn(label: Text("Wnd")),
              DataColumn(label: Text("Rnd")),
              DataColumn(label: Text("Dmg")),
              DataColumn(label: Text("Ability")),
            ],
            rows: List<DataRow>.generate(meleeWeaponList.length, (index) {
              return DataRow(
                cells: [
                  DataCell(Text("")),
                  DataCell(Text(meleeWeaponList[index].name)),
                  DataCell(Text("")),
                  DataCell(Text(meleeWeaponList[index].attack)),
                  DataCell(Text(meleeWeaponList[index].hit)),
                  DataCell(Text(meleeWeaponList[index].wound)),
                  DataCell(Text(meleeWeaponList[index].rend)),
                  DataCell(Text(meleeWeaponList[index].damage)),
                  DataCell(Text(meleeWeaponList[index].ability)),
                ],
              );
            }),
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
