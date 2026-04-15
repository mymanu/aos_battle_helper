import 'package:aos_battle_helper/classes/spell.dart';
import 'package:aos_battle_helper/classes/unit.dart';
import 'package:flutter/material.dart';

class StartofBattle extends StatefulWidget {
  StartofBattle({super.key, required this.title /*required this.settings*/});

  //MySettings settings;
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

    List<Spell> megabossSpells = [
      Spell.trigger(
        "firstSpell-Title",
        "Start of Battle",
        "own phase",
        "Diese Fähigkeit lässt dich das Spiel gewinnen,\nwas ist wenn hier ganz viel Text steht",
      ),
      Spell.trigger(
        "Zweite Fähigkeit",
        "Start of Battle",
        "enemy phase",
        "Hier wird leider verloren",
      ),
    ];

    List<Spell> kragnosSpells = [
      Spell("Dritte  Fähigkeit", "Heldenphase", "Hier gibt es Untentschieden"),
      Spell("Vierte Fähigkeit", "Start of Battle", "Up we Go"),
      Spell("5. Spell", "Heldenphase", "Testspell ohne erledigt"),
      Spell("Spell 1 von Kragnos", "Start of Battle", "Saucool"),
    ];

    List<Spell> gordrakkSpells = [
      Spell.trigger(
        "Spell 1 von Gordrakk",
        "Start of Battle",
        "any phase",
        "Saucool",
      ),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
      Spell("Spell 1 von Gordrakk", "Movement Phase", "Saucool"),
    ];

    List<Unit> units = [
      Unit.withSpells("Megaboss", megabossSpells),
      Unit.withSpells("Gordrakk", gordrakkSpells),
      Unit.withSpells("Kragnos", kragnosSpells),
    ];

    List<Spell> spellsThisPhase = [];

    for (Unit unit in units) {
      for (Spell spell in unit.spells) {
        if (spell.phase.contains("Start of Battle")) {
          //if(spell.phase.contains("Movement Phase")) {

          if ((spell.trigger.contains("own phase") ||
                  spell.trigger.contains("any phase")) &&
              widget.ownPhase) {
            widget.erledigtList.add(spell.erledigt);
            spell.originUnit = unit.name;
            spellsThisPhase.add(spell);
          }
          if ((spell.trigger.contains("enemy phase") ||
                  spell.trigger.contains("any phase")) &&
              !widget.ownPhase) {
            widget.erledigtList.add(spell.erledigt);
            spell.originUnit = unit.name;
            spellsThisPhase.add(spell);
          }
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
                                spellsThisPhase[index].title,
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
                                  spellsThisPhase[index].title,
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
                            Text(spellsThisPhase[index].trigger),
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
