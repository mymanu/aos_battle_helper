import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/spellLore.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import '../spearhead/spearheadGeneralSpells.dart';
import 'aosGeneralSpells.dart';

class SeraphonHardcoded {
  Settings pickSeraphonHardcoded(Settings settings) {
    // Slann Solo (Special Boss)

    Weapon greatWeapon = Weapon("greatWeapon", "Great Weapon of Renown");
    greatWeapon.attack = "5";
    greatWeapon.hit = "3+";
    greatWeapon.wound = "2+";
    greatWeapon.rend = "2";
    greatWeapon.damage = "3";
    greatWeapon.ability = "Crit (Mortal)";

    Weapon hooves = Weapon(
      "hooves",
      "Ghyranite Steed`s Teeth, Hooves or Claws",
    );
    hooves.attack = "2";
    hooves.hit = "5+";
    hooves.wound = "3+";
    hooves.damage = "1";
    hooves.ability = "Companion";

    List<Ability> slannSoloSpells = [SpearheadGeneralSpells().getGuardedHero()];

    Unit slannSolo = Unit.withSpells(
      "Slann Solo - schneller als ein Skink",
      slannSoloSpells,
    );
    slannSolo.weapons.add(greatWeapon);
    slannSolo.weapons.add(hooves);
    slannSolo.move = "12\"";
    slannSolo.health = "11";
    slannSolo.save = "3+";
    slannSolo.control = "5";
    slannSolo.keywords = "General, Hero, Order, Seraphon, Cavalry";

    // Slann Solo (Special Boss)
    //---------------------------------------------------------
    // Saurus Warriors

    Weapon celestiteWeapon = Weapon("celestiteWeapon", "Celestite Weapon");
    celestiteWeapon.attack = "2";
    celestiteWeapon.hit = "3+";
    celestiteWeapon.wound = "3+";
    celestiteWeapon.rend = "1";
    celestiteWeapon.damage = "1";

    Ability orderedCohorts = Ability("Ordered Cohorts");
    orderedCohorts.typeName = "Ability (Passive)";
    orderedCohorts.color = "Green";
    orderedCohorts.effect =
        "Add 1 to save rolls for this unit while each model in this unit is contesting an objective you control.";

    List<Ability> saurusWarriorsSpells = [
      orderedCohorts,
      aosGeneralSpells().getChampion(),
      aosGeneralSpells().getStandardBearer(),
      aosGeneralSpells().getMusician(),
    ];

    Unit saurusWarriors = Unit.withSpells(
      "Saurus Warriors",
      saurusWarriorsSpells,
    );
    saurusWarriors.weapons.add(celestiteWeapon);
    saurusWarriors.move = "5\"";
    saurusWarriors.health = "2";
    saurusWarriors.save = "4+";
    saurusWarriors.control = "1";
    saurusWarriors.keywords =
        "Order, Seraphon, Saurus, Infantry, Champion, Standard Bearer, Musician";

    // Saurus Warriors
    //---------------------------------------------------------
    // Skink Starpriest

    Weapon serpentStaff = Weapon("serpentStaff", "Serpent Staff");
    serpentStaff.attack = "3";
    serpentStaff.hit = "4+";
    serpentStaff.wound = "4+";
    serpentStaff.rend = "1";
    serpentStaff.damage = "D3";

    Ability serpent = Ability("Serpent Staff");
    serpent.typeName = "Ability (Activated)";
    serpent.timing = "Your Hero Phase";
    serpent.color = "Yellow";
    serpent.declare =
        "Pick a visible friendly Seraphon unit wholly within 18\" of this unit to be the target.";
    serpent.effect =
        "Roll a dice. On a 2+, the target’s melee weapons have Crit (Auto-wound) until the start of your next turn.";

    List<Ability> skinkStarpriestSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      serpent,
    ];

    Unit skinkStarpriest = Unit.withSpells(
      "Skink Starpriest",
      skinkStarpriestSpells,
    );
    skinkStarpriest.weapons.add(serpentStaff);
    skinkStarpriest.move = "8\"";
    skinkStarpriest.health = "5";
    skinkStarpriest.save = "6+";
    skinkStarpriest.control = "2";
    skinkStarpriest.keywords =
        "Regimental Leader, Hero, Order, Seraphon, Skink, Wizard (1), Infantry";

    // Skink Starpriest
    //---------------------------------------------------------
    // Kroxigor

