import 'package:aos_battle_helper/classes/ability.dart';
import 'package:aos_battle_helper/classes/weapon.dart';
class Unit {
  Unit(this.name);
  Unit.withSpells(this.name, this.abilitys);

  //Profiles
  String id = "-13";
  String name;
  List<Ability> abilitys = [];
  List<Weapon> weapons = [];

  //Characteristics
  String move = "-1";
  String health = "-2";
  String save = "-3";
  String control = "-4";

  String details = "Details der Unit?";

  String imagePath = "";
}