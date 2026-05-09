import 'package:aos_battle_helper/classes/battleTraits.dart';
import 'package:aos_battle_helper/classes/unit.dart';
import 'package:aos_battle_helper/classes/ability.dart';
import 'package:flutter/material.dart';

import '../classes/battleFormation.dart';
import '../classes/settings.dart';
import 'HeroPhase.dart';
import 'HomePage.dart';
import 'allUnits.dart';

class StartofBattle extends StatefulWidget {
  StartofBattle({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  bool ownPhase = true;

  //Color phaseColor = Colors.orange.shade800;
  Color phaseColor = Colors.black;

  String phaseColorString = "Black";

  @override
  _StartofBattle createState() => _StartofBattle();
}

class _StartofBattle extends State<StartofBattle> {
  @override
  Widget build(BuildContext context) {
    //String envTitle = Env.environmentName ?? "";
    //String title = widget.title + ' - ' + envTitle;
    String title = widget.title;
    //String title = widget.title + "Phase";

    List<Unit> unitsThisPhase = [];
    List<Ability> spellsThisPhase = [];

    for (Unit unit in widget.settings.army.unitList) {
      for (Ability ability in unit.abilitys) {
        if (ability.color.contains(widget.phaseColorString)) {
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

    for (Ability ability in widget.settings.army.spellLore.abilitys) {
      if (ability.color.contains(widget.phaseColorString)) {
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

    for (BattleTraits battleTrait in widget.settings.army.battleTraitsList) {
      for (Ability ability in battleTrait.abilitys) {
        if (ability.color.contains(widget.phaseColorString)) {
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

    for (BattleFormation battleFormation
        in widget.settings.army.battleFormationsList) {
      for (Ability ability in battleFormation.abilitys) {
        if (ability.color.contains(widget.phaseColorString)) {
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



    //TODO ab Hier wird das UI gebaut, ab hier kannst du dich dann austoben
    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        backgroundColor: widget.phaseColor,
        actions: <Widget>[
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
              _navigateToHero(context, widget.settings);
            },
            child: Text("Weiter zur Hero Phase"),
          ),
          SizedBox(width: 50),
          Text(
            widget.ownPhase
                ? 'Meine ' + widget.title
                : 'Gegnerische ' + widget.title,
          ),
          Switch(
            // This bool value toggles the switch.
            value: widget.ownPhase,
            activeThumbColor: Colors.teal,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                widget.ownPhase = value;
              });
            },
          ),
          /*IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
      */
        ],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
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
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Card(
                  child: spellsThisPhase[index].erledigt ?
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
                      :
                  //Ab hier Card wenn es eine Ability ist
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
                            Text(spellsThisPhase[index].timing),
                            Text(spellsThisPhase[index].originUnit),
                            Text(spellsThisPhase[index].details),
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

  void _navigateToHero(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HeroPhase(title: "Heldenphase", settings: settings),
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
