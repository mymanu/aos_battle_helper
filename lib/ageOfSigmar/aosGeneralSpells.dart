import '../classes/ability.dart';
import '../classes/settings.dart';

class aosGeneralSpells {
  Ability getChampion() {
    Ability champion = Ability("Champion",);
    champion.typeName = "Ability (Passive)";
    champion.color = "Red";
    champion.effect = "Add 1 to the Attacks characteristic of weapons used by champions in this unit";
    return champion;
  }
  Ability getStandardBearer() {
    Ability standardBearer = Ability("Standard Bearer",);
    standardBearer.typeName = "Ability (Passive)";
    standardBearer.color = "Purple";
    standardBearer.effect = "While this unit contains any standard bearers, add 1 to this unit’s control score.";
    return standardBearer;
  }

  Ability getWardSave() {
    Ability ward = Ability("Ward Save",);
    ward.typeName = "Ability (Passive)";
    ward.color = "Black";
    ward.effect = "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. "
        "If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.";
    return ward;
  }

  Ability getMusician() {
    Ability musician = Ability("Musician",);
    musician.typeName = "Ability (Passive)";
    musician.color = "Yellow";
    musician.effect = "While this unit contains any musicians, if it uses the ‘Rally’ command, you can make one additional rally roll of D6.";
  return musician;
  }

  Settings addCommandSpells(Settings settings) {
    List<Ability> commandSpells = [];

    Ability rally = Ability("Rally");
    rally.timing = "Any Hero Phase";
    rally.typeName = "Ability (Activated)";
    rally.color = "Yellow";
    rally.declare = "Declare: Choose a friendly unit which is not in combat to use this ability.";
    rally.effect = "Effect: Make 6x D6 Rallyroles. For each 4+ you gain 1 Rallypoint. You can use them as following:"
          "\n - Heal(1) this unit for each spent Rallypoint \n - You can use Rallypoints in the amount of health of 1 model to revive it.";
    rally.commandPoints = "1";
    commandSpells.add(rally);

    Ability magicalIntervention = Ability("Magical Intervention");
    magicalIntervention.timing = "Enemy Hero Phase";
    magicalIntervention.typeName = "Ability (Activated)";
    magicalIntervention.color = "Yellow";
    magicalIntervention.declare = "Declare: Pick a friendly Wizard or Priest to use this ability.";
    magicalIntervention.effect = "That friendly unit can use a Spell or Prayer ability (as appropriate) as if it were your hero phase. "
          "\nIf you do so, subtract 1 from casting rolls or chanting rolls made as part of that ability.";
    magicalIntervention.commandPoints = "1";
    commandSpells.add(magicalIntervention);

    Ability atTheDouble = Ability("At The Double");
    atTheDouble.timing = "Reaction: You declared a RUN Ability";
    atTheDouble.typeName = "Ability (Activated)";
    atTheDouble.color = "Gray";
    atTheDouble.declare = "Used By: The unit using that Run ability.";
    atTheDouble.effect = "Do not make a run roll as part of that Run ability. Instead, add 6\" to that unit’s Move characteristic to determine the distance each model"
          "in that unit can move as part of that Run ability.";
    atTheDouble.commandPoints = "1";
    commandSpells.add(atTheDouble);

    Ability redeploy = Ability("Redeploy");
    redeploy.timing = "Enemy Movement Phase";
    redeploy.typeName = "Ability (Activated)";
    redeploy.color = "Gray";
    redeploy.declare = "Pick a friendly unit that is not in combat to use this ability.";
    redeploy.effect = "Each model in that unit can move up to D6\"."
          "That move cannot pass through or end within the combat range of an enemy unit.";
    redeploy.commandPoints = "1";
    commandSpells.add(redeploy);

    Ability coveringFire = Ability("Covering Fire",);
    coveringFire.timing = "Enemy Shooting Phase";
    coveringFire.typeName = "Ability (Activated)";
    coveringFire.color = "Blue";
    coveringFire.declare = "Pick a friendly unit that is not in combat to use this ability.";
    coveringFire.effect = "Resolve shooting attacks for that unit, but all of the attacks must target the nearest visible enemy "
              "unit and you must subtract 1 from the hit rolls for those attacks.";
    coveringFire.commandPoints = "1";
    commandSpells.add(coveringFire);

    Ability forwardToVictory = Ability("Forward To Victory",);
    forwardToVictory.timing = "Reaction: You declared a CHARGE Ability";
    forwardToVictory.typeName = "Ability (Activated)";
    forwardToVictory.color = "Orange";
    forwardToVictory.declare = "Used By: The unit using that Charge ability.";
    forwardToVictory.effect = "You can re-roll the charge roll.";
    forwardToVictory.commandPoints = "1";
    commandSpells.add(forwardToVictory);

    Ability counterCharge = Ability("Counter-Charge",);
    counterCharge.timing = "Enemy Charge Phase";
    counterCharge.typeName = "Ability (Activated)";
    counterCharge.color = "Orange";
    counterCharge.declare = "Used By: The unit using that Charge ability.";
    counterCharge.effect = "You can re-roll the charge roll.";
    counterCharge.commandPoints = "2";
    commandSpells.add(counterCharge);

    Ability allOutAttack = Ability("All-Out Attack",);
    allOutAttack.timing = "Reaction: You declared an ATTACK Ability";
    allOutAttack.typeName = "Ability (Activated)";
    allOutAttack.color = "Red";
    allOutAttack.declare = "Used By: The unit using that Attack ability.";
    allOutAttack.effect = "Add 1 to hit rolls for attacks made as part of that Attack ability."
        "This also affects weapons that have the Companion weapon ability.";
    allOutAttack.commandPoints = "1";
    commandSpells.add(allOutAttack);

    Ability allOutDefence = Ability("All-Out Defence",);
    allOutDefence.timing = "Reaction: Opponent declared an ATTACK Ability";
    allOutDefence.typeName = "Ability (Activated)";
    allOutDefence.color = "Red";
    allOutDefence.declare = "Used By: A unit targeted by that Attack ability.";
    allOutDefence.effect = "Effect: Add 1 to save rolls for that unit in this phase.";
    allOutDefence.commandPoints = "1";
    commandSpells.add(allOutDefence);

    Ability powerThrough = Ability("Power Through",);
    powerThrough.timing = "End of Any Turn";
    powerThrough.typeName = "Ability (Activated)";
    powerThrough.color = "Purple";
    powerThrough.declare = "Declare: Pick a friendly unit that charged this turn"
          "to use this ability, then you must pick an enemy unit "
          "in combat with it to be the target. The target must"
          "have a lower Health characteristic than the unit"
          "using this ability.";
    powerThrough.effect = "Inflict D3 mortal damage on the target. Then,"
          "the unit using this ability can move a distance up to"
          "its Move characteristic. It can pass through and end"
          "that move within the combat ranges of enemy units"
          "that were in combat with it at the start of the move,"
          "but not those of other enemy units. It does not have"
          "to end the move in combat.";
    powerThrough.commandPoints = "1";
    commandSpells.add(powerThrough);

    settings.commandAbilitys = commandSpells;

    return settings;
  }

