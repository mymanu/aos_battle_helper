import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class SentinelsOfEmbergard {
  Settings pickSentinelsOfEmbergard(Settings settings) {
    //---------------------------------------------------------
    // General JORVAN KRREEL

    Weapon rangerblades = Weapon("rangerblades", "Ranger Blades");
    rangerblades.attack = "6";
    rangerblades.hit = "3+";
    rangerblades.wound = "4+";
    rangerblades.rend = "1";
    rangerblades.damage = "2";

    Ability prowling = Ability("Prowling Ash Panther");
    prowling.typeName = "Ability (Activated)";
    prowling.timing = "End of Any Turn";
    prowling.color = "Purple";
    prowling.effect =
        "If this unit has the Thexa token, give that token to an enemy unit within 6\" of this unit. "
        "If an enemy unit has the Thexa token, inflict D3 mortal damage on that enemy unit. Then, give this unit the Thexa token.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
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
    // MALLUS FORGEPRIEST

    Weapon warhammer = Weapon("warhammer", "Sigmarite Warhammer");
    warhammer.attack = "2";
    warhammer.hit = "4+";
    warhammer.wound = "3+";
    warhammer.rend = "1";
    warhammer.damage = "1";
    warhammer.ability = "Anti-charge (+1 Rend)";

    Ability consecrate = Ability("Consecrate the Land");
    consecrate.typeName = "Ability (Activated)";
    consecrate.timing = "Your Hero Phase";
    consecrate.color = "Yellow";
    consecrate.declare =
        "Pick an objective within 12\" of this unit, then make a chanting roll of D6.";
    consecrate.effect =
        "On a 3+, for the rest of the turn, friendly units have Ward (5+) while they are contesting that objective.";

    List<Ability> forepriestSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      consecrate,
    ];

    Unit forepriest = Unit.withSpells("Mallus Forgepriest", forepriestSpells);
    forepriest.weapons.add(warhammer);
    forepriest.move = "5\"";
    forepriest.health = "5";
    forepriest.save = "4+";
    forepriest.control = "2";
    forepriest.keywords = "Hero, Priest, Infantry";

    // MALLUS FORGEPRIEST
    //---------------------------------------------------------
    // FREEGUILD GALLANTS

    Weapon gallantry = Weapon("gallantry", "Weapons of Gallantry");
    gallantry.attack = "2";
    gallantry.hit = "3+";
    gallantry.wound = "4+";
    gallantry.rend = "1";
    gallantry.damage = "1";

    Ability will = Ability("Consecrate the Land");
    will.typeName = "Ability (Activated)";
    will.timing = "Your Hero Phase";
    will.color = "Yellow";
    will.declare =
        "Pick an objective within 12\" of this unit, then make a chanting roll of D6.";
    will.effect =
        "On a 3+, for the rest of the turn, friendly units have Ward (5+) while they are contesting that objective.";

    List<Ability> gallantsSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      will,
    ];

    Unit gallants = Unit.withSpells("Freeguild Gallants", gallantsSpells);
    gallants.weapons.add(warhammer);
    gallants.move = "5\"";
    gallants.health = "2";
    gallants.save = "3+";
    gallants.control = "1";
    gallants.keywords = "Infantry";

    // FREEGUILD GALLANTS
    //---------------------------------------------------------
    // FREEGUILD GRENADIERS

    Weapon arsenal = Weapon("arsenal", "Ruin-sweeper Arsenal");
    arsenal.range = "10\"";
    arsenal.attack = "1";
    arsenal.hit = "4+";
    arsenal.wound = "2+";
    arsenal.rend = "2";
    arsenal.damage = "1";

    Weapon bardiche = Weapon("bardiche", "Grenadier Bardiche");
    bardiche.attack = "2";
    bardiche.hit = "4+";
    bardiche.wound = "4+";
    bardiche.rend = "1";
    bardiche.damage = "2";

    Ability cinder = Ability("Cinder and Ash");
    cinder.typeName = "Ability (Activated)";
    cinder.timing = "Once Per Turn (Army), End of Any Turn";
    cinder.color = "Purple";
    cinder.declare =
        "Pick up to 1 terrain feature contested by this unit and up to 1 objective contested by this unit, "
        "then pick any enemy units also contesting them to be the targets.";
    cinder.effect =
        "Roll a dice for each target. On a 3+, inflict 1 mortal damage on the target.";

    List<Ability> grenadierSpells = [cinder];

    Unit grenadiers = Unit.withSpells("Freeguild Grenadiers", grenadierSpells);
    grenadiers.weapons.add(arsenal);
    grenadiers.weapons.add(bardiche);
    grenadiers.move = "5\"";
    grenadiers.health = "1";
    grenadiers.save = "4+";
    grenadiers.control = "1";
    grenadiers.keywords = "Infantry, Reinforcements";

    // FREEGUILD GRENADIERS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, forepriest, gallants, grenadiers];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability rangerDoctrines = Ability("Ranger Doctrines");
    rangerDoctrines.timing =
        "Once Per Turn (Army), Reaction: You declared a Fight ability for your general or a friendly non-Hero unit wholly within 12\" of your general";
    rangerDoctrines.typeName = "Ability (Activated)";
    rangerDoctrines.color = "Red";
    rangerDoctrines.usedBy = "The unit using that Fight ability.";
    rangerDoctrines.effect =
        "Immediately after that Fight ability has been resolved, pick a point on the battlefield within 6\" of your general. "
        "\nRemove the unit using this ability from the battlefield and set it up again within 1\" of that point and not in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(rangerDoctrines);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability closeDrill = Ability("Close-Quarters Drill");
    closeDrill.typeName = "Ability (Passive)";
    closeDrill.color = "Blue";
    closeDrill.effect =
        " Friendly units’ ranged weapons have Shoot in Combat but you must subtract 1 from hit rolls for their shooting attacks while they are in combat.";

    Ability blaggards = Ability("Come and Take It, Blaggards");
    blaggards.typeName = "Ability (Passive)";
    blaggards.color = "Purple";
    blaggards.effect =
        "Add 5 to the control scores of friendly non-Hero units "
        "while they are in combat with any enemy units that have 6 or more models "
        "or a Health characteristic of 3 or more.";

    List<Ability> regimentAbilies = [closeDrill, blaggards];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability knives = Ability("Throwing Knives");
    knives.keywords = "Enhancement";
    knives.typeName = "Ability (Active)";
    knives.timing = "Any Shooting Phase";
    knives.color = "Blue";
    knives.declare =
        "Pick a visible enemy unit within 10\" of your general to be the target.";
    knives.effect =
        "Roll a dice. On a 3+, inflict 1 mortal damage on the target.";

    Ability trainedRanger = Ability("Trained Ranger");
    trainedRanger.keywords = "Enhancement";
    trainedRanger.typeName = "Ability (Active)";
    trainedRanger.timing = "Once Per Battle, Your Movement Phase";
    trainedRanger.color = "Gray";
    trainedRanger.declare =
        " Pick a friendly unit wholly within 6\" of a battlefield edge to be the target.";
    trainedRanger.effect =
        "Remove the target from the battlefield and set it up again wholly within 3\" of a battlefield edge and more than 6\" from all enemy units.";

    Ability endurance = Ability("Hot-Blooded Endurance");
    endurance.keywords = "Enhancement";
    endurance.typeName = "Ability (Passive)";
    endurance.color = "Orange";
    endurance.effect =
        "Your general can use Charge abilities even if they used a Run or Retreat ability in the same turn "
        "\nand no mortal damage is inflicted on them by Retreat abilities.";

    Ability kraken = Ability("Mega Bossy");
    kraken.keywords = "Enhancement";
    kraken.typeName = "Ability (Active)";
    kraken.timing = "Once Per Battle, Any Combat Phase";
    kraken.color = "Red";
    kraken.effect =
        "Double the Attacks characteristic of your general’s melee weapons for the rest of the turn.";

    List<Ability> enhancements = [knives, trainedRanger, endurance, kraken];

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
