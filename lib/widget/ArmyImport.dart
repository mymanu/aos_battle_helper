import 'dart:convert';
import 'dart:io';
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
import '../classes/weapon.dart';

class ArmyImport extends StatefulWidget {
  ArmyImport({super.key, required this.title /*required this.settings*/});

  //MySettings settings;
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

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if(result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        print("File name: $_fileName");
      }

      setState(() {
        isLoading = false;
      });
    } catch (exception) {
      print(exception);
    }
  }



  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/import.json');
    final data = await json.decode(response);
    //final data = await jsonDecode(response) ;

    setState(() {
      Roster roster = Roster("id", "name");
      Map<String, dynamic> rosterMap = data["roster"];

      roster.name = rosterMap["name"];
      roster.id = rosterMap["id"];
      roster.costDynamic = rosterMap["costs"];
      roster.costLimitsDynamic = rosterMap["costLimits"];
      roster.forcesDynamic = rosterMap["forces"];

      print("Roster -> costDynamic Length: ${roster.costDynamic.length}");

      Army army = Army("name");

      //roster -> forces
      for (Map<String, dynamic> forcesMapJSON in roster.forcesDynamic) {
        Forces forces = Forces(forcesMapJSON["id"], forcesMapJSON["name"]);

        if (forcesMapJSON.containsKey("forces")) {
          forces.forcesTwoDynamic = forcesMapJSON["forces"];
        }

        //roster -> forces -> forcesTwo
        for (Map<String, dynamic> forcesTwoMapJSON in forces.forcesTwoDynamic) {
          ForcesTwo forcesTwo = ForcesTwo(
            forcesTwoMapJSON["id"],
            forcesTwoMapJSON["name"],
          );

          if (forcesTwoMapJSON.containsKey("selections")) {
            forcesTwo.selectionsDynamic = forcesTwoMapJSON["selections"];
          }

          //roster -> forces -> forcesTwo -> selections
          for (Map<String, dynamic> selectionMapJSON
              in forcesTwo.selectionsDynamic) {
            Selections select = Selections(
              selectionMapJSON["id"],
              selectionMapJSON["name"],
            );

            if (selectionMapJSON.containsKey("profiles")) {
              select.profilesDynamic = selectionMapJSON["profiles"];
            }
            if (selectionMapJSON.containsKey("selections")) {
              select.selectionsDynamic = selectionMapJSON["selections"];
            }
            if (selectionMapJSON.containsKey("type")) {
              select.type = selectionMapJSON["type"];
            }

            if (select.type.contains("unit")) {
              Unit unit = Unit(select.name);
              unit.id = select.id;

              //Ab hier den Profiles Pfad paralell zu Selections bauen
              //roster -> forces -> forcesTwo -> selections -> profiles
              for (Map<String, dynamic> unitMapJSON in select.profilesDynamic) {
                Profiles profile = Profiles(
                  unitMapJSON["id"],
                  unitMapJSON["name"],
                );

                if (unitMapJSON.containsKey("characteristics")) {
                  profile.characteristics = unitMapJSON["characteristics"];
                }
                if (unitMapJSON.containsKey("typeName")) {
                  profile.typeName = unitMapJSON["typeName"];
                }
                if (unitMapJSON.containsKey("attributes")) {
                  profile.attributes = unitMapJSON["attributes"];
                }

                //Characteristics für Units
                for (Map<String, dynamic> charMapJSON
                    in profile.characteristics) {
                  if (charMapJSON["name"].contains("Move")) {
                    unit.move = charMapJSON["\$text"].toString();
                    print("");
                    print("ACHTUNG ACHTUNG");
                    print(
                      "Hier der Move der Unit ausgegeben: " +
                          charMapJSON["\$text"].toString(),
                    );
                    print("DURCHSAGE BEENDET");
                    print("");
                  }
                  if (charMapJSON["name"].contains("Health")) {
                    unit.health = charMapJSON["\$text"].toString();
                  }
                  if (charMapJSON["name"].contains("Save")) {
                    unit.save = charMapJSON["\$text"].toString();
                  }
                  if (charMapJSON["name"].contains("Control")) {
                    unit.control = charMapJSON["\$text"].toString();
                  }
                }

                //--------------------------------------------------------------------

                if (profile.typeName.contains("Ability")) {
                  Ability ability = Ability(profile.name);
                  ability.id = profile.id;
                  ability.typeName = profile.typeName;

                  ////Characteristics für Abilitys
                  for (Map<String, dynamic> charMapJSON
                      in profile.characteristics) {
                    if (charMapJSON["name"].contains("Timing")) {
                      ability.timing = charMapJSON["\$text"].toString();
                    }
                    if (charMapJSON["name"].contains("Declare")) {
                      ability.declare = charMapJSON["\$text"].toString();
                    }
                    if (charMapJSON["name"].contains("Effect")) {
                      ability.effect = charMapJSON["\$text"].toString();
                    }
                    if (charMapJSON["name"].contains("Keywords")) {
                      ability.keywords = charMapJSON["\$text"].toString();
                    }
                    if (charMapJSON["name"].contains("Used By")) {
                      ability.usedBy = charMapJSON["\$text"].toString();
                    }
                  }
                  ////Attributes für Abilitys
                  for (Map<String, dynamic> attributesMapJSON
                      in profile.attributes) {
                    if (attributesMapJSON["name"].contains("Color")) {
                      ability.color = attributesMapJSON["\$text"].toString();
                    }
                  }
                  unit.abilitys.add(ability);
                }
              }

              //Ab hier den Selections Pfad paralell zu Profiles bauen
              //roster -> forces -> forcesTwo -> selections -> selections
              for (Map<String, dynamic> selectionMapTwoJSON
                  in select.selectionsDynamic) {
                Selections selectTwo = Selections(
                  selectionMapTwoJSON["id"],
                  selectionMapTwoJSON["name"],
                );

                if (selectionMapTwoJSON.containsKey("selections")) {
                  selectTwo.selectionsDynamic =
                      selectionMapTwoJSON["selections"];
                }

                //roster -> forces -> forcesTwo -> selections -> selections -> selections
                for (Map<String, dynamic> selectionThreeMapJSON
                    in selectTwo.selectionsDynamic) {
                  Selections selectThree = Selections(
                    selectionThreeMapJSON["id"],
                    selectionThreeMapJSON["name"],
                  );

                  if (selectionThreeMapJSON.containsKey("profiles")) {
                    selectThree.profilesDynamic =
                        selectionThreeMapJSON["profiles"];
                  }

                  //roster -> forces -> forcesTwo -> selections -> selections -> selections -> profiles
                  for (Map<String, dynamic> profileMapJSON
                      in selectThree.profilesDynamic) {
                    Profiles profile = Profiles(
                      profileMapJSON["id"],
                      profileMapJSON["name"],
                    );

                    if (profileMapJSON.containsKey("characteristics")) {
                      profile.characteristics =
                          profileMapJSON["characteristics"];
                    }
                    if (profileMapJSON.containsKey("typeName")) {
                      profile.typeName = profileMapJSON["typeName"];
                    }

                    if (profileMapJSON["typeName"].toString().contains(
                      "Weapon",
                    )) {
                      Weapon weapon = Weapon(
                        profileMapJSON["id"],
                        profileMapJSON["name"],
                      );

                      //roster -> forces -> forcesTwo -> selections -> selections -> selections -> profiles -> characteristics
                      for (Map<String, dynamic> weaponMapJSON
                          in profile.characteristics) {
                        if (weaponMapJSON["name"].contains("Atk")) {
                          weapon.attack = weaponMapJSON["\$text"].toString();
                        }
                        if (weaponMapJSON["name"].contains("Hit")) {
                          weapon.hit = weaponMapJSON["\$text"].toString();
                        }
                        if (weaponMapJSON["name"].contains("Wnd")) {
                          weapon.wound = weaponMapJSON["\$text"].toString();
                        }
                        if (weaponMapJSON["name"].contains("Rnd")) {
                          weapon.rend = weaponMapJSON["\$text"].toString();
                        }
                        if (weaponMapJSON["name"].contains("Dmg")) {
                          weapon.damage = weaponMapJSON["\$text"].toString();
                        }
                        if (weaponMapJSON["name"].contains("Ability")) {
                          weapon.ability = weaponMapJSON["\$text"].toString();
                        }
                      }
                      unit.weapons.add(weapon);
                    }
                  }
                }
              }
              army.unitList.add(unit);
            }
          }
        }
      }

      for (Unit unit in army.unitList) {
        print("-------------------------------------------------------------");
        print("");
        print("Unit aus dem großen neuen Decode Block:");
        print("Name der Unit: " + unit.name);
        print("Move: " + unit.move);
        print("Health: " + unit.health);
        print("Save: " + unit.save);
        print("Control: " + unit.control);
        print("-------------");
        print("Fähigkeiten:");

        for (Ability abi in unit.abilitys) {
          print("Name: " + abi.name);
          print("Typ: " + abi.typeName);
          print("Effekt: " + abi.effect);
          print("Timing: " + abi.timing);
          print("Farbe: " + abi.color);
          print("-----");
        }
        print("-------------");
        print("Waffen:");
        for (Weapon weap in unit.weapons) {
          print("Name: " + weap.name);
          print("Typ: " + weap.typeName);
          print("Anzahl Attacken: " + weap.attack);
          print("Treffen: " + weap.hit);
          print("Verwunden: " + weap.wound);
          print("Durchschlag: " + weap.rend);
          print("Schaden pro Würfel: " + weap.damage);
          print("Fähigkeit: " + weap.ability);
        }

        print("-------------------------------------------------------------");
        print("");
      }

      print("Anzahl der Units in der Unit-List: ${army.unitList.length}");
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
            isLoading
                ? CircularProgressIndicator()
                : TextButton(onPressed: (){
                  pickFile();
            }, child: Text("Pick File")),
            if(pickedFile != null)
              SizedBox(
                height: 300, width: 400, child: Image.file(fileToDisplay!),
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
}
