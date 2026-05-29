import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class GnawfeastClawpack{
  Settings pickGnawfeastClawpack(Settings settings){
    //---------------------------------------------------------
    // General CLAWLORD ON GNAW-BEAST

    Weapon ratlingPistol = Weapon("ratlingPistol", "Ratling Pistol");
    ratlingPistol.range = "10\"";
    ratlingPistol.attack = "D6";
    ratlingPistol.hit = "3+";
    ratlingPistol.wound = "3+";
    ratlingPistol.rend = "1";
    ratlingPistol.damage = "1";
    ratlingPistol.ability = "Crit (Auto-wound), Shoot in Combat";

    Weapon warpforgedHalberd = Weapon(
      "warpforgedHalberd",
      "Warpforged Halberd",
    );
    warpforgedHalberd.attack = "5";
    warpforgedHalberd.hit = "3+";
    warpforgedHalberd.wound = "4+";
    warpforgedHalberd.rend = "1";
    warpforgedHalberd.damage = "2";

    Weapon fangs = Weapon("fangs", "Gnaw-beast’s Chisel Fangs");
    fangs.attack = "4";
    fangs.hit = "4+";
    fangs.wound = "3+";
    fangs.rend = "1";
    fangs.damage = "D3";
    fangs.ability = "Companion";

    Ability corner = Ability("Cornered Rat");
    corner.typeName = "Ability (Passive)";
    corner.color = "Red";
    corner.effect = "While this unit is damaged, add 3 to the Attacks characteristic of its Warpforged Halberd.";

    List<Ability> generalSpells = [SpearheadGeneralSpells().getGuardedHero(), corner];

    Unit general = Unit.withSpells("Clawlord on Gnaw-Beast", generalSpells);
    general.id = "General";
    general.weapons.add(ratlingPistol);
    general.weapons.add(warpforgedHalberd);
    general.weapons.add(fangs);
    general.move = "9\"";
    general.health = "7";
    general.save = "4+";
    general.control = "2";
    general.keywords = "Hero, Cavalry, Ward (6+)";

    // General CLAWLORD ON GNAW-BEAST
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
    hornet.declare = "Pick a friendly unit wholly within 13\" of this unit to be the target, then roll a dice.";
    hornet.effect = "On a 3+, add the roll to the target`s control score until the start of your next turn.";

    Ability wither = Ability("Wither");
    wither.typeName = "Ability (Activated)";
    wither.timing = "Your Hero Phase";
    wither.color = "Yellow";
    wither.declare = "Pick a visible enemy unit within 13\" of this unit to be the target, then make a casting roll of 2D6.";
    wither.effect = "On a 6+, inflict D3 mortal damage on the target.";

    List<Ability> greySeerSpells = [SpearheadGeneralSpells().getGuardedHero(), hornet, wither];

    Unit greySeer = Unit.withSpells("Grey Seer", greySeerSpells);
    greySeer.weapons.add(warpstoneStaff);
    greySeer.move = "6\"";
    greySeer.health = "5";
    greySeer.save = "6+";
    greySeer.control = "2";
    greySeer.keywords = "Hero, Wizard, Infantry";

    // Grey Seer
    //---------------------------------------------------------
    // BRUTE WARLOCK ENGINEER

    Weapon warplockMusket = Weapon("warplockMusket", "Warplock Musket");
    warplockMusket.range = "24\"";
    warplockMusket.attack = "2";
    warplockMusket.hit = "3+";
    warplockMusket.wound = "3+";
    warplockMusket.rend = "2";
    warplockMusket.damage = "D3";
    warplockMusket.ability = "Crit (Auto-wound)";

    Weapon warpforgedDagger = Weapon("warpforgedDagger", "Warpforged Dagger");
    warpforgedDagger.attack = "3";
    warpforgedDagger.hit = "4+";
    warpforgedDagger.wound = "4+";
    warpforgedDagger.rend = "-";
    warpforgedDagger.damage = "2";

    Ability warp = Ability("More-More Warp Energy!");
    warp.typeName = "Ability (Activated)";
    warp.timing = "Reaction: You declared a SHOOT ability for this unit and it has not used a MOVE ability this turn.";
    warp.color = "Blue";
    warp.effect = "Roll a dice. On a 2+, set the Damage characteristic of its Warplock Musket to 3 this phase. "
        "\nOn a 1, inflict D3 mortal damage on this unit.";

    List<Ability> warlockSpells = [SpearheadGeneralSpells().getGuardedHero(), warp,];

    Unit warlock = Unit.withSpells("Warlock Engineer", warlockSpells);
    warlock.weapons.add(warplockMusket);
    warlock.weapons.add(warpforgedDagger);
    warlock.move = "6\"";
    warlock.health = "5";
    warlock.save = "5+";
    warlock.control = "2";
    warlock.keywords = "Hero, Infantry";

    // WARLOCK ENGINEER
    //---------------------------------------------------------
    // Clanrats

    Weapon rustyBlade = Weapon("rustyBlade", "Rusty Blade");
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

    //---------------------------------------------------------
    // RAT OGORS

    Weapon warpfireGun = Weapon("warpfireGun", "Warpfire Gun");
    warpfireGun.range = "10\"";
    warpfireGun.attack = "2D6";
    warpfireGun.hit = "2+";
    warpfireGun.wound = "4+";
    warpfireGun.rend = "2";
    warpfireGun.damage = "1";
    warpfireGun.ability = "Shoot in Combat";

    Weapon claws = Weapon("claws", "Claws, Blades and Fangs");
    claws.attack = "5";
    claws.hit = "4+";
    claws.wound = "3+";
    claws.rend = "1";
    claws.damage = "2";

    Ability fury = Ability("Unleashed Warp-Fury");
    fury.typeName = "Ability (Activated)";
    fury.timing = "Any Combat Phase, Once Per Battle";
    fury.color = "Red";
    fury.effect = "Inflict D3 mortal damage on this unit. Then, add 1 to the Attacks characteristic of its melee weapons this phase.";

    List<Ability> ratOgorsSpells = [fury];

    Unit ratOgors = Unit.withSpells("ratOgors", ratOgorsSpells);
    ratOgors.weapons.add(claws);
    ratOgors.move = "6\"";
    ratOgors.health = "4";
    ratOgors.save = "5+";
    ratOgors.control = "1";
    ratOgors.keywords = "Infantry";

    // RAT OGORS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, greySeer, warlock, clanrats, ratOgors];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability vermintide = Ability("The Lurking Vermintide");
    vermintide.typeName = "Ability (Activated)";
    vermintide.timing = "Once Per Battle, Deployment Phase";
    vermintide.color = "Black";
    vermintide.declare = "Pick a friendly unit that has not been deployed to be the target.";
    vermintide.effect =
        "The target unit is set up in reserve in the tunnels below. "
        "Units in the tunnels below that have not used the ‘Gnawhole Ambush’ ability "
        "by the end of the third battle round are destroyed.";

    Ability ambush = Ability("Gnawhole Ambush");
    ambush.typeName = "Ability (Activated)";
    ambush.timing = "Your Movement Phase";
    ambush.color = "Gray";
    ambush.declare = "Pick a friendly unit that is in the tunnels below to use this ability.";
    ambush.effect =
        "Set up that unit wholly within 6\" of a corner of the battlefield and more than 9\" from all enemy units.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(vermintide);
    battleTraits.abilitys.add(ambush);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability bullets = Ability("Warpstone-Laced Bullets");
    bullets.typeName = "Ability (Activated)";
    bullets.timing = "Once Per Battle, Your Shooting Phase";
    bullets.color = "Blue";
    bullets.declare = "Pick a ranged weapon a friendly unit is armed with.";
    bullets.effect =
        "That weapon has Crit (Mortal) this phase.";

    Ability tooquick = Ability("Too Quick Too Hit-Hit");
    tooquick.typeName = "Ability (Passive)";
    tooquick.timing = "Passive";
    tooquick.color = "Grey";
    tooquick.effect =
    "No mortal damage is inflicted on friendly units when they use Retreat abilities.";

    List<Ability> regimentAbilies = [bullets, tooquick];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability horde = Ability("Lead The Seething Horde");
    horde.typeName = "Ability (Activated)";
    horde.keywords = "Enhancement";
    horde.timing =
    "Reaction. You declared the ´Call for Reinforcments´ ability";
    horde.color = "Red";
    horde.effect =
    "Instead of using the set-up instructions in the ‘Call for Reinforcements’ ability, "
        "the replacement unit can be set up wholly within 13\" of this unit and not in combat.";

    Ability connections = Ability("Skyre Connections");
    connections.typeName = "Ability (Passive)";
    connections.keywords = "Enhancement";
    connections.timing = "Passive";
    connections.color = "Blue";
    connections.effect =
    "Your general’s Ratling Pistol has an Attacks characteristic of 2D6 instead of D6.";

    Ability charm = Ability("Warpstone Charm");
    charm.typeName = "Ability (Passive)";
    charm.keywords = "Enhancement";
    charm.timing = "Passive";
    charm.color = "Red";
    charm.effect =
    "Subtract 1 from save rolls for enemy units in combat with your general.";

    Ability stitched = Ability("Cloak of Stitched Victories");
    stitched.typeName = "Ability (Passive)";
    stitched.keywords = "Enhancement";
    stitched.timing = "Passive";
    stitched.color = "Green";
    stitched.effect = "Your general has Ward (5+)";

    List<Ability> enhancements = [horde, connections, charm, stitched];

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