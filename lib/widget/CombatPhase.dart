import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'EndOfTurn.dart';
import 'HomePage.dart';
import 'allUnits.dart';

class CombatPhase extends StatefulWidget {
  CombatPhase({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  Color phaseColor = Colors.red;

  String phaseColorString = "Red";

  @override
  _CombatPhase createState() => _CombatPhase();
}

class _CombatPhase extends State<CombatPhase> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    List<Ability> spellsThisPhase = [];
    List<Unit> unitsThisPhase = [];

    Functions functions = Functions();

    spellsThisPhase.addAll(functions.unitAbilitys(widget.settings.army.unitList, widget.phaseColorString, widget.settings.ownPhase));
    spellsThisPhase.addAll(functions.unitAbilitys(widget.settings.army.unitList, "Green", widget.settings.ownPhase));

    spellsThisPhase.addAll(functions.spellLoreAbilitys(widget.settings.army.spellLore, widget.phaseColorString, widget.settings.ownPhase));

    spellsThisPhase.addAll(functions.battleTraitAbilitys(widget.settings.army.battleTraitsList, widget.phaseColorString, widget.settings.ownPhase));

    spellsThisPhase.addAll(functions.battleFormationAbilitys(widget.settings.army.battleFormationsList, widget.phaseColorString, widget.settings.ownPhase));

    spellsThisPhase.addAll(functions.commandAbilitys(widget.settings.commandAbilitys, widget.phaseColorString, widget.settings.ownPhase));

    spellsThisPhase.addAll(functions.normalAbilitys(widget.settings.normalAbilitys, widget.phaseColorString, widget.settings.ownPhase));

    //Ab hier Units in unitsThisPhase
    for (Unit unit in widget.settings.army.unitList) {
      if (unit.weapons.isNotEmpty) {
        unitsThisPhase.add(unit);
      }
    }

    //TODO ab Hier wird das UI der Helden-Phase gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: calculateTextColor(widget.phaseColor)),),
        centerTitle: true,
        backgroundColor: widget.phaseColor,
        actions: <Widget>[
          Text(
              "Underdog:",
          style: TextStyle(color: calculateTextColor(widget.phaseColor))),
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
          SizedBox(width: 10,),
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
            icon: Icon(Icons.remove, color: calculateTextColor(widget.phaseColor)),
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
              _navigateToEnd(context, widget.settings);
            },
            child: Text("Weiter zum End of Turn"),
          ),
          SizedBox(width: 50),
          Text(
              widget.settings.ownPhase
                  ? 'My ' + widget.title
                  : 'Enemy ' + widget.title,
              style: TextStyle(color: calculateTextColor(widget.phaseColor))),
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
                childAspectRatio: 2,


              ),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Card(
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
                          : Column(
                        mainAxisSize: MainAxisSize.min,
                        //crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text("Ursprung: " + spellsThisPhase[index].originUnit),
                            ],
                          ),
                          spellsThisPhase[index].typeName.contains("Passive") ? Text(spellsThisPhase[index].typeName) : Text(spellsThisPhase[index].timing),
                          Text(spellsThisPhase[index].originUnit),
                          Text(""),
                          spellsThisPhase[index].effect.contains("-") ?
                          Text(spellsThisPhase[index].declare) : spellsThisPhase[index].declare.contains("-") ?
                          Text(spellsThisPhase[index].effect) :
                          Text(spellsThisPhase[index].declare + "\n\n" + spellsThisPhase[index].effect) ,

                          spellsThisPhase[index].commandPoints.contains("-") ? Text("") : Text("Command Point cost: " + spellsThisPhase[index].commandPoints),
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
                                    spellsThisPhase[index].erledigt = true;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: Text("Item $index"),
                                onPressed: () {
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
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
                return Card(
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
                      :  Column(
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
                      //TODO Hier Content der Card einfügen einer Unit
                      Text("Health: " + unitsThisPhase[index].health),
                      Text("Move: " + unitsThisPhase[index].move),
                      Text("Save: " + unitsThisPhase[index].save),
                      Text("Control: " + unitsThisPhase[index].control),
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
                            child: Text("Unit erledigt"),
                            onPressed: () {
                              setState(() {
                                unitsThisPhase[index].erledigt =
                                true;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: Text("show Warscroll"),
                            onPressed: () {
                              functions.showWarscroll(context, widget.settings, unitsThisPhase[index]);
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
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

  void _navigateToEnd(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EndOfTurn(title: "End of Turn", settings: settings),
      ),
    );
  }

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
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
