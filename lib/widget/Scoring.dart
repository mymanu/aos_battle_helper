import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';
import 'StartofBattle.dart';

class Scoring extends StatefulWidget {
  Scoring({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  Color phaseColor = Colors.teal;

  @override
  _Scoring createState() => _Scoring();
}

class _Scoring extends State<Scoring> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    int finalScorePlayer1 = 0;
    int finalScorePlayer2 = 0;

    for (int score in widget.settings.scoresPlayer1) {
      finalScorePlayer1 = finalScorePlayer1 + score;
    }
    for (int score in widget.settings.scoresPlayer2) {
      finalScorePlayer2 = finalScorePlayer2 + score;
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
        child: Table(
          children: [
            TableRow(
              children: [
                Text(widget.settings.playerName),
                Text("vs"),
                widget.settings.playerName.contains("Edi")
                    ? Text("Victim")
                    : Text("Enemy"),
              ],
            ),
            TableRow(
              children: [
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer1[0] =
                                widget.settings.scoresPlayer1[0] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer1[0].toString(),
                      ),
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
                    ]
                ),
                Text("Round 1"),
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer2[0] =
                                widget.settings.scoresPlayer2[0] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer2[0].toString(),
                      ),
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
                    ]
                ),
              ],
            ),
            TableRow(
              children: [
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer1[1] =
                                widget.settings.scoresPlayer1[1] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer1[1].toString(),
                      ),
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
                    ]
                ),
                Text("Round 2"),
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer2[1] =
                                widget.settings.scoresPlayer2[1] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer2[1].toString(),
                      ),
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
                    ]
                ),
              ],
            ),
            TableRow(
              children: [
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer1[2] =
                                widget.settings.scoresPlayer1[2] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer1[2].toString(),
                      ),
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
                    ]
                ),
                Text("Round 3"),
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer2[2] =
                                widget.settings.scoresPlayer2[2] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer2[2].toString(),
                      ),
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
                    ]
                ),
              ],
            ),
            TableRow(
              children: [
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer1[3] =
                                widget.settings.scoresPlayer1[3] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer1[3].toString(),
                      ),
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
                    ]
                ),
                Text("Round 4"),
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer2[3] =
                                widget.settings.scoresPlayer2[3] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer2[3].toString(),
                      ),
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
                    ]
                ),
              ],
            ),
            TableRow(
              children: [
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer1[4] =
                                widget.settings.scoresPlayer1[4] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer1[4].toString(),
                      ),
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
                    ]
                ),
                Text("Round 5"),
                Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
                        onPressed: () {
                          setState(() {
                            widget.settings.scoresPlayer2[4] =
                                widget.settings.scoresPlayer2[4] + 1;
                          });
                        },
                      ),
                      Text(
                        widget.settings.scoresPlayer2[4].toString(),
                      ),
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
                    ]
                ),
              ],
            ),
            TableRow(
              children: [
                Text(finalScorePlayer1.toString()),
                Text("Score"),
                Text(finalScorePlayer2.toString()),
              ]
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
