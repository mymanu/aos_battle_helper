import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class WarpsparkClawpack {
  Settings pickWarpsparkClawpack(Settings settings) {
    //---------------------------------------------------------
    // Grey Seer

    Weapon warpstoneStaff = Weapon("warpstoneStaff", "Warpstone Staff");
    warpstoneStaff.attack = "3";
    warpstoneStaff.hit = "4+";
    warpstoneStaff.wound = "4+";
    warpstoneStaff.rend = "1";
    warpstoneStaff.damage = "D3";

    Ability hornet = Ability("Will of the Hornet Rat");
    hornet.typeName = "Ability (Activated)";
    hornet.timing = "Your Hero Phase";
    hornet.color = "Yellow";
    hornet.declare =
        "Pick a friendly unit wholly within 13\" of this unit to be the target, then roll a dice.";
    hornet.effect =
        "On a 3+, add the roll to the target`s control score until the start of your next turn.";

    Ability wither = Ability("Wither");
    wither.typeName = "Ability (Activated)";
    wither.timing = "Your Hero Phase";
    wither.color = "Yellow";
    wither.declare =
        "Pick a visible enemy unit within 13\" of this unit to be the target, then make a casting roll of 2D6.";
    wither.effect = "On a 6+, inflict D3 mortal damage on the target.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      hornet,
      wither,
    ];

    Unit general = Unit.withSpells("Grey Seer", generalSpells);
    general.id = "General";
    general.weapons.add(warpstoneStaff);
    general.move = "6\"";
    general.health = "5";
    general.save = "6+";
    general.control = "2";
    general.keywords = "Hero, Wizard, Infantry";

    // Grey Seer
    //---------------------------------------------------------
    // Clanrats

    Weapon rustyBlade = Weapon("rustyBlade", "RustyBlade");
    rustyBlade.attack = "2";
    rustyBlade.hit = "4+";
    rustyBlade.wound = "5+";
    rustyBlade.rend = "-";
    rustyBlade.damage = "1";

    Ability seething = Ability("Seething Swarm");
    seething.typeName = "Ability (Activated)";
    seething.timing = "End of Any Turn";
    seething.color = "Purple";
    seething.effect = "You can return D3 slain models to this unit.";

    List<Ability> clanratsSpells = [seething];

    Unit clanrats = Unit.withSpells("Clanrats", clanratsSpells);
    clanrats.weapons.add(rustyBlade);
    clanrats.move = "6\"";
    clanrats.health = "1";
    clanrats.save = "5+";
    clanrats.control = "1";
    clanrats.keywords = "Infantry, Reinforcements";

    // Clanrats
    //---------------------------------------------------------
    // Stormfiends

    Weapon ratlingCannons = Weapon("ratlingCannons", "Ratling Cannons");
    ratlingCannons.range = "15\"";
    ratlingCannons.attack = "3D6";
    ratlingCannons.hit = "4+";
    ratlingCannons.wound = "3+";
    ratlingCannons.rend = "1";
    ratlingCannons.damage = "1";

    Weapon windlaunchers = Weapon("windlaunchers", "Windlaunchers");
    windlaunchers.range = "15\"";
    windlaunchers.attack = "3";
    windlaunchers.hit = "4+";
    windlaunchers.wound = "3+";
    windlaunchers.rend = "2";
    windlaunchers.damage = "D3";

    Weapon clubbingBlows = Weapon("clubbingBlows", "Clubbing Blows");
    clubbingBlows.attack = "4";
    clubbingBlows.hit = "4+";
    clubbingBlows.wound = "2+";
    clubbingBlows.rend = "-";
    clubbingBlows.damage = "2";

    Weapon shockGauntlets = Weapon("shockGauntlets", "Shock Gauntlets");
    shockGauntlets.attack = "4";
    shockGauntlets.hit = "4+";
    shockGauntlets.wound = "2+";
    shockGauntlets.rend = "1";
    shockGauntlets.damage = "2";

    Ability gauntlets = Ability("Shock Gauntlets");
    gauntlets.typeName = "Ability (Passive)";
    gauntlets.color = "Red";
    gauntlets.effect =
        "Each time an attack made with this unit`s Shock Gauntlets scores a critical hit, that attack scores D6 hits"
        "instead of 1 (make a wound roll for each hit).";

    List<Ability> stormfiendsSpells = [gauntlets];

    Unit stormfiends = Unit.withSpells("Stormfiends", stormfiendsSpells);
    stormfiends.weapons.add(ratlingCannons);
    stormfiends.weapons.add(windlaunchers);
    stormfiends.weapons.add(clubbingBlows);
    stormfiends.weapons.add(shockGauntlets);
    stormfiends.move = "6\"";
    stormfiends.health = "6";
    stormfiends.save = "4+";
    stormfiends.control = "2";
    stormfiends.keywords = "Infantry";

    // Stormfiends
    //---------------------------------------------------------
    // Warp Lightning Cannon

    Weapon warpLightningBlast = Weapon(
      "warpLightningBlast",
      "Warp Lightning Blast",
    );
    warpLightningBlast.range = "20\"";
    warpLightningBlast.attack = "2D6";
    warpLightningBlast.hit = "4+";
    warpLightningBlast.wound = "*";
    warpLightningBlast.rend = "*";
    warpLightningBlast.damage = "*";

    Weapon teeth = Weapon("teeth", "Crew`s Teeth and Knives");
    teeth.attack = "D6";
    teeth.hit = "4+";
    teeth.wound = "5+";
    teeth.damage = "1";

    Ability blast = Ability("Warp Lightning Blast");
    blast.typeName = "Ability (Passive)";
    blast.color = "Blue";
    blast.effect =
        "Each attack made with this weapon in a single phase must target the same enemy unit."
        "Each hit inflicts 1 mortal damage on the target and the attack sequence ends.";

    List<Ability> warpLightningCannonSpells = [blast];

    Unit warpLightningCannon = Unit.withSpells(
      "Warp Lightning Cannon",
      warpLightningCannonSpells,
    );
    warpLightningCannon.weapons.add(warpLightningBlast);
    warpLightningCannon.weapons.add(teeth);
    warpLightningCannon.move = "3\"";
    warpLightningCannon.health = "8";
    warpLightningCannon.save = "4+";
    warpLightningCannon.control = "2";
    warpLightningCannon.keywords = "War Machine";

    // Warp Lightning Cannon
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, clanrats, stormfiends, warpLightningCannon];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability threeClawsteps = Ability("Always three Clawsteps Ahead");
    threeClawsteps.typeName = "Ability (Activated)";
    threeClawsteps.timing = "Once Per Phase, Enemy Movement Phase";
    threeClawsteps.color = "Gray";
    threeClawsteps.declare = "Pick a friendly unit that is not in combat.";
    threeClawsteps.effect =
        "That unit can use the `Normal Move` ability as if it were your movement phase.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(threeClawsteps);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability endlessSwarmofRats = Ability("Endless Swarm of Rats");
    endlessSwarmofRats.typeName = "Ability (Activated)";
    endlessSwarmofRats.timing = "Any end of turn";
    endlessSwarmofRats.color = "Purple";
    endlessSwarmofRats.effect =
        "When a friendly Clanrats unit uses its `Seething Swarm` ability, you can return D6 slain"
        "models to that unit instead of D3.";

    Ability warpstoneLacedArmour = Ability("Warpstone-laced Armour");
    warpstoneLacedArmour.typeName = "Ability (Activated)";
    warpstoneLacedArmour.timing =
        "Once Per Battle, Reaction: Opponent declared an ATTACK ability and targeted your Stormfiends unit";
    warpstoneLacedArmour.color = "Red";
    warpstoneLacedArmour.effect =
        "Used By: Your Stormfiends unit."
        "\n\nEffect: Your Stormfiends unit has WARD (5+) for the rest of the turn.";

    List<Ability> regimentAbilies = [endlessSwarmofRats, warpstoneLacedArmour];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability cageOfWarpLightning = Ability("Cage of Warp Lightning");
    cageOfWarpLightning.typeName = "Ability (Activated)";
    cageOfWarpLightning.keywords = "Enhancement";
    cageOfWarpLightning.timing = "Once Per Battle, Any Combat Phase";
    cageOfWarpLightning.color = "Red";
    cageOfWarpLightning.declare =
        "Pick a visible enemy unit within 6\" of your general and roll a dice.";
    cageOfWarpLightning.effect =
        "On a 2+, the enemy unit has STRIKE-LAST this phase. On a 1, inflict 1 mortal damage on your general.";

    Ability scurryAway = Ability("Scurry Away");
    scurryAway.typeName = "Ability (Activated)";
    scurryAway.keywords = "Enhancement";
    scurryAway.timing = "Any Combat Phase";
    scurryAway.color = "Red";
    scurryAway.effect =
        "Roll a dice. On a 3+, this unit can immediately use the `Retreat` ability as if it were your movement"
        "phase. If it does so, no mortal damage is inflicted on it.";

    Ability skilledManipulator = Ability("Skilled Manipulator");
    skilledManipulator.typeName = "Ability (Passive)";
    skilledManipulator.keywords = "Enhancement";
    skilledManipulator.timing = "Passive";
    skilledManipulator.color = "Red";
    skilledManipulator.effect =
        "Your general has WARD (4+) while they are within 1\" of any friendly CLanrats units.";

    Ability skitterleap = Ability("Skitterleap");
    skitterleap.typeName = "Ability (Activated)";
    skitterleap.keywords = "Enhancement";
    skitterleap.timing = "Your Hero Phase";
    skitterleap.color = "Yellow";
    skitterleap.declare = "Make a casting roll of 2D6.";
    skitterleap.effect = "On a 6+, remove your general from the battlefield and set them up again on the battlefield"
        "more than 6\" from all enemy units. They cannot use MOVE abilities in the following movement phase.";

    List<Ability> enhancements = [
      cageOfWarpLightning,
      scurryAway,
      skilledManipulator,
      skitterleap,
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
