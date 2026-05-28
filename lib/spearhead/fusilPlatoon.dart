import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

//TODO Seite fusil ausfüllen

class FusilPlatoon {
  Settings pickFusilPlatoon(Settings settings) {
    //---------------------------------------------------------
    // General JORVAN KRREEL

    Weapon rangerblades = Weapon("rangerblades","Ranger Blades");
    rangerblades.attack = "6";
    rangerblades.hit = "3+";
    rangerblades.wound = "4+";
    rangerblades.rend = "1";
    rangerblades.damage = "2";

    Ability veteran = Ability("Veteran Skirmishers");
    veteran.typeName = "Ability (Activated)";
    veteran.timing = "Your Hero Phase";
    veteran.color = "Yellow";
    veteran.declare =
    "Pick a friendly unit wholly within 12\" of this unit to be the target";
    veteran.effect =
    "Roll a dice. On a 3+, for the rest of the turn, "
        "add 2\" to the target’s Move characteristic but it cannot use Run abilities.";

    Ability prowling = Ability("Prowling Ash Panther");
    prowling.typeName = "Ability (Activated)";
    prowling.timing = "End of Any Turn";
    prowling.color = "Purple";
    prowling.effect =
    "If this unit has the Thexa token, give that token to an enemy unit within 6\" of this unit. "
        "If an enemy unit has the Thexa token, inflict D3 mortal damage on that enemy unit. Then, give this unit the Thexa token.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      veteran,
      prowling,
    ];

    Unit general = Unit.withSpells("Jorvan Kreel", generalSpells);
    general.id = "General";
    general.weapons.add(rangerblades);
    general.move = "6\"";
    general.health = "5";
    general.save = "4+";
    general.control = "2";
    general.keywords = "Hero, Infantry";

    // General JORVAN KRREEL
    //---------------------------------------------------------

    //---------------------------------------------------------
    // Unit-List Build

    //List<Unit> units = [general, ardboyz, bruteRagerz, brutes];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits



    Ability mightyDestroyers = Ability("Mighty Destroyers");
    mightyDestroyers.timing = "Once Per Turn (Army), Any Hero Phase";
    mightyDestroyers.typeName = "Ability (Activated)";
    mightyDestroyers.color = "Yellow";
    mightyDestroyers.declare = "Pick a friendly unit that was not set up this turn to be the target.";
    mightyDestroyers.effect = "The target can move up to 3\". It can move into combat. "
        "\nIf it was in combat at the start of the move, it must end that move in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(mightyDestroyers);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability naturalDisaster = Ability("Natural Disaster");
    naturalDisaster.typeName = "Ability (Passive)";
    naturalDisaster.color = "Orange";
    naturalDisaster.effect = "If you make an unmodified charge roll of 8+ for a friendly unit, "
        "\nadd 1 to the Attacks characteristic of that unit’s melee weapons for the rest of the turn.";

    Ability properRuckus = Ability("A Proper Ruckus");
    properRuckus.timing =
    "Once Per Battle, Reaction: You declared the ´Mighty Destroyers´ ability";
    properRuckus.typeName = "Ability (Activated)";
    properRuckus.color = "Yellow";
    properRuckus.effect =
    "All friendly units on the battlefield that were not set up this turn are the targets of that ability instead.";

    List<Ability> regimentAbilies = [naturalDisaster, properRuckus];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability amberstone = Ability("Amberstone Whetstone");
    amberstone.keywords = "Enhancement";
    amberstone.typeName = "Ability (Passive)";
    amberstone.color = "Red";
    amberstone.effect =
    "The Rend characteristic of your general’s melee weapons is 2";

    Ability skulls = Ability("Trophy Skulls");
    skulls.keywords = "Enhancement";
    skulls.typeName = "Ability (Passive)";
    skulls.color = "Purple";
    skulls.effect = "Your general’s Control characteristic is 5.";

    Ability armourGork = Ability("Armour of Gork");
    armourGork.keywords = "Enhancement";
    armourGork.typeName = "Ability (Passive)";
    armourGork.color = "Green";
    armourGork.effect = "Your general has Ward (6+).";

    Ability megaBossy = Ability("Mega Bossy");
    megaBossy.keywords = "Enhancement";
    megaBossy.typeName = "Ability (Passive)";
    megaBossy.color = "Orange";
    megaBossy.effect =
    "If this unit charged this turn, for the rest of the turn, "
        "add 1 to charge rolls for friendly units while they are wholly within 12\" of this unit.";

    List<Ability> enhancements = [amberstone, skulls, armourGork, megaBossy];

    // Enhancements
    //---------------------------------------------------------
    //

    //settings.army.unitList = units;

    settings.army.battleTraitsList.clear();
    settings.army.battleTraitsList.add(battleTraits);

    settings.regimentAbilities = regimentAbilies;

    settings.enhancements = enhancements;

    return settings;
  }
}