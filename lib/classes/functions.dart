import 'package:flutter/material.dart';

import 'package:aos_battle_helper/classes/settings.dart';
import 'package:aos_battle_helper/classes/unit.dart';
import '../widget/HomePage.dart';
import '../widget/WarScroll.dart';
import 'ability.dart';
import 'battleTraits.dart';
import 'package:aos_battle_helper/classes/battleFormation.dart';
import 'package:aos_battle_helper/classes/spellLore.dart';

class Functions {

  List<Ability> unitAbilitys(List<Unit>unitList, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Unit unit in unitList) {
      for (Ability ability in unit.abilitys) {
        if (ability.color.contains(phaseColorString)) {
          /*
          //Für Hard Coded Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              ownPhase) {
            ability.originUnit = unit.name;
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              !ownPhase) {
            ability.originUnit = unit.name;
            abilitys.add(ability);
          }
          //Für Hard Coded Spells Ende
          */

          //TODO Kann aktuell zu doppelten Spells führen -> Hard Coded anpassen, sodass nur noch JSON Version vorhanden ist
          //Für JSON Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive")) &&
              ownPhase) {
            ability.originUnit = unit.name;
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive")) &&
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

  List<Ability> spellLoreAbilitys(SpellLore spellLore, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Ability ability in spellLore.abilitys) {
      if (ability.color.contains(phaseColorString)) {
        /*
        //Für Hard Coded Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            ownPhase) {
          ability.originUnit = "Spell-Lore";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            !ownPhase) {
          ability.originUnit = "Spell-Lore";
          abilitys.add(ability);
        }
        //Für Hard Coded Spells Ende
         */
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive")) &&
            ownPhase) {
          ability.originUnit = "Spell-Lore";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive")) &&
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
          /*
          //Für Hard Coded Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              ownPhase) {
            ability.originUnit = "Battle-Trait";
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              !ownPhase) {
            ability.originUnit = "Battle-Trait";
            abilitys.add(ability);
          }
          //Für Hard Coded Spells Ende
          */
          //Für JSON Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive")) &&
              ownPhase) {
            ability.originUnit = "Battle-Trait";
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive")) &&
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

  List<Ability> battleFormationAbilitys(List<BattleFormation> battleFormationsList, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (BattleFormation battleFormation in battleFormationsList) {
      for (Ability ability in battleFormation.abilitys) {
        if (ability.color.contains(phaseColorString)) {
          /*
          //Für Hard Coded Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              ownPhase) {
            ability.originUnit = "Battle-Formation";
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.timing.contains("Passive")) &&
              !ownPhase) {
            ability.originUnit = "Battle-Formation";
            abilitys.add(ability);
          }
          //Für Hard Coded Spells Ende
          */
          //Für JSON Spells Anfang
          if ((ability.timing.contains("Your") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive")) &&
              ownPhase) {
            ability.originUnit = "Battle-Formation";
            abilitys.add(ability);
          }
          if ((ability.timing.contains("Enemy") ||
              ability.timing.contains("Any") ||
              ability.typeName.contains("Passive")) &&
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

  List<Ability> commandAbilitys(List<Ability> commandAbilitys, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Ability ability in commandAbilitys) {
      if (ability.color.contains(phaseColorString)) {
        /*
        //Für Hard Coded Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            ownPhase) {
          ability.originUnit = "Command-Ability";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            !ownPhase) {
          ability.originUnit = "Command-Ability";
          abilitys.add(ability);
        }
        //Für Hard Coded Spells Ende
        */
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive")) &&
            ownPhase) {
          ability.originUnit = "Command-Ability";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive")) &&
            !ownPhase) {
          ability.originUnit = "Command-Ability";
          abilitys.add(ability);
        }
        //Für JSON Spells Ende
      }
    }
    return abilitys;
  }

  List<Ability> normalAbilitys(List<Ability> normalAbilitys, String phaseColorString, bool ownPhase) {
    List<Ability> abilitys = [];
    for (Ability ability in normalAbilitys) {
      if (ability.color.contains(phaseColorString)) {
        /*
        //Für Hard Coded Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            ownPhase) {
          ability.originUnit = "Core-Ability";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.timing.contains("Passive")) &&
            !ownPhase) {
          ability.originUnit = "Core-Ability";
          abilitys.add(ability);
        }
        //Für Hard Coded Spells Ende
        */
        //Für JSON Spells Anfang
        if ((ability.timing.contains("Your") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive")) &&
            ownPhase) {
          ability.originUnit = "Core-Ability";
          abilitys.add(ability);
        }
        if ((ability.timing.contains("Enemy") ||
            ability.timing.contains("Any") ||
            ability.typeName.contains("Passive")) &&
            !ownPhase) {
          ability.originUnit = "Core-Ability";
          abilitys.add(ability);
        }
        //Für JSON Spells Ende
      }
    }
    return abilitys;
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
}