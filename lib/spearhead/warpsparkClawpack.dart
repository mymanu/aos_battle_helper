import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'generalSpells.dart';

class WarpsparkClawpack {
  Settings pickWarpsparkClawpack(Settings settings) {
    //---------------------------------------------------------
    // Grey Seer

    List<Ability> generalSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Will of the Hornet Rat",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly unit wholly within 13\" of this unit to be the target, then roll a dice."
            "\n\nEffect: On a 3+, add the roll to the target`s control score until the start of your next turn.",
      ),
      Ability.color(
        "Wither",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible enemy unit within 13\" of this unit to be the target, then make a casting roll of 2D6."
            "\n\nEffect: On a 6+, inflict D3 mortal damage on the target.",
      ),
    ];

    Weapon warpstoneStaff = Weapon("warpstoneStaff", "Warpstone Staff");
    warpstoneStaff.attack = "3";
    warpstoneStaff.hit = "4+";
    warpstoneStaff.wound = "4+";
    warpstoneStaff.rend = "1";
    warpstoneStaff.damage = "D3";

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

    List<Ability> clanratsSpells = [
      Ability.color(
        "Seething Swarm",
        "End of Any Turn",
        "Purple",
        "Effect: You can return D3 slain models to this unit",
      ),
    ];

    Weapon rustyBlade = Weapon("rustyBlade", "RustyBlade");
    rustyBlade.attack = "2";
    rustyBlade.hit = "4+";
    rustyBlade.wound = "5+";
    rustyBlade.rend = "-";
    rustyBlade.damage = "1";

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

    List<Ability> stormfiendsSpells = [
      Ability.color(
        "Shock Gauntlets",
        "Passive",
        "Red",
        "Effect: Each time an attack made with this unit`s Shock Gauntlets scores a critical hit, that attack scores D6 hits"
            "instead of 1 (make a wound roll for each hit).",
      ),
    ];

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

    List<Ability> warpLightningCannonSpells = [
      Ability.color(
        "Warp Lightning Blast",
        "Passive",
        "Blue",
        "Effect: Each attack made with this weapon in a single phase must target the same enemy unit."
            "Each hit inflicts 1 mortal damage on the target and the attack sequence ends.",
      ),
    ];

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

    Ability threeClawsteps = Ability(
      "Always three Clawsteps Ahead",
      "-",
      "-",
      "-",
      "-",
    );
    threeClawsteps.timing = "Once Per Phase, Enemy Movement Phase";
    threeClawsteps.color = "Gray";
    threeClawsteps.details =
    "Declare: Pick a friendly unit that is not in combat."
        "\n\nEffect: That unit can use the `Normal Move` ability as if it were your movement phase.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(threeClawsteps);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability endlessSwarmofRats = Ability(
      "Endless Swarm of Rats",
      "-",
      "-",
      "-",
      "-",
    );
    endlessSwarmofRats.timing = "Any end of turn";
    endlessSwarmofRats.color = "Purple";
    endlessSwarmofRats.details =
    "Effect: When a friendly Clanrats unit uses its `Seething Swarm` ability, you can return D6 slain"
        "models to that unit instead of D3.";

    Ability warpstoneLacedArmour = Ability(
      "Warpstone-laced Armour",
      "-",
      "-",
      "-",
      "-",
    );
    warpstoneLacedArmour.timing =
    "Once Per Battle, Reaction: Opponent declared an ATTACK ability and targeted your Stormfiends unit";
    warpstoneLacedArmour.color = "Red";
    warpstoneLacedArmour.details =
    "Used By: Your Stormfiends unit."
        "\n\nEffect: Your Stormfiends unit has WARD (5+) for the rest of the turn.";

    List<Ability> regimentAbilies = [endlessSwarmofRats, warpstoneLacedArmour];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability cageOfWarpLightning = Ability(
      "Cage of Warp Lightning",
      "-",
      "-",
      "-",
      "-",
    );
    cageOfWarpLightning.keywords = "Enhancement";
    cageOfWarpLightning.timing = "Once Per Battle, Any Combat Phase";
    cageOfWarpLightning.color = "Red";
    cageOfWarpLightning.details =
    "Declare: Pick a visible enemy unit within 6\" of your general and roll a dice"
        "\n\nEffect: On a 2+, the enemy unit has STRIKE-LAST this phase. On a 1, inflict 1 mortal damage on your general";

    Ability scurryAway = Ability("Scurry Away", "-", "-", "-", "-");
    scurryAway.keywords = "Enhancement";
    scurryAway.timing = "Any Combat Phase";
    scurryAway.color = "Red";
    scurryAway.details =
    "Effect: Roll a dice. On a 3+, this unit can immediately use the `Retreat` ability as if it were your movement"
        "phase. If it does so, no mortal damage is inflicted on it.";

    Ability skilledManipulator = Ability(
      "Skilled Manipulator",
      "-",
      "-",
      "-",
      "-",
    );
    skilledManipulator.keywords = "Enhancement";
    skilledManipulator.timing = "Passive";
    skilledManipulator.color = "Red";
    skilledManipulator.details =
    "Effect: Your general has WARD (4+) while they are within 1\" of any friendly CLanrats units.";

    Ability skitterleap = Ability("Skitterleap", "-", "-", "-", "-");
    skitterleap.keywords = "Enhancement";
    skitterleap.timing = "Your Hero Phase";
    skitterleap.color = "Yellow";
    skitterleap.details =
    "Declare: Make a casting roll of 2D6."
        "\n\nEffect: On a 6+, remove your general from the battlefield and set them up again on the battlefield"
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