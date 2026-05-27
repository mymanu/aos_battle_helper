import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/spellLore.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import '../spearhead/crixxitKillPack.dart';
import '../spearhead/spearheadGeneralSpells.dart';
import '../spearhead/gnawfeastClawpack.dart';
import '../spearhead/irojawzBigMob.dart';
import '../spearhead/starscaleWarhost.dart';
import '../spearhead/warpsparkClawpack.dart';
import '../widget/RegimentChooser.dart';
import 'BattleTactics.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  bool firstRun = true;

  bool? masterThePaths = false;
  bool? restlessEnergy = false;
  bool? interceptAndRecover = false;
  bool? wrathfulCycles = false;
  bool? scoutingForce = false;
  bool? attunedToGhyran = false;

  @override
  _SettingsWidget createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    //String envTitle = Env.environmentName ?? "";
    //String title = widget.title + ' - ' + envTitle;
    String title = widget.title;
    //String title = widget.title + "Phase";
    TextEditingController playerNameController = TextEditingController();
    playerNameController.text = widget.settings.playerName;

    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: playerNameController,
                onChanged: (text) {
                  widget.settings.playerName = text;
                },
                onSubmitted: (String value) async {
                  widget.settings.playerName = value;
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thanks!'),
                        content: Text(
                          'Spieler 1 heißt "$value", mit der Zeichenlänge:  ${value.characters.length}.',
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Spacer(),

                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'add AoS Spells',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addCommandSpells();
                        addNormalSpells();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Orks Orks Orks',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickIronjawzHardcoded();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Dino-Time',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickSeraphonHardcoded();
                      },
                    ),
                  ],
                ),

                Spacer(),

                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Please choose TWO Battle Tactics"),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Column(
                          children: [
                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.masterThePaths,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.masterThePaths = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),
                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.restlessEnergy,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.restlessEnergy = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.interceptAndRecover,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.interceptAndRecover = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.wrathfulCycles,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.wrathfulCycles = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.scoutingForce,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.scoutingForce = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.attunedToGhyran,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.attunedToGhyran = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),

                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Master the Paths"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Master the Paths"),
                                      content: Text(
                                        BattleTactics().masterThePaths[0] +
                                            "\n\n" +
                                            BattleTactics().masterThePaths[1] +
                                            "\n\n" +
                                            BattleTactics().masterThePaths[2],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Restless Energy"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Restless Energy"),
                                      content: Text(
                                        BattleTactics().restlessEnergy[0] +
                                            "\n\n" +
                                            BattleTactics().restlessEnergy[1] +
                                            "\n\n" +
                                            BattleTactics().restlessEnergy[2],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Intercept and Recover"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Intercept and Recover",
                                      ),
                                      content: Text(
                                        BattleTactics().interceptAndRecover[0] +
                                            "\n\n" +
                                            BattleTactics()
                                                .interceptAndRecover[1] +
                                            "\n\n" +
                                            BattleTactics()
                                                .interceptAndRecover[2],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Wrathful Cycles"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Wrathful Cycles"),
                                      content: Text(
                                        BattleTactics().wrathfulCycles[0] +
                                            "\n\n" +
                                            BattleTactics().wrathfulCycles[1] +
                                            "\n\n" +
                                            BattleTactics().wrathfulCycles[2],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Scouting Force"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Scouting Force"),
                                      content: Text(
                                        BattleTactics().scoutingForce[0] +
                                            "\n\n" +
                                            BattleTactics().scoutingForce[1] +
                                            "\n\n" +
                                            BattleTactics().scoutingForce[2],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Attuned to Ghyran"),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Attuned to Ghyran"),
                                      content: Text(
                                        BattleTactics().attunedToGhyran[0] +
                                            "\n\n" +
                                            BattleTactics().attunedToGhyran[1] +
                                            "\n\n" +
                                            BattleTactics().attunedToGhyran[2],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.orange,
                            backgroundColor: Colors.blueGrey.shade800,
                            shadowColor: Colors.black,
                            padding: const EdgeInsets.all(10.0),
                            minimumSize: Size(250, 100),
                            maximumSize: Size(510, 510),
                          ),
                          child: Text(
                            '2 Battle Tactics chosen',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            widget.settings.chosenBattleTactics.clear();
                            if (widget.masterThePaths!) {
                              widget.settings.chosenBattleTactics.add(
                                "masterThePaths",
                              );
                            }
                            if (widget.restlessEnergy!) {
                              widget.settings.chosenBattleTactics.add(
                                "restlessEnergy",
                              );
                            }
                            if (widget.interceptAndRecover!) {
                              widget.settings.chosenBattleTactics.add(
                                "interceptAndRecover",
                              );
                            }
                            if (widget.wrathfulCycles!) {
                              widget.settings.chosenBattleTactics.add(
                                "wrathfulCycles",
                              );
                            }
                            if (widget.scoutingForce!) {
                              widget.settings.chosenBattleTactics.add(
                                "scoutingForce",
                              );
                            }
                            if (widget.attunedToGhyran!) {
                              widget.settings.chosenBattleTactics.add(
                                "attunedToGhyran",
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                Spacer(),

                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'add Spearhed Spells',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addSpearheadSpells();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Seraphon \nStarscale Warhost',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickStarscaleWarhost();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Orruk Warclans \nIronjawz Bigmob',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickIronjawzBigmob();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Skaven \nWarpspark Clawpack',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickWarpsparkClawpack();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Skaven \nGnawfeast Clawpack',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickSkavenGnawfeastClawpack();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Skaven \nCrixxit´s Kill-Pack',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickSkavenCrixxitKillPack();
                      },
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.blueGrey.shade800,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'Choose Regiment Ability\nand Enhancement',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickRegimentAbilityAndEnhancement(
                          context,
                          widget.settings,
                        );
                      },
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void addCommandSpells() {
    List<Ability> commandSpells = [];

    Ability rally = Ability.color(
      "Rally",
      "Any Hero Phase",
      "Yellow",
      "Declare: Choose a friendly unit which is not in combat to use this ability."
          "\n\nEffect: Make 6x D6 Rallyroles. For each 4+ you gain 1 Rallypoint. You can use them as following:"
          "\n - Heal(1) this unit for each spent Rallypoint"
          "\n - You can use Rallypoints in the amount of health of 1 model to revive it.",
    );
    rally.commandPoints = "1";
    commandSpells.add(rally);

    Ability magicalIntervention = Ability.color(
      "Magical Intervention",
      "Enemy Hero Phase",
      "Yellow",
      "Declare: Pick a friendly Wizard or Priest to use this ability."
          "\n\nEffect: That friendly unit can use a Spell or Prayer ability (as appropriate) as if it were your hero phase. "
          "\nIf you do so, subtract 1 from casting rolls or chanting rolls made as part of that ability.",
    );
    magicalIntervention.commandPoints = "1";
    commandSpells.add(magicalIntervention);

    Ability atTheDouble = Ability.color(
      "At The Double",
      "Reaction: You declared a RUN Ability",
      "Gray",
      "Used By: The unit using that Run ability."
          "\n\nEffect: Do not make a run roll as part of that Run ability. Instead, add 6\" to that unit’s Move characteristic to determine the distance each model"
          "in that unit can move as part of that Run ability.",
    );
    atTheDouble.commandPoints = "1";
    commandSpells.add(atTheDouble);

    Ability redeploy = Ability.color(
      "Redeploy",
      "Enemy Movement Phase",
      "Gray",
      "Declare: Pick a friendly unit that is not in combat to use this ability."
          "\n\nEffect: Each model in that unit can move up to D6\"."
          "That move cannot pass through or end within the"
          "combat range of an enemy unit.",
    );
    redeploy.commandPoints = "1";
    commandSpells.add(redeploy);

    Ability coveringFire = Ability.color(
      "Covering Fire",
      "Enemy Shooting Phase",
      "Blue",
      "Declare: Pick a friendly unit that is not in combat to use this ability."
          "\n\nEffect: Resolve shooting attacks for that unit, but all of the attacks must target the nearest visible enemy"
          "unit and you must subtract 1 from the hit rolls for those attacks.",
    );
    coveringFire.commandPoints = "1";
    commandSpells.add(coveringFire);

    Ability forwardToVictory = Ability.color(
      "Forward To Victory",
      "Reaction: You declared a CHARGE Ability",
      "Orange",
      "Used By: The unit using that Charge ability."
          "\n\nEffect: You can re-roll the charge roll.",
    );
    forwardToVictory.commandPoints = "1";
    commandSpells.add(forwardToVictory);

    Ability counterCharge = Ability.color(
      "Counter-Charge",
      "Enemy Charge Phase",
      "Orange",
      "Used By: The unit using that Charge ability."
          "\n\nEffect: You can re-roll the charge roll.",
    );
    counterCharge.commandPoints = "2";
    commandSpells.add(counterCharge);

    Ability allOutAttack = Ability.color(
      "All-Out Attack",
      "Reaction: You declared an ATTACK Ability",
      "Red",
      "Used By: The unit using that Attack ability."
          "\n\nEffect: Add 1 to hit rolls for attacks made as part of"
          "that Attack ability. This also affects weapons that"
          "have the Companion weapon ability.",
    );
    allOutAttack.commandPoints = "1";
    commandSpells.add(allOutAttack);

    Ability allOutDefence = Ability.color(
      "All-Out Defence",
      "Reaction: Opponent declared an ATTACK Ability",
      "Red",
      "Used By: A unit targeted by that Attack ability."
          "\n\nEffect: Add 1 to save rolls for that unit in this phase.",
    );
    allOutDefence.commandPoints = "1";
    commandSpells.add(allOutDefence);

    Ability powerThrough = Ability.color(
      "Power Through",
      "End of Any Turn",
      "Purple",
      "Declare: Pick a friendly unit that charged this turn"
          "to use this ability, then you must pick an enemy unit "
          "in combat with it to be the target. The target must"
          "have a lower Health characteristic than the unit"
          "using this ability."
          "\n\nEffect: Inflict D3 mortal damage on the target. Then,"
          "the unit using this ability can move a distance up to"
          "its Move characteristic. It can pass through and end"
          "that move within the combat ranges of enemy units"
          "that were in combat with it at the start of the move,"
          "but not those of other enemy units. It does not have"
          "to end the move in combat.",
    );
    powerThrough.commandPoints = "1";
    commandSpells.add(powerThrough);

    widget.settings.commandAbilitys = commandSpells;
  }

  void addNormalSpells() {
    List<Ability> normalSpells = [];

    Ability activatePlaceOfPower = Ability.color(
      "Activate Place Of Power",
      "Start of Any Turn",
      "Black",
      "Declare: Pick a friendly Hero within 3\" of any Places of Power to use this ability."
          "\n\nEffect: Roll a dice. On a 1, inflict D3 mortal damage on that Hero. On a 2+:"
          "\n• If that Hero is a Wizard or Priest, add 1 to casting rolls or chanting rolls for that Hero this turn."
          "\n• If that Hero is not a Wizard or Priest, they can use the ‘Unbind’ or ‘Banish Manifestation’ ability this turn as if they had Wizard (1).",
    );
    normalSpells.add(activatePlaceOfPower);

    Ability banishManifestation = Ability.color(
      "Banish Manifestation",
      "Your Hero Phase",
      "Yellow",
      "Declare: Pick a friendly Wizard or Priest to use this ability, pick a manifestation within 30\" of them"
          "to be the target, then make a banishment roll of 2D6."
          "\n\nEffect: If the banishment roll equals or exceeds the banishment value listed on the manifestation’s"
          "warscroll, it is banished and removed from play. You cannot pick the same manifestation as the target of this ability more than once per turn.",
    );
    normalSpells.add(banishManifestation);

    Ability unbind = Ability.color(
      "Unbind",
      "Reaction: Opponent declared a SPELL ability",
      "Yellow",
      "Used By: A friendly Wizard within 30\" of the enemy Wizard casting the spell."
          "\n\nEffect: Make an unbinding roll of 2D6. If the roll exceeds the casting roll for the spell, then the spell is"
          "unbound and its effect is not resolved. This reaction cannot be used more than once per casting roll.",
    );
    normalSpells.add(unbind);

    Ability normalMove = Ability.color(
      "Normal Move",
      "Your Movement Phase",
      "Gray",
      "Declare: Pick a friendly unit that is not in combat to use this ability."
          "\n\nEffect: That unit can move a distance up to its Move characteristic. That unit cannot move into combat"
          "during any part of that move.",
    );
    normalSpells.add(normalMove);

    Ability run = Ability.color(
      "Run",
      "Your Movement Phase",
      "Gray",
      "Declare: Pick a friendly unit that is not in combat to use this ability."
          "\n\nEffect: Make a run roll of D6. That unit can move a distance up to its Move characteristic added to the"
          "run roll. That unit cannot move into combat during"
          "any part of that move.",
    );
    normalSpells.add(run);

    Ability retreat = Ability.color(
      "Retreat",
      "Your Movement Phase",
      "Gray",
      "Declare: Pick a friendly unit that is in combat to use this ability."
          "\n\nEffect: Inflict D3 mortal damage on that unit. That unit can move a distance up to its Move"
          "characteristic. That unit can move through the"
          "combat ranges of any enemy units but cannot end"
          "that move within an enemy unit’s combat range.",
    );
    normalSpells.add(retreat);

    Ability shoot = Ability.color(
      "Shoot",
      "Your Shooting Phase",
      "Blue",
      "Declare: Pick a friendly unit that has not used a Run or Retreat ability this turn to use this ability. Then,"
          "pick one or more enemy units as the target(s) of that unit’s attacks (see 16.0)."
          "\n\nEffect: Resolve shooting attacks against the target unit(s).",
    );
    normalSpells.add(shoot);

    Ability charge = Ability.color(
      "Charge",
      "Your Charge Phase",
      "Orange",
      "Declare: Pick a friendly unit that is not in combat and has not used a Run or Retreat ability this turn"
          "to use this ability. Then, make a charge roll of 2D6."
          "\n\nEffect: That unit can move a distance up to the value of the charge roll. That unit can move through the"
          "combat ranges of any enemy units and must end that move within ½\" of a visible enemy unit. If it does so,"
          "the unit using this ability has charged.",
    );
    normalSpells.add(charge);

    Ability fight = Ability.color(
      "Fight",
      "Reaction: Opponent declared an ATTACK Ability",
      "Red",
      "Declare: Pick a friendly unit that is in combat or that charged this turn to use this ability. That unit can"
          "make a pile‑in move (see 15.4). Then, if that unit is in combat, you must pick one or more enemy units as"
          "the target(s) of that unit’s attacks (see 16.0)."
          "\n\nEffect: Resolve combat attacks against the target unit(s).",
    );
    normalSpells.add(fight);

    widget.settings.normalAbilitys = normalSpells;
  }

  void addSpearheadSpells() {
    widget.settings = SpearheadGeneralSpells().addSpearheadSpells(widget.settings);
  }

  void pickIronjawzHardcoded() {
    //---------------------------------------------------------
    // Megaboss

    List<Ability> megabossSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Alright, Get´ Em",
        "Passive",
        "Orange",
        "If a friendly IRONJAWZ unit uses the ‘Counter-charge’ command while it is wholly within 12\" of this unit, spend 1 command point to use that command instead of 2.",
      ),
      Ability.color(
        "Obsessed With Violence",
        "Passive",
        "Black",
        "Add 1 to hit rolls for this unit’s attacks while it is in combat. Add 1 to this unit’s Move characteristic while it is not in combat.",
      ),
    ];

    Weapon choppa = Weapon("choppa", "Choppa");
    choppa.attack = "7";
    choppa.hit = "4+";
    choppa.wound = "3+";
    choppa.rend = "1";
    choppa.damage = "3";
    choppa.ability = "-";

    Unit megaboss = Unit.withSpells("Megaboss", megabossSpells);
    megaboss.weapons.add(choppa);
    megaboss.move = "5\"";
    megaboss.health = "6";
    megaboss.save = "3+";
    megaboss.control = "2";
    megaboss.keywords = "Destruction, Ironjawz, Hero, Infantry";

    // Megaboss
    //---------------------------------------------------------
    // Ardboyz

    List<Ability> ardboyzSpells = [
      Ability.color(
        "Shield Bash",
        "Any Combat Phase",
        "Red",
        "Make a shield bash roll of D6 for each model in this unit that is within 3\" of the target. For each 6+, inflict 1 mortal damage on the target.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit",
      ),
      Ability.color(
        "Standard Bearer",
        "Passive",
        "Purple",
        "While this unit contains any standard bearers, add 1 to this unit’s control score.",
      ),
    ];

    Weapon choppaOrStikka = Weapon("choppaOrStikka", "Choppa or Stikka");
    choppaOrStikka.attack = "2";
    choppaOrStikka.hit = "4+";
    choppaOrStikka.wound = "3+";
    choppaOrStikka.rend = "1";
    choppaOrStikka.damage = "1";
    choppaOrStikka.ability = "Anti-charge (+1 Rend)";

    Unit ardboyz = Unit.withSpells("Ardboyz", ardboyzSpells);
    ardboyz.weapons.add(choppaOrStikka);
    ardboyz.move = "4\"";
    ardboyz.health = "2";
    ardboyz.save = "3+";
    ardboyz.control = "1";
    ardboyz.keywords =
        "Destruction, Ironjawz, Infantry, Champion, Standard Bearer";

    // Ardboyz
    //---------------------------------------------------------
    // Brutes

    List<Ability> brutesSpells = [
      Ability.color(
        "You Messin'?",
        "Passive",
        "Purple",
        "Enemy units with a Health characteristic of 1 or 2 cannot contest objectives while they are in combat with this unit.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit.",
      ),
    ];

    Weapon bruteWeapons = Weapon("bruteWeapons", "Brute Weapons");
    bruteWeapons.attack = "3";
    bruteWeapons.hit = "4+";
    bruteWeapons.wound = "3+";
    bruteWeapons.rend = "1";
    bruteWeapons.damage = "2";
    bruteWeapons.ability = "Anti-Infantry (+1 Rend)";

    Weapon goreChoppa = Weapon("goreChoppa", "Gore-choppa");
    goreChoppa.attack = "3";
    goreChoppa.hit = "4+";
    goreChoppa.wound = "3+";
    goreChoppa.rend = "2";
    goreChoppa.damage = "3";

    Unit brutes = Unit.withSpells("Brutes", brutesSpells);
    brutes.weapons.add(bruteWeapons);
    brutes.weapons.add(goreChoppa);
    brutes.move = "4\"";
    brutes.health = "3";
    brutes.save = "3+";
    brutes.control = "1";
    brutes.keywords = "Destruction, Ironjawz, Infantry, Champion, Brute";

    // Brutes
    //---------------------------------------------------------
    // Gore-gruntas

    List<Ability> goreGruntaSpells = [
      Ability.color(
        "Gore-grunta Charge",
        "Any Charge Phase",
        "Orange",
        "Declare: If this unit charged this phase, pick an enemy unit within 1\" of it to be the target.\nEffect: Roll a D3. On a 2+, inflict an amount of mortal damage on the target equal to the roll. Add 1 to the mortal damage inflicted (if any) if the target is Cavalry.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit.",
      ),
    ];

    Weapon choppaOrHacka = Weapon("choppaOrHacka", "Choppa or Hacka");
    choppaOrHacka.attack = "4";
    choppaOrHacka.hit = "4+";
    choppaOrHacka.wound = "3+";
    choppaOrHacka.rend = "1";
    choppaOrHacka.damage = "1";
    choppaOrHacka.ability = "Anti-Cavalry (+1 Rend)";

    Weapon gruntaTusks = Weapon("gruntaTusks", "Grunta`s Tusks");
    gruntaTusks.attack = "4";
    gruntaTusks.hit = "4+";
    gruntaTusks.wound = "2+";
    gruntaTusks.rend = "-";
    gruntaTusks.damage = "1";
    gruntaTusks.ability = "Charge (+1 Damage), Companion";

    Unit goreGruntas = Unit.withSpells("Gore-gruntas", goreGruntaSpells);
    goreGruntas.weapons.add(choppaOrHacka);
    goreGruntas.weapons.add(gruntaTusks);
    goreGruntas.move = "9\"";
    goreGruntas.health = "5";
    goreGruntas.save = "3+";
    goreGruntas.control = "2";
    goreGruntas.keywords = "Destruction, Ironjawz, Cavalry, Champion";

    // Gore-gruntas
    //---------------------------------------------------------
    // Weirdnob Shaman

    List<Ability> shamanSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Brutal Power",
        "Passive",
        "Yellow",
        "Add 1 to this unit’s power level while there are any friendly Ironjawz units that have 10 or more models wholly within 12\" of it.",
      ),
    ];

    Weapon greenPuke = Weapon("greenPuke", "GreenPuke");
    greenPuke.range = "10\"";
    greenPuke.attack = "4";
    greenPuke.hit = "2+";
    greenPuke.wound = "4+";
    greenPuke.rend = "-";
    greenPuke.damage = "D3";
    greenPuke.ability = "Shoot In Combat";

    Weapon waaaghStaff = Weapon("waaaghStaff", "Waaagh! Staff");
    waaaghStaff.attack = "3";
    waaaghStaff.hit = "4+";
    waaaghStaff.wound = "3+";
    waaaghStaff.rend = "1";
    waaaghStaff.damage = "D3";

    Unit weirdnobShaman = Unit.withSpells("Weirdnob Shaman", shamanSpells);
    weirdnobShaman.weapons.add(greenPuke);
    weirdnobShaman.weapons.add(waaaghStaff);
    weirdnobShaman.move = "4\"";
    weirdnobShaman.health = "6";
    weirdnobShaman.save = "6+";
    weirdnobShaman.control = "2";
    weirdnobShaman.keywords =
        "Destruction, Ironjawz, Infantry, Hero, Wizard (1)";

    // Weirdnob Shaman
    //---------------------------------------------------------
    // Bossrokk Tower

    List<Ability> towerSpells = [
      Ability.color(
        "Man da Tower!",
        "Passive",
        "Black",
        "While this terrain feature has a Shouty Boss:\n• The Shouty Boss cannot use Move abilities.\n• Instead of measuring range or visibility to the Shouty Boss, measure to this terrain feature instead.\n• All attacks that would target the Shouty Boss target this terrain feature instead.\n• If this terrain feature is destroyed, before removing it from the battlefield, inflict D3 mortal damage on the Shouty Boss. Then, set up the Shouty Boss on the battlefield within 3\" of this terrain feature and not in combat. That unit is no longer the Shouty Boss. If it is not possible to set up the Shouty Boss, it is slain.",
      ),
      Ability.color(
        "Up We Go!",
        "Your Hero Phase",
        "Yellow",
        "Declare: If this terrain feature does not have a Shouty Boss , pick a friendly Ironjawz Infantry Hero that is not in combat and is within 3\" of it to be the target.\nEffect: Place the target on this terrain feature. The target is now a Shouty Boss (see ‘Man da Tower’).",
      ),
      Ability.color(
        "Aggressively Bossy",
        "Once Per Turn, Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible enemy unit within 18\" of this terrain feature to be the target.\nEffect: Roll a dice. Add 1 to the roll if this terrain feature has a Shouty Boss. On a 4+, pick 1 of the following effects to apply to the target until the start of your next turn:\nDat's Ours, Ya Git!: Subtract 3 from the target's control score.\nZog Off Wiv Ya Magic!: Subtract 1 from casting rolls and/or chanting rolls for the target.\nOi! Hold it!: Subtract 1 from the number of dice rolled when making charge rolls for the target, to a minimum of 1.",
      ),
      Ability.color(
        "I'm Off!",
        "Your Movement Phase",
        "Gray",
        "Effect: If this terrain feature has a Shouty Boss that was not placed on it this turn, set up the Shouty Boss on the battlefield wholly within 6\" of this terrain feature and not in combat. That unit is no longer a Shouty Boss.",
      ),
    ];

    Unit tower = Unit.withSpells("Bossrokk Tower", towerSpells);
    tower.move = "-";
    tower.health = "12";
    tower.save = "4+";
    tower.keywords = "Destruction, Ironjawz, Faction Terrain";

    // Bossrokk Tower
    //---------------------------------------------------------
    // Manifestation

    List<Ability> footSpells = [
      Ability.color(
        "Multiple Parts",
        "Passive",
        "Black",
        "When a number of damage points equal to this Manifestation's Health characteristic are allocated to it, this Manifestation is destroyed and all its parts are removed from play.",
      ),
      Ability.color(
        "Ward Save",
        "Passive",
        "Black",
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.",
      ),
      Ability.color(
        "Wandering Destruction",
        "Once Per Turn, Your Movement Phase",
        "Gray",
        "Declare: Pick a part of this Manifestation to be the target.\nRemove the target from the battlefield and set it up again on the battlefield wholly within 9\" of the other part of this Manifestation.\nThen, roll a D3 for each enemy unit within 3\" of the target. On a 2+:\n• Inflict an amount of mortal damage on the target equal to the roll.\n• That unit has the Stomped keyword until the start of your next turn.\n• Subtract 1 from the number of dice rolled when making charge rolls for Stomped units, to a minimum of 1.",
      ),
    ];

    Unit foot = Unit.withSpells("Foot of Gork", footSpells);
    foot.health = "8";
    foot.save = "4+";
    foot.banishment = "7+";
    foot.keywords =
        "Destruction, Ironjawz, Manifestation, Endless Spell, Ward (6+)";

    List<Ability> gorkSpells = [
      Ability.color(
        "Ward Save",
        "Passive",
        "Black",
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.",
      ),
      Ability.color(
        "Bellowing Waaagh!-Cries",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly Ironjawz or Kruleboyz Wizard or Priest within 3\" of this Manifestation to be the target.\nEffect: Pick either 1 or 2 to add to casting rolls or chanting rolls for the target until the start of your next turn. Then, roll a number of dice equal to the number picked. For each 1-2, allocate 1 damage point to the target (ward rolls cannot be made for those damage points). For each 5+, until the start of your next turn, add 1 to charge rolls for friendly Kruleboyz or Ironjawz units while they are wholly within 12\" of this Manifestation. Friendly units can be affected by this ability multiple times and the effects are cumulative.",
      ),
    ];

    Weapon toxicGas = Weapon("toxicGas", "Toxic Gas");
    toxicGas.attack = "5";
    toxicGas.hit = "2+";
    toxicGas.wound = "4+";
    toxicGas.rend = "1";
    toxicGas.damage = "D3";

    Unit gork = Unit.withSpells("Gork-Roara", gorkSpells);
    gork.weapons.add(toxicGas);
    gork.move = "6";
    gork.health = "6";
    gork.save = "5+";
    gork.banishment = "7+";
    gork.keywords =
        "Destruction, Ironjawz, Manifestation, Endless Spell, Ward (6+)";

    List<Ability> morkspitSpells = [
      Ability.color(
        "Ward Save",
        "Passive",
        "Black",
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.",
      ),
      Ability.color(
        "Tricksy Footing",
        "Passive",
        "Yellow",
        "Subtract 3 from the control score of enemy units while they are within 6\" of this Manifestation.",
      ),
      Ability.color(
        "Grasping Gunge",
        "Passive",
        "Gray",
        "Enemy units cannot use Run abilities while they are within 6\" of this Manifestation.",
      ),
    ];

    Unit morkspit = Unit.withSpells("Morkspit Marsh", morkspitSpells);
    morkspit.health = "8";
    morkspit.save = "5+";
    morkspit.banishment = "7+";
    morkspit.keywords =
        "Destruction, Ironjawz, Manifestation, Endless Spell, Ward (6+)";

    // Manifestation
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [
      megaboss,
      ardboyz,
      brutes,
      goreGruntas,
      weirdnobShaman,
      tower,
      foot,
      gork,
      morkspit,
    ];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability ironjawzWaaagh = Ability("Ironjawz Waaagh!",
      "Once Per Turn (Army), Your Charge Phase",
      "Ability (Activated)",
      "Pick a friendly Ironjawz Hero to be the target. You cannot pick the same Hero to be the target of this ability more than once per battle.",
      "For the rest of the turn, the following effects apply to friendly Ironjawz units while they are wholly within 18\" of the target:\n"
          "• Add 1 to charge rolls for those units.\n• Add 1 to the Attacks characteristic of those units’ melee weapons.",
    );
    ironjawzWaaagh.keywords = "WAAAGH!";
    ironjawzWaaagh.color = "Orange";

    Ability mightyDestroyers = Ability("Mighty Destroyers", "-", "-", "-", "-");
    mightyDestroyers.timing = "Once Per Turn (Army), Any Hero Phase";
    mightyDestroyers.color = "Yellow";
    mightyDestroyers.details =
        "Declare: Pick a friendly Ironjawz unit that was not set up this turn to be the target.\nEffect: The target can move up to 3\". It can move into combat. If it was in combat at the start of the move, it must end that move in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(ironjawzWaaagh);
    battleTraits.abilitys.add(mightyDestroyers);

    // Battle Traits
    //---------------------------------------------------------
    // Spell Lore

    Ability summonFoot = Ability("Summon Foot of Gork", "-", "-", "-", "-");
    summonFoot.timing = "Your Hero Phase";
    summonFoot.color = "Yellow";
    summonFoot.castingValue = "7";
    summonFoot.keywords = "Spell, Summon";
    summonFoot.details =
        "Declare: If there is not a friendly Foot of Gork on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Foot of Gork wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units. A Foot of Gork has 2 parts that must be set up within 9\" of each other.";

    Ability summonGork = Ability("Summon Gork-Roara", "-", "-", "-", "-");
    summonGork.timing = "Your Hero Phase";
    summonGork.color = "Yellow";
    summonGork.castingValue = "5";
    summonGork.keywords = "Spell, Summon";
    summonGork.details =
        "Declare: If there is not a friendly Gork-Roara on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Gork-Roara wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units.";

    Ability summonMorkspit = Ability(
      "Summon Morkspit Marsh",
      "-",
      "-",
      "-",
      "-",
    );
    summonMorkspit.timing = "Your Hero Phase";
    summonMorkspit.color = "Yellow";
    summonMorkspit.castingValue = "5";
    summonMorkspit.keywords = "Spell, Summon";
    summonMorkspit.details =
        "Declare: If there is not a friendly Morkspit Marsh on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Morkspit Marsh wholly within 18\" of the caster and visible to them.";

    Ability bashEmLadz = Ability("Bash 'Em, Ladz", "-", "-", "-", "-");
    bashEmLadz.timing = "Your Hero Phase";
    bashEmLadz.color = "Yellow";
    bashEmLadz.castingValue = "6";
    bashEmLadz.keywords = "Spell, Unlimited";
    bashEmLadz.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly Ironjawz unit wholly within 12\" of them to be the target, then make a casting roll of 2D6.\nEffect: The target’s melee weapons have Crit (2 Hits) until the start of your next turn";

    Ability greatHand = Ability(
      "Da Great Big Green Hand of Gork",
      "-",
      "-",
      "-",
      "-",
    );
    greatHand.timing = "Your Hero Phase";
    greatHand.color = "Yellow";
    greatHand.castingValue = "7";
    greatHand.keywords = "Spell";
    greatHand.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly unit wholly within 12\" of them and not in combat to be the target, then make a casting roll of 2D6.\nEffect: Remove the target from the battlefield and set it up again wholly within 24\" of the caster and more than 9\" from all enemy units.";

    Ability mightyEadbutt = Ability("Mighty 'Eadbutt", "-", "-", "-", "-");
    mightyEadbutt.timing = "Your Hero Phase";
    mightyEadbutt.color = "Yellow";
    mightyEadbutt.castingValue = "6";
    mightyEadbutt.keywords = "Spell";
    mightyEadbutt.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible enemy unit within 18\" of them to be the target, then make a casting roll of 2D6.\nEffect: Inflict D3 mortal damage on the target. If the target is a Wizard, inflict 3 mortal damage on the target instead.";

    SpellLore spellLore = SpellLore();
    spellLore.abilitys.add(summonFoot);
    spellLore.abilitys.add(summonGork);
    spellLore.abilitys.add(summonMorkspit);
    spellLore.abilitys.add(bashEmLadz);
    spellLore.abilitys.add(greatHand);
    spellLore.abilitys.add(mightyEadbutt);

    // Spell Lore
    //---------------------------------------------------------
    // Battle Formation

    Ability naturalDisaster = Ability("Natural Disaster", "-", "-", "-", "-");
    naturalDisaster.timing = "Passive";
    naturalDisaster.color = "Orange";
    naturalDisaster.details =
        "If you make an unmodified charge roll of 8+ for a friendly non-Hero Ironjawz unit, add 1 to the Attacks characteristic of that unit’s melee weapons for the rest of the turn.";

    BattleFormation battleFormation = BattleFormation();
    battleFormation.abilitys.add(naturalDisaster);

    // Battle Formation
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.army.battleFormationsList.clear();
    widget.settings.army.battleFormationsList.add(battleFormation);

    widget.settings.army.spellLore = spellLore;
  }

  //TODO Seraphon Path to Glory Liste hinzufügen über Button Hinzufügen
  void pickSeraphonHardcoded() {
    // Slann Solo (Special Boss)

    List<Ability> slannSoloSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
    ];

    Weapon greatWeapon = Weapon("greatWeapon", "Great Weapon of Renown");
    greatWeapon.attack = "5";
    greatWeapon.hit = "3+";
    greatWeapon.wound = "2+";
    greatWeapon.rend = "2";
    greatWeapon.damage = "3";
    greatWeapon.ability = "Crit (Mortal)";

    Weapon hooves = Weapon(
      "hooves",
      "Ghyranite Steed`s Teeth, Hooves or Claws",
    );
    hooves.attack = "2";
    hooves.hit = "5+";
    hooves.wound = "3+";
    hooves.damage = "1";
    hooves.ability = "Companion";

    Unit slannSolo = Unit.withSpells(
      "Slann Solo - schneller als ein Skink",
      slannSoloSpells,
    );
    slannSolo.weapons.add(greatWeapon);
    slannSolo.weapons.add(hooves);
    slannSolo.move = "12\"";
    slannSolo.health = "11";
    slannSolo.save = "3+";
    slannSolo.control = "5";
    slannSolo.keywords = "General, Hero, Order, Seraphon, Cavalry";

    // Slann Solo (Special Boss)
    //---------------------------------------------------------
    // Saurus Warriors

    List<Ability> saurusWarriorsSpells = [
      Ability.color(
        "Ordered Cohorts",
        "Passive",
        "Green",
        "Add 1 to save rolls for this unit while each model in this unit is contesting an objective you control.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit.",
      ),
      Ability.color(
        "Musician",
        "Passive",
        "Yellow",
        "While this unit contains any musicians, if it uses the ‘Rally’ command, you can make one additional rally roll of D6.",
      ),
      Ability.color(
        "Standard Bearer",
        "Passive",
        "Purple",
        "While this unit contains any standard bearers, add 1 to this unit’s control score.",
      ),
    ];

    Weapon celestiteWeapon = Weapon("celestiteWeapon", "Celestite Weapon");
    celestiteWeapon.attack = "2";
    celestiteWeapon.hit = "3+";
    celestiteWeapon.wound = "3+";
    celestiteWeapon.rend = "1";
    celestiteWeapon.damage = "1";

    Unit saurusWarriors = Unit.withSpells(
      "Saurus Warriors",
      saurusWarriorsSpells,
    );
    saurusWarriors.weapons.add(celestiteWeapon);
    saurusWarriors.move = "5\"";
    saurusWarriors.health = "2";
    saurusWarriors.save = "4+";
    saurusWarriors.control = "1";
    saurusWarriors.keywords =
        "Order, Seraphon, Saurus, Infantry, Champion, Standard Bearer, Musician";

    // Saurus Warriors
    //---------------------------------------------------------
    // Skink Starpriest

    List<Ability> skinkStarpriestSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Serpent Staff",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible friendly Seraphon unit wholly within 18\" of this unit to be the target.\nEffect: Roll a dice. On a 2+, the target’s melee weapons have Crit (Auto-wound) until the start of your next turn.",
      ),
    ];

    Weapon serpentStaff = Weapon("serpentStaff", "Serpent Staff");
    serpentStaff.attack = "3";
    serpentStaff.hit = "4+";
    serpentStaff.wound = "4+";
    serpentStaff.rend = "1";
    serpentStaff.damage = "D3";

    Unit skinkStarpriest = Unit.withSpells(
      "Skink Starpriest",
      skinkStarpriestSpells,
    );
    skinkStarpriest.weapons.add(serpentStaff);
    skinkStarpriest.move = "8\"";
    skinkStarpriest.health = "5";
    skinkStarpriest.save = "6+";
    skinkStarpriest.control = "2";
    skinkStarpriest.keywords =
        "Regimental Leader, Hero, Order, Seraphon, Skink, Wizard (1), Infantry";

    // Skink Starpriest
    //---------------------------------------------------------
    // Kroxigor

    List<Ability> kroxigorSpells = [
      Ability.color(
        "Brutal Blows",
        "Passive",
        "Red",
        "Add 1 to the Damage characteristic of this unit’s melee weapons for attacks that target an enemy unit that has 10 or more models.",
      ),
    ];

    Weapon moonstoneHammer = Weapon("moonstoneHammer", "Moonstone Hammer");
    moonstoneHammer.attack = "4";
    moonstoneHammer.hit = "3+";
    moonstoneHammer.wound = "2+";
    moonstoneHammer.rend = "1";
    moonstoneHammer.damage = "3";
    moonstoneHammer.ability = "Anti-Infantry (+1 Rend)";

    Weapon drakebiteMaul = Weapon("drakebiteMaul", "Drakebite Maul");
    drakebiteMaul.attack = "4";
    drakebiteMaul.hit = "4+";
    drakebiteMaul.wound = "2+";
    drakebiteMaul.rend = "1";
    drakebiteMaul.damage = "2";
    drakebiteMaul.ability = "Anti-Infantry (+1 Rend)";

    Unit kroxigor = Unit.withSpells("Kroxigor", kroxigorSpells);
    kroxigor.weapons.add(moonstoneHammer);
    kroxigor.weapons.add(drakebiteMaul);
    kroxigor.move = "5\"";
    kroxigor.health = "6";
    kroxigor.save = "4+";
    kroxigor.control = "2";
    kroxigor.keywords = "Order, Seraphon, Kroxigor, Infantry";

    // Kroxigor
    //---------------------------------------------------------
    // Stegadon

    List<Ability> stegadonSpells = [
      Ability.color(
        "Battle Damaged",
        "Passive",
        "Red",
        "While this unit has 10 or more damage points, the Attacks characteristic of its Stegadon’s Horns and Jaws is 4.",
      ),
      Ability.color(
        "Unstoppable Stampede",
        "Once Per Turn (Army), Any Charge Phase",
        "Orange",
        "Declare: If this unit charged this phase, pick an enemy Infantry unit in combat with it to be the target.\nEffect: Inflict D3 mortal damage on the target. Then, this unit can move 2D6\". This unit can pass through models in the target unit but must end that move in combat.",
      ),
    ];

    Weapon handlersJavelins = Weapon(
      "handlersJavelins",
      "Handlers`Meteoric Javelins",
    );
    handlersJavelins.range = "12\"";
    handlersJavelins.attack = "6";
    handlersJavelins.hit = "4+";
    handlersJavelins.wound = "4+";
    handlersJavelins.damage = "1";
    handlersJavelins.ability = "Shoot In Combat";

    Weapon skystreakBow = Weapon("skystreakBow", "Skystreak Bow");
    skystreakBow.range = "18\"";
    skystreakBow.attack = "3";
    skystreakBow.hit = "3+";
    skystreakBow.wound = "3+";
    skystreakBow.rend = "1";
    skystreakBow.damage = "2";
    skystreakBow.ability = "Anti-Monster (+1 Rend)";

    Weapon stegadonHorns = Weapon("stegadonHorns", "Stegadon`s Horns and Jaws");
    stegadonHorns.attack = "6";
    stegadonHorns.hit = "4+";
    stegadonHorns.wound = "2+";
    stegadonHorns.rend = "1";
    stegadonHorns.damage = "2";
    stegadonHorns.ability = "Charge (+1 Damage), Companion";

    Unit stegadon = Unit.withSpells("Stegadon", stegadonSpells);
    stegadon.weapons.add(handlersJavelins);
    stegadon.weapons.add(skystreakBow);
    stegadon.weapons.add(stegadonHorns);
    stegadon.move = "8\"";
    stegadon.health = "14";
    stegadon.save = "4+";
    stegadon.control = "5";
    stegadon.keywords = "Order, Seraphon, Skink, Monster";

    // Stegadon
    //---------------------------------------------------------
    // Realmshaper Engine

    List<Ability> realmshaperEngineSpells = [
      Ability.color(
        "Fierce Guardians",
        "Passive",
        "Red",
        "Add 1 to hit rolls for combat attacks made by friendly Saurus or Kroxigor units that target an enemy unit while that enemy unit is within 9\" of this terrain feature.",
      ),
      Ability.color(
        "Power Unleashed",
        "Your Hero Phase",
        "Yellow",
        "Declare: If there are any friendly Seraphon Wizards within 3\" of this terrain feature, pick another terrain feature within 24\" of this terrain feature, then pick up to 3 enemy units within 3\" of that terrain feature to be the targets.\nEffect: Roll a D3 for each target. On a 2+, inflict an amount of mortal damage on the target equal to the roll. If that terrain feature has a Health characteristic, inflict D3 mortal damage on it.",
      ),
    ];

    Unit realmshaperEngine = Unit.withSpells(
      "Realmshaper Engine",
      realmshaperEngineSpells,
    );
    realmshaperEngine.move = "-";
    realmshaperEngine.health = "15";
    realmshaperEngine.save = "4+";

    // Realmshaper Engine
    //---------------------------------------------------------
    // Manifestation

    //TODO muss Jenny definieren welche Manifestation sie spielen will !!!

    // Manifestation
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [
      slannSolo,
      saurusWarriors,
      skinkStarpriest,
      kroxigor,
      stegadon,
      realmshaperEngine,
    ];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability theGreatPlan = Ability("The Great Plan", "-", "-", "-", "-");
    theGreatPlan.timing = "Once Per Battle, Deployment Phase";
    theGreatPlan.color = "Black";
    theGreatPlan.details =
        "Declare: Pick an Asterism ability.Effect: That Asterism ability can be used for the rest of the battle, but the others cannot, unless allowed by the ‘Further the Great Plan’ ability.";

    Ability furtherTheGreatPlan = Ability(
      "Further the Great Plan",
      "-",
      "-",
      "-",
      "-",
    );
    furtherTheGreatPlan.timing =
        "Once Per Battle, Start of the Third Battle Round";
    furtherTheGreatPlan.color = "Black";
    furtherTheGreatPlan.details =
        "Declare: You can use this ability if you meet the condition below that corresponds to the Asterism you picked in the deployment phase."
        "\nItzl the Tamer: 3 or more enemy units have been destroyed."
        "\nQuetzl the Preserver: There are no enemy units wholly within friendly territory."
        "\nSotek the Deliverer: The enemy general is in combat or has been destroyed."
        "\nTepok the Seer: There are any friendly Slann units on the battlefield and no friendly Slann units are in combat or have been destroyed.Effect: Pick a different Asterism ability. It can be used in addition to the one you picked in the deployment phase.";

    Ability itzlTheTamer = Ability("Itzl the Tamer", "-", "-", "-", "-");
    itzlTheTamer.timing = "Passive";
    itzlTheTamer.color = "Red";
    itzlTheTamer.details =
        "Companion weapons used by friendly Seraphon units have Crit (2 Hits).";
    itzlTheTamer.keywords = "Asterism";

    Ability quetzlThePreserver = Ability(
      "Quetzl the Preserver",
      "-",
      "-",
      "-",
      "-",
    );
    quetzlThePreserver.timing = "Passive";
    quetzlThePreserver.color = "Red";
    quetzlThePreserver.details =
        "Subtract 1 from the Rend characteristic of melee weapons for attacks that target friendly Seraphon units that are wholly within friendly territory.";
    quetzlThePreserver.keywords = "Asterism";

    Ability sotekTheDeliverer = Ability(
      "Sotek the Deliverer",
      "-",
      "-",
      "-",
      "-",
    );
    sotekTheDeliverer.timing = "Passive";
    sotekTheDeliverer.color = "Gray";
    sotekTheDeliverer.details =
        "Add 2 to the Move characteristic of friendly Seraphon units.";
    sotekTheDeliverer.keywords = "Asterism";

    Ability tepokTheSeer = Ability("Tepok the Seer", "-", "-", "-", "-");
    tepokTheSeer.timing = "Passive";
    tepokTheSeer.color = "Yellow";
    tepokTheSeer.details =
        "Add 1 to casting rolls for friendly Seraphon units.";
    tepokTheSeer.keywords = "Asterism";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(theGreatPlan);
    battleTraits.abilitys.add(furtherTheGreatPlan);
    battleTraits.abilitys.add(itzlTheTamer);
    battleTraits.abilitys.add(quetzlThePreserver);
    battleTraits.abilitys.add(sotekTheDeliverer);
    battleTraits.abilitys.add(tepokTheSeer);

    // Battle Traits
    //---------------------------------------------------------
    // Spell Lore
    //TODO hier Summon Spells für Jennys Manifestation einbauen
    /*
    Ability summonFoot = Ability("Summon Foot of Gork");
    summonFoot.timing = "Your Hero Phase";
    summonFoot.color = "Yellow";
    summonFoot.castingValue = "7";
    summonFoot.keywords = "Spell, Summon";
    summonFoot.details =
    "Declare: If there is not a friendly Foot of Gork on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Foot of Gork wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units. A Foot of Gork has 2 parts that must be set up within 9\" of each other.";

    Ability summonGork = Ability("Summon Gork-Roara");
    summonGork.timing = "Your Hero Phase";
    summonGork.color = "Yellow";
    summonGork.castingValue = "5";
    summonGork.keywords = "Spell, Summon";
    summonGork.details =
    "Declare: If there is not a friendly Gork-Roara on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Gork-Roara wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units.";

    Ability summonMorkspit = Ability("Summon Morkspit Marsh");
    summonMorkspit.timing = "Your Hero Phase";
    summonMorkspit.color = "Yellow";
    summonMorkspit.castingValue = "5";
    summonMorkspit.keywords = "Spell, Summon";
    summonMorkspit.details =
    "Declare: If there is not a friendly Morkspit Marsh on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Morkspit Marsh wholly within 18\" of the caster and visible to them.";
    */

    Ability cometsCall = Ability("Comet's Call", "-", "-", "-", "-");
    cometsCall.timing = "Your Hero Phase";
    cometsCall.color = "Yellow";
    cometsCall.castingValue = "7";
    cometsCall.keywords = "Spell";
    cometsCall.details =
        "Declare: Pick a friendly Seraphon Wizard to cast this spell, pick a visible enemy unit within 18\" of them to be the target, then make a casting roll of 2D6.\nEffect: Roll a dice for each model in the target unit. For each 5+, inflict 1 mortal damage on the target.";

    Ability mysticalUnforging = Ability(
      "Mystical Unforging",
      "-",
      "-",
      "-",
      "-",
    );
    mysticalUnforging.timing = "Your Hero Phase";
    mysticalUnforging.color = "Yellow";
    mysticalUnforging.castingValue = "6";
    mysticalUnforging.keywords = "Spell, Unlimited";
    mysticalUnforging.details =
        "Declare: Pick a friendly Seraphon Wizard to cast this spell, pick a visible enemy unit within 12\" of them to be the target, then make a casting roll of 2D6.\nEffect: Subtract 1 from the Rend characteristic of the target’s weapons until the start of your next turn.";

    Ability speedOfHuanchi = Ability("Speed of Huanchi", "-", "-", "-", "-");
    speedOfHuanchi.timing = "Your Hero Phase";
    speedOfHuanchi.color = "Yellow";
    speedOfHuanchi.castingValue = "6";
    speedOfHuanchi.keywords = "Spell";
    speedOfHuanchi.details =
        "Declare: Pick a friendly Seraphon Wizard to cast this spell, pick a visible friendly Seraphon unit wholly within 12\" of them to be the target, then make a casting roll of 2D6.\nEffect: Until the start of your next turn, the target can use a Run ability and still use Shoot and/or Charge abilities later in the turn.";

    SpellLore spellLore = SpellLore();
    /*
    spellLore.abilitys.add(summonFoot);
    spellLore.abilitys.add(summonGork);
    spellLore.abilitys.add(summonMorkspit);
     */
    spellLore.abilitys.add(cometsCall);
    spellLore.abilitys.add(mysticalUnforging);
    spellLore.abilitys.add(speedOfHuanchi);

    // Spell Lore
    //---------------------------------------------------------
    // Battle Formation

    //TODO muss Jenny definieren welchen Battle Formation sie spielen will !!!
    BattleFormation battleFormation = BattleFormation();

    // Battle Formation
    //---------------------------------------------------------
    // in widget.settings die Armee hinzufügen

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.army.battleFormationsList.clear();
    widget.settings.army.battleFormationsList.add(battleFormation);

    widget.settings.army.spellLore = spellLore;
  }

  void pickWarpsparkClawpack() {
    widget.settings = WarpsparkClawpack().pickWarpsparkClawpack(widget.settings);
  }

  void pickStarscaleWarhost() {
    widget.settings = StarscaleWarhost().pickStarscaleWarhost(widget.settings);
  }

  void pickIronjawzBigmob() {
    widget.settings = IronjawzBigMob().pickIronjawzBigMob(widget.settings);
  }

  void pickSkavenGnawfeastClawpack() {
    widget.settings = GnawfeastClawpack().pickGnawfeastClawpack(widget.settings);
  }

  void pickSkavenCrixxitKillPack() {
    widget.settings = CrixxitKillPack().pickCrixxitKillPack(widget.settings);
  }

  Future<void> pickRegimentAbilityAndEnhancement(
    BuildContext context,
    Settings settings,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          title: Text("Choose Regiment Ability and Enhancement"),
          content: Container(
            height: 1000,
            width: 1000,
            child: RegimentChooser(settings: settings),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
                for (Unit unit in widget.settings.army.unitList) {
                  if (unit.id.contains("General")) {
                    if (!widget.firstRun) {
                      unit.abilitys.removeLast();
                    }
                    unit.abilitys.add(widget.settings.chosenEnhancement);
                    widget.firstRun = false;
                  }
                }
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}
