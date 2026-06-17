import 'package:aos_battle_helper/classes/settings.dart';

import 'ability.dart';

class BattlePlan {

  Settings rissInAethelgard(Settings settings) {
    //for (int x = 0; x < 5; x++) {
    Ability abi = Ability("name");
    abi.name = "Das Kausale Paradoxon";
    abi.typeName = "Ability (Activated)";
    abi.timing = "Once per Phase, Any Phase";
    abi.color = "Black,Yellow,Gray,Blue,Orange,Red,Purple";
    abi.declare =
    "In einer Phase kann ein Spieler einen Paradox Punkt ausgeben um einen einzelnen Würfel des Gegners neuwerfen zu lassen. "
        "Pro Phase kann nur ein Punkt ausgegeben werden.";
    /*
      switch (x) {
        case 0:
          abi.color = "Black";
          break;
        case 1:
          abi.color = "Yellow";
          break;
        case 2:
          abi.color = "Grey";
          break;
      }*/
    settings.normalAbilitys.add(abi);
    //}

    Ability throwDice = Ability("Throw the Dice");
    throwDice.typeName = "Ability (Activated)";
    throwDice.timing = "Once per Battle Round, Your Phase";
    throwDice.color = "Black";
    throwDice.declare = "Zu Beginn der Runde wirft der führende Spieler einen W3. Wenn es keinen führenden Spieler gibt, wirft einer der Spieler einen W3. "
        "Beide Spieler erhalten entsprechend des Wurfes Paradox Punkte. Der Underdog erhält einen zusätzlichen Paradox Punkt.";

    settings.normalAbilitys.add(throwDice);

    return settings;
  }

}