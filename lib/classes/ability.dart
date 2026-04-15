//import 'package:aos_battle_helper/classes/spell.dart';
class Ability {
  Ability(this.name);
  Ability.withSpells(this.name);

  //Profiles
  String id = "-13";
  String name;
  //List<Spell> spells = [];

  //Characteristics
  String timing = "-1";
  String declare = "-2";
  String effect = "-3";
  String keywords = "-4";
  String usedBy = "-5";

  //Attributes
  String color = "-6";
  String type = "-7";

  String details = "Details der Unit?";

  String imagePath = "";
}