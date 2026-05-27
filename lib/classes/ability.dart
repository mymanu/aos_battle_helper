class Ability {
  Ability(this.name);

  //Ability.example(this.name, this.timing, this.details);
  //Ability.color(this.name, this.timing, this.color, this.details);

  /*
 typeName: Ability (Activated)
 typeName: Ability (Passive)
  */

  //Profiles
  String id = "-";
  String name;

  //List<Spell> spells = [];

  //Characteristics
  String timing = "-";
  String declare = "-1";
  String effect = "-1";
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
