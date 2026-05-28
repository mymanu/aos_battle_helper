import 'dart:io';

import 'package:flutter/material.dart';

import '../classes/ability.dart';
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

    List<Ability> passiveAbilities = [];
    for (Ability abi in widget.unit.abilitys) {
      if (abi.typeName.contains("Passive")) {
        passiveAbilities.add(abi);
      }
    }

    //TODO ab Hier wird das UI der WarScrolls gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      /*appBar: AppBar(
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
      ),*/

      // Start vom body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 50, top: 10),
                  child:
                      // Kreis diagonal getrennt durch 2 Linien
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
                            //TODO Positioned für grünen Kasten
                            //https://pub.dev/packages/flutter_custom_clippers
                            Positioned(
                              top: 55,
                              left: 112,
                              child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),

                            Positioned(
                              left: 75,
                              child: Column(
                                children: [
                                  Text(
                                    "Move",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    widget.unit.move,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
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
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.unit.health,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
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
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Transform.rotate(
                                    angle: math.pi * 0.5,
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
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
                                    widget.unit.banishment.contains("-") ?
                                    widget.unit.control : widget.unit.banishment,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.unit.banishment
                                        .contains("-")
                                        ? "Control"
                                        : "Banish",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),

                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        height: 190,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade400,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          widget.unit.name,
                          style: TextStyle(height: 2.5, fontSize: 25),
                        ),
                      ),
                      widget.unit.keywords.contains("Reinforcement")
                          ? Positioned(
                              top: -10,
                              right: -28,
                              child: //Icon(Icons.warehouse),
                              IconButton(
                                icon: Image.file(
                                  //Nur bei Windows --debug exe benötigt
                                  //File("data/flutter_assets/assets/AoS_Reinforcement_Symbol.png"),

                                  //Nur in Android Studio
                                  File('./assets/AoS_Reinforcement_Symbol.png'),
                                  //scale: 0.5,
                                  height: 100,
                                  width: 100,
                                ),
                                onPressed: () {},
                              ),
                            )
                          : Text(""),
                      //2. Row für Schlüsselworte
                      Positioned(bottom: 0,left: 130, child: Text("Keywords:")),
                      Positioned(bottom: 0, left: 320, child: Text(widget.unit.keywords)),
                    ],
                  ),
                ),
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

            Container(
              width: 1300,
              height: 300,
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(10),
                    //padding: const EdgeInsets.only(right: 50),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        /*
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                */
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        childAspectRatio: 1.3,
                      ),
                      delegate: SliverChildBuilderDelegate((
                        BuildContext context,
                        int index,
                      ) {
                        return Card(
                          child: passiveAbilities[index].erledigt
                              ?
                                //Ab hier Card wenn die Ability erledigt ist
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      passiveAbilities[index].erledigt = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        passiveAbilities[index].name,
                                        //cardContentList[index].ability.name.contains("-1") ? cardContentList[index].unit.name : cardContentList[index].ability.name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Icon(Icons.done, size: 100),
                                    ],
                                  ),
                                )
                              :
                                //Ab hier Card wenn es eine Ability ist
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          passiveAbilities[index].name,
                                          //cardContentList[index].ability.name,
                                          style: TextStyle(
                                            backgroundColor: widget.phaseColor,
                                            fontWeight: FontWeight.bold,
                                            color: calculateTextColor(
                                              widget.phaseColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    passiveAbilities[index].typeName.contains("Passive") ? Text(passiveAbilities[index].typeName) : Text(passiveAbilities[index].timing),
                                    Text(passiveAbilities[index].originUnit),
                                    Text(""),
                                    passiveAbilities[index].effect.contains("-1") ?
                                    Text(passiveAbilities[index].declare) : passiveAbilities[index].declare.contains("-1") ?
                                    Text(passiveAbilities[index].effect) :
                                    Text(passiveAbilities[index].declare + "\n\n" + passiveAbilities[index].effect) ,

                                    passiveAbilities[index].commandPoints.contains("-") ? Text("") : Text("Command Point cost: " + passiveAbilities[index].commandPoints),
                                    /*
                            Text(cardContentList[index].ability.timing),
                            Text(cardContentList[index].ability.originUnit),
                            Text(cardContentList[index].ability.details),
                             */
                                    /*
                            ListTile(
                              leading: Icon(Icons.album),
                              title: Text(spells[index].title),
                              subtitle: Text(spells[index].details),
                            ),
                            */
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                          child: Text("Fähigkeit erledigt"),
                                          onPressed: () {
                                            setState(() {
                                              passiveAbilities[index].erledigt =
                                                  true;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        TextButton(
                                          child: Text("Item $index"),
                                          onPressed: () {
                                            /* ... */
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ],
                                ),
                        );
                      }, childCount: passiveAbilities.length),
                    ),
                  ),
                ],
              ),
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
