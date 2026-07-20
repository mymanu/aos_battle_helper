import 'dart:convert';
import 'dart:io';

import 'package:aos_battle_helper/classes/profiles.dart';
import 'package:aos_battle_helper/classes/roster.dart';
import 'package:aos_battle_helper/classes/selections.dart';
import 'package:aos_battle_helper/classes/weapon.dart';
import 'package:flutter/material.dart';

import 'package:aos_battle_helper/classes/settings.dart';
import 'package:aos_battle_helper/classes/unit.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import '../ageOfSigmar/aosGeneralSpells.dart';
import '../spearhead/spearheadGeneralSpells.dart';
import '../widget/AbilityPopUp.dart';
import '../widget/HomePage.dart';
import '../widget/WarScroll.dart';
import 'ability.dart';
import 'battleTraits.dart';
import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:aos_battle_helper/classes/spellLore.dart';

import 'forces.dart';
import 'forcesTwo.dart';

class Functions {
  Settings settings = Settings();


  List<Ability> unitAbilitys(List<Unit>unitList, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Unit unit in unitList) {
      for (Ability ability in unit.abilitys) {
        if (ability.color.contains(phaseColorString)) {
          //Für JSON Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive") ||
              ability.timing.contains("Reaction")) &&
              ownPhase) {
            ability.originUnit = unit.name;
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive") ||
              ability.timing.contains("Reaction")) &&
              !ownPhase) {
            ability.originUnit = unit.name;
            abilitys.add(ability);
          }
          //Für JSON Spells Ende
        }
      }
    }
    return abilitys;
  }


  List<Ability> unitAbilityDeployment(List<Unit>unitList) {
    List<Ability> abilitys = [];
    for (Unit unit in unitList) {
      for (Ability ability in unit.abilitys) {
          if (ability.timing.contains("Deployment")) {
            ability.originUnit = unit.name;
            abilitys.add(ability);
          }
      }
    }
    return abilitys;
  }

  List<Ability> spellLoreAbilitys(SpellLore spellLore, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Ability ability in spellLore.abilitys) {
      if (ability.color.contains(phaseColorString)) {
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            ownPhase) {
          ability.originUnit = "Spell-Lore";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            !ownPhase) {
          ability.originUnit = "Spell-Lore";
          abilitys.add(ability);
        }
        //Für JSON Spells Ende
      }
    }
    return abilitys;
  }

  List<Ability> battleTraitAbilitys(List<BattleTraits> battleTraitsList, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (BattleTraits battleTrait in battleTraitsList) {
      for (Ability ability in battleTrait.abilitys) {
        if (ability.color.contains(phaseColorString)) {
          //Für JSON Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive") ||
              ability.timing.contains("Reaction")) &&
              ownPhase) {
            ability.originUnit = "Battle-Trait";
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive") ||
              ability.timing.contains("Reaction")) &&
              !ownPhase) {
            ability.originUnit = "Battle-Trait";
            abilitys.add(ability);
          }
          //Für JSON Spells Ende
        }
      }
    }
    return abilitys;
  }

  List<Ability> battleTraitDeployment(List<BattleTraits> battleTraitsList) {
    List<Ability> abilitys = [];
    for (BattleTraits battleTrait in battleTraitsList) {
      for (Ability ability in battleTrait.abilitys) {
        if (ability.timing.contains("Deployment")){
          ability.originUnit = "Battle-Trait";
          abilitys.add(ability);
        }
      }
    }
    return abilitys;
  }

  List<Ability> battleTraitStartOfBattle(List<BattleTraits> battleTraitsList) {
    List<Ability> abilitys = [];
    for (BattleTraits battleTrait in battleTraitsList) {
      for (Ability ability in battleTrait.abilitys) {
        if (ability.timing.contains("Battle Round")){
          ability.originUnit = "Battle-Trait";
          abilitys.add(ability);
        }
      }
    }
    return abilitys;
  }

  List<Ability> battleFormationAbilitys(List<BattleFormation> battleFormationsList, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (BattleFormation battleFormation in battleFormationsList) {
      for (Ability ability in battleFormation.abilitys) {
        if (ability.color.contains(phaseColorString)) {
          //Für JSON Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive") ||
              ability.timing.contains("Reaction")) &&
              ownPhase) {
            ability.originUnit = "Battle-Formation";
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive") ||
              ability.timing.contains("Reaction")) &&
              !ownPhase) {
            ability.originUnit = "Battle-Formation";
            abilitys.add(ability);
          }
          //Für JSON Spells Ende
        }
      }
    }
    return abilitys;
  }

  List<Ability> battleFormationDeployment(List<BattleFormation> battleFormationsList) {
    List<Ability> abilitys = [];
    for (BattleFormation battleFormation in battleFormationsList) {
      for (Ability ability in battleFormation.abilitys) {
          //Für JSON Spells Anfang
          if (ability.timing.contains("Deployment")) {
            ability.originUnit = "Battle-Formation";
            abilitys.add(ability);
          }
      }
    }
    return abilitys;
  }

  List<Ability> commandAbilitys(List<Ability> commandAbilitys, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Ability ability in commandAbilitys) {
      if (ability.color.contains(phaseColorString)) {
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            ownPhase) {
          ability.originUnit = "Command-Ability";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            !ownPhase) {
          ability.originUnit = "Command-Ability";
          abilitys.add(ability);
        }
        //Für JSON Spells Ende
      }
    }
    return abilitys;
  }

  List<Ability> coreAbilitys(List<Ability> normalAbilitys, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Ability ability in normalAbilitys) {
      if (ability.color.contains(phaseColorString)) {
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            ownPhase) {
          ability.originUnit = "Core-Ability";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            !ownPhase) {
          ability.originUnit = "Core-Ability";
          abilitys.add(ability);
        }
        //Für JSON Spells Ende
      }
    }
    return abilitys;
  }

  List<Ability> preparationAbilities(List<Ability> preparationAbilities, String phaseColorString, bool ownPhase) {
    List<Ability> abilities = [];
    for (Ability ability in preparationAbilities) {
      if (ability.color.contains(phaseColorString)) {
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            ownPhase) {
          ability.originUnit = "Preparation-Ability";
          abilities.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive") ||
            ability.timing.contains("Reaction")) &&
            !ownPhase) {
          ability.originUnit = "Preparation-Ability";
          abilities.add(ability);
        }
        //Für JSON Spells Ende
      }
    }
    return abilities;
  }



  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }


  Future<void> showWarscroll(BuildContext context, Settings settings, Unit currentUnit) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          title: Text(currentUnit.name),
          content: Container(
            height: 1500,
            width: 1500,
            child: WarScroll(
              title: currentUnit.name,
              settings: settings,
              unit: currentUnit,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Menu'),
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToMenu(context, settings);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAbilityPopUp(BuildContext context, Settings settings, Ability currentAbility) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          title: Text(currentAbility.name),
          content: Container(
            height: 1500,
            width: 1500,
            child: AbilityPopUp(
              title: currentAbility.name,
              settings: settings,
              ability: currentAbility,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Menu'),
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToMenu(context, settings);
              },
            ),
          ],
        );
      },
    );
  }

  //https://pub.dev/packages/flutter_parsed_text
  Widget parseText(BuildContext context, String text) {
    Ability ward = aosGeneralSpells().getWardSave();
    Ability musician = aosGeneralSpells().getMusician();
    Ability champion = aosGeneralSpells().getChampion();
    Ability standardBearer = aosGeneralSpells().getStandardBearer();
    Ability fly = aosGeneralSpells().getFly();

    Map<String, Ability> testMap = {"ward roll": ward, "WARD": ward, "CHAMPION": champion, "MUSICIAN": musician, "STANDARDBEARER": standardBearer, "FLY": fly};

    return ParsedText(
      text: text,
      style: TextStyle(color: calculateTextColor(Colors.black)),
      parse: <MatchText>[
        MatchText(
          pattern:
              r"\*\*\*?\^?\^?([^*^]+)\^?\^?\*\*\*?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            //fontSize: 24,
          ),
          renderText:
              ({
            required String str,
            required String pattern,
          }) {
            RegExp customRegExp =
            RegExp(pattern);
            Match match = customRegExp
                .firstMatch(str)!;
            return {
              'display': match[2]!,
            };
          },
          onTap: (display) {
            display = display.replaceAll("*", "").replaceAll("^", "");
            showAbilityPopUp(context, settings, testMap[display]!);
          },
        ),
        MatchText(
          pattern:
          r"(WARD)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            //fontSize: 24,
          ),
          renderText:
              ({
            required String str,
            required String pattern,
          }) {
            RegExp customRegExp =
            RegExp(pattern);
            Match match = customRegExp
                .firstMatch(str)!;
            return {
              'display': match[1]!,
            };
          },
          onTap: (display) {
            display = display.replaceAll("*", "").replaceAll("^", "").replaceAll(" ", "");
            showAbilityPopUp(context, settings, testMap[display]!);
          },
        ),

        MatchText(
          pattern:
          r"(MUSICIAN)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            //fontSize: 24,
          ),
          renderText:
              ({
            required String str,
            required String pattern,
          }) {
            RegExp customRegExp =
            RegExp(pattern);
            Match match = customRegExp
                .firstMatch(str)!;
            return {
              'display': match[1]!,
            };
          },
          onTap: (display) {
            display = display.replaceAll("*", "").replaceAll("^", "").replaceAll(" ", "");
            showAbilityPopUp(context, settings, testMap[display]!);
          },
        ),

        MatchText(
          pattern:
          r"(CHAMPION)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            //fontSize: 24,
          ),
          renderText:
              ({
            required String str,
            required String pattern,
          }) {
            RegExp customRegExp =
            RegExp(pattern);
            Match match = customRegExp
                .firstMatch(str)!;
            return {
              'display': match[1]!,
            };
          },
          onTap: (display) {
            display = display.replaceAll("*", "").replaceAll("^", "").replaceAll(" ", "");
            showAbilityPopUp(context, settings, testMap[display]!);
          },
        ),

        MatchText(
          pattern:
          r"(STANDARD BEARER)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            //fontSize: 24,
          ),
          renderText:
              ({
            required String str,
            required String pattern,
          }) {
            RegExp customRegExp =
            RegExp(pattern);
            Match match = customRegExp
                .firstMatch(str)!;
            return {
              'display': match[1]!,
            };
          },
          onTap: (display) {
            display = display.replaceAll("*", "").replaceAll("^", "").replaceAll(" ", "");
            showAbilityPopUp(context, settings, testMap[display]!);
          },
        ),

        MatchText(
          pattern:
          r"(FLY)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            //fontSize: 24,
          ),
          renderText:
              ({
            required String str,
            required String pattern,
          }) {
            RegExp customRegExp =
            RegExp(pattern);
            Match match = customRegExp
                .firstMatch(str)!;
            return {
              'display': match[1]!,
            };
          },
          onTap: (display) {
            display = display.replaceAll("*", "").replaceAll("^", "").replaceAll(" ", "");
            showAbilityPopUp(context, settings, testMap[display]!);
          },
        ),
      ],
    );
  }


  Future<Settings> readArmyOfJSON(File? jsonFile, Settings thisSettings) async {
    settings = thisSettings;
    settings.army.unitList.clear();

    final String response = await jsonFile!.readAsString();
    final data = await json.decode(response);

    Map<String, dynamic> rosterMap = data["roster"];
    Roster roster = Roster(rosterMap["id"], rosterMap["name"]);

    for (Map<String, dynamic> entry in rosterMap["forces"]) {
      roster.forcesDynamic.add(entry);
    }
    for (Map<String, dynamic> entry in rosterMap["costLimits"]) {
      roster.costLimitsDynamic.add(entry);
    }
    for (Map<String, dynamic> entry in rosterMap["costs"]) {
      roster.costDynamic.add(entry);
    }

    List<Forces> forcesList = [];

    for (Map<String, dynamic> forcesMapJSON in roster.forcesDynamic) {
      Forces forces = Forces(forcesMapJSON["id"], forcesMapJSON["name"]);

      if (forcesMapJSON.containsKey("forces")) {
        for (Map<String, dynamic> entry in forcesMapJSON["forces"]) {
          forces.forcesTwoDynamic.add(entry);
        }
      }
      if (forcesMapJSON.containsKey("selections")) {
        for (Map<String, dynamic> entry in forcesMapJSON["selections"]) {
          forces.selectionsDynamic.add(entry);
        }
      }
      forcesList.add(forces);
    }

    List<ForcesTwo> forcesTwoList = [];

    for (Forces forces in forcesList) {
      for (Map<String, dynamic> forcesTwoMapJSON in forces.forcesTwoDynamic) {
        ForcesTwo forcesTwo = ForcesTwo(
          forcesTwoMapJSON["id"],
          forcesTwoMapJSON["name"],
        );
        if (forcesTwoMapJSON.containsKey("selections")) {
          for (Map<String, dynamic> entry in forcesTwoMapJSON["selections"]) {
            forcesTwo.selectionsDynamic.add(entry);
          }
        }
        forcesTwoList.add(forcesTwo);
      }
    }

    List<Selections> selections = [];
    for (ForcesTwo forcesTwo in forcesTwoList) {
      for (Map<String, dynamic> selectionMapJSON
      in forcesTwo.selectionsDynamic) {
        Selections currentSelections = Selections(
          selectionMapJSON["id"],
          selectionMapJSON["name"],
        );
        if (selectionMapJSON.containsKey("profiles")) {
          for (Map<String, dynamic> entry in selectionMapJSON["profiles"]) {
            currentSelections.profilesDynamic.add(entry);
          }
        }
        if (selectionMapJSON.containsKey("selections")) {
          for (Map<String, dynamic> entry in selectionMapJSON["selections"]) {
            currentSelections.selectionsDynamic.add(entry);
          }
        }
        if (selectionMapJSON.containsKey("categories")) {
          for (Map<String, dynamic> entry in selectionMapJSON["categories"]) {
            currentSelections.categoriesDynamic.add(entry);
          }
        }
        if (selectionMapJSON.containsKey("type")) {
          currentSelections.type = selectionMapJSON["type"];
        }
        selections.add(currentSelections);
      }
    }

    for (Selections mySelection in selections) {
      if (mySelection.type.contains("unit")) {
        settings.army.unitList.add(readUnitOfJSON(mySelection));
      }
    }

    //Unit Ausgabe mit Prints
    for (Unit unit in settings.army.unitList) {
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
        print("------------------");
      }

      print("-------------------------------------------------------------");
      print("");
    }

    print(
      "Anzahl der Units in der Unit-List: ${settings.army.unitList
          .length}",
    );

    List<Selections> selectionsList = [];
    //roster -> forces -> selections
    for (Forces forces in forcesList) {
      for (Map<String, dynamic> selectionMapJSON in forces.selectionsDynamic) {
        Selections select = Selections(
          selectionMapJSON["id"],
          selectionMapJSON["name"],
        );

        if (selectionMapJSON.containsKey("profiles")) {
          for (Map<String, dynamic> entry in selectionMapJSON["profiles"]) {
            select.profilesDynamic.add(entry);
          }
        }
        if (selectionMapJSON.containsKey("categories")) {
          for (Map<String, dynamic> entry in selectionMapJSON["categories"]) {
            select.categoriesDynamic.add(entry);
          }
        }
        if (selectionMapJSON.containsKey("selections")) {
          for (Map<String, dynamic> entry in selectionMapJSON["selections"]) {
            select.selectionsDynamic.add(entry);
          }
        }
        if (selectionMapJSON.containsKey("type")) {
          select.type = selectionMapJSON["type"];
        }
        if (selectionMapJSON.containsKey("rules")) {
          for (Map<String, dynamic> entry in selectionMapJSON["rules"]) {
            select.rulesDynamic.add(entry);
          }
        }
        selectionsList.add(select);
      }

      for (Selections select in selectionsList) {
        if (select.name.contains("Battle Trait")) {
          settings.army.battleTraitsList = readBattleTrait(select);
        }
        if (select.name.contains("Arcane") || select.name.contains("Spell")) {
          settings.army.spellLore = readSpellLoreOfJSON(select);
        }
        if (select.type.contains("unit")) {
          settings.army.unitList.add(readUnitOfJSON(select));
        }
        if (select.name.contains("Formation")) {
          settings.army.battleFormationsList.add(
            readBattleFormationOfJSON(select),
          );
        }

        List<Selections> selectionsTwoList = [];
        //roster -> forces -> selections -> selectionsTwo
        for (Map<String, dynamic> selectionMapTwoJSON
        in select.selectionsDynamic) {
          Selections selectTwo = Selections(
            selectionMapTwoJSON["id"],
            selectionMapTwoJSON["name"],
          );

          if (selectionMapTwoJSON.containsKey("categories")) {
            for (Map<String, dynamic> entry
            in selectionMapTwoJSON["categories"]) {
              selectTwo.categoriesDynamic.add(entry);
            }
          }

          if (selectionMapTwoJSON.containsKey("profiles")) {
            for (Map<String, dynamic> entry
            in selectionMapTwoJSON["profiles"]) {
              selectTwo.profilesDynamic.add(entry);
            }
          }

          if (selectionMapTwoJSON.containsKey("selections")) {
            for (Map<String, dynamic> entry
            in selectionMapTwoJSON["selections"]) {
              selectTwo.selectionsDynamic.add(entry);
            }
          }

          if (selectionMapTwoJSON.containsKey("type")) {
            selectTwo.type = selectionMapTwoJSON["type"];
          }

          selectionsTwoList.add(selectTwo);
        }
        for (Selections selectTwo in selectionsTwoList) {
          if (selectTwo.type.contains("unit")) {
            settings.army.unitList.add(readUnitOfJSON(selectTwo));
          }
        }
      }
    }
    return settings;
  }

  Unit readUnitOfJSON(Selections mySelection) {
    Unit unit = Unit(mySelection.name);
    unit.id = mySelection.id;

    //Keywords befüllen, beim ersten wird der "-" ersetzt, weitere ergänzt
    bool firstKeyword = true;
    for (Map<String, dynamic> categoriesMapJSON
    in mySelection.categoriesDynamic) {
      if (categoriesMapJSON.containsKey("name")) {
        if (firstKeyword) {
          unit.keywords = categoriesMapJSON["name"];
          firstKeyword = false;
        } else {
          unit.keywords = unit.keywords + ", " + categoriesMapJSON["name"];
        }
      }
    }

    //Ab hier den Profiles Pfad paralell zu Selections bauen
    //roster -> forces -> forcesTwo -> selections -> profiles
    List<Profiles> profileList = [];
    for (Map<String, dynamic> unitMapJSON in mySelection.profilesDynamic) {
      Profiles profile = Profiles(unitMapJSON["id"], unitMapJSON["name"]);

      if (unitMapJSON.containsKey("characteristics")) {
        for (Map<String, dynamic> entry in unitMapJSON["characteristics"]) {
          profile.characteristics.add(entry);
        }
      }
      if (unitMapJSON.containsKey("typeName")) {
        profile.typeName = unitMapJSON["typeName"];
      }
      if (unitMapJSON.containsKey("attributes")) {
        for (Map<String, dynamic> entry in unitMapJSON["attributes"]) {
          profile.attributes.add(entry);
        }
      }
      profileList.add(profile);
    }

    //Characteristics für Units
    for (Profiles profile in profileList) {
      for (Map<String, dynamic> charMapJSON in profile.characteristics) {
        if (charMapJSON["name"].contains("Move")) {
          unit.move = charMapJSON["\$text"].toString();
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
        if (charMapJSON["name"].contains("Banishment")) {
          unit.banishment = charMapJSON["\$text"].toString();
        }
      }

      //--------------------------------------------------------------------
      if (profile.typeName.contains("Ability")) {
        bool abilityAlreadyAdded = false;
        unit = readUnitAbilityOfJSON(unit, profile, abilityAlreadyAdded);
      }

      if (profile.typeName.contains("Weapon")) {
        bool weaponNew = true;
        unit = readWeaponJSON(unit, profile, weaponNew);
      }

      List<Selections> selectTwoList = [];
      //Ab hier den Selections Pfad paralell zu Profiles bauen
      //roster -> forces -> forcesTwo -> selections -> selections
      for (Map<String, dynamic> selectionMapTwoJSON
      in mySelection.selectionsDynamic) {
        Selections selectTwo = Selections(
          selectionMapTwoJSON["id"],
          selectionMapTwoJSON["name"].toString(),
        );

        if (selectionMapTwoJSON.containsKey("selections")) {
          for (Map<String, dynamic> entry
          in selectionMapTwoJSON["selections"]) {
            selectTwo.selectionsDynamic.add(entry);
          }
        }

        if (selectionMapTwoJSON.containsKey("profiles")) {
          for (Map<String, dynamic> entry in selectionMapTwoJSON["profiles"]) {
            selectTwo.profilesDynamic.add(entry);
          }
        }

        if (selectionMapTwoJSON.containsKey("categories")) {
          for (Map<String, dynamic> entry
          in selectionMapTwoJSON["categories"]) {
            selectTwo.categoriesDynamic.add(entry);
          }
        }
        selectTwoList.add(selectTwo);
      }

      for (Selections selectTwo in selectTwoList) {
        //roster -> forces -> forcesTwo -> selections -> selectTwo -> profiles
        for (Map<String, dynamic> profileMapJSON in selectTwo.profilesDynamic) {
          Profiles profile = Profiles(
            profileMapJSON["id"],
            profileMapJSON["name"],
          );

          if (profileMapJSON.containsKey("characteristics")) {
            profile.characteristics = profileMapJSON["characteristics"];
          }
          if (profileMapJSON.containsKey("typeName")) {
            profile.typeName = profileMapJSON["typeName"];
          }
          if (profileMapJSON.containsKey("attributes")) {
            profile.attributes = profileMapJSON["attributes"];
          }

          bool weaponNew = true;
          if (profile.typeName.contains("Weapon")) {
            unit = readWeaponJSON(unit, profile, weaponNew);
          }

          bool abilityAlreadyAdded = false;
          if (profile.typeName.contains("Ability")) {
            //unit = readAbilityOfJSON(unit, profile);
            unit = readUnitAbilityOfJSON(unit, profile, abilityAlreadyAdded);
          }
        }

        for (Map<String, dynamic> catMap in selectTwo.categoriesDynamic) {
          if (catMap.containsKey("name")) {
            if (catMap["name"].contains("WIZARD")) {
              if (!unit.keywords.contains("WIZARD")) {
                unit.keywords = unit.keywords + ", " + catMap["name"];
              } else {
                unit.keywords = unit.keywords.replaceAll(
                  "WIZARD(1)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "WIZARD (1)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "WIZARD(2)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "WIZARD (2)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "WIZARD(3)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "WIZARD (3)",
                  catMap["name"],
                );
              }
            }
            if (catMap["name"].contains("PRIEST")) {
              if (!unit.keywords.contains("PRIEST")) {
                unit.keywords = unit.keywords + ", " + catMap["name"];
              } else {
                unit.keywords = unit.keywords.replaceAll(
                  "PRIEST(1)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "PRIEST (1)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "PRIEST(2)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "PRIEST (2)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "PRIEST(3)",
                  catMap["name"],
                );
                unit.keywords = unit.keywords.replaceAll(
                  "PRIEST (3)",
                  catMap["name"],
                );
              }
            }
          }
        }

        List<Selections> selectThreeList = [];
        //roster -> forces -> forcesTwo -> selections -> selectTwo -> selectThree
        for (Map<String, dynamic> selectionThreeMapJSON
        in selectTwo.selectionsDynamic) {
          Selections selectThree = Selections(
            selectionThreeMapJSON["id"],
            selectionThreeMapJSON["name"],
          );

          if (selectionThreeMapJSON.containsKey("profiles")) {
            for (Map<String, dynamic> entry
            in selectionThreeMapJSON["profiles"]) {
              selectThree.profilesDynamic.add(entry);
            }
          }
          if (selectionThreeMapJSON.containsKey("selections")) {
            for (Map<String, dynamic> entry
            in selectionThreeMapJSON["selections"]) {
              selectThree.selectionsDynamic.add(entry);
            }
          }
          selectThreeList.add(selectThree);
        }
        List<Selections> selectFourList = [];

        //roster -> forces -> forcesTwo -> selections -> selections -> selections -> profiles
        for (Selections selectThree in selectThreeList) {
          if (selectThree.name.contains("WIZARD") &&
              !unit.keywords.contains("WIZARD")) {
            unit.keywords = unit.keywords + ", " + selectThree.name;
          }
          if (selectThree.name.contains("PRIEST") &&
              !unit.keywords.contains("PRIEST")) {
            unit.keywords = unit.keywords + ", " + selectThree.name;
          }

          for (Map<String, dynamic> selectionFourMapJSON
          in selectThree.selectionsDynamic) {
            Selections selectFour = Selections(
              selectionFourMapJSON["id"],
              selectionFourMapJSON["name"],
            );

            if (selectionFourMapJSON.containsKey("profiles")) {
              for (Map<String, dynamic> entry
              in selectionFourMapJSON["profiles"]) {
                selectFour.profilesDynamic.add(entry);
              }
            }
            selectFourList.add(selectFour);
          }

          bool weaponNew = true;
          for (Map<String, dynamic> profileMapJSON
          in selectThree.profilesDynamic) {
            Profiles profile = Profiles(
              profileMapJSON["id"],
              profileMapJSON["name"],
            );

            if (profileMapJSON.containsKey("characteristics")) {
              profile.characteristics = profileMapJSON["characteristics"];
            }
            if (profileMapJSON.containsKey("typeName")) {
              profile.typeName = profileMapJSON["typeName"];
            }
            if (profileMapJSON.containsKey("attributes")) {
              profile.attributes = profileMapJSON["attributes"];
            }

            if (profile.typeName.contains("Weapon")) {
              unit = readWeaponJSON(unit, profile, weaponNew);
            }
            bool abilityAlreadyAdded = false;
            if (profile.typeName.contains("Ability")) {
              //unit = readAbilityOfJSON(unit, profile);
              unit = readUnitAbilityOfJSON(unit, profile, abilityAlreadyAdded);
            }
          }

          for (Selections selectFour in selectFourList) {
            bool weaponNew = true;
            for (Map<String, dynamic> profileMapJSON
            in selectFour.profilesDynamic) {
              Profiles profile = Profiles(
                profileMapJSON["id"],
                profileMapJSON["name"],
              );

              if (profileMapJSON.containsKey("characteristics")) {
                profile.characteristics = profileMapJSON["characteristics"];
              }
              if (profileMapJSON.containsKey("typeName")) {
                profile.typeName = profileMapJSON["typeName"];
              }
              if (profileMapJSON.containsKey("attributes")) {
                profile.attributes = profileMapJSON["attributes"];
              }

              if (profile.typeName.contains("Weapon")) {
                unit = readWeaponJSON(unit, profile, weaponNew);
              }
            }
          }
        }
      }
    }
    return unit;
  }

  Unit readUnitAbilityOfJSON(
      Unit unit,
      Profiles profile,
      bool abilityAlreadyAdded,
      ) {
    //Unit readAbilityOfJSON(Unit unit, Profiles profile) {
    Ability ability = Ability(profile.name);
    ability.id = profile.id;
    ability.typeName = profile.typeName;

    ////Characteristics für Abilitys
    for (Map<String, dynamic> charMapJSON in profile.characteristics) {
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
      if (charMapJSON["name"].contains("Casting Value")) {
        ability.castingValue = charMapJSON["\$text"].toString();
      }
      if (charMapJSON["name"].contains("Cost")) {
        ability.commandPoints = charMapJSON["\$text"].toString();
      }
    }
    ////Attributes für Abilitys
    for (Map<String, dynamic> attributesMapJSON in profile.attributes) {
      if (attributesMapJSON["name"].contains("Color")) {
        ability.color = attributesMapJSON["\$text"].toString();
      }
    }

    for (Ability abi in unit.abilitys) {
      if (abi.id == ability.id) {
        abilityAlreadyAdded = true;
      }
    }
    if (!abilityAlreadyAdded) {
      unit.abilitys.add(ability);
    }
    abilityAlreadyAdded = false;
    //unit.abilitys.add(ability);
    return unit;
  }

  Ability readAbilityOfJSON(Profiles profile) {
    Ability ability = Ability(profile.name);
    ability.id = profile.id;
    ability.typeName = profile.typeName;

    ////Characteristics für Abilitys
    for (Map<String, dynamic> charMapJSON in profile.characteristics) {
      if (charMapJSON["name"].contains("Timing")) {
        ability.timing = charMapJSON["\$text"].toString();
      }
      if (charMapJSON["name"].contains("Declare")) {
        ability.declare = charMapJSON["\$text"].toString();
      }
      if (charMapJSON["name"].contains("Effect")) {
        ability.effect = charMapJSON["\$text"].toString();
      }
      if (charMapJSON["name"].contains("Casting Value")) {
        ability.castingValue = charMapJSON["\$text"].toString();
      }
      if (charMapJSON["name"].contains("Keywords")) {
        ability.keywords = charMapJSON["\$text"].toString();
      }
      if (charMapJSON["name"].contains("Used By")) {
        ability.usedBy = charMapJSON["\$text"].toString();
      }
    }
    ////Attributes für Abilitys
    for (Map<String, dynamic> attributesMapJSON in profile.attributes) {
      if (attributesMapJSON["name"].contains("Color")) {
        ability.color = attributesMapJSON["\$text"].toString();
      }
    }
    return ability;
  }

  SpellLore readSpellLoreOfJSON(Selections select) {
    SpellLore spelllore = SpellLore();
    List<Selections> selectionsTwoList = [];

    for (Map<String, dynamic> selectionMapTwoJSON in select.selectionsDynamic) {
      Selections selectTwo = Selections(
        selectionMapTwoJSON["id"],
        selectionMapTwoJSON["name"],
      );

      //TODO Hier nochmal Selections durchsurchen für normales AoS (Debug ausführen mit Gordrak und Schweine)

      if (selectionMapTwoJSON.containsKey("categories")) {
        for (Map<String, dynamic> entry in selectionMapTwoJSON["categories"]) {
          selectTwo.categoriesDynamic.add(entry);
        }
      }

      if (selectionMapTwoJSON.containsKey("profiles")) {
        for (Map<String, dynamic> entry in selectionMapTwoJSON["profiles"]) {
          selectTwo.profilesDynamic.add(entry);
        }
      }

      if (selectionMapTwoJSON.containsKey("type")) {
        selectTwo.type = selectionMapTwoJSON["type"];
      }

      if (!selectTwo.type.contains("unit")) {
        selectionsTwoList.add(selectTwo);
      }
    }
    for (Selections selectTwo in selectionsTwoList) {
      for (Map<String, dynamic> profileMapJSON in selectTwo.profilesDynamic) {
        Profiles profile = Profiles(
          profileMapJSON["id"],
          profileMapJSON["name"],
        );

        if (profileMapJSON.containsKey("characteristics")) {
          profile.characteristics = profileMapJSON["characteristics"];
        }
        if (profileMapJSON.containsKey("attributes")) {
          profile.attributes = profileMapJSON["attributes"];
        }
        if (profileMapJSON.containsKey("typeName")) {
          profile.typeName = profileMapJSON["typeName"];
        }

        if (profile.typeName.contains("Ability")) {
          //unit = readAbilityOfJSON(unit, profile);
          Ability abi = readAbilityOfJSON(profile);
          spelllore.abilitys.add(abi);
        }
      }
    }
    return spelllore;
  }

  Unit readWeaponJSON(Unit unit, Profiles profile, bool weaponNew) {
    Weapon weapon = Weapon(profile.id, profile.name);

    //roster -> forces -> forcesTwo -> selections -> selections -> selections -> profiles -> characteristics
    for (Map<String, dynamic> weaponMapJSON in profile.characteristics) {
      if (weaponMapJSON["name"].contains("Rng")) {
        weapon.range = weaponMapJSON["\$text"].toString();
      }
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
    for (Weapon thisWeapon in unit.weapons) {
      if (thisWeapon.id == weapon.id) {
        weaponNew = false;
      }
    }
    if (weaponNew) {
      unit.weapons.add(weapon);
    }
    return unit;
  }

  List<BattleTraits> readBattleTrait(Selections select) {
    List<BattleTraits> battleTraitList = [];
    BattleTraits battleTrait = BattleTraits();

    //roster -> forces -> selections -> profiles
    for (Map<String, dynamic> profilesMapJSON in select.profilesDynamic) {
      Profiles profile = Profiles(
        profilesMapJSON["id"],
        profilesMapJSON["name"],
      );

      if (profilesMapJSON.containsKey("characteristics")) {
        profile.characteristics = profilesMapJSON["characteristics"];
      }
      if (profilesMapJSON.containsKey("attributes")) {
        profile.attributes = profilesMapJSON["attributes"];
      }
      if (profilesMapJSON.containsKey("typeName")) {
        profile.typeName = profilesMapJSON["typeName"];
      }

      if (profile.typeName.contains("Ability")) {
        Ability ability = readAbilityOfJSON(profile);

        battleTrait.abilitys.add(ability);
        print(
          "Battle-Trait Ausgabe: " + battleTrait.abilitys.length.toString(),
        );
      }
    }
    battleTraitList.add(battleTrait);
    return battleTraitList;
  }

  BattleFormation readBattleFormationOfJSON(Selections select) {
    BattleFormation battleFormation = BattleFormation();

    List<Selections> selectionsTwoList = [];

    for (Map<String, dynamic> selectionMapTwoJSON in select.selectionsDynamic) {
      Selections selectTwo = Selections(
        selectionMapTwoJSON["id"],
        selectionMapTwoJSON["name"],
      );

      if (selectionMapTwoJSON.containsKey("categories")) {
        for (Map<String, dynamic> entry in selectionMapTwoJSON["categories"]) {
          selectTwo.categoriesDynamic.add(entry);
        }
      }

      if (selectionMapTwoJSON.containsKey("profiles")) {
        for (Map<String, dynamic> entry in selectionMapTwoJSON["profiles"]) {
          selectTwo.profilesDynamic.add(entry);
        }
      }

      if (selectionMapTwoJSON.containsKey("type")) {
        selectTwo.type = selectionMapTwoJSON["type"];
      }

      if (!selectTwo.type.contains("unit")) {
        selectionsTwoList.add(selectTwo);
      }
    }
    for (Selections selectTwo in selectionsTwoList) {
      for (Map<String, dynamic> profileMapJSON in selectTwo.profilesDynamic) {
        Profiles profile = Profiles(
          profileMapJSON["id"],
          profileMapJSON["name"],
        );

        if (profileMapJSON.containsKey("characteristics")) {
          profile.characteristics = profileMapJSON["characteristics"];
        }
        if (profileMapJSON.containsKey("attributes")) {
          profile.attributes = profileMapJSON["attributes"];
        }
        if (profileMapJSON.containsKey("typeName")) {
          profile.typeName = profileMapJSON["typeName"];
        }

        if (profile.typeName.contains("Ability")) {
          //unit = readAbilityOfJSON(unit, profile);
          Ability abi = readAbilityOfJSON(profile);
          battleFormation.abilitys.add(abi);
        }
      }
    }
    return battleFormation;
  }

  SnackBar showSnackBar(String text) {
    return SnackBar(
      content: Text(text, style: TextStyle(color: calculateTextColor(Colors.red.shade800)),),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.red.shade800,
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  Settings addGuardedHeroAndSacredRites(Settings settings) {
    for (Unit unit in settings.army.unitList) {
      if (unit.keywords.contains("HERO")) {
        unit.abilitys.add(SpearheadGeneralSpells().getGuardedHero());
      }
      if (unit.keywords.contains("PRIEST")) {
        settings.army.spellLore.abilitys.add(SpearheadGeneralSpells().getSacredRites());
      }
    }

    return settings;
  }

}