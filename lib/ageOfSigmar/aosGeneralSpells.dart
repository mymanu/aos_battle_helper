import '../classes/ability.dart';
import '../classes/settings.dart';

class aosGeneralSpells {
  Ability getChampion() {
    Ability champion = Ability("Champion");
    champion.typeName = "Ability (Passive)";
    champion.color = "Red";
    champion.effect =
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit";
    return champion;
  }

  Ability getStandardBearer() {
    Ability standardBearer = Ability("Standard Bearer");
    standardBearer.typeName = "Ability (Passive)";
    standardBearer.color = "Purple";
    standardBearer.effect =
        "While this unit contains any standard bearers, add 1 to this unit’s control score.";
    return standardBearer;
  }

  Ability getWardSave() {
    Ability ward = Ability("Ward Save");
    ward.typeName = "Ability (Passive)";
    ward.color = "Black";
    ward.effect =
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. "
        "If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.";
    return ward;
  }

  Ability getMusician() {
    Ability musician = Ability("Musician");
    musician.typeName = "Ability (Passive)";
    musician.color = "Yellow";
    musician.effect =
        "While this unit contains any musicians, if it uses the ‘Rally’ command, you can make one additional rally roll of D6.";
    return musician;
  }

  Settings addCommandSpells(Settings settings) {
    List<Ability> commandSpells = [];

    Ability rally = Ability("Rally");
    rally.timing = "Any Hero Phase";
    rally.typeName = "Ability (Activated)";
    rally.color = "Yellow";
    rally.declare =
        "Declare: Choose a friendly unit which is not in combat to use this ability.";
    rally.effect =
        "Effect: Make 6x D6 Rallyroles. For each 4+ you gain 1 Rallypoint. You can use them as following:"
        "\n - Heal(1) this unit for each spent Rallypoint \n - You can use Rallypoints in the amount of health of 1 model to revive it.";
    rally.commandPoints = "1";
    commandSpells.add(rally);

    Ability magicalIntervention = Ability("Magical Intervention");
    magicalIntervention.timing = "Enemy Hero Phase";
    magicalIntervention.typeName = "Ability (Activated)";
    magicalIntervention.color = "Yellow";
    magicalIntervention.declare =
        "Declare: Pick a friendly Wizard or Priest to use this ability.";
    magicalIntervention.effect =
        "That friendly unit can use a Spell or Prayer ability (as appropriate) as if it were your hero phase. "
        "\nIf you do so, subtract 1 from casting rolls or chanting rolls made as part of that ability.";
    magicalIntervention.commandPoints = "1";
    commandSpells.add(magicalIntervention);

    Ability atTheDouble = Ability("At The Double");
    atTheDouble.timing = "Reaction: You declared a RUN Ability";
    atTheDouble.typeName = "Ability (Activated)";
    atTheDouble.color = "Gray";
    atTheDouble.declare = "Used By: The unit using that Run ability.";
    atTheDouble.effect =
        "Do not make a run roll as part of that Run ability. Instead, add 6\" to that unit’s Move characteristic to determine the distance each model"
        "in that unit can move as part of that Run ability.";
    atTheDouble.commandPoints = "1";
    commandSpells.add(atTheDouble);

    Ability redeploy = Ability("Redeploy");
    redeploy.timing = "Enemy Movement Phase";
    redeploy.typeName = "Ability (Activated)";
    redeploy.color = "Gray";
    redeploy.declare =
        "Pick a friendly unit that is not in combat to use this ability.";
    redeploy.effect =
        "Each model in that unit can move up to D6\"."
        "That move cannot pass through or end within the combat range of an enemy unit.";
    redeploy.commandPoints = "1";
    commandSpells.add(redeploy);

    Ability coveringFire = Ability("Covering Fire");
    coveringFire.timing = "Enemy Shooting Phase";
    coveringFire.typeName = "Ability (Activated)";
    coveringFire.color = "Blue";
    coveringFire.declare =
        "Pick a friendly unit that is not in combat to use this ability.";
    coveringFire.effect =
        "Resolve shooting attacks for that unit, but all of the attacks must target the nearest visible enemy "
        "unit and you must subtract 1 from the hit rolls for those attacks.";
    coveringFire.commandPoints = "1";
    commandSpells.add(coveringFire);

    Ability forwardToVictory = Ability("Forward To Victory");
    forwardToVictory.timing = "Reaction: You declared a CHARGE Ability";
    forwardToVictory.typeName = "Ability (Activated)";
    forwardToVictory.color = "Orange";
    forwardToVictory.declare = "Used By: The unit using that Charge ability.";
    forwardToVictory.effect = "You can re-roll the charge roll.";
    forwardToVictory.commandPoints = "1";
    commandSpells.add(forwardToVictory);

    Ability counterCharge = Ability("Counter-Charge");
    counterCharge.timing = "Enemy Charge Phase";
    counterCharge.typeName = "Ability (Activated)";
    counterCharge.color = "Orange";
    counterCharge.declare = "Used By: The unit using that Charge ability.";
    counterCharge.effect = "You can re-roll the charge roll.";
    counterCharge.commandPoints = "2";
    commandSpells.add(counterCharge);

    Ability allOutAttack = Ability("All-Out Attack");
    allOutAttack.timing = "Reaction: You declared an ATTACK Ability";
    allOutAttack.typeName = "Ability (Activated)";
    allOutAttack.color = "Green";
    allOutAttack.declare = "Used By: The unit using that Attack ability.";
    allOutAttack.effect =
        "Add 1 to hit rolls for attacks made as part of that Attack ability."
        "This also affects weapons that have the Companion weapon ability.";
    allOutAttack.commandPoints = "1";
    commandSpells.add(allOutAttack);

    Ability allOutDefence = Ability("All-Out Defence");
    allOutDefence.timing = "Reaction: Opponent declared an ATTACK Ability";
    allOutDefence.typeName = "Ability (Activated)";
    allOutDefence.color = "Green";
    allOutDefence.declare = "Used By: A unit targeted by that Attack ability.";
    allOutDefence.effect =
        "Effect: Add 1 to save rolls for that unit in this phase.";
    allOutDefence.commandPoints = "1";
    commandSpells.add(allOutDefence);

    Ability powerThrough = Ability("Power Through");
    powerThrough.timing = "End of Any Turn";
    powerThrough.typeName = "Ability (Activated)";
    powerThrough.color = "Purple";
    powerThrough.declare =
        "Declare: Pick a friendly unit that charged this turn"
        "to use this ability, then you must pick an enemy unit "
        "in combat with it to be the target. The target must"
        "have a lower Health characteristic than the unit"
        "using this ability.";
    powerThrough.effect =
        "Inflict D3 mortal damage on the target. Then,"
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

    Ability activatePlaceOfPower = Ability("Activate Place Of Power");
    activatePlaceOfPower.timing = "Start of Any Turn";
    activatePlaceOfPower.typeName = "Ability (Activated)";
    activatePlaceOfPower.color = "Black";
    activatePlaceOfPower.declare =
        "Pick a friendly Hero within 3\" of any Places of Power to use this ability.";
    activatePlaceOfPower.effect =
        "Roll a dice. On a 1, inflict D3 mortal damage on that Hero. On a 2+:"
        "\n• If that Hero is a Wizard or Priest, add 1 to casting rolls or chanting rolls for that Hero this turn."
        "\n• If that Hero is not a Wizard or Priest, they can use the ‘Unbind’ or ‘Banish Manifestation’ ability this turn as if they had Wizard (1).";
    normalSpells.add(activatePlaceOfPower);

    Ability banishManifestation = Ability("Banish Manifestation");
    banishManifestation.timing = "Your Hero Phase";
    banishManifestation.typeName = "Ability (Activated)";
    banishManifestation.color = "Yellow";
    banishManifestation.declare =
        "Pick a friendly Wizard or Priest to use this ability, pick a manifestation within 30\" of them"
        "to be the target, then make a banishment roll of 2D6.";
    banishManifestation.effect =
        "If the banishment roll equals or exceeds the banishment value listed on the manifestation’s"
        "warscroll, it is banished and removed from play. You cannot pick the same manifestation as the target of this ability more than once per turn.";
    normalSpells.add(banishManifestation);

    Ability unbind = Ability("Unbind");
    unbind.timing = "Reaction: Opponent declared a SPELL ability";
    unbind.typeName = "Ability (Activated)";
    unbind.color = "Yellow";
    unbind.declare =
        "Used By: A friendly Wizard within 30\" of the enemy Wizard casting the spell.";
    unbind.typeName =
        "Make an unbinding roll of 2D6. If the roll exceeds the casting roll for the spell, then the spell is"
        "unbound and its effect is not resolved. This reaction cannot be used more than once per casting roll.";
    ;
    normalSpells.add(unbind);

    Ability normalMove = Ability("Normal Move");
    normalMove.timing = "Your Movement Phase";
    normalMove.typeName = "Ability (Activated)";
    normalMove.color = "Gray";
    normalMove.declare =
        "Pick a friendly unit that is not in combat to use this ability.";
    normalMove.effect =
        "That unit can move a distance up to its Move characteristic. That unit cannot move into combat"
        "during any part of that move.";
    normalSpells.add(normalMove);

    Ability run = Ability("Run");
    run.timing = "Your Movement Phase";
    run.typeName = "Ability (Activated)";
    run.color = "Gray";
    run.declare =
        "Pick a friendly unit that is not in combat to use this ability.";
    run.color =
        "Make a run roll of D6. That unit can move a distance up to its Move characteristic added to the"
        "run roll. That unit cannot move into combat during any part of that move.";
    normalSpells.add(run);

    Ability retreat = Ability("Retreat");
    retreat.timing = "Your Movement Phase";
    retreat.typeName = "Ability (Activated)";
    retreat.color = "Gray";
    retreat.declare =
        "Pick a friendly unit that is in combat to use this ability.";
    retreat.effect =
        "Inflict D3 mortal damage on that unit. That unit can move a distance up to its Move"
        "characteristic. That unit can move through the combat ranges of any enemy units but cannot end"
        "that move within an enemy unit’s combat range.";
    normalSpells.add(retreat);

    Ability shoot = Ability("Shoot");
    shoot.timing = "Your Shooting Phase";
    shoot.typeName = "Ability (Activated)";
    shoot.color = "Blue";
    shoot.declare =
        "Pick a friendly unit that has not used a Run or Retreat ability this turn to use this ability. "
        "Then, pick one or more enemy units as the target(s) of that unit’s attacks (see 16.0).";
    shoot.effect = "Resolve shooting attacks against the target unit(s).";
    normalSpells.add(shoot);

    Ability charge = Ability("Charge");
    charge.timing = "Your Charge Phase";
    charge.typeName = "Ability (Activated)";
    charge.color = "Orange";
    charge.declare =
        "Pick a friendly unit that is not in combat and has not used a Run or Retreat ability this turn"
        "to use this ability. Then, make a charge roll of 2D6.";
    charge.effect =
        "That unit can move a distance up to the value of the charge roll. That unit can move through the"
        "combat ranges of any enemy units and must end that move within ½\" of a visible enemy unit. If it does so,"
        "the unit using this ability has charged.";
    normalSpells.add(charge);

    Ability fight = Ability("Fight");
    fight.timing = "Reaction: Opponent declared an ATTACK Ability";
    fight.typeName = "Ability (Activated)";
    fight.color = "Red";
    fight.declare =
        "Pick a friendly unit that is in combat or that charged this turn to use this ability. That unit can"
        "make a pile‑in move (see 15.4). Then, if that unit is in combat, you must pick one or more enemy units as"
        "the target(s) of that unit’s attacks (see 16.0).";
    fight.effect = "Resolve combat attacks against the target unit(s).";
    normalSpells.add(fight);

    settings.normalAbilitys = normalSpells;
    return settings;
  }