  Settings addNormalSpells(Settings settings) {
    List<Ability> normalSpells = [];

    Ability activatePlaceOfPower = Ability("Activate Place Of Power",);
    activatePlaceOfPower.timing = "Start of Any Turn";
    activatePlaceOfPower.typeName = "Ability (Activated)";
    activatePlaceOfPower.color = "Black";
    activatePlaceOfPower.declare = "Pick a friendly Hero within 3\" of any Places of Power to use this ability.";
    activatePlaceOfPower.effect = "Roll a dice. On a 1, inflict D3 mortal damage on that Hero. On a 2+:"
          "\n• If that Hero is a Wizard or Priest, add 1 to casting rolls or chanting rolls for that Hero this turn."
          "\n• If that Hero is not a Wizard or Priest, they can use the ‘Unbind’ or ‘Banish Manifestation’ ability this turn as if they had Wizard (1).";
    normalSpells.add(activatePlaceOfPower);

    Ability banishManifestation = Ability("Banish Manifestation",);
    banishManifestation.timing = "Your Hero Phase";
    banishManifestation.typeName = "Ability (Activated)";
    banishManifestation.color = "Yellow";
    banishManifestation.declare = "Pick a friendly Wizard or Priest to use this ability, pick a manifestation within 30\" of them"
          "to be the target, then make a banishment roll of 2D6.";
    banishManifestation.effect = "If the banishment roll equals or exceeds the banishment value listed on the manifestation’s"
          "warscroll, it is banished and removed from play. You cannot pick the same manifestation as the target of this ability more than once per turn.";
    normalSpells.add(banishManifestation);

    Ability unbind = Ability("Unbind",);
    unbind.timing = "Reaction: Opponent declared a SPELL ability";
    unbind.typeName = "Ability (Activated)";
    unbind.color = "Yellow";
    unbind.declare = "Used By: A friendly Wizard within 30\" of the enemy Wizard casting the spell.";
    unbind.typeName = "Make an unbinding roll of 2D6. If the roll exceeds the casting roll for the spell, then the spell is"
          "unbound and its effect is not resolved. This reaction cannot be used more than once per casting roll.";;
    normalSpells.add(unbind);

    Ability normalMove = Ability("Normal Move",);
    normalMove.timing = "Your Movement Phase";
    normalMove.typeName = "Ability (Activated)";
    normalMove.color = "Gray";
    normalMove.declare = "Pick a friendly unit that is not in combat to use this ability.";
    normalMove.effect = "That unit can move a distance up to its Move characteristic. That unit cannot move into combat"
          "during any part of that move.";
    normalSpells.add(normalMove);

    Ability run = Ability("Run",);
    run.timing = "Your Movement Phase";
    run.typeName = "Ability (Activated)";
    run.color = "Gray";
    run.declare = "Pick a friendly unit that is not in combat to use this ability.";
    run.color = "Make a run roll of D6. That unit can move a distance up to its Move characteristic added to the"
          "run roll. That unit cannot move into combat during any part of that move.";
    normalSpells.add(run);

    Ability retreat = Ability("Retreat",);
    retreat.timing = "Your Movement Phase";
    retreat.typeName = "Ability (Activated)";
    retreat.color = "Gray";
    retreat.declare = "Pick a friendly unit that is in combat to use this ability.";
    retreat.effect = "Inflict D3 mortal damage on that unit. That unit can move a distance up to its Move"
          "characteristic. That unit can move through the combat ranges of any enemy units but cannot end"
          "that move within an enemy unit’s combat range.";
    normalSpells.add(retreat);

    Ability shoot = Ability("Shoot",);
    shoot.timing = "Your Shooting Phase";
    shoot.typeName = "Ability (Activated)";
    shoot.color = "Blue";
    shoot.declare = "Pick a friendly unit that has not used a Run or Retreat ability this turn to use this ability. "
        "Then, pick one or more enemy units as the target(s) of that unit’s attacks (see 16.0).";
    shoot.effect = "Resolve shooting attacks against the target unit(s).";
    normalSpells.add(shoot);

    Ability charge = Ability("Charge",);
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