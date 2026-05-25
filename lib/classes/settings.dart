import 'package:aos_battle_helper/classes/ability.dart';

import 'army.dart';
class Settings {
  Army army = Army("Beispiel-Armee-Name");
  int commandPoints = 4;
  List<Ability> commandAbilitys = [];
  List<Ability> normalAbilitys = [];
  String playerName = "Player 1";
  List<int> scoresPlayer1 = [0,0,0,0,0];
  List<int> scoresPlayer2 = [0,0,0,0,0];
  bool ownPhase = true;
  bool underdog = false;
  List<Ability> regimentAbilities = [];
  List<Ability> enhancements = [];
  Ability chosenEnhancement = Ability("AbilityToChoose");
  List<String> chosenBattleTactics = [];

  bool? firstBattleTacticAffray = false;
  bool? firstBattleTacticStrike = false;
  bool? firstBattleTacticDomination = false;

  bool? secondBattleTacticAffray = false;
  bool? secondBattleTacticStrike = false;
  bool? secondBattleTacticDomination = false;
}