import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class FusilPlatoon {
  Settings pickFusilPlatoon(Settings settings) {
    //---------------------------------------------------------
    // General FUSIL-MAJOR

    Weapon longFusil = Weapon("longFusil", "Long-Fusil");
    longFusil.range = "24\"";
    longFusil.attack = "3";
    longFusil.hit = "3+";
    longFusil.wound = "3+";
    longFusil.rend = "1";
    longFusil.damage = "2";

    Weapon mace = Weapon("mace", "Ranger Blades");
    mace.attack = "4";
    mace.hit = "4+";
    mace.wound = "2+";
    mace.rend = "2";
    mace.damage = "2";

    Ability targets = Ability("Mark Targets");
    targets.typeName = "Ability (Activated)";
    targets.timing = "Your Shooting Phase";
    targets.color = "Blue";
    targets.declare =
        "Pick an enemy unit that was targeted by this unit’s shooting attacks this turn to be the target.";
    targets.effect =
        "Add 1 to hit rolls for shooting attacks made by friendly units that target that unit for the rest of the turn.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      targets,
    ];

    Unit general = Unit.withSpells("Jorvan Kreel", generalSpells);
    general.id = "General";
    general.weapons.add(longFusil);
    general.weapons.add(mace);
    general.move = "5\"";
    general.health = "8";
    general.save = "3+";
    general.control = "2";
    general.keywords = "Hero, Infantry, Castelite";

    // General FUSIL-MAJOR
    //---------------------------------------------------------
    // ALCHEMITE WARFORGER

    Weapon tongstaff = Weapon("tongstaff", "Warpstone Staff");
    tongstaff.attack = "3";
    tongstaff.hit = "4+";
    tongstaff.wound = "4+";
    tongstaff.rend = "1";
    tongstaff.damage = "D3";

    Ability blazing = Ability("Blazing Weapons");
    blazing.typeName = "Ability (Activated)";
    blazing.timing = "Your Hero Phase";
    blazing.color = "Yellow";
    blazing.declare = "Pick a friendly unit wholly within 12\" of this unit to be the target, then make a casting roll of 2D6.";
    blazing.effect = "On a 6+, the target’s melee weapons have Crit (Mortal) until the start of your next turn.";

    List<Ability> warforgerSpells = [SpearheadGeneralSpells().getGuardedHero(), blazing];

    Unit warforger = Unit.withSpells("Alchemite Warforger", warforgerSpells);
    warforger.weapons.add(tongstaff);
    warforger.move = "5\"";
    warforger.health = "5";
    warforger.save = "5+";
    warforger.control = "2";
    warforger.keywords = "Hero, Wizard, Infantry";

    // ALCHEMITE WARFORGER
    //---------------------------------------------------------
    // FREEGUILD FUSILIERS

    Weapon fusilCannon = Weapon("fusilCannon", "Fusil-Cannon");
    fusilCannon.range = "18\"";
    fusilCannon.attack = "2";
    fusilCannon.hit = "4+";
    fusilCannon.wound = "4+";
    fusilCannon.rend = "1";
    fusilCannon.damage = "1";

    Weapon bayonet = Weapon("bayonet", "Fusil-Cannon");
    bayonet.attack = "1";
    bayonet.hit = "4+";
    bayonet.wound = "4+";
    bayonet.rend = "-";
    bayonet.damage = "1";

    Ability squire = Ability("Blazing Weapons");
    squire.typeName = "Ability (Passive)";
    squire.color = "Blue";
    squire.effect = "While this unit has a Blackpowder Squire token, this unit’s ranged weapons have Shoot in Combat.";

    Ability stop = Ability("Can´t Stop!");
    stop.typeName = "Ability (Passive)";
    stop.timing = "Once Per Turn (Army), Your Shooting Phase";
    stop.color = "Blue";
    stop.declare = "Pick another friendly Freeguild Fusiliers unit to be the target.";
    stop.effect = "Remove this unit’s Blackpowder Squire token from the battlefield, then give it to the target. ";

    List<Ability> fusiliersSpells = [SpearheadGeneralSpells().getGuardedHero(), squire, stop];

    Unit fusiliers = Unit.withSpells("Freeguild Fusiliers", fusiliersSpells);
    fusiliers.weapons.add(fusilCannon);
    fusiliers.weapons.add(bayonet);
    fusiliers.move = "5\"";
    fusiliers.health = "1";
    fusiliers.save = "4+";
    fusiliers.control = "1";
    fusiliers.keywords = "Infantry, Castelite, Reinforcements";

    // FREEGUILD FUSILIERS
    //---------------------------------------------------------
    // WILDERCORPS HUNTERS

    Weapon crossbow = Weapon("crossbow", "Hunting Crossbow");
    crossbow.range = "15\"";
    crossbow.attack = "2";
    crossbow.hit = "4+";
    crossbow.wound = "4+";
    crossbow.rend = "1";
    crossbow.damage = "1";

    Weapon huntingWeapon = Weapon("huntingWeapon", "Hunting Weapons");
    huntingWeapon.attack = "2";
    huntingWeapon.hit = "4+";
    huntingWeapon.wound = "4+";
    huntingWeapon.rend = "-";
    huntingWeapon.damage = "1";

    Weapon bite = Weapon("bite", "Trailhound’s Ferocious Bite");
    bite.attack = "2";
    bite.hit = "4+";
    bite.wound = "3+";
    bite.rend = "-";
    bite.damage = "1";

    Ability tracker = Ability("Expert Trackers");
    tracker.typeName = "Ability (Active)";
    tracker.color = "Black";
    tracker.effect = "This unit can use the ‘Normal Move’ ability as if it were your movement phase.";

    List<Ability> hunterSpells = [SpearheadGeneralSpells().getGuardedHero(), tracker];

    Unit hunter = Unit.withSpells("Freeguild Fusiliers", hunterSpells);
    hunter.weapons.add(crossbow);
    hunter.weapons.add(huntingWeapon);
    hunter.weapons.add(bite);
    hunter.move = "5\"";
    hunter.health = "1";
    hunter.save = "5+";
    hunter.control = "1";
    hunter.keywords = "Infantry";

    // WILDERCORPS HUNTERS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, warforger, fusiliers, hunter];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability fortify = Ability("Fortify Position");
    fortify.typeName = "Ability (Passive)";
    fortify.color = "Green";
    fortify.effect =
        "Subtract 1 from the Rend characteristic of weapons used for attacks that target friendly Castelite units "
        "if they did not use a Move ability in the same turn.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(fortify);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability provision = Ability("Well Provisioned");
    provision.typeName = "Ability (Active)";
    provision.timing = "Once Per Turn (Army), Your Shooting Phase";
    provision.color = "Green";
    provision.declare = "Pick a friendly non-Hero unit to be the target.";
    provision.effect =
        "Roll a dice. On a 3+, add 1 to wound rolls for that unit’s shooting attacks for the rest of the phase.";

    Ability resepected = Ability("Respected Leader");
    resepected.typeName = "Ability (Active)";
    resepected.timing = "Once Per Battle, Deployment Phase";
    resepected.color = "Black";
    resepected.effect =
        "Friendly Wildercorps Hunters units gain the Reinforcements keyword.";

    List<Ability> regimentAbilies = [provision, resepected];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability tactic = Ability("Adept Tactician");
    tactic.keywords = "Enhancement";
    tactic.typeName = "Ability (Active)";
    tactic.timing = "Once Per Battle, Your Movement Phase";
    tactic.color = "Gray";
    tactic.declare =
        "Pick 2 friendly Freeguild Fusiliers units that have been destroyed and have not already been replaced.";
    tactic.effect =
        "Set up a single replacement Freeguild Fusiliers unit with 10 models more than 6\" from all enemy units.";

    Ability shield = Ability("Shield Bash");
    shield.keywords = "Enhancement";
    shield.typeName = "Ability (Active)";
    shield.timing = "Once Per Turn, Your Movement Phase";
    shield.color = "Gray";
    shield.declare =
        "Pick an enemy Infantry, War Machine or Cavalry unit in combat with your general to be the target.";
    shield.effect =
        "Roll a dice. On a 3+, the target must immediately use the ‘Retreat’ ability as if it were the enemy movement phase.";

    Ability brace = Ability("Brace!");
    brace.keywords = "Enhancement";
    brace.typeName = "Ability (Passive)";
    brace.color = "Green";
    brace.effect = "Your general has Ward (5+).";

    Ability volley = Ability("Point-Blank Volley");
    volley.keywords = "Enhancement";
    volley.typeName = "Ability (Active)";
    volley.timing = "Once Per Turn, Enemy Combat Phase";
    volley.color = "Red";
    volley.declare =
        "Pick an enemy unit in combat with your general to be the target.";
    volley.effect =
        "Roll a D3. On a 2+, inflict an amount of mortal damage on the target equal to the roll.";

    List<Ability> enhancements = [tactic, shield, brace, volley];

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
