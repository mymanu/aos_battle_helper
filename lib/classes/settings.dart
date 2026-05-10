import 'package:aos_battle_helper/classes/ability.dart';

import 'army.dart';
class Settings {
  Army army = Army("Beispiel-Armee-Name");
  int commandPoints = 4;
  List<Ability> commandAbilitys = [];
  List<Ability> normalAbilitys = [];
  String playerName = "Spieler 1";
  List<int> scoresPlayer1 = [0,0,0,0,0];
  List<int> scoresPlayer2 = [0,0,0,0,0];
  bool ownPhase = true;
  bool underdog = false;
}