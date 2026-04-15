import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:aos_battle_helper/classes/roster.dart';
import 'package:aos_battle_helper/classes/profiles.dart';
import 'package:aos_battle_helper/classes/characteristics.dart';
import 'package:aos_battle_helper/classes/unit.dart';
/*
class ArmyImport extends StatefulWidget {
  ArmyImport({super.key, required this.title /*required this.settings*/});

  //MySettings settings;
  String title;

  @override
  _ArmyImport createState() => _ArmyImport();
}

class _ArmyImport extends State<ArmyImport> {
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/import.json');
    final data = await json.decode(response);
    //final data = await jsonDecode(response) ;
    setState(() {
      Map<String, dynamic> _items = data["roster"];
      print("..number of items ${_items.length}");

      Roster roster = Roster.fromJson(data["roster"]);

      print("Name: " + roster.name);
      print("ID: " + roster.id);

      print("Forces Name: " + roster.forces.name);

      print("ForcesTwo Name: " + roster.forces.forcesTwo.name);

      print("Selections Name: " + roster.forces.forcesTwo.selections.name);

      print(
        "Profiles Name: " + roster.forces.forcesTwo.selections.profiles.name,
      );

      print(
        "Characteristics Name: " +
            roster.forces.forcesTwo.selections.profiles.characteristics.name,
      );

      print(
        "Test " +
            roster.forces.forcesTwo.selections.profiles.charDynamic.toString(),
      );

      print("Platzhalter");

      //Ab hier um eine Liste an Dingen durchzugehen. bei charMap.update könnte man einzelne Objekte anlegen und Speichern

      List<Characteristics> charList = [];

      Map<String, String> charMap = {
        "name": "Move",
        "typeId": "fed0-d1b3-1bb8-c501",
      };
      charMap.clear();

      for (Map<String, dynamic> charMapJSON
      in roster.forces.forcesTwo.selections.profiles.charDynamic) {
        print(charMapJSON["name"]);
        print(charMapJSON["\$text"]);

        charMap.update(
          charMapJSON["name"],
              (value) => charMapJSON["\$text"],
          ifAbsent: () => charMapJSON["\$text"],
        );

        Characteristics character = Characteristics(charMapJSON["\$text"], charMapJSON["name"]);

        charList.add(character);
      }
      print("Meine Characteristics sind " + charMap.toString());
      print("----------------------\n------------------------");


      Unit unitBuild = Unit("test");

      for (Characteristics char in charList) {

        if(char.name.contains("Move")) {
          unitBuild.move = char.text;
        }
        if(char.name.contains("Health")) {
          unitBuild.health = char.text;
        }
        if(char.name.contains("Save")) {
          unitBuild.save = char.text;
        }
        if(char.name.contains("Control")) {
          unitBuild.control = char.text;
        }
      }

      print("Unit wurde erstellt:\nMove: " + unitBuild.move + "\nHealth: " + unitBuild.health);

      /*
      roster
      -> forces
        -> forcesTwo
          -> selections
            -> profiles
              -> characteristics
       */
    });
  }

  @override
  Widget build(BuildContext context) {
    //String envTitle = Env.environmentName ?? "";
    //String title = widget.title + ' - ' + envTitle;
    String title = widget.title;
    //String title = widget.title + "Phase";

    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        child: Column(
          children: [
            Text("Hallo-Text"),
            /*_items.isNotEmpty ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                  itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_items[index]["id"]),
                    margin: const EdgeInsets.all(10),
                    color: Colors.orangeAccent.shade100,
                      child: ListTile(
                        leading: Text(_items[index]["id"], style: TextStyle(color: calculateTextColor(Colors.orangeAccent.shade100))),
                        title: Text(_items[index]["name"], style: TextStyle(color: calculateTextColor(Colors.orangeAccent.shade100))),
                        subtitle: Text(_items[index]["description"], style: TextStyle(color: calculateTextColor(Colors.orangeAccent.shade100))),
                      )
                  );
                  },
              ),
            )
            Text("Habe was gefunden")
                : */
            ElevatedButton(
              onPressed: () {
                readJson();
              },
              child: Center(child: Text("Load Json")),
            ),
          ],
        ),
      ),
    );
  }

  /*void getJSONData(){
    final futureJSON = DefaultAssetBundle.of(context).loadString("assets/data.json");
    futureJSON.then(jsonDecode(futureJSON));
  }
   */

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}

 */
