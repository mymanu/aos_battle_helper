import 'dart:math' as math;

import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'CombatPhase.dart';
import 'HomePage.dart';
import 'allUnits.dart';

class ChargePhase extends StatefulWidget {
  ChargePhase({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  Color phaseColor = Colors.orange;

  String phaseColorString = "Orange";

  @override
  _ChargePhase createState() => _ChargePhase();
}

class _ChargePhase extends State<ChargePhase> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    List<Ability> spellsThisPhase = [];
    List<Unit> unitsThisPhase = [];

    Functions functions = Functions();

    spellsThisPhase.addAll(
      functions.unitAbilitys(
        widget.settings.army.unitList,
        widget.phaseColorString,
        widget.settings.ownPhase,
      ),
    );

    spellsThisPhase.addAll(
      functions.spellLoreAbilitys(
        widget.settings.army.spellLore,
        widget.phaseColorString,
        widget.settings.ownPhase,
      ),
    );

    spellsThisPhase.addAll(
      functions.battleTraitAbilitys(
        widget.settings.army.battleTraitsList,
        widget.phaseColorString,
        widget.settings.ownPhase,
      ),
    );

    spellsThisPhase.addAll(
      functions.battleFormationAbilitys(
        widget.settings.army.battleFormationsList,
        widget.phaseColorString,
        widget.settings.ownPhase,
      ),
    );

    spellsThisPhase.addAll(
      functions.commandAbilitys(
        widget.settings.commandAbilitys,
        widget.phaseColorString,
        widget.settings.ownPhase,
      ),
    );

    spellsThisPhase.addAll(
      functions.normalAbilitys(
        widget.settings.normalAbilitys,
        widget.phaseColorString,
        widget.settings.ownPhase,
      ),
    );

    for(Ability abi in spellsThisPhase) {
      if(!abi.commandPoints.contains("-")) {
        int commandCostInt = int.parse(abi.commandPoints);
        if (commandCostInt > widget.settings.commandPoints) {
          abi.erledigt = true;
        }
      }
    }

    //Ab hier Units in unitsThisPhase
    for (Unit unit in widget.settings.army.unitList) {
      if (unit.weapons.isNotEmpty) {
        unitsThisPhase.add(unit);
      }
    }

    //TODO ab Hier wird das UI der Helden-Phase gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: calculateTextColor(widget.phaseColor)),
        ),
        centerTitle: true,
        backgroundColor: widget.phaseColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
            onPressed: () {
              setState(() {
                widget.settings.paradoxPoints =
                    widget.settings.paradoxPoints + 1;
              });
            },
          ),
          Text(
            "PP: " + widget.settings.paradoxPoints.toString(),
            style: TextStyle(color: calculateTextColor(widget.phaseColor)),
          ),
          IconButton(
            icon: Icon(
              Icons.remove,
              color: calculateTextColor(widget.phaseColor),
            ),
            onPressed: () {
              setState(() {
                widget.settings.paradoxPoints =
                    widget.settings.paradoxPoints - 1;
              });
            },
          ),
          SizedBox(width: 10),
          Text(
            "Underdog:",
            style: TextStyle(color: calculateTextColor(widget.phaseColor)),
          ),
          Switch(
            // This bool value toggles the switch.
            value: widget.settings.underdog,
            activeThumbColor: Colors.teal,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                widget.settings.underdog = value;
              });
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.blueGrey.shade800,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              _navigateToAllUnits(context, widget.settings);
            },
            child: Text("WarScrolls"),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
            onPressed: () {
              setState(() {
                widget.settings.commandPoints =
                    widget.settings.commandPoints + 1;
              });
            },
          ),
          Text(
            "CP: " + widget.settings.commandPoints.toString(),
            style: TextStyle(color: calculateTextColor(widget.phaseColor)),
          ),
          IconButton(
            icon: Icon(
              Icons.remove,
              color: calculateTextColor(widget.phaseColor),
            ),
            onPressed: () {
              setState(() {
                widget.settings.commandPoints =
                    widget.settings.commandPoints - 1;
              });
            },
          ),
          ElevatedButton(
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
          SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.orange,
              backgroundColor: Colors.blueGrey.shade800,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              _navigateToCombat(context, widget.settings);
            },
            child: Text("Weiter zur Combat Phase"),
          ),
          SizedBox(width: 50),
          Switch(
            // Dieser bool-Wert ändert den Switch.
            value: widget.settings.ownPhase,
            activeThumbColor: Colors.black,
            onChanged: (bool value) {
              // Wird aufgerufen, wenn der user den Switch anklickt.
              setState(() {
                widget.settings.ownPhase = value;
              });
            },
          ),
          Text(
            widget.settings.ownPhase
                ? 'My ' + widget.title
                : 'Enemy ' + widget.title,
            style: TextStyle(color: calculateTextColor(widget.phaseColor)),
          ),
        ],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.only(right: 50),
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
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return SingleChildScrollView(
                  child: Card(
                    child: spellsThisPhase[index].erledigt
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                spellsThisPhase[index].erledigt = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  spellsThisPhase[index].name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(Icons.done, size: 100),
                                /*
                              Container(
                                height: 100,
                                width: 100,
                                child: LayoutBuilder(
                                  builder: (context, constraint) {
                                    return new Icon(
                                      Icons.done,
                                      size: constraint.biggest.height,
                                    );
                                  },
                                ),
                              ),
                              */
                              ],
                            ),
                          )
                        : Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child:
                                    spellsThisPhase[index].commandPoints
                                        .contains("-")
                                    ? Text("")
                                    : Text(
                                        "Command Point cost: " +
                                            spellsThisPhase[index]
                                                .commandPoints,
                                      ),
                              ),

                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        spellsThisPhase[index].name,
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
                                  spellsThisPhase[index].typeName.contains(
                                    "Passive",
                                  )
                                      ? functions.parseText(spellsThisPhase[index].typeName)
                                      : functions.parseText(spellsThisPhase[index].timing),
                                  functions.parseText(spellsThisPhase[index].originUnit),
                                  Text(""),
                                  (spellsThisPhase[index].effect.contains(
                                    "null",
                                  ) ||
                                      spellsThisPhase[index].effect
                                          .contains("-1"))
                                      ? functions.parseText(
                                    spellsThisPhase[index].declare,
                                  )
                                      : (spellsThisPhase[index].declare
                                      .contains("null") ||
                                      spellsThisPhase[index].declare
                                          .contains("-1"))
                                      ? functions.parseText(
                                    spellsThisPhase[index].effect,
                                  )
                                      : functions.parseText(
                                    spellsThisPhase[index].declare +
                                        "\n\n" +
                                        spellsThisPhase[index].effect,
                                  ),
                                  Text(""),

                                  (spellsThisPhase[index].keywords.contains(
                                    "null",
                                  ) ||
                                      spellsThisPhase[index].keywords
                                          .contains("-1"))
                                      ? Text("")
                                      : functions.parseText(
                                    "Keywords: ${spellsThisPhase[index].keywords}",
                                  ),
                                  
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
                                            if(!spellsThisPhase[index].commandPoints.contains("-")) {
                                              int commandCostInt = int.parse(spellsThisPhase[index].commandPoints);
                                              widget.settings.commandPoints = widget.settings.commandPoints - commandCostInt;
                                            }
                                            spellsThisPhase[index].erledigt =
                                            true;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton(
                                        //child: Text("Item $index"),
                                        child: Text("Show Ability PopUp"),
                                        onPressed: () {
                                          functions.showAbilityPopUp(context, widget.settings, spellsThisPhase[index]);
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                );
              }, childCount: spellsThisPhase.length),
            ),
          ),

          //Ab hier Kacheln für Units in der unitsThisPhase List bauen
          SliverPadding(
            padding: const EdgeInsets.only(right: 50),
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
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                  ) {
                return SingleChildScrollView(
                  child: Card(
                    child: unitsThisPhase[index].erledigt
                        ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          unitsThisPhase[index].erledigt = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            unitsThisPhase[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.done, size: 100),
                          /*
                              Container(
                                height: 100,
                                width: 100,
                                child: LayoutBuilder(
                                  builder: (context, constraint) {
                                    return new Icon(
                                      Icons.done,
                                      size: constraint.biggest.height,
                                    );
                                  },
                                ),
                              ),
                              */
                        ],
                      ),
                    )
                        : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              unitsThisPhase[index].name,
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
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                color: widget.phaseColor,
                                width: 7,
                              ), // Optional border
                            ),
                            child: Stack(
                              children: [
                                // left top to right bottom
                                Transform.rotate(
                                  angle:
                                  math.pi /
                                      4, // 45 degrees in radians
                                  child: Center(
                                    child: Container(
                                      height: 5, // Thickness
                                      color: widget.phaseColor,
                                    ),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: math.pi / 4,
                                  // right top to left bottom
                                  child: Center(
                                    child: Container(
                                      width: 5, // Thickness
                                      color: widget.phaseColor,
                                    ),
                                  ),
                                ),
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
                                        unitsThisPhase[index].move,
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
                                        unitsThisPhase[index].health,
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
                                        unitsThisPhase[index].save,
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
                                        unitsThisPhase[index]
                                            .banishment
                                            .contains("-")
                                            ? unitsThisPhase[index]
                                            .control
                                            : unitsThisPhase[index]
                                            .banishment,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        unitsThisPhase[index]
                                            .banishment
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: Text("Unit erledigt"),
                              onPressed: () {
                                setState(() {
                                  unitsThisPhase[index].erledigt = true;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: Text("show Warscroll"),
                              onPressed: () {
                                functions.showWarscroll(
                                  context,
                                  widget.settings,
                                  unitsThisPhase[index],
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: unitsThisPhase.length),
            ),
          ),
        ],
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void _navigateToCombat(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            CombatPhase(title: "Combatphase", settings: settings),
      ),
    );
  }

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }

  void _navigateToAllUnits(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            allUnits(title: "All Warscrolls", settings: settings),
      ),
    );
  }
}
