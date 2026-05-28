import 'package:aos_battle_helper/classes/settings.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';

class StarscaleWarhost {
  Settings pickStarscaleWarhost(Settings settings) {
    //---------------------------------------------------------
    // General SAURUS OLDBLOOD ON CARNOSAUR

    Weapon sunboltGauntlet = Weapon("sunboltGauntlet", "Sunbolt Gauntlet");
    sunboltGauntlet.range = "12\"";
    sunboltGauntlet.attack = "D6";
    sunboltGauntlet.hit = "3+";
    sunboltGauntlet.wound = "3+";
    sunboltGauntlet.rend = "1";
    sunboltGauntlet.damage = "1";
    sunboltGauntlet.ability = "Shoot in Combat";

    Weapon relicWeapon = Weapon("relicWeapon", "Relic Celestite Weapon");
    relicWeapon.attack = "5";
    relicWeapon.hit = "3+";
    relicWeapon.wound = "3+";
    relicWeapon.rend = "1";
    relicWeapon.damage = "2";

    Weapon jaws = Weapon("jaws", "Carnosaur´s Massive Jaws");
    jaws.attack = "3";
    jaws.hit = "4+";
    jaws.wound = "2+";
    jaws.rend = "2";
    jaws.damage = "3";
    jaws.ability = "Companion";

    Ability warlord = Ability("Ancient Warlord");
    warlord.typeName = "Ability (Activated)";
    warlord.timing = "Your Hero Phase";
    warlord.color = "Yellow";
    warlord.declare =
        "Pick a friendly unit wholly within 12\" of this unit to be the target. You cannot pick this unit.";
    warlord.effect =
        "Until the start of your next turn, add 1 to charge rolls for the target.";

    Ability damaged = Ability("Battle Damaged");
    damaged.typeName = "Ability (Passive)";
    damaged.color = "Black";
    damaged.effect =
        "While this unit has 10 or more damage points, the Attacks characteristic of its Carnosaur’s Massive Jaws is 1.";

    List<Ability> generalSpells = [warlord, damaged];

    Unit general = Unit.withSpells(
      "Saurus Oldblood on Carnosaur",
      generalSpells,
    );
    general.weapons.add(sunboltGauntlet);
    general.weapons.add(relicWeapon);
    general.weapons.add(jaws);
    general.id = "General";
    general.move = "10\"";
    general.health = "14";
    general.save = "4+";
    general.control = "5";
    general.keywords = "Hero, Monster";

    // General SAURUS OLDBLOOD ON CARNOSAUR
    //---------------------------------------------------------
    // SAURUS WARRIORS

    Weapon celestiteClub = Weapon("celestiteClub", "Celestite Club");
    celestiteClub.attack = "2";
    celestiteClub.hit = "3+";
    celestiteClub.wound = "3+";
    celestiteClub.rend = "1";
    celestiteClub.damage = "1";

    Ability cohorts = Ability("Ordered Cohorts");
    cohorts.typeName = "Ability (Passive)";
    cohorts.color = "Green";
    cohorts.effect =
        "Add 1 to save rolls for this unit while it is contesting an objective you control.";

    List<Ability> saurusWarriorSpells = [cohorts];

    Unit saurusWarriors = Unit.withSpells(
      "Saurus Warriors",
      saurusWarriorSpells,
    );

    saurusWarriors.weapons.add(celestiteClub);
    saurusWarriors.move = "5\"";
    saurusWarriors.health = "2";
    saurusWarriors.save = "4+";
    saurusWarriors.control = "1";
    saurusWarriors.keywords = "Infantry";

    // SAURUS WARRIORS
    //---------------------------------------------------------
    // KROXIGOR

    Weapon drakebite = Weapon("drakebite", "Drakebite Maul");
    drakebite.attack = "4";
    drakebite.hit = "4+";
    drakebite.wound = "2+";
    drakebite.rend = "1";
    drakebite.damage = "2";

    Ability blows = Ability("Brutal BLows");
    blows.typeName = "Ability (Passive)";
    blows.color = "Red";
    blows.effect =
        "This unit’s melee weapons have Crit (2 Hits) if the target unit has 5 or more models.";

    List<Ability> kroxigorSpells = [blows];

    Unit kroxigor = Unit.withSpells("Kroxigor", kroxigorSpells);
    kroxigor.weapons.add(drakebite);
    kroxigor.move = "5\"";
    kroxigor.health = "6";
    kroxigor.save = "4+";
    kroxigor.control = "2";
    kroxigor.keywords = "Infantry";

    // KROXIGOR
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, saurusWarriors, kroxigor];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability beastOfJungle = Ability("Beast of the Dark Jungles");
    beastOfJungle.typeName = "Ability (Activated)";
    beastOfJungle.timing = "Any Combat Phase";
    beastOfJungle.color = "Red";
    beastOfJungle.declare =
        "Pick your general to use this ability if they are in combat.";
    beastOfJungle.effect =
        "Pick 1 of the following:"
        "\nGargantuan Jaws: Pick an enemy unit in combat with your general and roll a dice. If the roll exceeds"
        "that unit’s Health characteristic, 1 model in that unit is slain."
        "\nRoar: Pick an enemy unit in combat with your general. Subtract D6 from that unit’s control score this turn.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(beastOfJungle);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability predatoryFighters = Ability("Predatory Fighters");
    predatoryFighters.typeName = "Ability (Activated)";
    predatoryFighters.timing = "Once Per Phase, End of Any Turn";
    predatoryFighters.color = "Purple";
    predatoryFighters.declare =
        "Roll a dice for each enemy unit in combat with any friendly units.";
    predatoryFighters.effect =
        "On a 3+, inflict 1 mortal damage on the unit being rolled for.";

