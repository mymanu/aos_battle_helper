import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'BattleTactics.dart';
import 'HomePage.dart';
import 'StartofBattle.dart';

class ScoringPath extends StatefulWidget {
  ScoringPath({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  Color phaseColor = Colors.teal;

  @override
  _Scoring createState() => _Scoring();
}

class _Scoring extends State<ScoringPath> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    int finalScorePlayer1 = 0;
    int finalScorePlayer2 = 0;

    Functions functions = Functions();

    for (int score in widget.settings.scoresPlayer1) {
      finalScorePlayer1 = finalScorePlayer1 + score;
    }
    for (int score in widget.settings.scoresPlayer2) {
      finalScorePlayer2 = finalScorePlayer2 + score;
    }

    //List<String> battleTacticStringList = ["You play Spearhead or forgot something","Battle Tactics","are", "pretty", "cool", "!"];
    List<String> battleTacticStringList = [];

    for (String battleTacticName in widget.settings.chosenBattleTactics) {
      switch (battleTacticName) {
        case "masterThePaths":
          battleTacticStringList.addAll(BattleTactics().masterThePaths);
          break;
        case "restlessEnergy":
          battleTacticStringList.addAll(BattleTactics().restlessEnergy);
          break;
        case "interceptAndRecover":
          battleTacticStringList.addAll(BattleTactics().interceptAndRecover);
          break;
        case "wrathfulCycles":
          battleTacticStringList.addAll(BattleTactics().wrathfulCycles);
          break;
        case "scoutingForce":
          battleTacticStringList.addAll(BattleTactics().scoutingForce);
          break;
        case "attunedToGhyran":
          battleTacticStringList.addAll(BattleTactics().attunedToGhyran);
          break;
        //Ab Hier Path Tactics
        case "ironjawTactics":
          battleTacticStringList.addAll(BattleTactics().attunedToGhyran);
          break;
      }
    }

    //TODO ab Hier wird das UI gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: calculateTextColor(widget.phaseColor)),
        ),
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
            child: Text("Start of Battle Round"),
          ),
          SizedBox(width: 50),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Warhammer - Age of Sigmar - Path to Glory"),
            SizedBox(height: 20,),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              border: TableBorder.all(color: Colors.teal, width: 2),
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40,10,20,10),
                      child: Text(widget.settings.playerName),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(40,10,20,10), child: Text("vs")),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40,10,20,10),
                      child: widget.settings.playerName.contains("Edi")
                          ? Text("Victim")
                          : Text("Enemy"),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[0] =
                                  widget.settings.scoresPlayer1[0] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer1[0].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[0] =
                                  widget.settings.scoresPlayer1[0] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                    Padding(padding: EdgeInsets.fromLTRB(20,20,20,10), child: Text("Round 1"),),
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[0] =
                                  widget.settings.scoresPlayer2[0] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer2[0].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[0] =
                                  widget.settings.scoresPlayer2[0] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[1] =
                                  widget.settings.scoresPlayer1[1] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer1[1].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[1] =
                                  widget.settings.scoresPlayer1[1] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
    Padding(padding: EdgeInsets.fromLTRB(20,20,20,10), child: Text("Round 2"),),
    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[1] =
                                  widget.settings.scoresPlayer2[1] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer2[1].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[1] =
                                  widget.settings.scoresPlayer2[1] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child:
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[2] =
                                  widget.settings.scoresPlayer1[2] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer1[2].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[2] =
                                  widget.settings.scoresPlayer1[2] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                    Padding(padding: EdgeInsets.fromLTRB(20,20,20,10), child: Text("Round 3"),),
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[2] =
                                  widget.settings.scoresPlayer2[2] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer2[2].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[2] =
                                  widget.settings.scoresPlayer2[2] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child:
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[3] =
                                  widget.settings.scoresPlayer1[3] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer1[3].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[3] =
                                  widget.settings.scoresPlayer1[3] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                    Padding(padding: EdgeInsets.fromLTRB(20,20,20,10), child: Text("Round 4"),),
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[3] =
                                  widget.settings.scoresPlayer2[3] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer2[3].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[3] =
                                  widget.settings.scoresPlayer2[3] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[4] =
                                  widget.settings.scoresPlayer1[4] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer1[4].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer1[4] =
                                  widget.settings.scoresPlayer1[4] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                    Padding(padding: EdgeInsets.fromLTRB(20,20,20,10), child: Text("Round 5"),),
                    Padding(padding: EdgeInsets.fromLTRB(20,10,20,10), child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[4] =
                                  widget.settings.scoresPlayer2[4] + 1;
                            });
                          },
                        ),
                        Text(widget.settings.scoresPlayer2[4].toString()),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: calculateTextColor(widget.phaseColor),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.settings.scoresPlayer2[4] =
                                  widget.settings.scoresPlayer2[4] - 1;
                            });
                          },
                        ),
                      ],
                    ),),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(60,10,20,10), child: Text(finalScorePlayer1.toString()),),
                    Padding(padding: EdgeInsets.fromLTRB(28,10,20,10), child: Text("Score"),),
                    Padding(padding: EdgeInsets.fromLTRB(60,10,20,10), child: Text(finalScorePlayer2.toString()),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            Text("Regeln für Siegpunkte Runde 3:"),
          functions.parseText(context,
                "**Normaler Knoten** kontrolliert: +2 SP pro Ziel.\n"
                "**Aktivierter Knoten** kontrolliert: +3 SP.\n\n\n\n\n\n"
                "Zusätzlich kann jeder Spieler einen von 4 Schicksalspfaden beschreiten um weitere Siegespunkte zu erspielen.\n\n"

                    "Pfad 1: „Meisterschaft der Zeitströme“ (Fokus: Kontroll- & Feldspiel)\n"
      "Für Generäle, die das Nadelöhr mathematisch besetzen und die Zitadelle dominieren wollen.\n\n"

      "Den Schicht-Knoten bündeln:\n"
      "Kontrolliere in einer beliebigen Schlachtrunde mindestens 2 Schicht-Knoten gleichzeitig am Ende deines Zugs. (+4 SP)\n\n"

      "Den Impuls erzwingen:\n"
      "Besetze in einer Runde den vom Underdog Aktivierten Knoten mit einer befreundeten Einheit, während sich mindestens eine feindliche Einheit in 6 Zoll Reichweite befindet. (+4 SP)\n\n"

      "Kausale Übernahme:\n"
      "Übernimm am Ende deines Zugs einen Schicht-Knoten, der zu Beginn deines Zugs dem Gegner gehörte. (+4 SP)\n\n"

      "**\n\n"

      "Pfad 2: „Kausale Zerschlagung“ (Fokus: Aggression & Entfaltung)\n"
      "Für Generäle, die die Zeit-Energie nutzen, um den Feind mit roher Gewalt zu zerschmettern.\n\n"

      "Schock im Zeitsturm:\n"
      "Füge einer feindlichen Einheit Schaden zu, die sich auf oder an (innerhalb 3 Zoll) einem Schicht-Knoten befindet. (+4 SP)\n\n"

      "Artefakt-Exekution:\n"
      "Vernichte eine gegnerische Einheit ODER den gegnerischen General in dem Zug, in dem du dein Stufe-2-Artefakt einsetzt. (+4 SP)\n\n"

      "Brechung der Anker:\n"
      "Vernichte im Laufe des Spiels insgesamt 2 gegnerische Einheiten im Umkreis von 6 Zoll um den zentralen Schicht-Knoten (Knoten 2). (+4 SP)\n\n"

      "**\n\n"

      "Pfad 3: „Chronos-Infiltration“ (Fokus: Mobilität & Raumgewinn)\n"
      "Für Generäle, die die verschobenen Zeitschichten nutzen, um den Feind zu umgehen.\n\n"

      "Flanken-Fluss:\n"
      "Beende deinen Spielzug mit mindestens zwei Einheiten vollständig in der gegnerischen Spielfeldhälfte. (+4 SP)\n\n"

      "Tiefen-Verankerung:\n"
      "Kontrolliere den Schicht-Knoten, der der gegnerischen Aufstellungszone am nächsten liegt, am Ende eines deiner Spielzüge. (+4 SP)\n\n"

      "Riss-Durchbruch:\n"
      "Bringe vor dem Ende von Schlachtrunde 4 deinen General oder ein MONSTER vollständig in die gegnerische Aufstellungszone. (+4 SP)\n\n"

      "**\n\n"

      "Pfad 4: „Präzise Rekalibrierung“ (Fokus: Taktische Zähigkeit & Konter)\n"
      "Für Generäle, die den feindlichen Ansturm aussitzen und im richtigen Moment zurückschlagen.\n\n"

      "Dem Zeitsturm trotzen:\n"
      "Eine deiner Einheiten erleidet auf einem Schicht-Knoten Schaden durch feindliche Attacken, hält das Ziel am Ende der Runde aber immer noch. (+4 SP)\n\n"

      "Paradoxer Gegenschlag:\n"
      "Setze eine Paradox-Aktion ein und vernichte in derselben Runde die gegnerische Einheit, die zuvor Schaden angerichtet hat. (+4 SP)\n\n"

      "Nadelöhr-Zentrum:\n"
          "Beende die 4. oder 5. Schlachtrunde mit der absoluten Kontrolle über den zentralen Schicht-Knoten (Knoten 2). (+4 SP)"

          "**"
            ),

            SizedBox(height: 50),

            Text("Regeln für Siegpunkte Runde 2:"),
            Text(
              "\n• Jedes kontrollierte Missionsziel: je 1 SP"
                  "\n• Taktik erfüllen: 4 SP",
            ),

            SizedBox(height: 50),

            Text("Regeln für Siegpunkte Runde 1:"),
            Text(
              "\n• 1 Missionsziel kontrollieren: 2 SP"
              "\n• 2 Missionsziele kontrollieren: 3 SP"
              "\n• 3 Missionsziele kontrollieren: 4 SP"
              "\n• Taktik erfüllen: 4 SP",
            ),

            SizedBox(height: 40),

            /*Card(
              child: ListTile(
                leading: Icon(Icons.looks_one_outlined),
                title: Text(widget.settings.chosenBattleTactics.first),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 2,
                          child: CupertinoCheckbox(
                            checkColor: CupertinoColors.white,
                            activeColor: Colors.teal,
                            // Set tristate to true to make the checkbox display a null value
                            // in addition to the default true and false values.
                            tristate: false,
                            value: widget.settings.firstBattleTacticAffray,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.settings.firstBattleTacticAffray = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(battleTacticStringList[0]),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Transform.scale(
                          scale: 2,
                          child: CupertinoCheckbox(
                            checkColor: CupertinoColors.white,
                            activeColor: Colors.teal,
                            // Set tristate to true to make the checkbox display a null value
                            // in addition to the default true and false values.
                            tristate: false,
                            value: widget.settings.firstBattleTacticStrike,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.settings.firstBattleTacticStrike = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(battleTacticStringList[1]),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Transform.scale(
                          scale: 2,
                          child: CupertinoCheckbox(
                            checkColor: CupertinoColors.white,
                            activeColor: Colors.teal,
                            // Set tristate to true to make the checkbox display a null value
                            // in addition to the default true and false values.
                            tristate: false,
                            value: widget.settings.firstBattleTacticDomination,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.settings.firstBattleTacticDomination =
                                    value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(battleTacticStringList[2]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          */
            SizedBox(height: 10),
            /*Card(
              child: ListTile(
                leading: Icon(Icons.looks_two_outlined),
                title: Text(widget.settings.chosenBattleTactics.last),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 2,
                          child: CupertinoCheckbox(
                            checkColor: CupertinoColors.white,
                            activeColor: Colors.teal,
                            // Set tristate to true to make the checkbox display a null value
                            // in addition to the default true and false values.
                            tristate: false,
                            value: widget.settings.secondBattleTacticAffray,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.settings.secondBattleTacticAffray =
                                    value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(battleTacticStringList[3]),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Transform.scale(
                          scale: 2,
                          child: CupertinoCheckbox(
                            checkColor: CupertinoColors.white,
                            activeColor: Colors.teal,
                            // Set tristate to true to make the checkbox display a null value
                            // in addition to the default true and false values.
                            tristate: false,
                            value: widget.settings.secondBattleTacticStrike,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.settings.secondBattleTacticStrike =
                                    value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(battleTacticStringList[4]),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Transform.scale(
                          scale: 2,
                          child: CupertinoCheckbox(
                            checkColor: CupertinoColors.white,
                            activeColor: Colors.teal,
                            // Set tristate to true to make the checkbox display a null value
                            // in addition to the default true and false values.
                            tristate: false,
                            value: widget.settings.secondBattleTacticDomination,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.settings.secondBattleTacticDomination =
                                    value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(battleTacticStringList[5]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            */
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

  void _navigateToStartofBattle(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            StartofBattle(title: "Start of Battle", settings: settings),
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
}
