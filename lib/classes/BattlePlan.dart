import 'package:aos_battle_helper/classes/settings.dart';

import 'ability.dart';

class BattlePlan {

  Settings rissInAethelgard(Settings settings) {
    Ability abi = Ability("name");
    abi.name = "Das Kausale Paradoxon";
    abi.typeName = "Ability (Activated)";
    abi.timing = "Once per Phase, Any Phase";
    abi.color = "Black,Yellow,Gray,Blue,Orange,Red,Purple";
    abi.declare =
    "In einer Phase kann ein Spieler einen Paradox Punkt (PP) ausgeben um einen einzelnen Würfel des Gegners neuwerfen zu lassen. "
        "Pro Phase kann nur ein Punkt ausgegeben werden.";
    settings.normalAbilitys.add(abi);

    Ability throwDice = Ability("Throw the Dice");
    throwDice.typeName = "Ability (Activated)";
    throwDice.timing = "Once per Battle Round, Your Phase";
    throwDice.color = "Black";
    throwDice.declare = "Zu Beginn der Runde wirft der führende Spieler einen W3. Wenn es keinen führenden Spieler gibt, wirft einer der Spieler einen W3. "
        "Beide Spieler erhalten entsprechend des Wurfes Paradox Punkte (PP). Der Underdog erhält einen zusätzlichen Paradox Punkt (PP).";
    settings.normalAbilitys.add(throwDice);

    Ability aufstellungPtG1 = Ability("Path to Glory Runde 1: Aufstellung");
    aufstellungPtG1.typeName = "Ability (Passive)";
    aufstellungPtG1.color = "Teal";
    aufstellungPtG1.effect =
    "• Klassische Aufstellung an den langen Tischkanten."
        "\n• Die Aufstellungszonen sind jeweils 9 Zoll tief."
        "\n• Missionsziele: Platziert 3 Echo-Splitter (Missionsziele) exakt auf der Mittellinie des Tisches."
        "\n• Splitter Alpha: Genau im mathematischen Zentrum des Spielfelds."
        "\n• Splitter Beta: 12 Zoll links vom Zentrum auf der Mittellinie."
        "\n• Splitter Gamma: 12 Zoll rechts vom Zentrum auf der Mittellinie. "
        "\n• Das Spiel dauert maximal 5 Schlachtrunden.";
    settings.normalAbilitys.add(aufstellungPtG1);

    List<Ability> abis = [];

    Ability reminderChooseTactic = Ability("Path to Glory Runde 1: Tactic Reminder");
    reminderChooseTactic.typeName = "Ability (Passive)";
    reminderChooseTactic.timing = "Any Phase";
    reminderChooseTactic.color = "Black";
    reminderChooseTactic.effect =
    "Please choose one tactic to play for this Battle Round.";

    abis.add(reminderChooseTactic);
    settings.normalAbilitys.insertAll(0, abis);
    //settings.normalAbilitys.add(reminderChooseTactic);


    return settings;
  }

}