    Weapon moonstoneHammer = Weapon("moonstoneHammer", "Moonstone Hammer");
    moonstoneHammer.attack = "4";
    moonstoneHammer.hit = "3+";
    moonstoneHammer.wound = "2+";
    moonstoneHammer.rend = "1";
    moonstoneHammer.damage = "3";
    moonstoneHammer.ability = "Anti-Infantry (+1 Rend)";

    Weapon drakebiteMaul = Weapon("drakebiteMaul", "Drakebite Maul");
    drakebiteMaul.attack = "4";
    drakebiteMaul.hit = "4+";
    drakebiteMaul.wound = "2+";
    drakebiteMaul.rend = "1";
    drakebiteMaul.damage = "2";
    drakebiteMaul.ability = "Anti-Infantry (+1 Rend)";

    Ability blows = Ability("Brutal Blows");
    blows.typeName = "Ability (Passive)";
    blows.color = "Red";
    blows.effect =
        "Add 1 to the Damage characteristic of this unit’s melee weapons for attacks that target an enemy unit that has 10 or more models.";

    List<Ability> kroxigorSpells = [blows];

    Unit kroxigor = Unit.withSpells("Kroxigor", kroxigorSpells);
    kroxigor.weapons.add(moonstoneHammer);
    kroxigor.weapons.add(drakebiteMaul);
    kroxigor.move = "5\"";
    kroxigor.health = "6";
    kroxigor.save = "4+";
    kroxigor.control = "2";
    kroxigor.keywords = "Order, Seraphon, Kroxigor, Infantry";

    // Kroxigor
    //---------------------------------------------------------
    // Stegadon

    Weapon handlersJavelins = Weapon(
      "handlersJavelins",
      "Handlers`Meteoric Javelins",
    );
    handlersJavelins.range = "12\"";
    handlersJavelins.attack = "6";
    handlersJavelins.hit = "4+";
    handlersJavelins.wound = "4+";
    handlersJavelins.damage = "1";
    handlersJavelins.ability = "Shoot In Combat";

    Weapon skystreakBow = Weapon("skystreakBow", "Skystreak Bow");
    skystreakBow.range = "18\"";
    skystreakBow.attack = "3";
    skystreakBow.hit = "3+";
    skystreakBow.wound = "3+";
    skystreakBow.rend = "1";
    skystreakBow.damage = "2";
    skystreakBow.ability = "Anti-Monster (+1 Rend)";

    Weapon stegadonHorns = Weapon("stegadonHorns", "Stegadon`s Horns and Jaws");
    stegadonHorns.attack = "6";
    stegadonHorns.hit = "4+";
    stegadonHorns.wound = "2+";
    stegadonHorns.rend = "1";
    stegadonHorns.damage = "2";
    stegadonHorns.ability = "Charge (+1 Damage), Companion";

    Ability damaged = Ability("Battle Damaged");
    damaged.typeName = "Ability (Passive)";
    damaged.color = "Red";
    damaged.effect =
        "While this unit has 10 or more damage points, the Attacks characteristic of its Stegadon’s Horns and Jaws is 4.";

    Ability stampede = Ability("Unstoppable Stampede");
    stampede.typeName = "Ability (Activated)";
    stampede.timing = "Once Per Turn (Army), Any Charge Phase";
    stampede.color = "Orange";
    stampede.declare =
        "If this unit charged this phase, pick an enemy Infantry unit in combat with it to be the target.";
    stampede.effect =
        "Inflict D3 mortal damage on the target. Then, this unit can move 2D6\". "
        "\nThis unit can pass through models in the target unit but must end that move in combat.";

    List<Ability> stegadonSpells = [damaged, stampede];

    Unit stegadon = Unit.withSpells("Stegadon", stegadonSpells);
    stegadon.weapons.add(handlersJavelins);
    stegadon.weapons.add(skystreakBow);
    stegadon.weapons.add(stegadonHorns);
    stegadon.move = "8\"";
    stegadon.health = "14";
    stegadon.save = "4+";
    stegadon.control = "5";
    stegadon.keywords = "Order, Seraphon, Skink, Monster";

    // Stegadon
    //---------------------------------------------------------
    // Realmshaper Engine

    Ability guardians = Ability("Fierce Guardians");
    guardians.typeName = "Ability (Passive)";
    guardians.color = "Red";
    guardians.effect =
        "Add 1 to hit rolls for combat attacks made by friendly Saurus or Kroxigor units that target an enemy unit "
        "while that enemy unit is within 9\" of this terrain feature.";

