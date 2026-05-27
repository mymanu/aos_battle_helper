import 'dart:math';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class CrixxitKillPack {
  Settings pickCrixxitKillPack(Settings settings) {
    //---------------------------------------------------------
    // General DEATHMASTER

    Weapon weepingBlade = Weapon("weepingBlade", "Weeping Blade");
    weepingBlade.attack = "5";
    weepingBlade.hit = "3+";
    weepingBlade.wound = "4+";
    weepingBlade.rend = "1";
    weepingBlade.damage = "D3";
    weepingBlade.ability = "Anti-HERO (+1 Rend), Crit (Mortal)";

    Ability shadowy = Ability("Shadowy Killers");
    shadowy.typeName = "Ability (Passive)";
    shadowy.color = "Green";
    shadowy.effect =
        "If the unmodified hit roll for an attack that targets this unit is 1-4,"
        "the attack fails and the attack sequence ends.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      shadowy,
    ];

    Unit general = Unit.withSpells("Deathmaster", generalSpells);
    general.id = "General";
    general.weapons.add(weepingBlade);
    general.move = "7\"";
    general.health = "5";
    general.save = "5+";
    general.control = "2";
    general.keywords = "Hero, Infantry, Ward (6+)";

    // General DEATHMASTER
    //---------------------------------------------------------
    // DEATHMASTER  CRIXXIT

    Weapon cuts = Weapon("cuts", "The Blades of Thirteen Cuts");
    cuts.attack = "13";
    cuts.hit = "2+";
    cuts.wound = "4+";
    cuts.rend = "1";
    cuts.damage = "1";
    cuts.ability = "Crit (Mortal)";

    Ability hunt = Ability("");
    hunt.typeName = "Ability (Activated)";
    hunt.timing = "Your Hero Phase";
    hunt.color = "Yellow";
    hunt.declare =
        "Pick a visible friendly Gutter Runners unit wholly within 12\" of this unit to be the target, then roll a dice.";
    hunt.effect = "On a 3+, add 1 to charge rolls for the rest of the turn.";

    List<Ability> deathmasterCrixxitSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      hunt,
    ];

    Unit deathmasterCrixxit = Unit.withSpells(
      "Deathmaster Crixxit",
      deathmasterCrixxitSpells,
    );

    deathmasterCrixxit.weapons.add(cuts);
    deathmasterCrixxit.move = "7\"";
    deathmasterCrixxit.health = "6";
    deathmasterCrixxit.save = "5+";
    deathmasterCrixxit.control = "2";
    deathmasterCrixxit.keywords = "Hero, Infantry, Ward (5+)";

    // DEATHMASTER  CRIXXIT
    //---------------------------------------------------------
    // GUTTER RUNNERS

    Weapon eshin = Weapon("eshin", "Eshin Specialist Blades");
    eshin.attack = "3";
    eshin.hit = "3+";
    eshin.wound = "4+";
    eshin.rend = "1";
    eshin.damage = "1";
    eshin.ability = "Crit (Mortal)";

    Ability bombs = Ability("Bomb Rats");
    bombs.typeName = "Ability (Activated)";
    bombs.timing = "Once Per Turn (Army), Your Charge Phase";
    bombs.color = "Orange";
    bombs.declare =
        "You can only use this ability if this unit has a Bomb Rat token."
        "\nPick an enemy unit within 9\" of this unit to be the target. Then, roll a dice.";
    bombs.effect =
        "On a 3+, inflict 1 mortal damage on the target. On a 1-2, remove this units Bomb Rat token from the battlefield.";

    List<Ability> gutterSpells = [bombs];

    Unit gutter = Unit.withSpells("Gutter Runners", gutterSpells);
    gutter.weapons.add(eshin);
    gutter.move = "7\"";
    gutter.health = "1";
    gutter.save = "6+";
    gutter.control = "1";
    gutter.keywords = "Infantry, Reinforcements, Ward (6+)";

    // GUTTER RUNNERS
    //---------------------------------------------------------
    // NIGHT RUNNERS

    Weapon slings = Weapon("slings", "Slings and Poisoned Stars");
    slings.range = "10\"";
    slings.attack = "2";
    slings.hit = "4+";
    slings.wound = "4+";
    slings.rend = "-";
    slings.damage = "1";
    slings.ability = "Crit (Auto-wound), Shoot in Combat";

    Weapon blades = Weapon("slings", "Poisoned Blades");
    blades.attack = "2";
    blades.hit = "4+";
    blades.wound = "5+";
    blades.rend = "-";
    blades.damage = "1";
    blades.ability = "Crit (Mortal)";

    Ability smoke = Ability("Smoke Bombs");
    smoke.typeName = "Ability (Activated)";
    smoke.timing = "Once Per Turn (Army), Any Combat Phase";
    smoke.color = "Red";
    smoke.declare = "This unit can only use this abilityif it is in combat. Roll a dice.";
    smoke.effect =
        "On a 4+, this unit can immediately use the ´Retreat´ ability as if it were your movement phase.";

    List<Ability> nightRunnerSpells = [smoke];

    Unit nightRunner = Unit.withSpells("Night Runners", nightRunnerSpells);
    nightRunner.weapons.add(slings);
    nightRunner.weapons.add(blades);
    nightRunner.move = "7\"";
    nightRunner.health = "1";
    nightRunner.save = "6+";
    nightRunner.control = "1";
    nightRunner.keywords = "Infantry, Reinforcements, Ward (6+)";

    // NIGHT RUNNERS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, deathmasterCrixxit, gutter, nightRunner];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability shadow = Ability("Cloaked in Shadow");
    shadow.typeName = "Ability (Activated)";
    shadow.timing = "Once Per Turn (Army), Combat Phase";
    shadow.color = "Red";
    shadow.declare =
        "Pick a friendly HERO unit to use this ability. Then, pick a different friendly unit that has 2 or more models to be the target.";
    shadow.effect =
        "Make a shadow-travel roll of D6. On a 3+, remove the HERO using this ability from the battlefield "
        "and set them up again wholly within 6\" of the target. They can be set up in combat with any enemy units that are already in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(shadow);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability shade = Ability("Way of the Skittering Shade");
    shade.typeName = "Ability (Activated)";
    shade.timing = "Once Per Battle, Your Movement Phase";
    shade.color = "Grey";
    shade.declare =
    "Pick a friendly unit that is wholly within 6\" of a battlefield edge to be the target.";
    shade.effect =
        "Remove the target from the battlefield and set it up again wholly within 3\" of a battlefield edge"
        "and more than 6\" from all enemy units.";

    Ability clawWay = Ability("Way of the Fiendish Claw");
    clawWay.typeName = "Ability (Activated)";
    clawWay.timing = "Once Per Battle (Army), Any Combat Phase";
    clawWay.color = "Red";
    clawWay.declare = "Pick a friendly HERO to be the target.";
    clawWay.effect =
        "The target has STRIKE-FIRST for the rest of the turn.";

    List<Ability> regimentAbilies = [shade, clawWay];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability acrobatic = Ability("Murderous Acrobatics");
    acrobatic.typeName = "Ability (Passive)";
    acrobatic.keywords = "Enhancement";
    acrobatic.timing = "Passive";
    acrobatic.color = "Orange";
    acrobatic.effect =
        "When your general uses the ´Charge´ ability, they can pass through enemy models.";

    Ability masterShadows = Ability("Master of Shadows");
    masterShadows.typeName = "Ability (Passive)";
    masterShadows.keywords = "Enhancement";
    masterShadows.timing = "Passive";
    masterShadows.color = "Red";
    masterShadows.effect =
        "When your general uses the ´Cloaked in Shadow´ ability, add 1 to the shadow-travel roll.";

    Ability anotherShadow = Ability("Just Another Shadow");
    anotherShadow.typeName = "Ability (Passive)";
    anotherShadow.keywords = "Enhancement";
    anotherShadow.timing = "Passive";
    anotherShadow.color = "Green";
    anotherShadow.effect =
        "While your general is wholly within the combat range of a friendly unit that has 3 or more models,"
        "your general has WARD (4+).";

    Ability screech = Ability("Death Screech");
    screech.typeName = "Ability (Passive)";
    screech.keywords = "Enhancement";
    screech.timing = "Passive";
    screech.color = "Red";
    screech.declare = "Pick an enemy unit within 6\" of your general to be the target.";
    screech.effect =
        "Roll a dice. On a 3+, for the rest of the turn, subtract 1 from hit rolls for the target´s attacks.";

    List<Ability> enhancements = [
      acrobatic,
      masterShadows,
      anotherShadow,
      screech,
    ];

    // Enhancements
    //---------------------------------------------------------
    //

    settings.army.unitList = units;

    settings.army.battleTraitsList.clear();
    settings.army.battleTraitsList.add(battleTraits);

    settings.regimentAbilities = regimentAbilies;

    settings.enhancements = enhancements;

    return settings;
  }
}
