import 'dart:io';

import 'package:aos_battle_helper/spearhead/fusilPlatoon.dart';
import 'package:aos_battle_helper/spearhead/sentinelsOfEmbergard.dart';
import 'package:aos_battle_helper/spearhead/zenestrasZealots.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../ageOfSigmar/aosGeneralSpells.dart';
import '../ageOfSigmar/ironjawzHardcoded.dart';
import '../ageOfSigmar/pathToGlory.dart';
import '../ageOfSigmar/seraphonHardcoded.dart';
import '../classes/BattlePlan.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';

import 'HomePage.dart';

class SettingsWidgetPath extends StatefulWidget {
  SettingsWidgetPath({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  bool firstRun = true;

  bool? ironjawTactics = false;
  bool? seraphonTactics = false;
  bool? skavenTactics = false;
  bool? sylvanethTactics = false;
  bool? stormcastTactics = false;
  bool? citiesTactics = false;
  bool? nighthauntTactics = false;
  bool? nurgleTactics = false;

  @override
  _SettingsWidgetPath createState() => _SettingsWidgetPath();
}

class _SettingsWidgetPath extends State<SettingsWidgetPath> {

  Functions functions = Functions();

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        print("File name: $_fileName");
      }

      //TODO hier wir die Funktion zum JSON decoden gestartet
      widget.settings = await functions.readArmyOfJSON(fileToDisplay, widget.settings);
      setState(() {
        isLoading = false;
      });
    } catch (exception) {
      print(exception);
    }
  }


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
      body: SingleChildScrollView(
        child:
      Center(
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

            Text(
              "Bitte auf NewRecruit.eu eine Armee erstellen\nBei FORCE: bitte Path to Glory: Ravaged Coast auswählen.\n\n"
                  "Diese Liste dann über den Import JSON Button importieren.\n\n"
                  "Danach bitte prüfen, ob alles richtig angezeigt wird in den jeweiligen Phasen.\n"
                  "Manuel kann nicht alles perfekt testen.",
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : TextButton(
              onPressed: () {
                pickFile();
              },
              child: Text("Import JSON"),
            ),
            if (pickedFile != null)
              Text("Armee erfolgreich importiert"),

            SizedBox(height: 50),
            Text(
              "Hinweis: Bitte nicht vergessen die AoS Standard Fähigkeiten wie Move, BattlePlan Fähigkeit und ggf Taktiken hinzuzufügen.",
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
                        foregroundColor: calculateTextColor(
                          Colors.red.shade500,
                        ),
                        backgroundColor: Colors.red.shade500,
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(250, 100),
                        maximumSize: Size(510, 510),
                      ),
                      child: Text(
                        'add Preparation, Command\n'
                        'and Core Spells',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addCommandSpells();
                        addNormalSpells();
                        addAoSPreparationSpells();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("Preparation, Core and Command Spells successfully added"));
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
                        'Add Path BattlePlan Round 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addBattlePlanSpells();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("Battle-Plan Abilities successfully added"));
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
                        'Add Path BattlePlan Round 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addBattlePlanSpellsPTGRound2();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("Battle-Plan Abilities successfully added"));
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
                        'Clear Settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.settings = Settings();
                        });
                        _navigateToMenu(context, widget.settings);
                      },
                    ),
                  ],
                ),

                /*
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
                                value: widget.ironjawTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.ironjawTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            //Ggf für Handy Nutzer auskommentieren für Surface 30 benötigt
                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.seraphonTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.seraphonTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.skavenTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.skavenTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.citiesTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.citiesTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.sylvanethTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.sylvanethTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.stormcastTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.stormcastTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.nighthauntTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.nighthauntTactics = value;
                                    //directoriesFill();
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 30),

                            Transform.scale(
                              scale: 2,
                              child: CupertinoCheckbox(
                                checkColor: CupertinoColors.white,
                                activeColor: Colors.teal,
                                // Set tristate to true to make the checkbox display a null value
                                // in addition to the default true and false values.
                                tristate: false,
                                value: widget.nurgleTactics,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.nurgleTactics = value;
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
                              child: Text("Ironjawz"),
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
                              child: Text("Seraphon"),
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
                              child: Text("Skaven"),
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
                              child: Text("Cities of Sigmar"),
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
                              child: Text("Sylvaneth"),
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
                              child: Text("Stormcast Eternals"),
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

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Nighthaunt"),
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

                            SizedBox(height: 12),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                backgroundColor: Colors.blueGrey.shade800,
                                shadowColor: Colors.black,
                              ),
                              child: Text("Maggotkin of Nurgle"),
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
                            'Your Battle Tactics chosen',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            widget.settings.chosenBattleTactics.clear();
                            if (widget.ironjawTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "ironjawTactics",
                              );
                            }
                            if (widget.seraphonTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "seraphonTactics",
                              );
                            }
                            if (widget.skavenTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "skavenTactics",
                              );
                            }
                            if (widget.sylvanethTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "sylvanethTactics",
                              );
                            }
                            if (widget.stormcastTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "stormcastTactics",
                              );
                            }
                            if (widget.citiesTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "citiesTactics",
                              );
                            }
                            if (widget.citiesTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "nighthauntTactics",
                              );
                            }
                            if (widget.citiesTactics!) {
                              widget.settings.chosenBattleTactics.add(
                                "nurgleTactics",
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
*/
                Spacer(),

                Column(
                  children: [
                    Text("Loot from 1st Round:"),

                    SizedBox(height: 10),

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
                        'Ork Loot Round 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addOrrukLootPTGRound1();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("WAAAAGH! Ironjawz Loot successfully added"));
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
                        'Seraphon Loot Round 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addSeraphonLootPTGRound1();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("ROOAARR! Seraphon Loot successfully added"));
                      },
                    ),
                  ],
                ),

                Spacer(),

                Column(
                  children: [
                    Text("Hard Coded Armies:"),

                    SizedBox(height: 10),

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
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("WAAAAGH! Ironjawz Hardcoded successfully added"));
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
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("ROOAARR! Seraphon Hardcoded successfully added"));
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
                        'Skink Floyd hinzufügen',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addSkinkFloydHardcoded();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("Skink Floyd successfully added"));
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
                        'Asterism in Deployment',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        addAsterismDeploy();
                        ScaffoldMessenger.of(context).showSnackBar(functions.showSnackBar("Asterism for Deploy Screen successfully added"));
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

  void addAoSPreparationSpells() {
    widget.settings = aosGeneralSpells().aosPreparationSpells(widget.settings);
  }

  void pickIronjawzHardcoded() {
    widget.settings = IronjawzHardcoded().pickIronjawzHardcoded(
      widget.settings,
    );
  }

  //TODO Seraphon Path to Glory Liste hinzufügen über Button Hinzufügen
  void pickSeraphonHardcoded() {
    widget.settings = SeraphonHardcoded().pickSeraphonHardcoded(widget.settings);
  }

  void addSkinkFloydHardcoded() {
    widget.settings = SeraphonHardcoded().addSkinkFloydHardcoded(widget.settings);
  }

  void addAsterismDeploy() {
    widget.settings = SeraphonHardcoded().addAsterismDeploy(widget.settings);
  }

  void addBattlePlanSpells() {
    widget.settings = BattlePlan().rissInAethelgard(widget.settings);
  }

  void addBattlePlanSpellsPTGRound2() {
    widget.settings = BattlePlan().diePfadeSichern(widget.settings);
  }

  void addOrrukLootPTGRound1() {
    widget.settings = PathToGlory().addOrrukLoot(widget.settings);
  }

  void addSeraphonLootPTGRound1() {
    widget.settings = PathToGlory().addSeraphonLoot(widget.settings);
  }

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }

}