    Ability power = Ability("Power Unleashed");
    power.typeName = "Ability (Activated)";
    power.timing = "Your Hero Phase";
    power.color = "Yellow";
    power.declare =
        "If there are any friendly Seraphon Wizards within 3\" of this terrain feature, pick another terrain feature within 24\" of this terrain"
        "feature, then pick up to 3 enemy units within 3\" of that terrain feature to be the targets.";
    power.effect =
        "Roll a D3 for each target. On a 2+, inflict an amount of mortal damage on the target equal to the roll. "
        "If that terrain feature has a Health characteristic, inflict D3 mortal damage on it.";

    List<Ability> realmshaperEngineSpells = [guardians, power];

    Unit realmshaperEngine = Unit.withSpells(
      "Realmshaper Engine",
      realmshaperEngineSpells,
    );
    realmshaperEngine.move = "-";
    realmshaperEngine.health = "15";
    realmshaperEngine.save = "4+";

    // Realmshaper Engine
    //---------------------------------------------------------
    // Manifestation

    //TODO muss Jenny definieren welche Manifestation sie spielen will !!!

    // Manifestation
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [
      slannSolo,
      saurusWarriors,
      skinkStarpriest,
      kroxigor,
      stegadon,
      realmshaperEngine,
    ];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability theGreatPlan = Ability("The Great Plan");
    theGreatPlan.timing = "Once Per Battle, Deployment Phase";
    theGreatPlan.color = "Black";
    theGreatPlan.declare = "Pick an Asterism ability.";
    theGreatPlan.effect =
        "That Asterism ability can be used for the rest of the battle, but the others cannot, "
        "unless allowed by the ‘Further the Great Plan’ ability.";

    Ability furtherTheGreatPlan = Ability("Further the Great Plan");
    furtherTheGreatPlan.typeName = "Ability (Activated)";
    furtherTheGreatPlan.timing =
        "Once Per Battle, Start of the Third Battle Round";
    furtherTheGreatPlan.color = "Black";
    furtherTheGreatPlan.declare =
        "You can use this ability if you meet the condition below that corresponds to the Asterism you picked in the deployment phase."
        "\nItzl the Tamer: 3 or more enemy units have been destroyed."
        "\nQuetzl the Preserver: There are no enemy units wholly within friendly territory."
        "\nSotek the Deliverer: The enemy general is in combat or has been destroyed."
        "\nTepok the Seer: There are any friendly Slann units on the battlefield and no friendly Slann units are in combat or have been destroyed.";
    furtherTheGreatPlan.effect =
        "Pick a different Asterism ability. It can be used in addition to the one you picked in the deployment phase.";

    Ability itzlTheTamer = Ability("Itzl the Tamer");
    itzlTheTamer.typeName = "Ability (Passive)";
    itzlTheTamer.timing = "Passive";
    itzlTheTamer.color = "Red";
    itzlTheTamer.effect =
        "Companion weapons used by friendly Seraphon units have Crit (2 Hits).";
    itzlTheTamer.keywords = "Asterism";

    Ability quetzlThePreserver = Ability("Quetzl the Preserver");
    quetzlThePreserver.typeName = "Ability (Passive)";
    quetzlThePreserver.timing = "Passive";
    quetzlThePreserver.color = "Red";
    quetzlThePreserver.effect =
        "Subtract 1 from the Rend characteristic of melee weapons for attacks that target friendly Seraphon units that are wholly within friendly territory.";
    quetzlThePreserver.keywords = "Asterism";

    Ability sotekTheDeliverer = Ability("Sotek the Deliverer");
    sotekTheDeliverer.typeName = "Ability (Passive)";
    sotekTheDeliverer.timing = "Passive";
    sotekTheDeliverer.color = "Gray";
    sotekTheDeliverer.effect =
        "Add 2 to the Move characteristic of friendly Seraphon units.";
    sotekTheDeliverer.keywords = "Asterism";

    Ability tepokTheSeer = Ability("Tepok the Seer");
    tepokTheSeer.typeName = "Ability (Passive)";
    tepokTheSeer.timing = "Passive";
    tepokTheSeer.color = "Yellow";
    tepokTheSeer.effect = "Add 1 to casting rolls for friendly Seraphon units.";
    tepokTheSeer.keywords = "Asterism";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(theGreatPlan);
    battleTraits.abilitys.add(furtherTheGreatPlan);
    battleTraits.abilitys.add(itzlTheTamer);
    battleTraits.abilitys.add(quetzlThePreserver);
    battleTraits.abilitys.add(sotekTheDeliverer);
    battleTraits.abilitys.add(tepokTheSeer);

