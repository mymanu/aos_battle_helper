import 'dart:convert';
import 'dart:io';
import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:aos_battle_helper/classes/spellLore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

import 'package:aos_battle_helper/classes/roster.dart';
import 'package:aos_battle_helper/classes/profiles.dart';
import 'package:aos_battle_helper/classes/selections.dart';
import 'package:aos_battle_helper/classes/unit.dart';
import 'package:aos_battle_helper/classes/ability.dart';
import 'package:aos_battle_helper/classes/selections.dart';

import '../classes/army.dart';
import '../classes/forces.dart';
import '../classes/forcesTwo.dart';
import '../classes/functions.dart';
import '../classes/settings.dart';
import '../classes/weapon.dart';
import '../classes/battleTraits.dart';
import 'HomePage.dart';

import 'package:flutter_parsed_text/flutter_parsed_text.dart';

class ArmyImport extends StatefulWidget {
  ArmyImport({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  @override
  _ArmyImport createState() => _ArmyImport();
}

class _ArmyImport extends State<ArmyImport> {
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
      widget.settings = await Functions().readArmyOfJSON(fileToDisplay, widget.settings);
      //widget.readArmyOfJSON(fileToDisplay);
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Bitte auf NewRecruit.eu eine Armee erstellen\nBei FORCE: bitte Path to Glory: Ravaged Coast auswählen.\n\n"
              "Diese Liste dann über den Import JSON Button importieren.\n\n"
              "Danach bitte prüfen, ob alles richtig angezeigt wird in den jeweiligen Phasen.\n"
              "Manuel kann nicht alles perfekt testen.",
            ),

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
                :
            ElevatedButton(
              onPressed: () {
                readArmyOfJSON(File("./assets/import.json"));
              },
              child: Center(child: Text("Load Json")),
            ),*/
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
              SizedBox(
                height: 300,
                width: 400, //child: Image.file(fileToDisplay!),
                child: Text("Armee erfolgreich importiert"),
              ),

            SizedBox(height: 50),
            Text(
              "Hinweis: Bitte nicht vergessen über Settings die AoS Standard Fähigkeiten wie Move hinzuzufügen.",
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
