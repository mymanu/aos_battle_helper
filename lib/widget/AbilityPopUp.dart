import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';

import '../classes/ability.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'HomePage.dart';
import 'dart:math' as math;

class AbilityPopUp extends StatefulWidget {
  AbilityPopUp({
    super.key,
    required this.title,
    required this.settings,
    required this.ability,
  });

  Settings settings;
  String title;

  Ability ability;

  //List<bool> erledigtList = [];
  //bool ownPhase = true;
  Color phaseColor = Colors.yellow.shade800;

  //String phaseColorString = "White";

  @override
  _AbilityPopUp createState() => _AbilityPopUp();
}

class _AbilityPopUp extends State<AbilityPopUp> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    Functions functions = Functions();

    //TODO ab Hier wird das UI der WarScrolls gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      // Start vom body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      //TODO wird aktuell nicht angezeigt, mal danach schauen
                      Positioned(
                        top: 0,
                        right: 0,
                        child: widget.ability.castingValue.contains("-")
                            ? Text("")
                            : Text(
                          "Casting Value: " + widget.ability.castingValue,
                        ),
                      ),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: widget.ability.commandPoints.contains("-")
                            ? Text("")
                            : Text("CP cost: " + widget.ability.commandPoints),
                      ),
                      Container(
                        height: 190,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade400,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          widget.ability.name,
                          style: TextStyle(height: 2.5, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(
              width: 1300,
              height: 300,
              child: SingleChildScrollView(
                child: Card(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: widget.ability.castingValue.contains("-")
                            ? Text("")
                            : Text(
                                "Casting Value: " + widget.ability.castingValue,
                              ),
                      ),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: widget.ability.commandPoints.contains("-")
                            ? Text("")
                            : Text("CP cost: " + widget.ability.commandPoints),
                      ),
                      //Ab hier Card wenn es eine Ability ist
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.ability.name,
                                //cardContentList[index].ability.name,
                                style: TextStyle(
                                  backgroundColor: widget.phaseColor,
                                  fontWeight: FontWeight.bold,
                                  color: calculateTextColor(widget.phaseColor),
                                ),
                              ),
                            ],
                          ),
                          widget.ability.typeName.contains("Passive")
                              ? Text(widget.ability.typeName)
                              : Text(widget.ability.timing),
                          Text(widget.ability.originUnit),
                          Text(""),
                          (widget.ability.effect.contains("null") ||
                                  widget.ability.effect.contains("-1"))
                              ? functions.parseText(widget.ability.declare)
                              : (widget.ability.declare.contains("null") ||
                                    widget.ability.declare.contains("-1"))
                              ? functions.parseText(
                                  "Effekt: ${widget.ability.effect}",
                                )
                              : functions.parseText(
                                  widget.ability.declare +
                                      "\n\n" +
                                      widget.ability.effect,
                                ),

                          Text(""),

                          (widget.ability.keywords.contains("null") ||
                                  widget.ability.keywords.contains("-1"))
                              ? Text("")
                              : functions.parseText(
                                  "Keywords: ${widget.ability.keywords}",
                                ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: Text("Fähigkeit erledigt"),
                                onPressed: () {
                                  setState(() {
                                    widget.ability.erledigt = true;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }
}
