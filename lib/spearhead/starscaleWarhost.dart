
import 'package:aos_battle_helper/classes/settings.dart';

import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';

class StarscaleWarhost {
  Settings pickStarscaleWarhost(Settings settings) {
    //---------------------------------------------------------
    // General SAURUS OLDBLOOD ON CARNOSAUR

    List<Ability> generalSpells = [
      Ability.color(
        "Ancient Warlord",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly unit wholly within 12\" of this unit to be the target. You cannot pick this unit."
            "\n\nEffect: Until the start of your next turn, add 1 to charge rolls for the target.",
      ),
      Ability.color(
        "Battle Damaged",
        "Passive",
        "Black",
        "Effect: While this unit has 10 or more damage points, the Attacks characteristic of its Carnosaur’s Massive Jaws is 1.",
      ),
    ];

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

    List<Ability> saurusWarriorSpells = [
      Ability.color(
        "Ordered Cohorts",
        "Passive",
        "Green",
        "Effect: Add 1 to save rolls for this unit while it is contesting an objective you control.",
      ),
    ];

    Weapon celestiteClub = Weapon("celestiteClub", "Celestite Club");
    celestiteClub.attack = "2";
    celestiteClub.hit = "3+";
    celestiteClub.wound = "3+";
    celestiteClub.rend = "1";
    celestiteClub.damage = "1";

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

    List<Ability> kroxigorSpells = [
      Ability.color(
        "Brutal BLows",
        "Passive",
        "Red",
        "Effect: This unit’s melee weapons have Crit (2 Hits) if the target unit has 5 or more models.",
      ),
    ];

    Weapon drakebite = Weapon("drakebite", "Drakebite Maul");
    drakebite.attack = "4";
    drakebite.hit = "4+";
    drakebite.wound = "2+";
    drakebite.rend = "1";
    drakebite.damage = "2";

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

    Ability BeastOfJungle = Ability(
      "Beast of the Dark Jungles",
      "-",
      "-",
      "-",
      "-",
    );
    BeastOfJungle.timing = "Any Combat Phase";
    BeastOfJungle.color = "Red";
    BeastOfJungle.details =
    "Declare: Pick your general to use this ability if they are in combat."
        "\n\nEffect: Pick 1 of the following:"
        "\nGargantuan Jaws: Pick an enemy unit in combat with your general and roll a dice. If the roll exceeds"
        "that unit’s Health characteristic, 1 model in that unit is slain."
        "\nRoar: Pick an enemy unit in combat with your general. Subtract D6 from that unit’s control score this turn.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(BeastOfJungle);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability predatoryFighters = Ability(
      "Predatory Fighters",
      "-",
      "-",
      "-",
      "-",
    );
    predatoryFighters.timing = "Once Per Phase, End of Any Turn";
    predatoryFighters.color = "Purple";
    predatoryFighters.details =
    "Declare: Roll a dice for each enemy unit in combat with any friendly units."
        "\n\nEffect: On a 3+, inflict 1 mortal damage on the unit being rolled for.";

    Ability templeGuardians = Ability(
      "Temple-City Guardians",
      "-",
      "-",
      "-",
      "-",
    );
    templeGuardians.timing = "Passive";
    templeGuardians.color = "Green";
    templeGuardians.details =
    "Effect: Friendly units have Ward (6+) while they are wholly within friendly territory.";

    List<Ability> regimentAbilies = [predatoryFighters, templeGuardians];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability sotekGaze = Ability("Sotek´s Gaze", "-", "-", "-", "-");
    sotekGaze.keywords = "Enhancement";
    sotekGaze.timing = "End of Any Turn";
    sotekGaze.color = "Purple";
    sotekGaze.details =
    "Effect: Roll a dice. Add the roll to your general’s control score this turn.";

    Ability ancientStrategist = Ability(
      "Ancient Strategist",
      "-",
      "-",
      "-",
      "-",
    );
    ancientStrategist.keywords = "Enhancement";
    ancientStrategist.timing = "Once Per Battle, Any Movement Phase";
    ancientStrategist.color = "Grey";
    ancientStrategist.details =
    "Declare: Pick a friendly unit wholly within 12\" of your general. You cannot pick your general."
        "\n\nEffect: That unit can use the ‘Normal Move’ ability as if it were your movement phase.";

    Ability bladeRealities = Ability("Blade of Realities", "-", "-", "-", "-");
    bladeRealities.keywords = "Enhancement";
    bladeRealities.timing = "Passive";
    bladeRealities.color = "Red";
    bladeRealities.details =
    "Effect: Add 1 to the Rend characteristic of your general’s Relic Celestite Weapon.";

    Ability wrathChotec = Ability("The Wrath of Chotec", "-", "-", "-", "-");
    wrathChotec.keywords = "Enhancement";
    wrathChotec.timing = "Passive";
    wrathChotec.color = "Blue";
    wrathChotec.details =
    "Effect: The Attacks characteristic of your general’s Sunbolt Gauntlet is 6 instead of D6.";

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