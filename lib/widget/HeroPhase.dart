import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';

class HeroPhase extends StatefulWidget {
  HeroPhase({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  List<bool> erledigtList = [];
  bool ownPhase = true;
  Color phaseColor = Colors.yellow.shade800;

  String phaseColorString = "Yellow";

  @override
  _HeroPhase createState() => _HeroPhase();
}

class _HeroPhase extends State<HeroPhase> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    List<Ability> spellsThisPhase = [];

    for(Unit unit in widget.settings.army.unitList) {
      //for (Unit unit in units) {
      for (Ability ability in unit.abilitys) {
        //if (ability.typeName.contains("Ability")) {
          //if (ability.timing.contains("Hero")) {
          if(ability.color.contains(widget.phaseColorString)) {

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

    for(Ability abi in widget.settings.army.spellLore.abilitys) {
      if(abi.color.contains(widget.phaseColorString)) {
        widget.erledigtList.add(abi.erledigt);
        abi.originUnit = "Spell-Lore";
        spellsThisPhase.add(abi);
      }
    }

    for(BattleTraits battleTrait in widget.settings.army.battleTraitsList) {
      for(Ability abi in battleTrait.abilitys) {
        if(abi.color.contains(widget.phaseColorString)) {
          widget.erledigtList.add(abi.erledigt);
          abi.originUnit = "Battle-Trait";
          spellsThisPhase.add(abi);
        }
      }
    }

    for(BattleFormation battleFormation in widget.settings.army.battleFormationsList) {
      for(Ability abi in battleFormation.abilitys) {
        if(abi.color.contains(widget.phaseColorString)) {
          widget.erledigtList.add(abi.erledigt);
          abi.originUnit = "Battle-Formation";
          spellsThisPhase.add(abi);
        }
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
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
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
