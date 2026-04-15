import 'package:aos_battle_helper/classes/spell.dart';
class Unit {
  Unit(this.name);
  Unit.withSpells(this.name, this.spells);

  //Profiles
  String id = "-13";
  String name;
  List<Spell> spells = [];

  //Characteristics
  String move = "-1";
  String health = "-2";
  String save = "-3";
  String control = "-4";

  String details = "Details der Unit?";

  String imagePath = "";
}