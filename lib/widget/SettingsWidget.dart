import 'package:aos_battle_helper/spearhead/fusilPlatoon.dart';
import 'package:aos_battle_helper/spearhead/sentinelsOfEmbergard.dart';
import 'package:aos_battle_helper/spearhead/zenestrasZealots.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../ageOfSigmar/aosGeneralSpells.dart';
import '../ageOfSigmar/ironjawzHardcoded.dart';
import '../ageOfSigmar/seraphonHardcoded.dart';
import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/spellLore.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import '../spearhead/bitterbarkCopse.dart';
import '../spearhead/crixxitKillPack.dart';
import '../spearhead/spearheadGeneralSpells.dart';
import '../spearhead/gnawfeastClawpack.dart';
import '../spearhead/irojawzBigMob.dart';
import '../spearhead/spitewingFlight.dart';
import '../spearhead/starscaleWarhost.dart';
import '../spearhead/warpsparkClawpack.dart';
import '../spearhead/fusilPlatoon.dart';
import '../spearhead/sentinelsOfEmbergard.dart';
import '../spearhead/zenestrasZealots.dart';
import '../spearhead/casteliteCompany.dart';
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
                        foregroundColor: calculateTextColor(Colors.red.shade500),
                        backgroundColor: Colors.red.shade500,
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
                        foregroundColor: calculateTextColor(Colors.red.shade500),
                        backgroundColor: Colors.red.shade500,
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
                  ],
                ),

                Spacer(),

                Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: calculateTextColor(Colors.red.shade500),
                          backgroundColor: Colors.red.shade500,
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
                          'Cities of Sigmar \nSentinels Of Embergard',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          pickSentinelsOfEmbergard();
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
                          'Cities of Sigmar \nZenestra´s Zealots',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          pickZenestrasZealots();
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
                          'Cities of Sigmar \nFusil-Platoon',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          pickFusilPlatoon();
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
                          'Cities of Sigmar \nCastelite Company',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          pickCasteliteCompany();
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
                          'Sylvaneth\nBitterbark Copse',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          pickBitterbarkCopse();
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
                          'Sylvaneth\nSpitewing Flight',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          pickSpitewingFlight();
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
   widget.settings = aosGeneralSpells().addCommandSpells(widget.settings);
  }

  void addNormalSpells() {
    widget.settings = aosGeneralSpells().addNormalSpells(widget.settings);
  }

  void addSpearheadSpells() {
    widget.settings = SpearheadGeneralSpells().addSpearheadSpells(widget.settings);
  }

  void pickIronjawzHardcoded() {
    widget.settings = IronjawzHardcoded().pickIronjawzHardcoded(widget.settings);
  }

  //TODO Seraphon Path to Glory Liste hinzufügen über Button Hinzufügen
  void pickSeraphonHardcoded() {
    widget.settings = SeraphonHardcoded().pickSeraphonHardcoded(widget.settings);
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

  void pickSentinelsOfEmbergard() {
    widget.settings = SentinelsOfEmbergard().pickSentinelsOfEmbergard(widget.settings);
  }

  void pickZenestrasZealots() {
    widget.settings = Zenestraszealots().pickZenestraszealots(widget.settings);
  }

  void pickFusilPlatoon() {
    widget.settings = FusilPlatoon().pickFusilPlatoon(widget.settings);
  }

  void pickCasteliteCompany() {
    widget.settings = CasteliteCompany().pickCasteliteCompany(widget.settings);
  }

  void pickBitterbarkCopse() {
    widget.settings = BitterbarkCopse().pickBitterbarkCopse(widget.settings);
  }

  void pickSpitewingFlight() {
    widget.settings = SpitewingFlight().pickSpitewingFlight(widget.settings);
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
