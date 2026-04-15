class Spell {
  Spell (this.title, this.phase, this.details);
  Spell.trigger (this.title, this.phase, this.trigger, this.details);

  String title;
  String trigger = "own phase";
  String phase;
  String originUnit = "";

  String details;
  bool erledigt = false;
}