    // Battle Traits
    //---------------------------------------------------------
    // Spell Lore
    //TODO hier Summon Spells für Jennys Manifestation einbauen
    /*
    Ability summonFoot = Ability("Summon Foot of Gork");
    summonFoot.timing = "Your Hero Phase";
    summonFoot.color = "Yellow";
    summonFoot.castingValue = "7";
    summonFoot.keywords = "Spell, Summon";
    summonFoot.details =
    "Declare: If there is not a friendly Foot of Gork on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Foot of Gork wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units. A Foot of Gork has 2 parts that must be set up within 9\" of each other.";

    Ability summonGork = Ability("Summon Gork-Roara");
    summonGork.timing = "Your Hero Phase";
    summonGork.color = "Yellow";
    summonGork.castingValue = "5";
    summonGork.keywords = "Spell, Summon";
    summonGork.details =
    "Declare: If there is not a friendly Gork-Roara on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Gork-Roara wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units.";

    Ability summonMorkspit = Ability("Summon Morkspit Marsh");
    summonMorkspit.timing = "Your Hero Phase";
    summonMorkspit.color = "Yellow";
    summonMorkspit.castingValue = "5";
    summonMorkspit.keywords = "Spell, Summon";
    summonMorkspit.details =
    "Declare: If there is not a friendly Morkspit Marsh on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.\nEffect: Set up a Morkspit Marsh wholly within 18\" of the caster and visible to them.";
    */

    Ability cometsCall = Ability("Comet's Call");
    cometsCall.typeName = "Ability (Activated)";
    cometsCall.timing = "Your Hero Phase";
    cometsCall.color = "Yellow";
    cometsCall.castingValue = "7";
    cometsCall.keywords = "Spell";
    cometsCall.declare =
        "Pick a friendly Seraphon Wizard to cast this spell, pick a visible enemy unit within 18\" of them to be the target, then make a casting roll of 2D6.";
    cometsCall.effect =
        "Roll a dice for each model in the target unit. For each 5+, inflict 1 mortal damage on the target.";

    Ability mysticalUnforging = Ability("Mystical Unforging");
    mysticalUnforging.typeName = "Ability (Activated)";
    mysticalUnforging.timing = "Your Hero Phase";
    mysticalUnforging.color = "Yellow";
    mysticalUnforging.castingValue = "6";
    mysticalUnforging.keywords = "Spell, Unlimited";
    mysticalUnforging.declare =
        "Pick a friendly Seraphon Wizard to cast this spell, pick a visible enemy unit within 12\" of them to be the target, then make a casting roll of 2D6.";
    mysticalUnforging.effect =
        "Subtract 1 from the Rend characteristic of the target’s weapons until the start of your next turn.";

    Ability speedOfHuanchi = Ability("Speed of Huanchi");
    speedOfHuanchi.typeName = "Ability (Activated)";
    speedOfHuanchi.timing = "Your Hero Phase";
    speedOfHuanchi.color = "Yellow";
    speedOfHuanchi.castingValue = "6";
    speedOfHuanchi.keywords = "Spell";
    speedOfHuanchi.declare =
        "Pick a friendly Seraphon Wizard to cast this spell, pick a visible friendly Seraphon unit wholly within 12\" of them to be the target, then make a casting roll of 2D6.";
    speedOfHuanchi.effect =
        "Until the start of your next turn, the target can use a Run ability and still use Shoot and/or Charge abilities later in the turn.";

    SpellLore spellLore = SpellLore();
    /*
    spellLore.abilitys.add(summonFoot);
    spellLore.abilitys.add(summonGork);
    spellLore.abilitys.add(summonMorkspit);
     */
    spellLore.abilitys.add(cometsCall);
    spellLore.abilitys.add(mysticalUnforging);
    spellLore.abilitys.add(speedOfHuanchi);

    // Spell Lore
    //---------------------------------------------------------
    // Battle Formation

    //TODO muss Jenny definieren welchen Battle Formation sie spielen will !!!
    BattleFormation battleFormation = BattleFormation();

    // Battle Formation
    //---------------------------------------------------------
    // in widget.settings die Armee hinzufügen

    settings.army.unitList = units;

    settings.army.battleTraitsList.clear();
    settings.army.battleTraitsList.add(battleTraits);

    settings.army.battleFormationsList.clear();
    settings.army.battleFormationsList.add(battleFormation);

    settings.army.spellLore = spellLore;

    return settings;
  }
}
