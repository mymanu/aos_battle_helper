import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class SpitewingFlight {
  Settings pickSpitewingFlight(Settings settings) {
    //---------------------------------------------------------
    // General ARCH-REVENANT

    Weapon arch = Weapon("arch", "Arch-Revenant’s Glaive");
    arch.attack = "5";
    arch.hit = "3+";
    arch.wound = "4+";
    arch.rend = "1";
    arch.damage = "2";

    Ability horn = Ability("Heartwood Hunting Horn");
    horn.typeName = "Ability (Activated)";
    horn.timing = "Your Hero Phase";
    horn.color = "Yellow";
    horn.declare =
        "Pick a visible friendly unit wholly within 12\" of this unit to be the target.";
    horn.effect =
        "Until the start of your next turn, when determining which effects of the ‘Song of the Hunt’ ability apply to the target, "
        "you count as having 1 additional chord.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      horn,
    ];

    Unit general = Unit.withSpells("Arch-Revenant", generalSpells);
    general.id = "General";
    general.weapons.add(arch);
    general.move = "12\"";
    general.health = "6";
    general.save = "4+";
    general.control = "2";
    general.keywords = "Hero, Infantry, Fly";

    // General ARCH-REVENANT
    //---------------------------------------------------------
    // GOSSAMID ARCHERS

    Weapon bow = Weapon("bow", "Gossamid Bow");
    bow.range = "12\"";
    bow.attack = "2";
    bow.hit = "3+";
    bow.wound = "4+";
    bow.rend = "1";
    bow.damage = "1";
    bow.ability = "Shoot in Combat";

    Weapon cruelTalons = Weapon("cruelTalons", "Cruel Talons");
    cruelTalons.attack = "1";
    cruelTalons.hit = "3+";
    cruelTalons.wound = "4+";
    cruelTalons.rend = "-";
    cruelTalons.damage = "1";

    Ability zephyrSpites = Ability("Zephyr Spites");
    zephyrSpites.typeName = "Ability (Activated)";
    zephyrSpites.timing =
        "Reaction: You declared a Shoot ability for this unit";
    zephyrSpites.color = "Blue";
    zephyrSpites.effect =
        "After that Shoot ability has been resolved, this unit can move up to D6\". "
        "\nIt cannot move into combat during any part of that move.";

    List<Ability> archersSpells = [zephyrSpites];

    Unit archers = Unit.withSpells("Gossamid Archers", archersSpells);
    archers.weapons.add(bow);
    archers.weapons.add(cruelTalons);
    archers.move = "12\"";
    archers.health = "2";
    archers.save = "5+";
    archers.control = "1";
    archers.keywords = "Infantry, Fly";

    // GOSSAMID ARCHERS
    //---------------------------------------------------------
    // SPITERIDER LANCERS

    Weapon lance = Weapon("lance", "Spiterider Lance");
    lance.attack = "3";
    lance.hit = "3+";
    lance.wound = "4+";
    lance.rend = "1";
    lance.damage = "1";
    lance.ability = "Charge (+1 Damage";

    Weapon mandibles = Weapon("mandibles", "Dragonspite´s Mandibles");
    mandibles.attack = "3";
    mandibles.hit = "4+";
    mandibles.wound = "3+";
    mandibles.rend = "1";
    mandibles.damage = "2";
    mandibles.ability = "Companion";

    Ability spiterCharge = Ability("Spiterider Charge");
    spiterCharge.typeName = "Ability (Active)";
    spiterCharge.timing = "Any Charge Phase";
    spiterCharge.color = "Orange";
    spiterCharge.declare =
        "If this unit charged this phase, pick a visible enemy unitwithin 1\" of it to be the target.";
    spiterCharge.effect =
        "Roll a D3. Add 1 to the roll if the target is the enemy quarry. "
        "\nOn a 2+, inflict an amount of mortal damage on the target equal to the roll.";

    List<Ability> lancerSpells = [spiterCharge];

    Unit lancers = Unit.withSpells("Spiterider Lancers", lancerSpells);
    lancers.weapons.add(lance);
    lancers.weapons.add(mandibles);
    lancers.move = "12\"";
    lancers.health = "5";
    lancers.save = "4+";
    lancers.control = "2";
    lancers.keywords = "Cavalry, Fly";

    // SPITERIDER LANCERS
    //---------------------------------------------------------
    // REVENANT SEEKERS

    Weapon sickle = Weapon("sickle", "Seeker´s Sickle");
    sickle.attack = "3";
    sickle.hit = "3+";
    sickle.wound = "4+";
    sickle.rend = "1";
    sickle.damage = "1";
    sickle.ability = "Crit (Mortal)";

    // Weapon mandibles und Ability spiterCharge siehe Unit "SPITERIDER LANCERS" darüber.

    List<Ability> lancersSpells = [spiterCharge];

    Unit seeker = Unit.withSpells("Revenant Seekers", lancersSpells);
    seeker.weapons.add(sickle);
    seeker.weapons.add(mandibles);
    seeker.move = "6\"";
    seeker.health = "3";
    seeker.save = "5+";
    seeker.control = "1";
    seeker.keywords = "Infantry, Reinforcements";

    // REVENANT SEEKERS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, archers, lancers, seeker];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability target = Ability("Target of Vengeance");
    target.typeName = "Ability (Active)";
    target.timing = "Once Per Battle Round (Army), Start of Battle Round";
    target.color = "Black";
    target.declare =
        " If there is no enemy quarry on the battlefield, pick an enemy unit on the battlefield to be the target.";
    target.effect = "The target is the quarry for the rest of the battle.";

    Ability airborne = Ability("Airborne Cohesion");
    airborne.typeName = "Ability (Passive)";
    airborne.color = "Black";
    airborne.effect = "Friendly units have a coherency range of 2\".";

    Ability hunt = Ability("Song of the Hunt");
    hunt.typeName = "Ability (Passive)";
    hunt.color = "Black";
    hunt.effect =
        "You gain 1 chord each time an enemy quarry is destroyed. The following cumulative effects apply depending on the number of chords you have:"
        "\n1 chord: Simple: Add 1 to run rolls and charge rolls for friendly units while they are within 9\" of the enemy quarry."
        "\n2 chords: Tuneful: Add 1 to hit rolls for friendly units’ attacks while they are within 9\" of the enemy quarry."
        "\n3+ chords: Melodic: Add 1 to wound rolls for friendly units’ attacks while they are within 9\" of the enemy quarry.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(target);
    battleTraits.abilitys.add(airborne);
    battleTraits.abilitys.add(hunt);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability leaves = Ability("Leaves on the Wind");
    leaves.typeName = "Ability (Active)";
    leaves.timing = "Once Per Battle (Army), End of Any Turn";
    leaves.color = "Purple";
    leaves.declare = "Pick a friendly unit that is in combat to be the target.";
    leaves.effect =
        "The target can immediately use the ‘Retreat’ ability as if it were your movement phase and no mortal damage is inflicted on it if it does so.";

    Ability lifeBringer = Ability("Life Bringers");
    lifeBringer.typeName = "Ability (Active)";
    lifeBringer.timing = "Once Per Turn (Army), End of Any Turn";
    lifeBringer.color = "Purple";
    lifeBringer.effect = "Heal (D3) each friendly unit.";

    List<Ability> regimentAbilies = [leaves, lifeBringer];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability head = Ability("Head of the Hunt");
    head.keywords = "Enhancement";
    head.typeName = "Ability (Passive)";
    head.color = "Red";
    head.effect =
        "Add 1 to the Rend characteristic of your general’s melee weapons while the enemy quarry is within 9\" of and visible to them.";

    Ability zephyr = Ability("Zephyrkin");
    zephyr.keywords = "Enhancement";
    zephyr.typeName = "Ability (Active)";
    zephyr.timing = "Reaction: You declared a Fight ability for your general";
    zephyr.color = "Red";
    zephyr.effect =
        "If your general charged this turn, they can move up to 2D6\" after that Fight ability has been resolved. "
        "They cannot end that move in combat.";

    Ability spirit = Ability("Bold Spirit");
    spirit.keywords = "Enhancement";
    spirit.typeName = "Ability (Active)";
    spirit.timing = "Once Per Battle (Army), Any Hero Phase";
    spirit.color = "Yellow";
    spirit.effect =
        "For the rest of the turn, add 1 to wound rolls for friendly units’ combat attacks while they are within your general’s combat range.";

    Ability cunning = Ability("Cunning Pursuer");
    cunning.keywords = "Enhancement";
    cunning.typeName = "Ability (Passive)";
    cunning.color = "Orange";
    cunning.effect =
        "While your general is in combat, add 1 to charge rolls for friendly units wholly within 12\" of them. "
        "Add 2 instead while your general is in combat with the quarry.";

    List<Ability> enhancements = [head, zephyr, spirit, cunning];

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
