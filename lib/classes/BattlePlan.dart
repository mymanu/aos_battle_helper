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

  Settings dieEingefroreneZitadelle(Settings settings) {
    Ability throwDice = Ability("01 Throw the Dice");
    throwDice.typeName = "Ability (Activated)";
    throwDice.timing = "Once per Battle Round, Any Phase";
    throwDice.color = "Black";
    throwDice.declare = "Zu Beginn der Runde wirft der führende Spieler einen W3. Wenn es keinen führenden Spieler gibt, wirft einer der Spieler einen W3. "
        "Beide Spieler erhalten entsprechend des Wurfes Paradox Punkte (PP). Der Underdog erhält einen zusätzlichen Paradox Punkt (PP).";
    settings.normalAbilitys.insert(0, throwDice);

    Ability reminderChooseTactic = Ability("02 Der Schicht-Impuls (PtG Runde 3)");
    reminderChooseTactic.typeName = "Ability (Activated)";
    reminderChooseTactic.timing = "Once per Battle Round, Any Phase";
    reminderChooseTactic.color = "Black";
    reminderChooseTactic.effect =
    "Die Instabilen Knoten verändern sich ständig. Der Underdog wirft einen Würfel. Bei einer 4+ darf der Underdog einen Knoten auswählen, dieser wird zum aktiven Knoten für diese Runde."
    "Bei einer 1-3 wird der Knoten der dem Würfelwurf entspricht der aktive Knoten.";
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

    Ability aufstellungPtG2 = Ability("02 Aufstellung (PtG Runde 3)");
    aufstellungPtG2.typeName = "Ability (Passive)";
    aufstellungPtG2.color = "Teal";
    aufstellungPtG2.effect =
    "**Format**: 1250 Punkte pro Armee.\n"
    "**Spielfeld**: Standard-Spielfeld (6x4 Fuß).\n"
    "**Aufstellung**: Diagonale Aufstellung. Zieht eine Linie von Ecke zu Ecke. Die Aufstellungszonen verlaufen parallel zu dieser Diagonale in einem Abstand von 12 Zoll zur Spielfeldmitte.\n"
    "**Missionsziele**: Platziert 3 Schicht-Knoten exakt auf der zentralen Diagonale:\n"
    "Auf der Diagonale werden in gleichen Abständen drei Konten verteilt. Einer in der Mitte, die anderen beiden jeweils 18 Zoll auf der Diagonalen entfernt von der Mitte. Gebt jedem Knoten eine Nummer von 1-3\n"
    "Das Paradox System bleibt bestehen wie in den vorherigen Runden."
        "\nDas Spiel dauert maximal 5 Schlachtrunden.";
    //settings.normalAbilitys.add(aufstellungPtG2);
    settings.preparationSpells.insert(1, aufstellungPtG2);


    Ability taktikPtG3 = Ability("03 Taktik wählen (PtG Runde 3)");
    taktikPtG3.typeName = "Ability (Passive)";
    taktikPtG3.color = "Teal";
    taktikPtG3.declare = "Jeder General wählt vor dem ersten Zug einen der folgenden 4 Pfade:";
    taktikPtG3.effect = "Pfad 1: „Meisterschaft der Zeitströme“ (Fokus: Kontroll- & Feldspiel)\n"
    "Für Generäle, die das Nadelöhr mathematisch besetzen und die Zitadelle dominieren wollen.\n\n"

    "Den Schicht-Knoten bündeln:\n"
    "Kontrolliere in einer beliebigen Schlachtrunde mindestens 2 Schicht-Knoten gleichzeitig am Ende deines Zugs. (+4 SP)\n\n"

    "Den Impuls erzwingen:\n"
    "Besetze in einer Runde den vom Underdog Aktivierten Knoten mit einer befreundeten Einheit, während sich mindestens eine feindliche Einheit in 6 Zoll Reichweite befindet. (+4 SP)\n\n"

    "Kausale Übernahme:\n"
    "Übernimm am Ende deines Zugs einen Schicht-Knoten, der zu Beginn deines Zugs dem Gegner gehörte. (+4 SP)\n\n"

    "**\n\n"

    "Pfad 2: „Kausale Zerschlagung“ (Fokus: Aggression & Entfaltung)\n"
    "Für Generäle, die die Zeit-Energie nutzen, um den Feind mit roher Gewalt zu zerschmettern.\n\n"

    "Schock im Zeitsturm:\n"
    "Füge einer feindlichen Einheit Schaden zu, die sich auf oder an (innerhalb 3 Zoll) einem Schicht-Knoten befindet. (+4 SP)\n\n"

    "Artefakt-Exekution:\n"
    "Vernichte eine gegnerische Einheit ODER den gegnerischen General in dem Zug, in dem du dein Stufe-2-Artefakt einsetzt. (+4 SP)\n\n"

    "Brechung der Anker:\n"
    "Vernichte im Laufe des Spiels insgesamt 2 gegnerische Einheiten im Umkreis von 6 Zoll um den zentralen Schicht-Knoten (Knoten 2). (+4 SP)\n\n"

    "**\n\n"

    "Pfad 3: „Chronos-Infiltration“ (Fokus: Mobilität & Raumgewinn)\n"
    "Für Generäle, die die verschobenen Zeitschichten nutzen, um den Feind zu umgehen.\n\n"

    "Flanken-Fluss:\n"
    "Beende deinen Spielzug mit mindestens zwei Einheiten vollständig in der gegnerischen Spielfeldhälfte. (+4 SP)\n\n"

    "Tiefen-Verankerung:\n"
    "Kontrolliere den Schicht-Knoten, der der gegnerischen Aufstellungszone am nächsten liegt, am Ende eines deiner Spielzüge. (+4 SP)\n\n"

    "Riss-Durchbruch:\n"
    "Bringe vor dem Ende von Schlachtrunde 4 deinen General oder ein MONSTER vollständig in die gegnerische Aufstellungszone. (+4 SP)\n\n"

    "**\n\n"

    "Pfad 4: „Präzise Rekalibrierung“ (Fokus: Taktische Zähigkeit & Konter)\n"
    "Für Generäle, die den feindlichen Ansturm aussitzen und im richtigen Moment zurückschlagen.\n\n"

    "Dem Zeitsturm trotzen:\n"
    "Eine deiner Einheiten erleidet auf einem Schicht-Knoten Schaden durch feindliche Attacken, hält das Ziel am Ende der Runde aber immer noch. (+4 SP)\n\n"

    "Paradoxer Gegenschlag:\n"
    "Setze eine Paradox-Aktion ein und vernichte in derselben Runde die gegnerische Einheit, die zuvor Schaden angerichtet hat. (+4 SP)\n\n"

    "Nadelöhr-Zentrum:\n"
    "Beende die 4. oder 5. Schlachtrunde mit der absoluten Kontrolle über den zentralen Schicht-Knoten (Knoten 2). (+4 SP)"

    "**";
    settings.preparationSpells.insert(2, taktikPtG3);

    return settings;
  }
}