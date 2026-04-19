import 'package:aos_battle_helper/classes/unit.dart';
import 'package:aos_battle_helper/classes/ability.dart';
import 'package:flutter/material.dart';

import '../classes/settings.dart';

class StartofBattle extends StatefulWidget {
  StartofBattle({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  List<bool> erledigtList = [];
  bool ownPhase = true;
  Color phaseColor = Colors.orange.shade800;

  //Color phaseColor = Colors.grey;

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

    List<Ability> megabossSpells = [
      Ability.example(
        "firstSpell-Title",
        "Start of Battle",
        "Diese Fähigkeit lässt dich das Spiel gewinnen,\nwas ist wenn hier ganz viel Text steht",
      ),
      Ability.example(
        "Zweite Fähigkeit",
        "Start of Battle",
        "Hier wird leider verloren",
      ),
    ];

    List<Ability> kragnosSpells = [
      Ability.example("Dritte  Fähigkeit", "Heldenphase", "Hier gibt es Untentschieden"),
      Ability.example("Vierte Fähigkeit", "Start of Battle", "Up we Go"),
      Ability.example("5. Spell", "Heldenphase", "Testspell ohne erledigt"),
      Ability.example("Spell 1 von Kragnos", "Start of Battle", "Saucool"),
    ];

    List<Ability> gordrakkSpells = [
      Ability.example(
        "Spell 1 von Gordrakk",
        "Start of Battle",
        "any phase",
      ),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Ability.example("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
    ];

    List<Unit> units = [
      Unit.withSpells("Megaboss", megabossSpells),
      Unit.withSpells("Gordrakk", gordrakkSpells),
      Unit.withSpells("Kragnos", kragnosSpells),
    ];

    List<Ability> spellsThisPhase = [];

    for(Unit unit in widget.settings.army.unitList) {
    //for (Unit unit in units) {
      for (Ability ability in unit.abilitys) {
        if (ability.typeName.contains("Ability")) {
        //if (ability.timing.contains("Start of Battle")) {
          //if(ability.phase.contains("Movement Phase")) {

          /*if ((ability.trigger.contains("own phase") ||
                  ability.trigger.contains("any phase")) &&
              widget.ownPhase) {
            widget.erledigtList.add(ability.erledigt);
            ability.originUnit = unit.name;
            spellsThisPhase.add(ability);
          }
          if ((ability.trigger.contains("enemy phase") ||
                  ability.trigger.contains("any phase")) &&
              !widget.ownPhase) {
            widget.erledigtList.add(ability.erledigt);
            ability.originUnit = unit.name;
            spellsThisPhase.add(ability);
            }
           */
          widget.erledigtList.add(ability.erledigt);
          ability.originUnit = unit.name;
          spellsThisPhase.add(ability);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: <Widget>[
          Text(
            widget.ownPhase
                ? 'Meine ' + widget.title
                : 'Gegnerische ' + widget.title,
          ),
          Switch(
            // This bool value toggles the switch.
            value: widget.ownPhase,
            activeThumbColor: widget.phaseColor,
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
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  child: widget.erledigtList[index]
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.erledigtList[index] = false;
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
                            Text(spellsThisPhase[index].timing),
                            Text(spellsThisPhase[index].originUnit),
                            Text(spellsThisPhase[index].details),
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
                                      widget.erledigtList[index] = true;
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
        ],
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
