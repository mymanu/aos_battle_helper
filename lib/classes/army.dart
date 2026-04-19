import 'package:aos_battle_helper/classes/battleTraits.dart';
import 'package:aos_battle_helper/classes/unit.dart';
class Army {
  Army(this.name);

  String name;
  List<Unit> unitList = [];
  List<BattleTraits> battleTraitsList = [];

  String imagePath = "";
}