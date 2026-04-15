import 'package:aos_battle_helper/classes/spell.dart';
import 'package:aos_battle_helper/classes/unit.dart';
class Army {
  Army(this.name);

  String name;
  List<Unit> units = [];

  String imagePath = "";
}