  Settings aosPreparationSpells(Settings settings) {
    List<Ability> aosPreparationSpells = [];

    Ability preBattleSequence = Ability("Pre-Battle Sequence");
    preBattleSequence.typeName = "Ability (Passive)";
    preBattleSequence.color = "Teal";
    preBattleSequence.effect =
        "• The players have to pick a battleplan as scenario for this battle."
        "\n• The players have to prepare the battlefield according to the battleplan (territories, objectives, terrain)."
        "\n• Roll off. The winner decides which territory belongs to which player. The opponent decides which player begins deployment.";
    aosPreparationSpells.add(preBattleSequence);

    Ability startBattleRoundSequence = Ability(
      "Start of Battle Round Sequence",
    );
    startBattleRoundSequence.typeName = "Ability (Passive)";
    startBattleRoundSequence.color = "Teal";
    startBattleRoundSequence.effect =
        "1. Determine the Active Player:"
        "\n• First battle round: The player who finished setting up the army first, chooses who takes the first turn."
        "\n• Later battle rounds: Players make a priority roll and the winner decides who starts (Core Rules, 12.0)."
        "\n• If the roll-off is a tie, the player who took the first turn in the previous battle round decides who is first next (= active player)."
        "\n2. Determine the Underdog: "
        "\nThe player with fewest victory points is the underdog for this battle round (Core Rules, 12.0)."
        "\nThere is no underdog, if the players are tie (equal victory points)."
        "\n3. Start of Battle Round Abilities:"
        "\n The active player can use any  Start of Battle Round  abilities  first, then their opponent can do the same.";
    aosPreparationSpells.add(startBattleRoundSequence);

    Ability deployment = Ability("Deployment");
    deployment.typeName = "Ability (Passive)";
    deployment.color = "Teal";
    deployment.effect =
        "• Some factions have faction terrain features, which have their own warscrolls and are set up using Deploy Terrain abilities."
        "\nThe player who begins deployment, must use Deploy Terrain abilities  first, followed by their opponent."
        "\n• The beginner sets up one regiment, then the opponent set one regiment, and so on."
        "\n• Once one player has no more Deploy abilities to use, "
        "their opponent must continue to use Deploy abilities until they also have no more to use."
        "\n• After both players have finished deploying their units,"
        "the player who begins deployment can use any  Deployment Phase  abilities, that are not Deploy or Deploy Terrain abilities,"
        "in the order of their choosing,  abilities, in the order of their choosing, then their opponent can do the same.";
    aosPreparationSpells.add(deployment);

    Ability deployUnit = Ability("Deploy Unit");
    deployUnit.typeName = "Ability (Passive)";
    deployUnit.color = "Teal";
    deployUnit.declare =
        "Pick a unit from your army roster that has not been deployed to be the target.";
    deployUnit.effect =
        "Set up the target unit wholly within friendly territory and more than 9\" from enemy territory. "
        "\nAfter you have done so, it has been deployed.";
    aosPreparationSpells.add(deployUnit);

    Ability deployFactionTerrain = Ability("Deploy Faction Terrain");
    deployFactionTerrain.typeName = "Ability (Passive)";
    deployFactionTerrain.color = "Teal";
    deployFactionTerrain.declare =
        "Pick a friendly faction terrain feature that has not been deployed to be the target.";
    deployFactionTerrain.effect =
        "Set up the target faction terrain feature wholly within friendly territory, more than 3\" from "
        "all objectives and other terrain features. After you have done so, it has been deployed.";
    aosPreparationSpells.add(deployFactionTerrain);

    Ability deployRegiment = Ability("Deploy Regiment");
    deployRegiment.typeName = "Ability (Passive)";
    deployRegiment.color = "Teal";
    deployRegiment.declare =
        "Pick a regiment from your army  roster to be the target. "
        "\nNo units in that regiment can have already been deployed.";
    deployRegiment.effect =
        "Keep using Deploy abilities without alternating until all units in that regiment have been deployed. "
        "\nYou cannot pick units that are not in that regiment as the target of any of those Deploy abilities."
        "\n(A regiment is a collection of units. It is one of the main building blocks of an army (see ‘Army Composition’ in the Advanced Rules)."
        "\nSome factions have special Deploy abilities, such as the ‘The Celestial Realm’ ability of the Stormcast Eternals).";
    aosPreparationSpells.add(deployRegiment);

    Ability phases = Ability("Turn Phases");
    phases.typeName = "Ability (Passive)";
    phases.color = "Teal";
    phases.effect =
        "Each player’s turn is broken down into 7 phases: "
        "\nStart of Turn, Hero Phase, Movement Phase, Shooting Phase, Charge Phase, Combat Phase, End of Turn."
        "\nIn each phase, the active player can use any abilities with the ‘Your (…) Phase’ or ‘Any (…) Phase’ timing."
        "\nOnce the active player has  nished using abilities, their opponent can then use any abilities with "
        "an ‘Enemy (…) Phase’ or ‘Any (…) Phase’ timing";
    aosPreparationSpells.add(phases);

    Ability terrain = Ability("Terrain");
    terrain.typeName = "Ability (Passive)";
    terrain.color = "Teal";
    terrain.effect =
        "Large Terrain Feature: Cover, Obscuring, Unstable."
        "\nSmall Terrain Feature: Cover, Unstable."
        "\n• Cover: Subtract 1 from hit rolls for attacks that target a unit that is behind or wholly on this terrain feature, "
        "unless that unit charged or has the Fly keyword."
        "\n• Obscuring: A unit cannot be targeted by shooting attacks if it is behind or wholly on this terrain feature, unless it has the Fly keyword."
        "\n• Unstable: Models can move across but cannot be set up on or"
        "end any type of move on any part of this terrain feature that is more than 1\" tall.";
    aosPreparationSpells.add(terrain);

    Ability universalWeaponAbilities = Ability("Universal Weapon Abilities");
    universalWeaponAbilities.typeName = "Ability (Passive)";
    universalWeaponAbilities.color = "Teal";
    universalWeaponAbilities.effect =
        "• Anti-X (+1 Rend): Add 1 to this weapon’s Rend characteristic if the target has the keyword after ‘Anti-’ or "
        "\nfulfils the condition after ‘Anti-’. Multiples of this ability are cumulative. For example, if a weapon has both"
        "\nAnti-charge (+1 Rend) and Anti-Hero (+1 Rend), then add 2 to the Rend characteristic of the weapon for "
        "\n attacks that target a Hero that charged in the same turn."
        "\n• Charge (+1 Damage): Add 1 to this weapon’s Damage characteristic if the attacking unit charged this turn."
        "\n• Companion: This weapon is not affected by abilities used by a friendly unit that affect the Attacks characteristic or the attack sequence."
        "\n• Crit (2 Hits): If an attack made with this weapon scores a critical hit, "
        "\nthat attack scores 2 hits on the target unit instead of 1. Make a wound roll for each hit."
        "\n• Crit (Auto-wound): If an attack made with this weapon scores a critical hit, "
        "\nthat attack automatically wounds the target. Make a save roll as normal."
        "\n• Crit (Mortal): If an attack made with this weapon scores a critical hit, that attack inflicts mortal damage on"
        "\nthe target unit equal to the Damage characteristic of that weapon and the attack sequence ends."
        "\n• Shoot in Combat: This weapon can be used to make shooting attacks even if the attacking unit is in combat.";
    aosPreparationSpells.add(universalWeaponAbilities);

    settings.preparationSpells = aosPreparationSpells;

    return settings;
  }
}
