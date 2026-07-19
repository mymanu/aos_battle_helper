import '../classes/ability.dart';
import '../classes/settings.dart';

class SpearheadGeneralSpells {
  Ability getGuardedHero() {
    Ability guardedHero = Ability("Guarded Hero");
    guardedHero.typeName = "Ability (Passive)";
    guardedHero.color = "Black";
    guardedHero.effect =
        "If this **Hero** is within the combat range of a friendly unit that is **not a Hero**:\n"
        "• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n"
        "• If this **Hero** is **Infantry**, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.";
    return guardedHero;
  }

  Settings addSpearheadSpells(Settings settings) {
    List<Ability> normalSpells = [];

    Ability reinforcements = Ability("Call for Reinforcements");
    reinforcements.timing = "Once Per Turn, Your Movement Phase";
    reinforcements.typeName = "Ability (Activated)";
    reinforcements.color = "Gray";
    reinforcements.declare =
        "Pick a friendly REINFORCEMENTS unit that has been destroyed.";
    reinforcements.effect =
        "Set up an identical replacement unit on the battlefield, wholly within fiendly territory,"
        "wholly within 6\" of the battlefield edge and not in combat."
        "\nEach REINFORCEMENTS unit can only be replaced once. Replacement units cannot themselves be replaced.";
    normalSpells.add(reinforcements);

    Ability normalMove = Ability("Normal Move");
    normalMove.timing = "Your Movement Phase";
    normalMove.typeName = "Ability (Activated)";
    normalMove.color = "Gray";
    normalMove.declare =
        "Pick a friendly unit that is not in combat to use this ability.";
    normalMove.effect =
        "That unit can move a distance up to its Move characteristic. That unit cannot move into combat during any part of that move.";
    normalSpells.add(normalMove);

    Ability run = Ability("Run");
    run.timing = "Your Movement Phase";
    run.typeName = "Ability (Activated)";
    run.color = "Gray";
    run.declare =
        "Pick a friendly unit that is not in combat to use this ability.";
    run.effect =
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
        "Pick a friendly unit that has not used a Run or Retreat ability this turn to use this ability. Then, "
        "pick one or more enemy units as the target(s) of that unit’s attacks (see 16.0).";
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

    settings = spearheadPreparationSpells(settings);

    return settings;
  }

  Settings spearheadPreparationSpells(Settings settings) {
    List<Ability> spearheadPreparationSpells = [];

    Ability preBattleSequence = Ability("Pre-Battle Sequence");
    preBattleSequence.typeName = "Ability (Passive)";
    preBattleSequence.color = "Teal";
    preBattleSequence.effect =
        "• Roll off. Winner chooses who is attacker and who is defender."
        "\n• Attacker picks regiment ability and enhancement, then defender does so."
        "\n• Defender chooses Aqshy or Ghyran side of realm battlefield."
        "\n• Defender picks deployment map (horizontal or diagonal) and chooses which territory is theirs."
        "\n• Defender sets up 1 large and 1 small terrain feature. Then attacker does the same."
        "\nEach terrain feature must be set up wholly within friendly territory, more than 6\" from all other terrain features"
        "\nand more than 3\" from both long battlefield edges and enemy territory. Terrain features cannot be set up on objectives.";
    spearheadPreparationSpells.add(preBattleSequence);

    Ability deployment = Ability("Deployment");
    deployment.typeName = "Ability (Passive)";
    deployment.color = "Teal";
    deployment.effect =
        "Attacker sets up their army first, followed by the defender. "
        "\nEach unit must be set up wholly within friendly territory and more than 6\" from enemy territory.";
    spearheadPreparationSpells.add(deployment);

    Ability seizingInitiative = Ability("Seizing The Initiative");
    seizingInitiative.typeName = "Ability (Passive)";
    seizingInitiative.color = "Teal";
    seizingInitiative.effect =
        "If the player who went second in the previous battle round wins the priority roll "
        "and chooses to go first in the current battle round, they do not draw any battle tactic cards for that battle round "
        "unless they are the underdog and the difference in victory points between the players is 5 or more.";
    spearheadPreparationSpells.add(seizingInitiative);

    Ability battleTacticCards = Ability("Battle Tactics Cards");
    battleTacticCards.typeName = "Ability (Passive)";
    battleTacticCards.color = "Teal";
    battleTacticCards.effect =
        "• Start of first battle round: draw 3 battle tactic cards."
        "\nStart of second or later battle round: discard any battle tactic cards in your hand if you wish. "
        "\nThen if you have less than 3 battle tactic cards in your hand, keep drawing them until you have 3.";
    spearheadPreparationSpells.add(battleTacticCards);

    Ability victoryPoints = Ability("Victory Points");
    victoryPoints.typeName = "Ability (Passive)";
    victoryPoints.color = "Teal";
    victoryPoints.effect =
        "At the end of each of your turns:"
        "\n• Score 1 victory point if you control at least one objective."
        "\• Score 1 victory point if you control two or more objectives."
        "\n• Score 1 victory point if you control more objectives than your opponent."
        "\n• Score 1 victory point for each battle tactic you completed this turn.";
    spearheadPreparationSpells.add(victoryPoints);

    Ability startBattleRoundSequence = Ability(
      "Start of Battle Round Sequence",
    );
    startBattleRoundSequence.typeName = "Ability (Passive)";
    startBattleRoundSequence.color = "Teal";
    startBattleRoundSequence.effect =
        "• First battle round: attacker chooses who takes the first turn. "
        "\nLater battle rounds: players make a priority roll (Core Rules, 12.0)."
        "\n• Determine underdog (Core Rules, 12.0)."
        "\n• Draw twist card."
        "\n• Players draw battle tactic cards (see below)."
        "\n• Start of Battle Round abilities are used.";
    spearheadPreparationSpells.add(startBattleRoundSequence);

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
    spearheadPreparationSpells.add(terrain);

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
    spearheadPreparationSpells.add(universalWeaponAbilities);

    settings.preparationSpells = spearheadPreparationSpells;

    return settings;
  }
}
