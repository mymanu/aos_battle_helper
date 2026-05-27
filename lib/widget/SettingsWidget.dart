import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/spellLore.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
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
                                      content:
                                      Text(BattleTactics().masterThePaths[0]
                                          + "\n\n" +
                                          BattleTactics().masterThePaths[1]
                                          + "\n\n" +
                                          BattleTactics().masterThePaths[2]
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
                                      content:
                                      Text(BattleTactics().restlessEnergy[0]
                                          + "\n\n" +
                                          BattleTactics().restlessEnergy[1]
                                          + "\n\n" +
                                          BattleTactics().restlessEnergy[2]
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
                                      title: const Text("Intercept and Recover"),
                                      content:
                                      Text(BattleTactics().interceptAndRecover[0]
                                          + "\n\n" +
                                          BattleTactics().interceptAndRecover[1]
                                          + "\n\n" +
                                          BattleTactics().interceptAndRecover[2]
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
                                      content:
                                      Text(BattleTactics().wrathfulCycles[0]
                                          + "\n\n" +
                                          BattleTactics().wrathfulCycles[1]
                                          + "\n\n" +
                                          BattleTactics().wrathfulCycles[2]
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
                                      content:
                                      Text(BattleTactics().scoutingForce[0]
                                          + "\n\n" +
                                          BattleTactics().scoutingForce[1]
                                          + "\n\n" +
                                          BattleTactics().scoutingForce[2]
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
                                      content:
                                      Text(BattleTactics().attunedToGhyran[0]
                                          + "\n\n" +
                                          BattleTactics().attunedToGhyran[1]
                                          + "\n\n" +
                                          BattleTactics().attunedToGhyran[2]
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
                            if(widget.masterThePaths!) {
                              widget.settings.chosenBattleTactics.add("masterThePaths");
                            }
                            if(widget.restlessEnergy!) {
                              widget.settings.chosenBattleTactics.add("restlessEnergy");
                            }
                            if(widget.interceptAndRecover!) {
                              widget.settings.chosenBattleTactics.add("interceptAndRecover");
                            }
                            if(widget.wrathfulCycles!) {
                              widget.settings.chosenBattleTactics.add("wrathfulCycles");
                            }
                            if(widget.scoutingForce!) {
                              widget.settings.chosenBattleTactics.add("scoutingForce");
                            }
                            if(widget.attunedToGhyran!) {
                              widget.settings.chosenBattleTactics.add("attunedToGhyran");
                            }
                          },
                        ),
                      ],
                    )
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
    List<Ability> normalSpells = [];

    Ability reinforcements = Ability.color(
      "Call for Reinforcements",
      "Once Per Turn, Your Movement Phase",
      "Gray",
      "Declare: Pick a friendly REINFORCEMENTS unit that has been destroyed."
          "\n\nEffect: Set up an identical replacement unit on the battlefield, wholly within fiendly territory,"
          "wholly within 6\" of the battlefield edge and not in combat."
          "\nEach REINFORCEMENTS unit can only be replaced once. Replacement units cannot themselves be replaced.",
    );
    normalSpells.add(reinforcements);

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

    Ability ironjawzWaaagh = Ability("Ironjawz Waaagh!","-","-","-","-");
    ironjawzWaaagh.timing = "Once Per Turn (Army), Your Charge Phase";
    ironjawzWaaagh.keywords = "WAAAGH!";
    ironjawzWaaagh.color = "Orange";
    ironjawzWaaagh.details =
        "Declare: Pick a friendly Ironjawz Hero to be the target. You cannot pick the same Hero to be the target of this ability more than once per battle.\nEffect: For the rest of the turn, the following effects apply to friendly Ironjawz units while they are wholly within 18\" of the target:\n• Add 1 to charge rolls for those units.\n• Add 1 to the Attacks characteristic of those units’ melee weapons.";

    Ability mightyDestroyers = Ability("Mighty Destroyers","-","-","-","-");
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

    Ability summonFoot = Ability("Summon Foot of Gork","-","-","-","-");
    summonFoot.timing = "Your Hero Phase";
    summonFoot.color = "Yellow";
    summonFoot.castingValue = "7";
    summonFoot.keywords = "Spell, Summon";
    summonFoot.details =
        "Declare: If there is not a friendly Foot of Gork on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Foot of Gork wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units. A Foot of Gork has 2 parts that must be set up within 9\" of each other.";

    Ability summonGork = Ability("Summon Gork-Roara","-","-","-","-");
    summonGork.timing = "Your Hero Phase";
    summonGork.color = "Yellow";
    summonGork.castingValue = "5";
    summonGork.keywords = "Spell, Summon";
    summonGork.details =
        "Declare: If there is not a friendly Gork-Roara on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Gork-Roara wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units.";

    Ability summonMorkspit = Ability("Summon Morkspit Marsh","-","-","-","-");
    summonMorkspit.timing = "Your Hero Phase";
    summonMorkspit.color = "Yellow";
    summonMorkspit.castingValue = "5";
    summonMorkspit.keywords = "Spell, Summon";
    summonMorkspit.details =
        "Declare: If there is not a friendly Morkspit Marsh on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Morkspit Marsh wholly within 18\" of the caster and visible to them.";

    Ability bashEmLadz = Ability("Bash 'Em, Ladz","-","-","-","-");
    bashEmLadz.timing = "Your Hero Phase";
    bashEmLadz.color = "Yellow";
    bashEmLadz.castingValue = "6";
    bashEmLadz.keywords = "Spell, Unlimited";
    bashEmLadz.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly Ironjawz unit wholly within 12\" of them to be the target, then make a casting roll of 2D6.\nEffect: The target’s melee weapons have Crit (2 Hits) until the start of your next turn";

    Ability greatHand = Ability("Da Great Big Green Hand of Gork","-","-","-","-");
    greatHand.timing = "Your Hero Phase";
    greatHand.color = "Yellow";
    greatHand.castingValue = "7";
    greatHand.keywords = "Spell";
    greatHand.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly unit wholly within 12\" of them and not in combat to be the target, then make a casting roll of 2D6.\nEffect: Remove the target from the battlefield and set it up again wholly within 24\" of the caster and more than 9\" from all enemy units.";

    Ability mightyEadbutt = Ability("Mighty 'Eadbutt","-","-","-","-");
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

    Ability naturalDisaster = Ability("Natural Disaster","-","-","-","-");
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

    Ability theGreatPlan = Ability("The Great Plan","-","-","-","-");
    theGreatPlan.timing = "Once Per Battle, Deployment Phase";
    theGreatPlan.color = "Black";
    theGreatPlan.details =
        "Declare: Pick an Asterism ability.Effect: That Asterism ability can be used for the rest of the battle, but the others cannot, unless allowed by the ‘Further the Great Plan’ ability.";

    Ability furtherTheGreatPlan = Ability("Further the Great Plan","-","-","-","-");
    furtherTheGreatPlan.timing =
        "Once Per Battle, Start of the Third Battle Round";
    furtherTheGreatPlan.color = "Black";
    furtherTheGreatPlan.details =
        "Declare: You can use this ability if you meet the condition below that corresponds to the Asterism you picked in the deployment phase."
        "\nItzl the Tamer: 3 or more enemy units have been destroyed."
        "\nQuetzl the Preserver: There are no enemy units wholly within friendly territory."
        "\nSotek the Deliverer: The enemy general is in combat or has been destroyed."
        "\nTepok the Seer: There are any friendly Slann units on the battlefield and no friendly Slann units are in combat or have been destroyed.Effect: Pick a different Asterism ability. It can be used in addition to the one you picked in the deployment phase.";

    Ability itzlTheTamer = Ability("Itzl the Tamer","-","-","-","-");
    itzlTheTamer.timing = "Passive";
    itzlTheTamer.color = "Red";
    itzlTheTamer.details =
        "Companion weapons used by friendly Seraphon units have Crit (2 Hits).";
    itzlTheTamer.keywords = "Asterism";

    Ability quetzlThePreserver = Ability("Quetzl the Preserver","-","-","-","-");
    quetzlThePreserver.timing = "Passive";
    quetzlThePreserver.color = "Red";
    quetzlThePreserver.details =
        "Subtract 1 from the Rend characteristic of melee weapons for attacks that target friendly Seraphon units that are wholly within friendly territory.";
    quetzlThePreserver.keywords = "Asterism";

    Ability sotekTheDeliverer = Ability("Sotek the Deliverer","-","-","-","-");
    sotekTheDeliverer.timing = "Passive";
    sotekTheDeliverer.color = "Gray";
    sotekTheDeliverer.details =
        "Add 2 to the Move characteristic of friendly Seraphon units.";
    sotekTheDeliverer.keywords = "Asterism";

    Ability tepokTheSeer = Ability("Tepok the Seer","-","-","-","-");
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

    Ability cometsCall = Ability("Comet's Call","-","-","-","-");
    cometsCall.timing = "Your Hero Phase";
    cometsCall.color = "Yellow";
    cometsCall.castingValue = "7";
    cometsCall.keywords = "Spell";
    cometsCall.details =
        "Declare: Pick a friendly Seraphon Wizard to cast this spell, pick a visible enemy unit within 18\" of them to be the target, then make a casting roll of 2D6.\nEffect: Roll a dice for each model in the target unit. For each 5+, inflict 1 mortal damage on the target.";

    Ability mysticalUnforging = Ability("Mystical Unforging","-","-","-","-");
    mysticalUnforging.timing = "Your Hero Phase";
    mysticalUnforging.color = "Yellow";
    mysticalUnforging.castingValue = "6";
    mysticalUnforging.keywords = "Spell, Unlimited";
    mysticalUnforging.details =
        "Declare: Pick a friendly Seraphon Wizard to cast this spell, pick a visible enemy unit within 12\" of them to be the target, then make a casting roll of 2D6.\nEffect: Subtract 1 from the Rend characteristic of the target’s weapons until the start of your next turn.";

    Ability speedOfHuanchi = Ability("Speed of Huanchi","-","-","-","-");
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
    //---------------------------------------------------------
    // Grey Seer

    List<Ability> generalSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Will of the Hornet Rat",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly unit wholly within 13\" of this unit to be the target, then roll a dice."
            "\n\nEffect: On a 3+, add the roll to the target`s control score until the start of your next turn.",
      ),
      Ability.color(
        "Wither",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible enemy unit within 13\" of this unit to be the target, then make a casting roll of 2D6."
            "\n\nEffect: On a 6+, inflict D3 mortal damage on the target.",
      ),
    ];

    Weapon warpstoneStaff = Weapon("warpstoneStaff", "Warpstone Staff");
    warpstoneStaff.attack = "3";
    warpstoneStaff.hit = "4+";
    warpstoneStaff.wound = "4+";
    warpstoneStaff.rend = "1";
    warpstoneStaff.damage = "D3";

    Unit general = Unit.withSpells("Grey Seer", generalSpells);
    general.id = "General";
    general.weapons.add(warpstoneStaff);
    general.move = "6\"";
    general.health = "5";
    general.save = "6+";
    general.control = "2";
    general.keywords = "Hero, Wizard, Infantry";

    // Grey Seer
    //---------------------------------------------------------
    // Clanrats

    List<Ability> clanratsSpells = [
      Ability.color(
        "Seething Swarm",
        "End of Any Turn",
        "Purple",
        "Effect: You can return D3 slain models to this unit",
      ),
    ];

    Weapon rustyBlade = Weapon("rustyBlade", "RustyBlade");
    rustyBlade.attack = "2";
    rustyBlade.hit = "4+";
    rustyBlade.wound = "5+";
    rustyBlade.rend = "-";
    rustyBlade.damage = "1";

    Unit clanrats = Unit.withSpells("Clanrats", clanratsSpells);
    clanrats.weapons.add(rustyBlade);
    clanrats.move = "6\"";
    clanrats.health = "1";
    clanrats.save = "5+";
    clanrats.control = "1";
    clanrats.keywords = "Infantry, Reinforcements";

    // Clanrats
    //---------------------------------------------------------
    // Stormfiends

    List<Ability> stormfiendsSpells = [
      Ability.color(
        "Shock Gauntlets",
        "Passive",
        "Red",
        "Effect: Each time an attack made with this unit`s Shock Gauntlets scores a critical hit, that attack scores D6 hits"
            "instead of 1 (make a wound roll for each hit).",
      ),
    ];

    Weapon ratlingCannons = Weapon("ratlingCannons", "Ratling Cannons");
    ratlingCannons.range = "15\"";
    ratlingCannons.attack = "3D6";
    ratlingCannons.hit = "4+";
    ratlingCannons.wound = "3+";
    ratlingCannons.rend = "1";
    ratlingCannons.damage = "1";

    Weapon windlaunchers = Weapon("windlaunchers", "Windlaunchers");
    windlaunchers.range = "15\"";
    windlaunchers.attack = "3";
    windlaunchers.hit = "4+";
    windlaunchers.wound = "3+";
    windlaunchers.rend = "2";
    windlaunchers.damage = "D3";

    Weapon clubbingBlows = Weapon("clubbingBlows", "Clubbing Blows");
    clubbingBlows.attack = "4";
    clubbingBlows.hit = "4+";
    clubbingBlows.wound = "2+";
    clubbingBlows.rend = "-";
    clubbingBlows.damage = "2";

    Weapon shockGauntlets = Weapon("shockGauntlets", "Shock Gauntlets");
    shockGauntlets.attack = "4";
    shockGauntlets.hit = "4+";
    shockGauntlets.wound = "2+";
    shockGauntlets.rend = "1";
    shockGauntlets.damage = "2";

    Unit stormfiends = Unit.withSpells("Stormfiends", stormfiendsSpells);
    stormfiends.weapons.add(ratlingCannons);
    stormfiends.weapons.add(windlaunchers);
    stormfiends.weapons.add(clubbingBlows);
    stormfiends.weapons.add(shockGauntlets);
    stormfiends.move = "6\"";
    stormfiends.health = "6";
    stormfiends.save = "4+";
    stormfiends.control = "2";
    stormfiends.keywords = "Infantry";

    // Stormfiends
    //---------------------------------------------------------
    // Warp Lightning Cannon

    List<Ability> warpLightningCannonSpells = [
      Ability.color(
        "Warp Lightning Blast",
        "Passive",
        "Blue",
        "Effect: Each attack made with this weapon in a single phase must target the same enemy unit."
            "Each hit inflicts 1 mortal damage on the target and the attack sequence ends.",
      ),
    ];

    Weapon warpLightningBlast = Weapon(
      "warpLightningBlast",
      "Warp Lightning Blast",
    );
    warpLightningBlast.range = "20\"";
    warpLightningBlast.attack = "2D6";
    warpLightningBlast.hit = "4+";
    warpLightningBlast.wound = "*";
    warpLightningBlast.rend = "*";
    warpLightningBlast.damage = "*";

    Weapon teeth = Weapon("teeth", "Crew`s Teeth and Knives");
    teeth.attack = "D6";
    teeth.hit = "4+";
    teeth.wound = "5+";
    teeth.damage = "1";

    Unit warpLightningCannon = Unit.withSpells(
      "Warp Lightning Cannon",
      warpLightningCannonSpells,
    );
    warpLightningCannon.weapons.add(warpLightningBlast);
    warpLightningCannon.weapons.add(teeth);
    warpLightningCannon.move = "3\"";
    warpLightningCannon.health = "8";
    warpLightningCannon.save = "4+";
    warpLightningCannon.control = "2";
    warpLightningCannon.keywords = "War Machine";

    // Warp Lightning Cannon
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, clanrats, stormfiends, warpLightningCannon];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability threeClawsteps = Ability("Always three Clawsteps Ahead","-","-","-","-");
    threeClawsteps.timing = "Once Per Phase, Enemy Movement Phase";
    threeClawsteps.color = "Gray";
    threeClawsteps.details =
        "Declare: Pick a friendly unit that is not in combat."
        "\n\nEffect: That unit can use the `Normal Move` ability as if it were your movement phase.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(threeClawsteps);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability endlessSwarmofRats = Ability("Endless Swarm of Rats","-","-","-","-");
    endlessSwarmofRats.timing = "Any end of turn";
    endlessSwarmofRats.color = "Purple";
    endlessSwarmofRats.details =
        "Effect: When a friendly Clanrats unit uses its `Seething Swarm` ability, you can return D6 slain"
        "models to that unit instead of D3.";

    Ability warpstoneLacedArmour = Ability("Warpstone-laced Armour","-","-","-","-");
    warpstoneLacedArmour.timing =
        "Once Per Battle, Reaction: Opponent declared an ATTACK ability and targeted your Stormfiends unit";
    warpstoneLacedArmour.color = "Red";
    warpstoneLacedArmour.details =
        "Used By: Your Stormfiends unit."
        "\n\nEffect: Your Stormfiends unit has WARD (5+) for the rest of the turn.";

    List<Ability> regimentAbilies = [endlessSwarmofRats, warpstoneLacedArmour];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability cageOfWarpLightning = Ability("Cage of Warp Lightning","-","-","-","-");
    cageOfWarpLightning.keywords = "Enhancement";
    cageOfWarpLightning.timing = "Once Per Battle, Any Combat Phase";
    cageOfWarpLightning.color = "Red";
    cageOfWarpLightning.details =
        "Declare: Pick a visible enemy unit within 6\" of your general and roll a dice"
        "\n\nEffect: On a 2+, the enemy unit has STRIKE-LAST this phase. On a 1, inflict 1 mortal damage on your general";

    Ability scurryAway = Ability("Scurry Away","-","-","-","-");
    scurryAway.keywords = "Enhancement";
    scurryAway.timing = "Any Combat Phase";
    scurryAway.color = "Red";
    scurryAway.details =
        "Effect: Roll a dice. On a 3+, this unit can immediately use the `Retreat` ability as if it were your movement"
        "phase. If it does so, no mortal damage is inflicted on it.";

    Ability skilledManipulator = Ability("Skilled Manipulator","-","-","-","-");
    skilledManipulator.keywords = "Enhancement";
    skilledManipulator.timing = "Passive";
    skilledManipulator.color = "Red";
    skilledManipulator.details =
        "Effect: Your general has WARD (4+) while they are within 1\" of any friendly CLanrats units.";

    Ability skitterleap = Ability("Skitterleap","-","-","-","-");
    skitterleap.keywords = "Enhancement";
    skitterleap.timing = "Your Hero Phase";
    skitterleap.color = "Yellow";
    skitterleap.details =
        "Declare: Make a casting roll of 2D6."
        "\n\nEffect: On a 6+, remove your general from the battlefield and set them up again on the battlefield"
        "more than 6\" from all enemy units. They cannot use MOVE abilities in the following movement phase.";

    List<Ability> enhancements = [
      cageOfWarpLightning,
      scurryAway,
      skilledManipulator,
      skitterleap,
    ];

    // Enhancements
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.regimentAbilities = regimentAbilies;

    widget.settings.enhancements = enhancements;
  }

  void pickStarscaleWarhost() {
    //---------------------------------------------------------
    // General SAURUS OLDBLOOD ON CARNOSAUR

    List<Ability> generalSpells = [
      Ability.color(
        "Ancient Warlord",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly unit wholly within 12\" of this unit to be the target. You cannot pick this unit."
            "\n\nEffect: Until the start of your next turn, add 1 to charge rolls for the target.",
      ),
      Ability.color(
        "Battle Damaged",
        "Passive",
        "Black",
        "Effect: While this unit has 10 or more damage points, the Attacks characteristic of its Carnosaur’s Massive Jaws is 1.",
      ),
    ];

    Weapon sunboltGauntlet = Weapon("sunboltGauntlet", "Sunbolt Gauntlet");
    sunboltGauntlet.range = "12\"";
    sunboltGauntlet.attack = "D6";
    sunboltGauntlet.hit = "3+";
    sunboltGauntlet.wound = "3+";
    sunboltGauntlet.rend = "1";
    sunboltGauntlet.damage = "1";
    sunboltGauntlet.ability = "Shoot in Combat";

    Weapon relicWeapon = Weapon("relicWeapon", "Relic Celestite Weapon");
    relicWeapon.attack = "5";
    relicWeapon.hit = "3+";
    relicWeapon.wound = "3+";
    relicWeapon.rend = "1";
    relicWeapon.damage = "2";

    Weapon jaws = Weapon("jaws", "Carnosaur´s Massive Jaws");
    jaws.attack = "3";
    jaws.hit = "4+";
    jaws.wound = "2+";
    jaws.rend = "2";
    jaws.damage = "3";
    jaws.ability = "Companion";

    Unit general = Unit.withSpells(
      "Saurus Oldblood on Carnosaur",
      generalSpells,
    );
    general.weapons.add(sunboltGauntlet);
    general.weapons.add(relicWeapon);
    general.weapons.add(jaws);
    general.id = "General";
    general.move = "10\"";
    general.health = "14";
    general.save = "4+";
    general.control = "5";
    general.keywords = "Hero, Monster";

    // General SAURUS OLDBLOOD ON CARNOSAUR
    //---------------------------------------------------------
    // SAURUS WARRIORS

    List<Ability> saurusWarriorSpells = [
      Ability.color(
        "Ordered Cohorts",
        "Passive",
        "Green",
        "Effect: Add 1 to save rolls for this unit while it is contesting an objective you control.",
      ),
    ];

    Weapon celestiteClub = Weapon("celestiteClub", "Celestite Club");
    celestiteClub.attack = "2";
    celestiteClub.hit = "3+";
    celestiteClub.wound = "3+";
    celestiteClub.rend = "1";
    celestiteClub.damage = "1";

    Unit saurusWarriors = Unit.withSpells(
      "Saurus Warriors",
      saurusWarriorSpells,
    );
    saurusWarriors.weapons.add(celestiteClub);
    saurusWarriors.move = "5\"";
    saurusWarriors.health = "2";
    saurusWarriors.save = "4+";
    saurusWarriors.control = "1";
    saurusWarriors.keywords = "Infantry";

    // SAURUS WARRIORS
    //---------------------------------------------------------
    // KROXIGOR

    List<Ability> kroxigorSpells = [
      Ability.color(
        "Brutal BLows",
        "Passive",
        "Red",
        "Effect: This unit’s melee weapons have Crit (2 Hits) if the target unit has 5 or more models.",
      ),
    ];

    Weapon drakebite = Weapon("drakebite", "Drakebite Maul");
    drakebite.attack = "4";
    drakebite.hit = "4+";
    drakebite.wound = "2+";
    drakebite.rend = "1";
    drakebite.damage = "2";

    Unit kroxigor = Unit.withSpells("Kroxigor", kroxigorSpells);
    kroxigor.weapons.add(drakebite);
    kroxigor.move = "5\"";
    kroxigor.health = "6";
    kroxigor.save = "4+";
    kroxigor.control = "2";
    kroxigor.keywords = "Infantry";

    // KROXIGOR
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, saurusWarriors, kroxigor];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability BeastOfJungle = Ability("Beast of the Dark Jungles","-","-","-","-");
    BeastOfJungle.timing = "Any Combat Phase";
    BeastOfJungle.color = "Red";
    BeastOfJungle.details =
        "Declare: Pick your general to use this ability if they are in combat."
        "\n\nEffect: Pick 1 of the following:"
        "\nGargantuan Jaws: Pick an enemy unit in combat with your general and roll a dice. If the roll exceeds"
        "that unit’s Health characteristic, 1 model in that unit is slain."
        "\nRoar: Pick an enemy unit in combat with your general. Subtract D6 from that unit’s control score this turn.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(BeastOfJungle);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability predatoryFighters = Ability("Predatory Fighters","-","-","-","-");
    predatoryFighters.timing = "Once Per Phase, End of Any Turn";
    predatoryFighters.color = "Purple";
    predatoryFighters.details =
        "Declare: Roll a dice for each enemy unit in combat with any friendly units."
        "\n\nEffect: On a 3+, inflict 1 mortal damage on the unit being rolled for.";

    Ability templeGuardians = Ability("Temple-City Guardians","-","-","-","-");
    templeGuardians.timing = "Passive";
    templeGuardians.color = "Green";
    templeGuardians.details =
        "Effect: Friendly units have Ward (6+) while they are wholly within friendly territory.";

    List<Ability> regimentAbilies = [predatoryFighters, templeGuardians];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability sotekGaze = Ability("Sotek´s Gaze","-","-","-","-");
    sotekGaze.keywords = "Enhancement";
    sotekGaze.timing = "End of Any Turn";
    sotekGaze.color = "Purple";
    sotekGaze.details =
        "Effect: Roll a dice. Add the roll to your general’s control score this turn.";

    Ability ancientStrategist = Ability("Ancient Strategist","-","-","-","-");
    ancientStrategist.keywords = "Enhancement";
    ancientStrategist.timing = "Once Per Battle, Any Movement Phase";
    ancientStrategist.color = "Grey";
    ancientStrategist.details =
        "Declare: Pick a friendly unit wholly within 12\" of your general. You cannot pick your general."
        "\n\nEffect: That unit can use the ‘Normal Move’ ability as if it were your movement phase.";

    Ability bladeRealities = Ability("Blade of Realities","-","-","-","-");
    bladeRealities.keywords = "Enhancement";
    bladeRealities.timing = "Passive";
    bladeRealities.color = "Red";
    bladeRealities.details =
        "Effect: Add 1 to the Rend characteristic of your general’s Relic Celestite Weapon.";

    Ability wrathChotec = Ability("The Wrath of Chotec","-","-","-","-");
    wrathChotec.keywords = "Enhancement";
    wrathChotec.timing = "Passive";
    wrathChotec.color = "Blue";
    wrathChotec.details =
        "Effect: The Attacks characteristic of your general’s Sunbolt Gauntlet is 6 instead of D6.";

    List<Ability> enhancements = [
      sotekGaze,
      ancientStrategist,
      bladeRealities,
      wrathChotec,
    ];

    // Enhancements
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.regimentAbilities = regimentAbilies;

    widget.settings.enhancements = enhancements;
  }

  void pickIronjawzBigmob() {
    //---------------------------------------------------------
    // General MEGABOSS

    List<Ability> generalSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Get Stuck In, Ladz!",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly unit wholly within 12\" of this unit to be the target."
            "\n\nEffect: Roll a dice. On a 2+, add 1 to the Attacks characteristic of the target’s melee weapons until the start of your next turn.",
      ),
    ];

    Weapon bossChoppa = Weapon("bossChoppa", "Boss-choppa");
    bossChoppa.attack = "8";
    bossChoppa.hit = "4+";
    bossChoppa.wound = "2+";
    bossChoppa.rend = "1";
    bossChoppa.damage = "2";

    Unit general = Unit.withSpells("Megaboss", generalSpells);
    general.id = "General";
    general.weapons.add(bossChoppa);
    general.move = "4\"";
    general.health = "8";
    general.save = "3+";
    general.control = "2";
    general.keywords = "Hero, Infantry";

    // General MEGABOSS
    //---------------------------------------------------------
    // ARDBOYZ

    List<Ability> ardboyzSpells = [
      Ability.color(
        "Shield Bash",
        "Any Combat Phase",
        "Red",
        "Declare: Pick an enemy unit within 1\" of this unit to be the target."
            "\n\nEffect: Make a shield bash roll of D6 for each model in this unit that is within 3\" of the target. "
            "For each 6, inflict 1 mortal damage on the target.",
      ),
    ];

    Weapon choppa = Weapon("choppa", "Choppa or Stikka");
    choppa.attack = "2";
    choppa.hit = "4+";
    choppa.wound = "3+";
    choppa.rend = "1";
    choppa.damage = "1";
    choppa.ability = "Anti-charge (+1 Rend)";

    Unit ardboyz = Unit.withSpells("Ardboyz", ardboyzSpells);
    ardboyz.weapons.add(choppa);
    ardboyz.move = "4\"";
    ardboyz.health = "2";
    ardboyz.save = "3+";
    ardboyz.control = "1";
    ardboyz.keywords = "Infantry";

    // ARDBOYZ
    //---------------------------------------------------------
    // BRUTE RAGERZ

    List<Ability> bruteRagerzSpells = [
      Ability.color(
        "Unleashed Rage",
        "Passive",
        "Red",
        "Effect: This unit has Strike-first if it charged in the same turn.",
      ),
    ];

    Weapon ragerWeapon = Weapon("ragerWeapon", "Rager Weapons");
    ragerWeapon.attack = "3";
    ragerWeapon.hit = "4+";
    ragerWeapon.wound = "2+";
    ragerWeapon.rend = "1";
    ragerWeapon.damage = "2";

    Unit bruteRagerz = Unit.withSpells("Brute Ragerz", bruteRagerzSpells);
    bruteRagerz.weapons.add(ragerWeapon);
    bruteRagerz.move = "4\"";
    bruteRagerz.health = "3";
    bruteRagerz.save = "5+";
    bruteRagerz.control = "1";
    bruteRagerz.keywords = "Infantry, Brute, Reinforcements";

    // BRUTE RAGERZ
    //---------------------------------------------------------
    // Brutes

    List<Ability> brutesSpells = [
      Ability.color(
        "You Messin'?",
        "Passive",
        "Purple",
        "Enemy models with a Health characteristic of 1 or 2 cannot contest objectives while they are in combat with this unit.",
      ),
    ];

    Weapon bruteWeapons = Weapon("bruteWeapons", "Brute Weapons");
    bruteWeapons.attack = "3";
    bruteWeapons.hit = "4+";
    bruteWeapons.wound = "3+";
    bruteWeapons.rend = "1";
    bruteWeapons.damage = "2";

    Unit brutes = Unit.withSpells("Brutes", brutesSpells);
    brutes.weapons.add(bruteWeapons);
    brutes.move = "4\"";
    brutes.health = "3";
    brutes.save = "3+";
    brutes.control = "1";
    brutes.keywords = "Infantry, Brute";

    // Brutes
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, ardboyz, bruteRagerz, brutes];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability ereWeGo = Ability("´Ere We Go","-","-","-","-");
    ereWeGo.timing = "Passive";
    ereWeGo.color = "Green";
    ereWeGo.details =
        "3rd Battle Round or later used by Brutes:\nEffect: Set up this unit anywhere on the battlefield more than 6\" from all enemy units.";

    Ability mightyDestroyers = Ability("Mighty Destroyers","-","-","-","-");
    mightyDestroyers.timing = "Once Per Turn (Army), Any Hero Phase";
    mightyDestroyers.color = "Yellow";
    mightyDestroyers.details =
        "Declare: Pick a friendly unit that was not set up this turn to be the target."
        "\n\nEffect: The target can move up to 3\". It can move into combat. "
        "\nIf it was in combat at the start of the move, it must end that move in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(mightyDestroyers);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability naturalDisaster = Ability("Natural Disaster","-","-","-","-");
    naturalDisaster.timing = "Passive";
    naturalDisaster.color = "Orange";
    naturalDisaster.details =
        "Effect: If you make an unmodified charge roll of 8+ for a friendly unit, "
        "\nadd 1 to the Attacks characteristic of that unit’s melee weapons for the rest of the turn.";

    Ability properRuckus = Ability("A Proper Ruckus","-","-","-","-");
    properRuckus.timing =
        "Once Per Battle, Reaction: You declared the ´Mighty Destroyers´ ability";
    properRuckus.color = "Yellow";
    properRuckus.details =
        "Effect: All friendly units on the battlefield that were not set up this turn are the targets of that ability instead.";

    List<Ability> regimentAbilies = [naturalDisaster, properRuckus];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability amberstone = Ability("Amberstone Whetstone","-","-","-","-");
    amberstone.keywords = "Enhancement";
    amberstone.timing = "Passive";
    amberstone.color = "Red";
    amberstone.details =
        "Effect: The Rend characteristic of your general’s melee weapons is 2";

    Ability skulls = Ability("Trophy Skulls","-","-","-","-");
    skulls.keywords = "Enhancement";
    skulls.timing = "Passive";
    skulls.color = "Purple";
    skulls.details = "Effect: Your general’s Control characteristic is 5.";

    Ability armourGork = Ability("Armour of Gork","-","-","-","-");
    armourGork.keywords = "Enhancement";
    armourGork.timing = "Passive";
    armourGork.color = "Green";
    armourGork.details = "Effect: Your general has Ward (6+).";

    Ability megaBossy = Ability("Mega Bossy","-","-","-","-");
    megaBossy.keywords = "Enhancement";
    megaBossy.timing = "Passive";
    megaBossy.color = "Orange";
    megaBossy.details =
        "Effect: If this unit charged this turn, for the rest of the turn, "
        "add 1 to charge rolls for friendly units while they are wholly within 12\" of this unit.";

    List<Ability> enhancements = [amberstone, skulls, armourGork, megaBossy];

    // Enhancements
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.regimentAbilities = regimentAbilies;

    widget.settings.enhancements = enhancements;
  }

  void pickSkavenGnawfeastClawpack() {
    //---------------------------------------------------------
    // General CLAWLORD ON GNAW-BEAST

    List<Ability> generalSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Cornered Rat",
        "Passive",
        "Red",
        "Effect: While this unit is damaged, add 3 to the Attacks characteristic of its Warpforged Halberd.",
      ),
    ];

    Weapon ratlingPistol = Weapon("ratlingPistol", "Ratling Pistol");
    ratlingPistol.range = "10\"";
    ratlingPistol.attack = "D6";
    ratlingPistol.hit = "3+";
    ratlingPistol.wound = "3+";
    ratlingPistol.rend = "1";
    ratlingPistol.damage = "1";
    ratlingPistol.ability = "Crit (Auto-wound), Shoot in Combat";

    Weapon warpforgedHalberd = Weapon("warpforgedHalberd", "Warpforged Halberd");
    warpforgedHalberd.attack = "5";
    warpforgedHalberd.hit = "3+";
    warpforgedHalberd.wound = "4+";
    warpforgedHalberd.rend = "1";
    warpforgedHalberd.damage = "2";

    Weapon fangs = Weapon("fangs", "Gnaw-beast’s Chisel Fangs");
    fangs.attack = "4";
    fangs.hit = "4+";
    fangs.wound = "3+";
    fangs.rend = "1";
    fangs.damage = "D3";
    fangs.ability = "Companion";

    Unit general = Unit.withSpells("Clawlord on Gnaw-Beast", generalSpells);
    general.id = "General";
    general.weapons.add(ratlingPistol);
    general.weapons.add(warpforgedHalberd);
    general.weapons.add(fangs);
    general.move = "9\"";
    general.health = "7";
    general.save = "4+";
    general.control = "2";
    general.keywords = "Hero, Cavalry, Ward (6+)";

    // General CLAWLORD ON GNAW-BEAST
    //---------------------------------------------------------
    // Grey Seer

    List<Ability> greySeerSpells = [
      Ability.color(
        "Will of the Hornet Rat",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly unit wholly within 13\" of this unit to be the target, then roll a dice."
            "\n\nEffect: On a 3+, add the roll to the target`s control score until the start of your next turn.",
      ),
      Ability.color(
        "Wither",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible enemy unit within 13\" of this unit to be the target, then make a casting roll of 2D6."
            "\n\nEffect: On a 6+, inflict D3 mortal damage on the target.",
      ),
    ];

    Weapon warpstoneStaff = Weapon("warpstoneStaff", "Warpstone Staff");
    warpstoneStaff.attack = "3";
    warpstoneStaff.hit = "4+";
    warpstoneStaff.wound = "4+";
    warpstoneStaff.rend = "1";
    warpstoneStaff.damage = "D3";

    Unit greySeer = Unit.withSpells("Grey Seer", greySeerSpells);
    greySeer.weapons.add(warpstoneStaff);
    greySeer.move = "6\"";
    greySeer.health = "5";
    greySeer.save = "6+";
    greySeer.control = "2";
    greySeer.keywords = "Hero, Wizard, Infantry";

    // Grey Seer
    //---------------------------------------------------------
    // BRUTE WARLOCK ENGINEER

    List<Ability> warlockSpells = [
      Ability.color(
        "More-More Warp Energy!",
        "Reaction: You declared a SHOOT ability for this unit and it has not used a MOVE ability this turn",
        "Blue",
        "Effect: Roll a dice. On a 2+, set the Damage characteristic of its Warplock Musket to 3 this phase. "
            "\nOn a 1, inflict D3 mortal damage on this unit.",
      ),
    ];

    Weapon warplockMusket = Weapon("warplockMusket", "Warplock Musket");
    warplockMusket.range = "24\"";
    warplockMusket.attack = "2";
    warplockMusket.hit = "3+";
    warplockMusket.wound = "3+";
    warplockMusket.rend = "2";
    warplockMusket.damage = "D3";
    warplockMusket.ability = "Crit (Auto-wound)";

    Weapon warpforgedDagger = Weapon("warpforgedDagger", "Warpforged Dagger");
    warpforgedDagger.attack = "3";
    warpforgedDagger.hit = "4+";
    warpforgedDagger.wound = "4+";
    warpforgedDagger.rend = "-";
    warpforgedDagger.damage = "2";

    Unit warlock = Unit.withSpells("Warlock Engineer", warlockSpells);
    warlock.weapons.add(warplockMusket);
    warlock.weapons.add(warpforgedDagger);
    warlock.move = "4\"";
    warlock.health = "3";
    warlock.save = "5+";
    warlock.control = "1";
    warlock.keywords = "Hero, Infantry";

    // WARLOCK ENGINEER
    //---------------------------------------------------------
    // Clanrats

    List<Ability> clanratsSpells = [
      Ability.color(
        "Seething Swarm",
        "End of Any Turn",
        "Purple",
        "Effect: You can return D3 slain models to this unit",
      ),
    ];

    Weapon rustyBlade = Weapon("rustyBlade", "Rusty Blade");
    rustyBlade.attack = "2";
    rustyBlade.hit = "4+";
    rustyBlade.wound = "5+";
    rustyBlade.rend = "-";
    rustyBlade.damage = "1";

    Unit clanrats = Unit.withSpells("Clanrats", clanratsSpells);
    clanrats.weapons.add(rustyBlade);
    clanrats.move = "6\"";
    clanrats.health = "1";
    clanrats.save = "5+";
    clanrats.control = "1";
    clanrats.keywords = "Infantry, Reinforcements";

    // Clanrats
    //---------------------------------------------------------

    //---------------------------------------------------------
    // RAT OGORS

    List<Ability> ratOgorsSpells = [
      Ability.color(
        "Unleashed Warp-Fury",
        "Any Combat Phase, Once Per Battle",
        "Red",
        "Effect: Inflict D3 mortal damage on this unit. Then, add 1 to the Attacks characteristic of its melee weapons this phase.",
      ),
    ];

    Weapon warpfireGun = Weapon("warpfireGun", "Warpfire Gun");
    warpfireGun.range = "10\"";
    warpfireGun.attack = "2D6";
    warpfireGun.hit = "2+";
    warpfireGun.wound = "4+";
    warpfireGun.rend = "2";
    warpfireGun.damage = "1";
    warpfireGun.ability = "Shoot in Combat";

    Weapon claws = Weapon("claws", "Claws, Blades and Fangs");
    claws.attack = "5";
    claws.hit = "4+";
    claws.wound = "3+";
    claws.rend = "1";
    claws.damage = "2";

    Unit ratOgors = Unit.withSpells("ratOgors", ratOgorsSpells);
    ratOgors.weapons.add(claws);
    ratOgors.move = "6\"";
    ratOgors.health = "1";
    ratOgors.save = "5+";
    ratOgors.control = "1";
    ratOgors.keywords = "Infantry";

    // RAT OGORS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, greySeer, warlock, clanrats, ratOgors];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability vermintide = Ability("The Lurking Vermintide","-","-","-","-");
    vermintide.timing = "Once Per Battle, Deployment Phase";
    vermintide.color = "Black";
    vermintide.details =
    "Declare: Pick a friendly unit that has not been deployed to be the target."
        "\n\nEffect: The target unit is set up in reserve in the tunnels below. "
        "Units in the tunnels below that have not used the ‘Gnawhole Ambush’ ability "
        "by the end of the third battle round are destroyed.";

    Ability ambush = Ability("Gnawhole Ambush","-","-","-","-");
    ambush.timing = "Your Movement Phase";
    ambush.color = "Grey";
    ambush.details =
    "Declare: Pick a friendly unit that is in the tunnels below to use this ability."
        "\n\nEffect: Set up that unit wholly within 6\" of a corner of the battlefield and more than 9\" from all enemy units.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(vermintide);
    battleTraits.abilitys.add(ambush);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability bullets = Ability("Warpstone-Laced Bullets","-","-","-","-");
    bullets.timing = "Once Per Battle, Your Shooting Phase";
    bullets.color = "Blue";
    bullets.details =
    "Declare: Pick a ranged weapon a friendly unit is armed with."
        "\n\nEffect: That weapon has Crit (Mortal) this phase.";

    Ability tooquick = Ability("Too Quick Too Hit-Hit","-","-","-","-");
    tooquick.timing = "Passive";
    tooquick.color = "Grey";
    tooquick.details =
    "Effect: No mortal damage is inflicted on friendly units when they use Retreat abilities.";

    List<Ability> regimentAbilies = [bullets, tooquick];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability horde = Ability("Lead The Seething Horde","-","-","-","-");
    horde.keywords = "Enhancement";
    horde.timing = "Reaction. You declared the ´Call for Reinforcments´ ability";
    horde.color = "Red";
    horde.details =
    "Effect: Instead of using the set-up instructions in the ‘Call for Reinforcements’ ability, "
        "the replacement unit can be set up wholly within 13\" of this unit and not in combat.";

    Ability connections = Ability("Skyre Connections","-","-","-","-");
    connections.keywords = "Enhancement";
    connections.timing = "Passive";
    connections.color = "Blue";
    connections.details = "Effect: Your general’s Ratling Pistol has an Attacks characteristic of 2D6 instead of D6.";

    Ability charm = Ability("Warpstone Charm","-","-","-","-");
    charm.keywords = "Enhancement";
    charm.timing = "Passive";
    charm.color = "Red";
    charm.details = "Effect: Subtract 1 from save rolls for enemy units in combat with your general.";

    Ability stitched = Ability("Cloak of Stitched Victories","-","-","-","-");
    stitched.keywords = "Enhancement";
    stitched.timing = "Passive";
    stitched.color = "Green";
    stitched.details =
    "Effect: Your general has Ward (5+)";

    List<Ability> enhancements = [horde, connections, charm, stitched];

    // Enhancements
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.regimentAbilities = regimentAbilies;

    widget.settings.enhancements = enhancements;
  }

  void pickSkavenCrixxitKillPack() {
    //---------------------------------------------------------
    // General DEATHMASTER

    List<Ability> generalSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Shadowy Killers",
        "Passive",
        "Green",
        "Effect: If the unmodified hit roll for an attack that targets this unit is 1-4,"
            "the attack fails and the attack sequence ends.",
      ),
    ];

    Weapon weepingBlade = Weapon("weepingBlade", "Weeping Blade");
    weepingBlade.attack = "5";
    weepingBlade.hit = "3+";
    weepingBlade.wound = "4+";
    weepingBlade.rend = "1";
    weepingBlade.damage = "D3";

    Unit general = Unit.withSpells("Deathmaster", generalSpells);
    general.id = "General";
    general.weapons.add(weepingBlade);
    general.move = "7\"";
    general.health = "5";
    general.save = "5+";
    general.control = "2";
    general.keywords = "Hero, Infantry, Ward (6+)";

    // General DEATHMASTER
    //---------------------------------------------------------
    // DEATHMASTER  CRIXXIT

    List<Ability> deathmasterCrixxitSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Go-Go, Hunt Them Down",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible friendly Gutter Runners unit wholly within 12\" of this unit to be the target, then roll a dice."
            "\n\nEffect: On a 3+, add 1 to charge rolls for the rest of the turn.",
      ),
    ];

    Weapon cuts = Weapon("cuts", "The Blades of Thirteen Cuts");
    cuts.attack = "13";
    cuts.hit = "2+";
    cuts.wound = "4+";
    cuts.rend = "1";
    cuts.damage = "1";

    Unit deathmasterCrixxit = Unit.withSpells("Deathmaster Crixxit", deathmasterCrixxitSpells);
    deathmasterCrixxit.weapons.add(cuts);
    deathmasterCrixxit.move = "7\"";
    deathmasterCrixxit.health = "6";
    deathmasterCrixxit.save = "5+";
    deathmasterCrixxit.control = "2";
    deathmasterCrixxit.keywords = "Hero, Infantry, Ward (5+)";

    // DEATHMASTER  CRIXXIT
    //---------------------------------------------------------
    // GUTTER RUNNERS

    List<Ability> gutterSpells = [
      Ability.color(
        "Bomb Rats",
        "Once Per Turn (Army), Your Charge Phase",
        "Orange",
        "Declare: You can only use this ability if this unit has a Bomb Rat token."
            "\nPick an enemy unit within 9\" of this unit to be the target. Then, roll a dice."
            "\n\nEffect: On a 3+, inflict 1 mortal damage on the target. On a 1-2, remove this units Bomb Rat token from the battlefield.",
      ),
    ];

    Weapon eshin = Weapon("eshin", "Eshin Specialist Blades");
    eshin.attack = "3";
    eshin.hit = "3+";
    eshin.wound = "4+";
    eshin.rend = "1";
    eshin.damage = "1";
    eshin.ability = "Crit (Mortal)";

    Unit gutter = Unit.withSpells("Gutter Runners", gutterSpells);
    gutter.weapons.add(eshin);
    gutter.move = "7\"";
    gutter.health = "1";
    gutter.save = "6+";
    gutter.control = "1";
    gutter.keywords = "Infantry, Reinforcements, Ward (6+)";

    // GUTTER RUNNERS
    //---------------------------------------------------------
    // NIGHT RUNNERS

    List<Ability> nightRunnerSpells = [
      Ability.color(
        "Smoke Bombs",
        "Once Per Turn (Army), Any Combat Phase",
        "Red",
        "Effect: On a 4+, this unit can immediately use the ´Retreat´ ability as if it were your movement phase.",
      ),
    ];

    Weapon slings = Weapon("slings", "Slings and Poisoned Stars");
    slings.range = "10\"";
    slings.attack = "2";
    slings.hit = "4+";
    slings.wound = "4+";
    slings.rend = "-";
    slings.damage = "1";
    slings.ability = "Crit (Auto-wound), Shoot in Combat";

    Weapon blades = Weapon("slings", "Poisoned Blades");
    blades.attack = "2";
    blades.hit = "4+";
    blades.wound = "5+";
    blades.damage = "1";
    blades.ability = "Crit (Mortal)";

    Unit nightRunner = Unit.withSpells("Night Runners", nightRunnerSpells);
    nightRunner.weapons.add(slings);
    nightRunner.weapons.add(blades);
    nightRunner.move = "7\"";
    nightRunner.health = "1";
    nightRunner.save = "6+";
    nightRunner.control = "1";
    nightRunner.keywords = "Infantry, Reinforcements, Ward (6+)";

    // NIGHT RUNNERS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, deathmasterCrixxit, gutter, nightRunner];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability shadow = Ability("Cloaked in Shadow","-","-","-","-");
    shadow.timing = "Once Per Turn (Army), Combat Phase";
    shadow.color = "Red";
    shadow.details =
    "Declare: Pick a friendly HERO unit to use this ability. Then, pick a different friendly unit that has 2 or more models to be the target."
        "\n\nEffect: Make a shadow-travel roll of D6. On a 3+, remove the HERO using this ability from the battlefield "
        "and set them up again wholly within 6\" of the target. They can be set up in combat with any enemy units that are already in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(shadow);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability shade = Ability("Way of the Skittering Shade","-","-","-","-");
    shade.timing = "Once Per Battle, Your Movement Phase";
    shade.color = "Grey";
    shade.details =
    "Declare: Pick a friendly unit that is wholly within 6\" of a battlefield edge to be the target."
        "\n\nEffect: Remove the target from the battlefield and set it up again wholly within 3\" of a battlefield edge"
        "and more than 6\" from all enemy units.";

    Ability clawWay = Ability("Way of the Fiendish Claw","-","-","-","-");
    clawWay.timing = "Once Per Battle (Army), Any Combat Phase";
    clawWay.color = "Red";
    clawWay.details =
    "Declare: Pick a friendly HERO to be the target"
        "\n\nEffect: The target has STRIKE-FIRST for the rest of the turn.";

    List<Ability> regimentAbilies = [shade, clawWay];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability acrobatic = Ability("Murderous Acrobatics","-","-","-","-");
    acrobatic.keywords = "Enhancement";
    acrobatic.timing = "Passive";
    acrobatic.color = "Orange";
    acrobatic.details =
    "Effect: When your general uses the ´Charge´ ability, they can pass through enemy models.";

    Ability masterShadows = Ability("Master of Shadows","-","-","-","-");
    masterShadows.keywords = "Enhancement";
    masterShadows.timing = "Passive";
    masterShadows.color = "Red";
    masterShadows.details = "Effect: When your general uses the ´Cloaked in Shadow´ ability, add 1 to the shadow-travel roll.";

    Ability anotherShadow = Ability("Just Another Shadow","-","-","-","-");
    anotherShadow.keywords = "Enhancement";
    anotherShadow.timing = "Passive";
    anotherShadow.color = "Green";
    anotherShadow.details = "Effect: While your general is wholly within the combat range of a friendly unit that has 3 or more models,"
        "your general has WARD (4+).";

    Ability screech = Ability("Death Screech","-","-","-","-");
    screech.keywords = "Enhancement";
    screech.timing = "Passive";
    screech.color = "Red";
    screech.details = "Declare: Pick an enemy unit within 6\" of your general to be the target."
        "\n\nEffect: Roll a dice. On a 3+, for the rest of the turn, subtract 1 from hit rolls for the target´s attacks.";

    List<Ability> enhancements = [acrobatic, masterShadows, anotherShadow, screech];

    // Enhancements
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.regimentAbilities = regimentAbilies;

    widget.settings.enhancements = enhancements;
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
            /*TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
                //_navigateToMenu(context, settings);
              },
            ),*/
          ],
        );
      },
    );
  }
}
