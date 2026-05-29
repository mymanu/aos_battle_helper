import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class IronjawzBigMob {
  Settings pickIronjawzBigMob(Settings settings) {
    //---------------------------------------------------------
    // General MEGABOSS

    Weapon bossChoppa = Weapon("bossChoppa", "Boss-choppa");
    bossChoppa.attack = "8";
    bossChoppa.hit = "4+";
    bossChoppa.wound = "2+";
    bossChoppa.rend = "1";
    bossChoppa.damage = "2";

    Ability getStuck = Ability("Get Stuck In, Ladz!",);
    getStuck.typeName = "Ability (Activated)";
    getStuck.timing = "Your Hero Phase";
    getStuck.color = "Yellow";
    getStuck.declare = "Pick a friendly unit wholly within 12\" of this unit to be the target.";
    getStuck.effect = "Roll a dice. On a 2+, add 1 to the Attacks characteristic of the target’s melee weapons until the start of your next turn.";

    List<Ability> generalSpells = [SpearheadGeneralSpells().getGuardedHero(),getStuck,];

    Unit general = Unit.withSpells("Megaboss", generalSpells);
    general.id = "General";
    general.weapons.add(bossChoppa);
    general.move = "4\"";
    general.health = "8";
    general.save = "3+";
    general.control = "2";
    general.keywords = "Hero, Infantry";

    // General MEGABOSS
    //---------------------------------------------------------
    // ARDBOYZ

    Weapon choppa = Weapon("choppa", "Choppa or Stikka");
    choppa.attack = "2";
    choppa.hit = "4+";
    choppa.wound = "3+";
    choppa.rend = "1";
    choppa.damage = "1";
    choppa.ability = "Anti-charge (+1 Rend)";

    Ability shieldbash = Ability("Shield Bash",);
    shieldbash.typeName = "Ability (Activated)";
    shieldbash.timing = "Any Combat Phase";
    shieldbash.color = "Red";
    shieldbash.declare = "Pick an enemy unit within 1\" of this unit to be the target.";
    shieldbash.effect = "Make a shield bash roll of D6 for each model in this unit that is within 3\" of the target. "
        "For each 6, inflict 1 mortal damage on the target.";

    List<Ability> ardboyzSpells = [shieldbash,];

    Unit ardboyz = Unit.withSpells("Ardboyz", ardboyzSpells);
    ardboyz.weapons.add(choppa);
    ardboyz.move = "4\"";
    ardboyz.health = "2";
    ardboyz.save = "3+";
    ardboyz.control = "1";
    ardboyz.keywords = "Infantry";

    // ARDBOYZ
    //---------------------------------------------------------
    // BRUTE RAGERZ

    Weapon ragerWeapon = Weapon("ragerWeapon", "Rager Weapons");
    ragerWeapon.attack = "3";
    ragerWeapon.hit = "4+";
    ragerWeapon.wound = "2+";
    ragerWeapon.rend = "1";
    ragerWeapon.damage = "2";

    Ability unleashedRage = Ability("Unleashed Rage");
    unleashedRage.typeName = "Ability (Passive)";
    unleashedRage.color = "Red";
    unleashedRage.effect = "This unit has Strike-first if it charged in the same turn.";

    List<Ability> bruteRagerzSpells = [unleashedRage,];

    Unit bruteRagerz = Unit.withSpells("Brute Ragerz", bruteRagerzSpells);
    bruteRagerz.weapons.add(ragerWeapon);
    bruteRagerz.move = "4\"";
    bruteRagerz.health = "3";
    bruteRagerz.save = "5+";
    bruteRagerz.control = "1";
    bruteRagerz.keywords = "Infantry, Brute, Reinforcements";

    // BRUTE RAGERZ
    //---------------------------------------------------------
    // Brutes

    Weapon bruteWeapons = Weapon("bruteWeapons", "Brute Weapons");
    bruteWeapons.attack = "3";
    bruteWeapons.hit = "4+";
    bruteWeapons.wound = "3+";
    bruteWeapons.rend = "1";
    bruteWeapons.damage = "2";

    Ability messin = Ability("You Messin'?");
    messin.typeName = "Ability (Passive)";
    messin.color = "Purple";
    messin.effect = "Enemy models with a Health characteristic of 1 or 2 cannot contest objectives while they are in combat with this unit.";

    List<Ability> brutesSpells = [messin,];

    Unit brutes = Unit.withSpells("Brutes", brutesSpells);
    brutes.weapons.add(bruteWeapons);
    brutes.move = "4\"";
    brutes.health = "3";
    brutes.save = "3+";
    brutes.control = "1";
    brutes.keywords = "Infantry, Brute";

    // Brutes
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, ardboyz, bruteRagerz, brutes];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability ereWeGo = Ability("´Ere We Go");
    ereWeGo.typeName = "Ability (Passive)";
    ereWeGo.color = "Green";
    ereWeGo.effect =
    "3rd Battle Round or later used by Brutes:\nEffect: Set up this unit anywhere on the battlefield more than 6\" from all enemy units.";

    Ability mightyDestroyers = Ability("Mighty Destroyers");
    mightyDestroyers.timing = "Once Per Turn (Army), Any Hero Phase";
    mightyDestroyers.typeName = "Ability (Activated)";
    mightyDestroyers.color = "Yellow";
    mightyDestroyers.declare = "Pick a friendly unit that was not set up this turn to be the target.";
    mightyDestroyers.effect = "The target can move up to 3\". It can move into combat. "
        "\nIf it was in combat at the start of the move, it must end that move in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(mightyDestroyers);
    battleTraits.abilitys.add(ereWeGo);

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
    amberstone.timing = "Passive";
    amberstone.color = "Red";
    amberstone.effect =
    "The Rend characteristic of your general’s melee weapons is 2";

    Ability skulls = Ability("Trophy Skulls");
    skulls.keywords = "Enhancement";
    skulls.typeName = "Ability (Passive)";
    skulls.timing = "Passive";
    skulls.color = "Purple";
    skulls.effect = "Your general’s Control characteristic is 5.";

    Ability armourGork = Ability("Armour of Gork");
    armourGork.keywords = "Enhancement";
    armourGork.typeName = "Ability (Passive)";
    armourGork.timing = "Passive";
    armourGork.color = "Green";
    armourGork.effect = "Your general has Ward (6+).";

    Ability megaBossy = Ability("Mega Bossy");
    megaBossy.keywords = "Enhancement";
    megaBossy.typeName = "Ability (Passive)";
    megaBossy.timing = "Passive";
    megaBossy.color = "Orange";
    megaBossy.effect =
    "If this unit charged this turn, for the rest of the turn, "
        "add 1 to charge rolls for friendly units while they are wholly within 12\" of this unit.";

    List<Ability> enhancements = [amberstone, skulls, armourGork, megaBossy];

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