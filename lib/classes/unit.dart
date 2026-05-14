import 'package:aos_battle_helper/classes/ability.dart';
import 'package:aos_battle_helper/classes/weapon.dart';
class Unit {
  Unit(this.name);
  Unit.withSpells(this.name, this.abilitys);

  //Profiles
  String id = "-";
  String name;
  List<Ability> abilitys = [];
  List<Weapon> weapons = [];

  //Characteristics
  String move = "-";
  String health = "-";
  String save = "-";
  String control = "-";

  String keywords = "-";

  String details = "Details der Unit?";
  String banishment = "-";
  bool erledigt = false;

  String imagePath = "";
}