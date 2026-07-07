import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';
import 'Scoring.dart';
import 'ScoringPath.dart';
import 'StartofBattle.dart';
import 'allUnits.dart';

class EndOfTurn extends StatefulWidget {
  EndOfTurn({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  Color phaseColor = Colors.purple;

  String phaseColorString = "Purple";

  bool showSpellLoreAbilities = false;
  bool showCoreAbilities = false;
  bool showCommandAbilities = false;

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

    List<Ability> spellLoreAbilities =
    functions.spellLoreAbilitys(
      widget.settings.army.spellLore,
      widget.phaseColorString,
      widget.settings.ownPhase,
    );

    List<Ability> coreAbilities =
    functions.coreAbilitys(
      widget.settings.normalAbilitys,
      widget.phaseColorString,
      widget.settings.ownPhase,
    );

    List<Ability> commandAbilities =
    functions.commandAbilitys(
      widget.settings.commandAbilitys,
      widget.phaseColorString,
      widget.settings.ownPhase,
    );

    for (Ability abi in spellsThisPhase) {
      if (!abi.commandPoints.contains("-")) {
        int commandCostInt = int.parse(abi.commandPoints);
        if (commandCostInt > widget.settings.commandPoints) {
          abi.erledigt = true;
        }
      }
    }

    for (Ability abi in commandAbilities) {
      if (!abi.commandPoints.contains("-")) {
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
              //_navigateToScoring(context, widget.settings);
              _navigateToScoringPath(context, widget.settings);
            },
            child: Text("To Scoring"),
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
          //1. Grid mit den ursprünglichen Kacheln
          SliverPadding(
            //padding: const EdgeInsets.all(40),
              padding: const EdgeInsets.only(right: 50),
              sliver:
              calculateSliverGrid(spellsThisPhase, "default")
          ),

          //TODO Ab hier Core Abilities

          widget.showCoreAbilities ?
          //1. Grid mit den ursprünglichen Kacheln
          SliverPadding(
            //padding: const EdgeInsets.all(40),
              padding: const EdgeInsets.only(right: 50),
              sliver:
              calculateSliverGrid(coreAbilities,"Core")
          )
              :
          SliverPadding(
            //padding: const EdgeInsets.all(40),
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
                    child:
                    //Ab hier Card wenn die Ability erledigt ist
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.showCoreAbilities = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "Show Core Abilities",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.arrow_downward, size: 100),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: 1),
            ),
          ),

          //TODO Ab hier Command Abilities

          widget.showCommandAbilities ?
          //1. Grid mit den ursprünglichen Kacheln
          SliverPadding(
            //padding: const EdgeInsets.all(40),
            padding: const EdgeInsets.only(right: 50),
            sliver:
            calculateSliverGrid(commandAbilities,"Command"),
          )
              :
          SliverPadding(
            //padding: const EdgeInsets.all(40),
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
                    child:
                    //Ab hier Card wenn die Ability erledigt ist
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.showCommandAbilities = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "Show Command Abilities",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.arrow_downward, size: 100),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: 1),
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

  void _navigateToScoringPath(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScoringPath(title: "Scoring", settings: settings),
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

  SliverGrid calculateSliverGrid(List<Ability> spellsThisPhase, String abilityBool){
    Functions functions = Functions();
    return SliverGrid(
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
                ?
            //Ab hier Card wenn die Ability erledigt ist
            ElevatedButton(
              onPressed: () {
                setState(() {
                  spellsThisPhase[index].erledigt = false;
                });
              },
              child: Column(
                children: [
                  Text(
                    spellsThisPhase[index].name,
                    //cardContentList[index].ability.name.contains("-1") ? cardContentList[index].unit.name : cardContentList[index].ability.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.done, size: 100),
                ],
              ),
            )
                :
            //Ab hier Card wenn es eine Ability ist
            Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child:
                  spellsThisPhase[index].castingValue
                      .contains("-")
                      ? Text("")
                      : Text(
                    "Casting Value: " +
                        spellsThisPhase[index].castingValue,
                  ),
                ),

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
                        ? functions.parseText(context, spellsThisPhase[index].typeName)
                        : functions.parseText(context, spellsThisPhase[index].timing),
                    functions.parseText(context, spellsThisPhase[index].originUnit),
                    Text(""),
                    (spellsThisPhase[index].effect.contains(
                      "null",
                    ) ||
                        spellsThisPhase[index].effect
                            .contains("-1"))
                        ? functions.parseText(context,
                      spellsThisPhase[index].declare,
                    )
                        : (spellsThisPhase[index].declare
                        .contains("null") ||
                        spellsThisPhase[index].declare
                            .contains("-1"))
                        ? functions.parseText(context,
                      spellsThisPhase[index].effect,
                    )
                        : functions.parseText(context,
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
                        : functions.parseText(context,
                      "Keywords: ${spellsThisPhase[index].keywords}",
                    ),

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
                          child: Text("Close Abilites"),
                          onPressed: () {
                            setState(() {
                              switch (abilityBool) {
                                case "SpellLore":
                                  widget.showSpellLoreAbilities = false;
                                  break;
                                case "Core":
                                  widget.showCoreAbilities = false;
                                  break;
                                case "Command":
                                  widget.showCommandAbilities = false;
                                  break;
                                default:
                                  widget.showSpellLoreAbilities = false;
                                  widget.showCoreAbilities = false;
                                  widget.showCommandAbilities = false;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: Text("Ability done"),
                          onPressed: () {
                            setState(() {
                              spellsThisPhase[index].erledigt = true;
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
    );
  }
}