    Ability templeGuardians = Ability("Temple-City Guardians");
    templeGuardians.typeName = "Ability (Passive)";
    templeGuardians.timing = "Passive";
    templeGuardians.color = "Green";
    templeGuardians.effect =
        "Friendly units have Ward (6+) while they are wholly within friendly territory.";

    List<Ability> regimentAbilies = [predatoryFighters, templeGuardians];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability sotekGaze = Ability("Sotek´s Gaze");
    sotekGaze.typeName = "Ability (Activated)";
    sotekGaze.keywords = "Enhancement";
    sotekGaze.timing = "End of Any Turn";
    sotekGaze.color = "Purple";
    sotekGaze.effect =
        "Roll a dice. Add the roll to your general’s control score this turn.";

    Ability ancientStrategist = Ability("Ancient Strategist");
    ancientStrategist.typeName = "Ability (Activated)";
    ancientStrategist.keywords = "Enhancement";
    ancientStrategist.timing = "Once Per Battle, Any Movement Phase";
    ancientStrategist.color = "Gray";
    ancientStrategist.declare =
        "Pick a friendly unit wholly within 12\" of your general. You cannot pick your general.";
    ancientStrategist.effect =
        "That unit can use the ‘Normal Move’ ability as if it were your movement phase.";

    Ability bladeRealities = Ability("Blade of Realities");
    bladeRealities.typeName = "Ability (Passive)";
    bladeRealities.keywords = "Enhancement";
    bladeRealities.timing = "Passive";
    bladeRealities.color = "Red";
    bladeRealities.effect =
        "Add 1 to the Rend characteristic of your general’s Relic Celestite Weapon.";

    Ability wrathChotec = Ability("The Wrath of Chotec");
    wrathChotec.typeName = "Ability (Passive)";
    wrathChotec.keywords = "Enhancement";
    wrathChotec.timing = "Passive";
    wrathChotec.color = "Blue";
    wrathChotec.effect =
        "The Attacks characteristic of your general’s Sunbolt Gauntlet is 6 instead of D6.";

    List<Ability> enhancements = [
      sotekGaze,
      ancientStrategist,
      bladeRealities,
      wrathChotec,
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
