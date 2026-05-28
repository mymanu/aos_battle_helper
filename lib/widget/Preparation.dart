import 'package:aos_battle_helper/classes/ability.dart';
import 'package:flutter/material.dart';

import '../classes/functions.dart';
import '../classes/settings.dart';
import 'HomePage.dart';
import 'StartofBattle.dart';
import 'allUnits.dart';

class Preparation extends StatefulWidget {
  Preparation({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  Color phaseColor = Colors.black;

  String phaseColorString = "Teal";

  @override
  _Preparation createState() => _Preparation();
}

class _Preparation extends State<Preparation> {
  @override
  Widget build(BuildContext context) {
    //String envTitle = Env.environmentName ?? "";
    //String title = widget.title + ' - ' + envTitle;
    String title = widget.title;
    //String title = widget.title + "Phase";

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
              _navigateToStartofBattle(context, widget.settings);
            },
            child: Text("To Start of Battle Round"),
          ),
          SizedBox(width: 50),
          Text(
            widget.settings.ownPhase
                ? 'My ' + widget.title
                : 'Enemy ' + widget.title,
          ),
          Switch(
            // This bool value toggles the switch.
            value: widget.settings.ownPhase,
            activeThumbColor: Colors.teal,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                widget.settings.ownPhase = value;
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
                childAspectRatio: 1.8,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) { //TODO für Manu: Bitte Preparations einfügen aus spearheadGeneralSpells.dart
                return Card(
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
                            spellsThisPhase[index].typeName.contains("Passive")
                                ? Text(spellsThisPhase[index].typeName)
                                : Text(spellsThisPhase[index].timing),
                            Text(spellsThisPhase[index].originUnit),
                            Text(""),
                            spellsThisPhase[index].effect.contains("-1")
                                ? Text(spellsThisPhase[index].declare)
                                : spellsThisPhase[index].declare.contains("-1")
                                ? Text(spellsThisPhase[index].effect)
                                : Text(
                                    spellsThisPhase[index].declare +
                                        "\n\n" +
                                        spellsThisPhase[index].effect,
                                  ),

                            spellsThisPhase[index].commandPoints.contains("-")
                                ? Text("")
                                : Text(
                                    "Command Point cost: " +
                                        spellsThisPhase[index].commandPoints,
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
        ],
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void _navigateToStartofBattle(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            StartofBattle(title: "Start of Battle Round", settings: settings),
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
