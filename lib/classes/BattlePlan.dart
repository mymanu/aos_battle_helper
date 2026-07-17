import 'package:aos_battle_helper/classes/settings.dart';

import 'ability.dart';

class BattlePlan {

  Settings rissInAethelgard(Settings settings) {
    Ability throwDice = Ability("01 Throw the Dice");
    throwDice.typeName = "Ability (Activated)";
    throwDice.timing = "Once per Battle Round, Your Phase";
    throwDice.color = "Black";
    throwDice.declare = "Zu Beginn der Runde wirft der führende Spieler einen W3. Wenn es keinen führenden Spieler gibt, wirft einer der Spieler einen W3. "
        "Beide Spieler erhalten entsprechend des Wurfes Paradox Punkte (PP). Der Underdog erhält einen zusätzlichen Paradox Punkt (PP).";
    settings.normalAbilitys.insert(0, throwDice);

    Ability reminderChooseTactic = Ability("02 Tactic Reminder (PtG Runde 1)");
    reminderChooseTactic.typeName = "Ability (Passive)";
    reminderChooseTactic.timing = "Any Phase";
    reminderChooseTactic.color = "Black";
    reminderChooseTactic.effect =
    "Please choose one tactic to play for this Battle Round.";
    settings.normalAbilitys.insert(1, reminderChooseTactic);

    Ability abi = Ability("name");
    abi.name = "Das Kausale Paradoxon";
    abi.typeName = "Ability (Activated)";
    abi.timing = "Once per Phase, Any Phase";
    abi.color = "Black,Yellow,Gray,Blue,Orange,Red,Purple";
    abi.declare =
    "In einer Phase kann ein Spieler einen Paradox Punkt (PP) ausgeben um einen einzelnen Würfel des Gegners neuwerfen zu lassen. "
        "Pro Phase kann nur ein Punkt ausgegeben werden.";
    settings.normalAbilitys.add(abi);

    Ability aufstellungPtG1 = Ability("02 Aufstellung (PtG Runde 1)");
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
    //settings.normalAbilitys.add(aufstellungPtG1);
    settings.preparationSpells.insert(1, aufstellungPtG1);

    return settings;
  }

  Settings diePfadeSichern(Settings settings) {
    Ability throwDice = Ability("01 Throw the Dice");
    throwDice.typeName = "Ability (Activated)";
    throwDice.timing = "Once per Battle Round, Your Phase";
    throwDice.color = "Black";
    throwDice.declare = "Zu Beginn der Runde wirft der führende Spieler einen W3. Wenn es keinen führenden Spieler gibt, wirft einer der Spieler einen W3. "
        "Beide Spieler erhalten entsprechend des Wurfes Paradox Punkte (PP). Der Underdog erhält einen zusätzlichen Paradox Punkt (PP).";
    settings.normalAbilitys.insert(0, throwDice);

    Ability reminderChooseTactic = Ability("02 Tactic Reminder (PtG Runde 2)");
    reminderChooseTactic.typeName = "Ability (Passive)";
    reminderChooseTactic.timing = "Any Phase";
    reminderChooseTactic.color = "Black";
    reminderChooseTactic.effect =
    "Please choose one tactic to play for this Battle Round.";
    settings.normalAbilitys.insert(1, reminderChooseTactic);

    Ability abi = Ability("name");
    abi.name = "Das Kausale Paradoxon";
    abi.typeName = "Ability (Activated)";
    abi.timing = "Once per Phase, Any Phase";
    abi.color = "Black,Yellow,Gray,Blue,Orange,Red,Purple";
    abi.declare =
    "In einer Phase kann ein Spieler einen Paradox Punkt (PP) ausgeben um einen einzelnen Würfel des Gegners neuwerfen zu lassen. "
        "Pro Phase kann nur ein Punkt ausgegeben werden.";
    settings.normalAbilitys.add(abi);

    Ability aufstellungPtG2 = Ability("02 Aufstellung (PtG Runde 2)");
    aufstellungPtG2.typeName = "Ability (Passive)";
    aufstellungPtG2.color = "Teal";
    aufstellungPtG2.effect =
    "• Klassische Aufstellung an den langen Tischkanten."
        "\n• Die Aufstellungszonen sind jeweils 9 Zoll tief."
        "\n• **Missionsziele**: Platziert 4 Ankerpunkte (Missionsziele) in einer rechteckigen Formation auf dem Spielfeld:"
        "\n• **Zwei neutrale Ziele**: Liegen exakt auf der horizontalen Mittellinie, jeweils 12 Zoll von den linken und rechten Spielfeldrändern entfernt."
        "\n• **Zwei Heimat-Ziele**: Ein Ziel liegt genau auf der Grenze deiner eigenen Aufstellungszone (mittig zentriert), "
        "das andere exakt gegenüber auf der Grenze der gegnerischen Aufstellungszone."
        "\n• Das Spiel dauert maximal 5 Schlachtrunden.";
    //settings.normalAbilitys.add(aufstellungPtG2);
    settings.preparationSpells.insert(1, aufstellungPtG2);

    return settings;
  }
}