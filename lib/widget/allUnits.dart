import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';
import 'WarScroll.dart';
import 'WarScrollManu.dart';

class allUnits extends StatefulWidget {
  allUnits({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  Color phaseColor = Colors.teal;

  @override
  _allUnits createState() => _allUnits();
}

class _allUnits extends State<allUnits> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    Functions functions = Functions();

    List<Unit> unitsThisPhase = [];

    //Ab hier Units in unitsThisPhase
    for (Unit unit in widget.settings.army.unitList) {
      unitsThisPhase.add(unit);
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
              _navigateBack(context, widget.settings);
            },
            child: Text("Zurück"),
          ),
          SizedBox(width: 50),
        ],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          //Ab hier Kacheln für Units in der unitsThisPhase List bauen
          SliverPadding(
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
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return SingleChildScrollView(
                  child: Card(
                    child: unitsThisPhase[index].erledigt
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitsThisPhase[index].erledigt = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  unitsThisPhase[index].name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(Icons.done, size: 100),
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
                                    unitsThisPhase[index].name,
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
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child:
                                    // Idee Kreis getrennt durch 2 Linien
                                    Container(
                                      width: 200,
                                      height: 200,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Circle color
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: widget.phaseColor,
                                          width: 7,
                                        ), // Optional border
                                      ),
                                      child: Stack(
                                        children: [
                                          // left top to right bottom
                                          Transform.rotate(
                                            angle:
                                                math.pi /
                                                4, // 45 degrees in radians
                                            child: Center(
                                              child: Container(
                                                height: 5, // Thickness
                                                color: widget.phaseColor,
                                              ),
                                            ),
                                          ),
                                          Transform.rotate(
                                            angle: math.pi / 4,
                                            // right top to left bottom
                                            child: Center(
                                              child: Container(
                                                width: 5, // Thickness
                                                color: widget.phaseColor,
                                              ),
                                            ),
                                          ),
                                          //https://pub.dev/packages/flutter_custom_clippers
                                          Positioned(
                                            top: 55,
                                            left: 112,
                                            child: Container(
                                              height: 75,
                                              width: 75,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            left: 75,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Move",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  unitsThisPhase[index].move,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 80,
                                            left: -10,
                                            child: Row(
                                              children: [
                                                Transform.rotate(
                                                  angle: math.pi * 1.5,
                                                  child: Text(
                                                    "Health",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  unitsThisPhase[index].health,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 80,
                                            left: 130,
                                            child: Row(
                                              children: [
                                                Text(
                                                  unitsThisPhase[index].save,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Transform.rotate(
                                                  angle: math.pi * 0.5,
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 135,
                                            left: 70,
                                            child: Column(
                                              children: [
                                                Text(
                                                  unitsThisPhase[index]
                                                          .banishment
                                                          .contains("-")
                                                      ? unitsThisPhase[index]
                                                            .control
                                                      : unitsThisPhase[index]
                                                            .banishment,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  unitsThisPhase[index]
                                                          .banishment
                                                          .contains("-")
                                                      ? "Control"
                                                      : "Banish",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              ),

                              /*
                            Text("Health: " + unitsThisPhase[index].health),
                            Text("Move: " + unitsThisPhase[index].move),
                            Text("Save: " + unitsThisPhase[index].save),
                            Text("Control: " + unitsThisPhase[index].control),
                            */
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: Text("Unit erledigt"),
                                    onPressed: () {
                                      setState(() {
                                        unitsThisPhase[index].erledigt = true;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  TextButton(
                                    child: Text("show Warscroll"),
                                    onPressed: () {
                                      functions.showWarscroll(
                                        context,
                                        widget.settings,
                                        unitsThisPhase[index],
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                  ),
                );
              }, childCount: unitsThisPhase.length),
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

  void _navigateBack(BuildContext context, Settings settings) {
    Navigator.of(context).pop();
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
