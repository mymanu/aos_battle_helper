import '../classes/ability.dart';

class GeneralSpells {
  Ability getGuardedHero() {
    Ability guardedHero = Ability("Guarded Hero",);
    guardedHero.typeName = "Ability (Passive)";
    guardedHero.color = "Black";
    guardedHero.effect =
    "If this Hero is within the combat range of a friendly unit that is not a Hero:\n"
        "• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n"
        "• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.";
    return guardedHero;
  }
}