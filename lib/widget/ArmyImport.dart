import 'dart:convert';
import 'package:aos_battle_helper/classes/selections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:aos_battle_helper/classes/roster.dart';
import 'package:aos_battle_helper/classes/profiles.dart';
import 'package:aos_battle_helper/classes/selections.dart';
import 'package:aos_battle_helper/classes/unit.dart';
import 'package:aos_battle_helper/classes/ability.dart';

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
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/import.json');
    final data = await json.decode(response);
    //final data = await jsonDecode(response) ;

    setState(() {
      Map<String, dynamic> _items = data["roster"];
      print("..number of items ${_items.length}");

      Roster rosterTest = Roster.fromJson(data["roster"]);

      print("Name: " + rosterTest.name);
      print("ID: " + rosterTest.id);

      print("Forces Name: " + rosterTest.forces.name);

      print("ForcesTwo Name: " + rosterTest.forces.forcesTwo.name);

      print("Selections Name: " + rosterTest.forces.forcesTwo.selections.name);

      /*
      print(
        "Profiles Name: " + rosterTest.forces.forcesTwo.selections.profiles.name,
      );


      print(
        "Characteristics Name: " +
            rosterTest.forces.forcesTwo.selections.profiles.characteristics.name,
      );



      print(
        "Test " +
            rosterTest.forces.forcesTwo.selections.profiles.charDynamic.toString(),
      );
      */

      //Alles importiert bis Zeile 224 (profiles aktuell fertig)
      //Jetzt muss für 225 die seclections angepasst werden (bereits geschehen)
      //Jetzt mit den Daten unter der selectionsDynamic unter selections arbeiten wie mit der profiledynamic (siehe ab Zeile 68)
      //aber es geht in der JSON noch tiefer (nochmal selections, profiles, characteristics) JSON Zeile 225 fortfolgend

      print("Platzhalter\n\n");

      Roster roster = Roster("id", "name");
      Map<String, dynamic> rosterMap = data["roster"];

      roster.name = rosterMap["name"];
      roster.id = rosterMap["id"];
      roster.costDynamic = rosterMap["costs"];
      roster.costLimitsDynamic = rosterMap["costLimits"];
      roster.forcesDynamic = rosterMap["forces"];

      print("Roster -> costDynamic Length: ${roster.costDynamic.length}");

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
                    print("\n");
                    print("ACHTUNG ACHTUNG");
                    print(
                      "Hier der Move der Unit ausgegeben: " +
                          charMapJSON["\$text"].toString(),
                    );
                    print("DURCHSAGE BEENDET");
                    print("\n");
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
                  //TODO Klammer richtig setzen
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
                roster.unitList.add(unit);
              }
            }
          }
        }
      }

      for (Unit unit in roster.unitList) {
        print("-------------------------------------------------------------");
        print("\n\n");
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
        print("\n\n");
      }

      //TODO alten Code entfernen
      //ab hier "alter Code" von unten aufgebaut

      //hier für Mittel Selection (Zeile 225) General und Megaboss

      List<Selections> selectionList = [];

      for (Map<String, dynamic> selectionMapJSON
          in rosterTest.forces.forcesTwo.selections.selectionsDynamic) {
        Selections select = Selections(
          selectionMapJSON["id"],
          selectionMapJSON["name"],
        );

        if (selectionMapJSON.containsKey("selections")) {
          select.selectionsDynamic = selectionMapJSON["selections"];
        }

        selectionList.add(select);
      }

      print("Inhalt Selection-List: " + selectionList.toString());
      print("");

      for (Selections select in selectionList) {
        print("Neue Selection erkannt");
        print(select.name);
        print(select.id);

        //hier für unter Selection (Zeile 235) Boss Choppa
        //weiter

        List<Selections> selectionListInner = [];

        for (Map<String, dynamic> selectionMapJSON
            in select.selectionsDynamic) {
          Selections selectInner = Selections(
            selectionMapJSON["id"],
            selectionMapJSON["name"],
          );

          if (selectionMapJSON.containsKey("selections")) {
            selectInner.selectionsDynamic = selectionMapJSON["selections"];
          }

          if (selectionMapJSON.containsKey("profiles")) {
            selectInner.profilesDynamic = selectionMapJSON["profiles"];
          }

          selectionListInner.add(selectInner);
        }

        for (Selections selectInSelect in selectionListInner) {
          print("Neue Unter-Selection erkannt");
          print(selectInSelect.name);
          print(selectInSelect.id);
        }
      }

      List<Profiles> profileList = [];

      for (Map<String, dynamic> unitMapJSON
          in rosterTest.forces.forcesTwo.selections.profilesDynamic) {
        Profiles profile = Profiles(unitMapJSON["id"], unitMapJSON["name"]);

        if (unitMapJSON.containsKey("characteristics")) {
          profile.characteristics = unitMapJSON["characteristics"];
        }
        if (unitMapJSON.containsKey("typeName")) {
          profile.typeName = unitMapJSON["typeName"];
        }
        if (unitMapJSON.containsKey("attributes")) {
          profile.attributes = unitMapJSON["attributes"];
        }

        profileList.add(profile);
      }

      //Ab hier Profiles Decodieren und in die letzte Unit in der UnitList einspeichern

      List<Unit> unitListTest = [];

      for (Profiles profile in profileList) {
        print("neues Profil mit Name: " + profile.name);
        print("Characteristics: " + profile.characteristics.toString());
        Unit unitToFill = Unit("test");

        if (profile.typeName.contains("Unit")) {
          print("Unit erkannt");
          print("----------------------");

          unitToFill.name = profile.name;
          unitToFill.id = profile.id;

          //Characteristics für Units
          for (Map<String, dynamic> charMapJSON in profile.characteristics) {
            if (charMapJSON["name"].contains("Move")) {
              unitToFill.move = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Health")) {
              unitToFill.health = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Save")) {
              unitToFill.save = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Control")) {
              unitToFill.control = charMapJSON["\$text"].toString();
            }
          }
          unitListTest.add(unitToFill);
        }

        if (profile.typeName.contains("Ability (Activated)")) {
          Ability abilityBuild = Ability("test");
          print("Ability (Activated) erkannt");
          print("----------------------");

          abilityBuild.name = profile.name;
          abilityBuild.id = profile.id;

          ////Characteristics für Abilitys (Activated)
          for (Map<String, dynamic> charMapJSON in profile.characteristics) {
            if (charMapJSON["name"].contains("Timing")) {
              abilityBuild.timing = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Declare")) {
              abilityBuild.declare = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Effect")) {
              abilityBuild.effect = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Keywords")) {
              abilityBuild.keywords = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Used By")) {
              abilityBuild.usedBy = charMapJSON["\$text"].toString();
            }
          }

          for (Map<String, dynamic> attributesMapJSON in profile.attributes) {
            if (attributesMapJSON["name"].contains("Color")) {
              abilityBuild.color = attributesMapJSON["\$text"].toString();
            }
          }

          unitListTest.last.abilitys.add(abilityBuild);
        }

        if (profile.typeName.contains("Ability (Passive)")) {
          Ability abilityBuildPassive = Ability("test");
          print("Ability (Passive) erkannt");
          print("----------------------");

          abilityBuildPassive.name = profile.name;
          abilityBuildPassive.id = profile.id;

          ////Characteristics für Abilitys (Passive)
          for (Map<String, dynamic> charMapJSON in profile.characteristics) {
            if (charMapJSON["name"].contains("Keywords")) {
              abilityBuildPassive.keywords = charMapJSON["\$text"].toString();
            }
            if (charMapJSON["name"].contains("Effect")) {
              abilityBuildPassive.effect = charMapJSON["\$text"].toString();
            }
          }

          for (Map<String, dynamic> attributesMapJSON in profile.attributes) {
            if (attributesMapJSON["name"].contains("Color")) {
              abilityBuildPassive.color = attributesMapJSON["\$text"]
                  .toString();
            }
          }

          unitListTest.last.abilitys.add(abilityBuildPassive);
        }
      }
      for (Unit unitThis in unitListTest) {
        print(
          "Unit wurde erstellt:\nMove: " +
              unitThis.move +
              "\nHealth: " +
              unitThis.health,
        );
        print("Save: " + unitThis.save + "\nControl: " + unitThis.control);

        for (Ability abi in unitThis.abilitys) {
          print("---------------");
          print("Ability Timing: " + abi.timing);
          print("Ability Name: " + abi.name);
          print("Ability Color: " + abi.color);
          print("Ability Effect: " + abi.effect);
        }
      }

      /*
      rosterTest
      -> forces
        -> forcesTwo
          -> selections
            -> profiles
              -> characteristics
            -> selections
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

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
