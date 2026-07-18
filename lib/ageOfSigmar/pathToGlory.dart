import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/settings.dart';

class PathToGlory {

  Settings addOrrukLoot(Settings settings) {
    Ability chronoSpalta = Ability("Chrono-geschärfte Spaltaz");
    chronoSpalta.timing = "Once per Battle, Any Combat Phase";
    chronoSpalta.typeName = "Ability (Activated)";
    chronoSpalta.color = "Red";
    chronoSpalta.declare =
    "Declare: Choose **a** friendly **Ironjawz** unit to use this ability.";
    chronoSpalta.effect =
    "Effect: Erhöhe den **Rüstungsbrechenden** Wert (Rend) **all** ihrer **Nahkampfwaffen** für **diese Phase** um 1.";

    BattleFormation battleForm = BattleFormation();
    battleForm.abilitys.add(chronoSpalta);
    settings.army.battleFormationsList.add(battleForm);
    return settings;
  }

  Settings addSeraphonLoot(Settings settings) {
    Ability fragmentierteSternenkarte = Ability("Fragmentierte Sternenkarte");
    fragmentierteSternenkarte.timing = "Once per Battle, After Deployment";
    fragmentierteSternenkarte.typeName = "Ability (Activated)";
    fragmentierteSternenkarte.color = "Teal";
    fragmentierteSternenkarte.declare =
    "Declare: Choose a friendly **Serphon** unit to use this ability.";
    fragmentierteSternenkarte.effect =
    "Effect:  Einmal pro Spiel, nach der Aufstellung, aber vor dem ersten Zug, darf der "
        "**Seraphon-Spieler** eine seiner Einheiten bis zu **6\" weit** bewegen, um seine mathematische Position zu korrigieren.";

    BattleFormation battleForm = BattleFormation();
    battleForm.abilitys.add(fragmentierteSternenkarte);
    settings.army.battleFormationsList.add(battleForm);
    return settings;
  }
}