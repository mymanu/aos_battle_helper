import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'EndOfTurn.dart';
import 'HomePage.dart';

class CombatPhase extends StatefulWidget {
  CombatPhase({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  bool ownPhase = true;
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

    for(Unit unit in widget.settings.army.unitList) {
      for (Ability ability in unit.abilitys) {
        if(ability.color.contains(widget.phaseColorString)) {
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              widget.ownPhase) {
            ability.originUnit = unit.name;
            spellsThisPhase.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              !widget.ownPhase) {
            ability.originUnit = unit.name;
            spellsThisPhase.add(ability);
          }
        }
      }
    }

    for(Ability ability in widget.settings.army.spellLore.abilitys) {
      if(ability.color.contains(widget.phaseColorString)) {
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            widget.ownPhase) {
          ability.originUnit = "Spell-Lore";
          spellsThisPhase.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            !widget.ownPhase) {
          ability.originUnit = "Spell-Lore";
          spellsThisPhase.add(ability);
        }
      }
    }

    for(BattleTraits battleTrait in widget.settings.army.battleTraitsList) {
      for(Ability ability in battleTrait.abilitys) {
        if(ability.color.contains(widget.phaseColorString)) {
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              widget.ownPhase) {
            ability.originUnit = "Battle-Trait";
            spellsThisPhase.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              !widget.ownPhase) {
            ability.originUnit = "Battle-Trait";
            spellsThisPhase.add(ability);
          }
        }
      }
    }

    for(BattleFormation battleFormation in widget.settings.army.battleFormationsList) {
      for(Ability ability in battleFormation.abilitys) {
        if(ability.color.contains(widget.phaseColorString)) {
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              widget.ownPhase) {
            ability.originUnit = "Battle-Formation";
            spellsThisPhase.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              !widget.ownPhase) {
            ability.originUnit = "Battle-Formation";
            spellsThisPhase.add(ability);
          }
        }
      }
    }

    for (Ability ability in widget.settings.commandAbilitys) {
      if (ability.color.contains(widget.phaseColorString)) {
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            widget.ownPhase) {
          ability.originUnit = "Command-Ability";
          spellsThisPhase.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            !widget.ownPhase) {
          ability.originUnit = "Command-Ability";
          spellsThisPhase.add(ability);
        }
      }
    }

    for (Ability ability in widget.settings.normalAbilitys) {
      if (ability.color.contains(widget.phaseColorString)) {
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            widget.ownPhase) {
          ability.originUnit = "Core-Ability";
          spellsThisPhase.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            !widget.ownPhase) {
          ability.originUnit = "Core-Ability";
          spellsThisPhase.add(ability);
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
        title: Text(title, style: TextStyle(color: calculateTextColor(widget.phaseColor)),),
        centerTitle: true,
        backgroundColor: widget.phaseColor,
        actions: <Widget>[
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
              widget.ownPhase
                  ? 'Meine ' + widget.title
                  : 'Gegnerische ' + widget.title,
              style: TextStyle(color: calculateTextColor(widget.phaseColor))),
          Switch(
            // Dieser bool-Wert ändert den Switch.
            value: widget.ownPhase,
            activeThumbColor: Colors.black,
            onChanged: (bool value) {
              // Wird aufgerufen, wenn der user den Switch anklickt.
              setState(() {
                widget.ownPhase = value;
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
                              Text("Ursprung: " + spellsThisPhase[index].originUnit),
                            ],
                          ),
                          Text("Trigger: " + spellsThisPhase[index].timing),
                          Text("Effekt: " + spellsThisPhase[index].details),
                          //Text("Ursprung: " + spellsThisPhase[index].originUnit),
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
                                  /* ... */
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
}
