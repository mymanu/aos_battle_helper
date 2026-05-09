class Ability {
  Ability(this.name);

  Ability.example(this.name, this.timing, this.details);
  Ability.color(this.name, this.timing, this.color, this.details);

  /*
 Spell (this.title, this.phase, this.details);
  Spell.trigger (this.title, this.phase, this.trigger, this.details);
  */

  //Profiles
  String id = "-";
  String name;

  //List<Spell> spells = [];

  //Characteristics
  String timing = "-";
  String declare = "-";
  String effect = "-";
  String keywords = "-";
  String usedBy = "-";

  //Attributes
  String color = "-";
  String typeName = "-";

  String details = "Details der Unit?";
  String castingValue = "-";

  bool erledigt = false;
  String originUnit = "Nobody";
  String commandPoints = "-";

  String imagePath = "";
}
