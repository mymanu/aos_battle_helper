import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';
import 'Scoring.dart';
import 'StartofBattle.dart';
import 'allUnits.dart';

class EndOfTurn extends StatefulWidget {
  EndOfTurn({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  Color phaseColor = Colors.purple;

  String phaseColorString = "Purple";

  @override
  _EndOfTurn createState() => _EndOfTurn();
}

class _EndOfTurn extends State<EndOfTurn> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    List<Ability> spellsThisPhase = [];

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
              _navigateToScoring(context, widget.settings);
            },
            child: Text("To Scoring"),
          ),
          SizedBox(width: 50),
          Text(
            widget.settings.ownPhase
                ? 'My ' + widget.title
                : 'Enemy ' + widget.title,
            style: TextStyle(color: calculateTextColor(widget.phaseColor)),
          ),
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
                childAspectRatio: 1.8,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        spellsThisPhase[index].name,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //TODO abändern zu Unit, von welcher es genutzt werden kann
                                      Text(
                                        "Ursprung: " +
                                            spellsThisPhase[index].originUnit,
                                      ),
                                    ],
                                  ),
                                  spellsThisPhase[index].typeName.contains(
                                        "Passive",
                                      )
                                      ? Text(spellsThisPhase[index].typeName)
                                      : Text(spellsThisPhase[index].timing),
                                  Text(spellsThisPhase[index].originUnit),
                                  Text(""),
                                  spellsThisPhase[index].effect.contains("-1")
                                      ? Text(spellsThisPhase[index].declare)
                                      : spellsThisPhase[index].declare.contains(
                                          "-1",
                                        )
                                      ? Text(spellsThisPhase[index].effect)
                                      : Text(
                                          spellsThisPhase[index].declare +
                                              "\n\n" +
                                              spellsThisPhase[index].effect,
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
                            ],
                          ),
                  ),
                );
              }, childCount: spellsThisPhase.length),
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

  void _navigateToScoring(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scoring(title: "Scoring", settings: settings),
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
