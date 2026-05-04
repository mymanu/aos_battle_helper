import 'package:aos_battle_helper/classes/battleTraits.dart';
import 'package:aos_battle_helper/classes/spellLore.dart';
import 'package:aos_battle_helper/classes/unit.dart';

import 'battleFormation.dart';
class Army {
  Army(this.name);

  String name;
  List<Unit> unitList = [];
  List<BattleTraits> battleTraitsList = [];
  List<BattleFormation> battleFormationsList = [];
  SpellLore spellLore = SpellLore();

  String imagePath = "";
}