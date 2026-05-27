import '../classes/ability.dart';
import '../classes/settings.dart';

class SpearheadGeneralSpells {
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

  Settings addSpearheadSpells(Settings settings) {
    List<Ability> normalSpells = [];

    Ability reinforcements = Ability("Call for Reinforcements",);
    reinforcements.timing = "Once Per Turn, Your Movement Phase";
    reinforcements.typeName = "Ability (Activated)";
    reinforcements.color = "Gray";
    reinforcements.declare = "Pick a friendly REINFORCEMENTS unit that has been destroyed.";
    reinforcements.effect = "Set up an identical replacement unit on the battlefield, wholly within fiendly territory,"
          "wholly within 6\" of the battlefield edge and not in combat."
          "\nEach REINFORCEMENTS unit can only be replaced once. Replacement units cannot themselves be replaced.";
    normalSpells.add(reinforcements);

    Ability normalMove = Ability("Normal Move",);
    normalMove.timing = "Your Movement Phase";
    normalMove.typeName = "Ability (Activated)";
    normalMove.color = "Gray";
    normalMove.declare = "Pick a friendly unit that is not in combat to use this ability.";
    normalMove.effect = "That unit can move a distance up to its Move characteristic. That unit cannot move into combat during any part of that move.";
    normalSpells.add(normalMove);

    Ability run = Ability("Run",);
    run.timing = "Your Movement Phase";
    run.typeName = "Ability (Activated)";
    run.color = "Gray";
    run.declare = "Pick a friendly unit that is not in combat to use this ability.";
    run.effect = "Make a run roll of D6. That unit can move a distance up to its Move characteristic added to the"
          "run roll. That unit cannot move into combat during any part of that move.";
    normalSpells.add(run);

    Ability retreat = Ability("Retreat");
    retreat.timing = "Your Movement Phase";
    retreat.typeName = "Ability (Activated)";
    retreat.color = "Gray";
    retreat.declare = "Pick a friendly unit that is in combat to use this ability.";
    retreat.effect = "Inflict D3 mortal damage on that unit. That unit can move a distance up to its Move"
          "characteristic. That unit can move through the combat ranges of any enemy units but cannot end"
          "that move within an enemy unit’s combat range.";
    normalSpells.add(retreat);

    Ability shoot = Ability("Shoot");
    shoot.timing = "Your Shooting Phase";
    shoot.typeName = "Ability (Activated)";
    shoot.color = "Blue";
    shoot.declare = "Pick a friendly unit that has not used a Run or Retreat ability this turn to use this ability. Then, "
          "pick one or more enemy units as the target(s) of that unit’s attacks (see 16.0).";
    shoot.effect = "Resolve shooting attacks against the target unit(s).";
    normalSpells.add(shoot);

    Ability charge = Ability("Charge");
    charge.timing = "Your Charge Phase";
    charge.typeName = "Ability (Activated)";
    charge.color = "Orange";
    charge.declare = "Pick a friendly unit that is not in combat and has not used a Run or Retreat ability this turn"
          "to use this ability. Then, make a charge roll of 2D6.";
    charge.effect = "That unit can move a distance up to the value of the charge roll. That unit can move through the"
          "combat ranges of any enemy units and must end that move within ½\" of a visible enemy unit. If it does so,"
          "the unit using this ability has charged.";
    normalSpells.add(charge);

    Ability fight = Ability("Fight",);
    fight.timing = "Reaction: Opponent declared an ATTACK Ability";
    fight.typeName = "Ability (Activated)";
    fight.color = "Red";
    fight.declare = "Pick a friendly unit that is in combat or that charged this turn to use this ability. That unit can"
          "make a pile‑in move (see 15.4). Then, if that unit is in combat, you must pick one or more enemy units as"
          "the target(s) of that unit’s attacks (see 16.0).";
    fight.effect = "Resolve combat attacks against the target unit(s).";
    normalSpells.add(fight);

    settings.normalAbilitys = normalSpells;

    return settings;
  }
}