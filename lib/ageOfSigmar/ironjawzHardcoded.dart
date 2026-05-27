import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/spellLore.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import '../spearhead/spearheadGeneralSpells.dart';
import 'aosGeneralSpells.dart';

class IronjawzHardcoded {

  Settings pickIronjawzHardcoded(Settings settings) {
    //---------------------------------------------------------
    // Megaboss

    Ability alright = Ability("Alright, Get´ Em",);
    alright.typeName = "Ability (Passive)";
    alright.color = "Orange";
    alright.effect = "If a friendly IRONJAWZ unit uses the ‘Counter-charge’ command while it is wholly within 12\" of "
        "this unit, spend 1 command point to use that command instead of 2.";

    Ability obsessed = Ability("Obsessed With Violence",);
    obsessed.typeName = "Ability (Passive)";
    obsessed.color = "Black";
    obsessed.effect = "Add 1 to hit rolls for this unit’s attacks while it is in combat. Add 1 to this unit’s Move characteristic while it is not in combat.";

    List<Ability> megabossSpells = [alright, obsessed, SpearheadGeneralSpells().getGuardedHero(),];

    Weapon choppa = Weapon("choppa", "Choppa");
    choppa.attack = "7";
    choppa.hit = "4+";
    choppa.wound = "3+";
    choppa.rend = "1";
    choppa.damage = "3";
    choppa.ability = "-";

    Unit megaboss = Unit.withSpells("Megaboss", megabossSpells);
    megaboss.weapons.add(choppa);
    megaboss.move = "5\"";
    megaboss.health = "6";
    megaboss.save = "3+";
    megaboss.control = "2";
    megaboss.keywords = "Destruction, Ironjawz, Hero, Infantry";

    // Megaboss
    //---------------------------------------------------------
    // Ardboyz
    Ability shield = Ability("Shield Bash",);
    shield.timing = "Any Combat Phase";
    shield.typeName = "Ability (Activated)";
    shield.color = "Red";
    shield.effect = "Make a shield bash roll of D6 for each model in this unit that is within 3\" of the target. For each 6+, inflict 1 mortal damage on the target.";

    List<Ability> ardboyzSpells = [shield, aosGeneralSpells().getChampion(), aosGeneralSpells().getStandardBearer()];

    Weapon choppaOrStikka = Weapon("choppaOrStikka", "Choppa or Stikka");
    choppaOrStikka.attack = "2";
    choppaOrStikka.hit = "4+";
    choppaOrStikka.wound = "3+";
    choppaOrStikka.rend = "1";
    choppaOrStikka.damage = "1";
    choppaOrStikka.ability = "Anti-charge (+1 Rend)";

    Unit ardboyz = Unit.withSpells("Ardboyz", ardboyzSpells);
    ardboyz.weapons.add(choppaOrStikka);
    ardboyz.move = "4\"";
    ardboyz.health = "2";
    ardboyz.save = "3+";
    ardboyz.control = "1";
    ardboyz.keywords =
    "Destruction, Ironjawz, Infantry, Champion, Standard Bearer";

    // Ardboyz
    //---------------------------------------------------------
    // Brutes
    Ability messin = Ability("You Messin'?",);
    messin.typeName = "Ability (Passive)";
    messin.color = "Purple";
    messin.effect = "Enemy units with a Health characteristic of 1 or 2 cannot contest objectives while they are in combat with this unit.";

    List<Ability> brutesSpells = [messin, aosGeneralSpells().getChampion(),];

    Weapon bruteWeapons = Weapon("bruteWeapons", "Brute Weapons");
    bruteWeapons.attack = "3";
    bruteWeapons.hit = "4+";
    bruteWeapons.wound = "3+";
    bruteWeapons.rend = "1";
    bruteWeapons.damage = "2";
    bruteWeapons.ability = "Anti-Infantry (+1 Rend)";

    Weapon goreChoppa = Weapon("goreChoppa", "Gore-choppa");
    goreChoppa.attack = "3";
    goreChoppa.hit = "4+";
    goreChoppa.wound = "3+";
    goreChoppa.rend = "2";
    goreChoppa.damage = "3";

    Unit brutes = Unit.withSpells("Brutes", brutesSpells);
    brutes.weapons.add(bruteWeapons);
    brutes.weapons.add(goreChoppa);
    brutes.move = "4\"";
    brutes.health = "3";
    brutes.save = "3+";
    brutes.control = "1";
    brutes.keywords = "Destruction, Ironjawz, Infantry, Champion, Brute";

    // Brutes
    //---------------------------------------------------------
    // Gore-gruntas

    Ability goreGruntaCharge = Ability("Gore-grunta Charge",);
    goreGruntaCharge.timing = "Any Charge Phase";
    goreGruntaCharge.typeName = "Ability (Activated)";
    goreGruntaCharge.color = "Orange";
    goreGruntaCharge.declare = "If this unit charged this phase, pick an enemy unit within 1\" of it to be the target.";
    goreGruntaCharge.effect = "Roll a D3. On a 2+, inflict an amount of mortal damage on the target equal to the roll. "
        "Add 1 to the mortal damage inflicted (if any) if the target is Cavalry.";

    List<Ability> goreGruntaSpells = [goreGruntaCharge, aosGeneralSpells().getChampion(),];

    Weapon choppaOrHacka = Weapon("choppaOrHacka", "Choppa or Hacka");
    choppaOrHacka.attack = "4";
    choppaOrHacka.hit = "4+";
    choppaOrHacka.wound = "3+";
    choppaOrHacka.rend = "1";
    choppaOrHacka.damage = "1";
    choppaOrHacka.ability = "Anti-Cavalry (+1 Rend)";

    Weapon gruntaTusks = Weapon("gruntaTusks", "Grunta`s Tusks");
    gruntaTusks.attack = "4";
    gruntaTusks.hit = "4+";
    gruntaTusks.wound = "2+";
    gruntaTusks.rend = "-";
    gruntaTusks.damage = "1";
    gruntaTusks.ability = "Charge (+1 Damage), Companion";

    Unit goreGruntas = Unit.withSpells("Gore-gruntas", goreGruntaSpells);
    goreGruntas.weapons.add(choppaOrHacka);
    goreGruntas.weapons.add(gruntaTusks);
    goreGruntas.move = "9\"";
    goreGruntas.health = "5";
    goreGruntas.save = "3+";
    goreGruntas.control = "2";
    goreGruntas.keywords = "Destruction, Ironjawz, Cavalry, Champion";

    // Gore-gruntas
    //---------------------------------------------------------
    // Weirdnob Shaman

    Ability brutalPower = Ability("Brutal Power",);
    brutalPower.typeName = "Ability (Passive)";
    brutalPower.color = "Yellow";
    brutalPower.effect = "Add 1 to this unit’s power level while there are any friendly Ironjawz units that have 10 or more models wholly within 12\" of it.";

    List<Ability> shamanSpells = [brutalPower, SpearheadGeneralSpells().getGuardedHero(),];

    Weapon greenPuke = Weapon("greenPuke", "GreenPuke");
    greenPuke.range = "10\"";
    greenPuke.attack = "4";
    greenPuke.hit = "2+";
    greenPuke.wound = "4+";
    greenPuke.rend = "-";
    greenPuke.damage = "D3";
    greenPuke.ability = "Shoot In Combat";

    Weapon waaaghStaff = Weapon("waaaghStaff", "Waaagh! Staff");
    waaaghStaff.attack = "3";
    waaaghStaff.hit = "4+";
    waaaghStaff.wound = "3+";
    waaaghStaff.rend = "1";
    waaaghStaff.damage = "D3";

    Unit weirdnobShaman = Unit.withSpells("Weirdnob Shaman", shamanSpells);
    weirdnobShaman.weapons.add(greenPuke);
    weirdnobShaman.weapons.add(waaaghStaff);
    weirdnobShaman.move = "4\"";
    weirdnobShaman.health = "6";
    weirdnobShaman.save = "6+";
    weirdnobShaman.control = "2";
    weirdnobShaman.keywords =
    "Destruction, Ironjawz, Infantry, Hero, Wizard (1)";

    // Weirdnob Shaman
    //---------------------------------------------------------
    // Bossrokk Tower

    Ability manDaTower = Ability("Man da Tower!",);
    manDaTower.typeName = "Ability (Passive)";
    manDaTower.color = "Black";
    manDaTower.effect = "While this terrain feature has a Shouty Boss:\n• The Shouty Boss cannot use Move abilities.\n• Instead of measuring range or visibility to the Shouty Boss, measure to this terrain feature instead.\n• All attacks that would target the Shouty Boss target this terrain feature instead.\n• If this terrain feature is destroyed, before removing it from the battlefield, inflict D3 mortal damage on the Shouty Boss. Then, set up the Shouty Boss on the battlefield within 3\" of this terrain feature and not in combat. That unit is no longer the Shouty Boss. If it is not possible to set up the Shouty Boss, it is slain.";

    Ability upWeGo = Ability("Up We Go!");
    upWeGo.timing = "Your Hero Phase";
    upWeGo.typeName = "Ability (Activated)";
    upWeGo.color = "Yellow";
    upWeGo.declare = "If this terrain feature does not have a Shouty Boss , pick a friendly Ironjawz Infantry Hero that is not in combat and "
    "is within 3\" of it to be the target.";
    upWeGo.effect = "Effect: Place the target on this terrain feature. The target is now a Shouty Boss (see ‘Man da Tower’).";

    Ability bossy = Ability("Aggressively Bossy",);
    bossy.timing =  "Once Per Turn, Your Hero Phase";
    bossy.typeName = "Ability (Activated)";
    bossy.color = "Yellow";
    bossy.declare = "Pick a visible enemy unit within 18\" of this terrain feature to be the target.";
    bossy.effect = "Roll a dice. Add 1 to the roll if this terrain feature has a Shouty Boss. On a 4+, pick 1 of the following effects "
    "to apply to the target until the start of your next turn:\nDat's Ours, Ya Git!: Subtract 3 from the target's control score."
    "\nZog Off Wiv Ya Magic!: Subtract 1 from casting rolls and/or chanting rolls for the target."
    "\nOi! Hold it!: Subtract 1 from the number of dice rolled when making charge rolls for the target, to a minimum of 1.";

    Ability off = Ability("I'm Off!",);
    off.timing = "Your Movement Phase";
    off.typeName = "Ability (Activated)";
    off.color = "Gray";
    off.effect = "If this terrain feature has a Shouty Boss that was not placed on it this turn, "
    "set up the Shouty Boss on the battlefield wholly within 6\" of this terrain feature and not in combat. That unit is no longer a Shouty Boss.";

    List<Ability> towerSpells = [manDaTower, upWeGo, bossy, off];

    Unit tower = Unit.withSpells("Bossrokk Tower", towerSpells);
    tower.move = "-";
    tower.health = "12";
    tower.save = "4+";
    tower.keywords = "Destruction, Ironjawz, Faction Terrain";

    // Bossrokk Tower
    //---------------------------------------------------------
    // Manifestation

    Ability multipleParts = Ability("Multiple Parts",);
    multipleParts.typeName = "Ability (Passive)";
    multipleParts.color = "Black";
    multipleParts.effect = "When a number of damage points equal to this Manifestation's Health characteristic are allocated to it, "
        "this Manifestation is destroyed and all its parts are removed from play.";

    Ability wanderingDestruction = Ability("Wandering Destruction");
    wanderingDestruction.timing = "Once Per Turn, Your Movement Phase";
    wanderingDestruction.typeName = "Ability (Activated)";
    wanderingDestruction.color = "Gray";
    wanderingDestruction.declare = "Pick a part of this Manifestation to be the target.\nRemove the target from the battlefield and set it up again on the "
        "battlefield wholly within 9\" of the other part of this Manifestation.\nThen, roll a D3 for each enemy unit within 3\" of the target. "
        "On a 2+:\n• Inflict an amount of mortal damage on the target equal to the roll.\n• That unit has the Stomped keyword until the start of your "
        "next turn.\n• Subtract 1 from the number of dice rolled when making charge rolls for Stomped units, to a minimum of 1.";

        List<Ability> footSpells = [multipleParts, wanderingDestruction, aosGeneralSpells().getWardSave()];

    Unit foot = Unit.withSpells("Foot of Gork", footSpells);
    foot.health = "8";
    foot.save = "4+";
    foot.banishment = "7+";
    foot.keywords =
    "Destruction, Ironjawz, Manifestation, Endless Spell, Ward (6+)";


    Ability bellowing = Ability("Bellowing Waaagh!-Cries",);
    bellowing.timing = "Your Hero Phase";
    bellowing.typeName = "Ability (Activated)";
    bellowing.color = "Yellow";
    bellowing.declare = "Pick a friendly Ironjawz or Kruleboyz Wizard or Priest within 3\" of this Manifestation to be the target.";
    bellowing.effect = "Pick either 1 or 2 to add to casting rolls or chanting rolls for the target until the start of your next turn. "
        "Then, roll a number of dice equal to the number picked. For each 1-2, allocate 1 damage point to the target "
        "(ward rolls cannot be made for those damage points). For each 5+, until the start of your next turn, add 1 to charge rolls for "
        "friendly Kruleboyz or Ironjawz units while they are wholly within 12\" of this Manifestation. Friendly units can be affected by "
        "this ability multiple times and the effects are cumulative.";

      List<Ability> gorkSpells = [bellowing, aosGeneralSpells().getWardSave()];

    Weapon toxicGas = Weapon("toxicGas", "Toxic Gas");
    toxicGas.attack = "5";
    toxicGas.hit = "2+";
    toxicGas.wound = "4+";
    toxicGas.rend = "1";
    toxicGas.damage = "D3";

    Unit gork = Unit.withSpells("Gork-Roara", gorkSpells);
    gork.weapons.add(toxicGas);
    gork.move = "6";
    gork.health = "6";
    gork.save = "5+";
    gork.banishment = "7+";
    gork.keywords =
    "Destruction, Ironjawz, Manifestation, Endless Spell, Ward (6+)";

    Ability tricksy = Ability("Tricksy Footing");
    tricksy.typeName = "Ability (Passive)";
    tricksy.color = "Yellow";
    tricksy.effect = "Subtract 3 from the control score of enemy units while they are within 6\" of this Manifestation.";

    Ability grasping = Ability("Grasping Gunge",);
    grasping.typeName = "Ability (Passive)";
    grasping.color = "Gray";
    grasping.effect = "Enemy units cannot use Run abilities while they are within 6\" of this Manifestation.";

    List<Ability> morkspitSpells = [tricksy, grasping, aosGeneralSpells().getWardSave()];

    Unit morkspit = Unit.withSpells("Morkspit Marsh", morkspitSpells);
    morkspit.health = "8";
    morkspit.save = "5+";
    morkspit.banishment = "7+";
    morkspit.keywords =
    "Destruction, Ironjawz, Manifestation, Endless Spell, Ward (6+)";

    // Manifestation
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [
      megaboss,
      ardboyz,
      brutes,
      goreGruntas,
      weirdnobShaman,
      tower,
      foot,
      gork,
      morkspit,
    ];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability ironjawzWaaagh = Ability("Ironjawz Waaagh!");
    ironjawzWaaagh.timing = "Once Per Turn (Army), Your Charge Phase";
    ironjawzWaaagh.typeName = "Ability (Activated)";
    ironjawzWaaagh.keywords = "WAAAGH!";
    ironjawzWaaagh.color = "Orange";
    ironjawzWaaagh.declare = "Pick a friendly Ironjawz Hero to be the target. You cannot pick the same Hero to be the target of this ability more than once per battle.";
    ironjawzWaaagh.effect = "For the rest of the turn, the following effects apply to friendly Ironjawz units while they are wholly within 18\" of the target:\n"
          "• Add 1 to charge rolls for those units.\n• Add 1 to the Attacks characteristic of those units’ melee weapons.";

    Ability mightyDestroyers = Ability("Mighty Destroyers",);
    mightyDestroyers.timing = "Once Per Turn (Army), Any Hero Phase";
    mightyDestroyers.typeName = "Ability (Activated)";
    mightyDestroyers.color = "Yellow";
    mightyDestroyers.declare = "Pick a friendly Ironjawz unit that was not set up this turn to be the target.";
    mightyDestroyers.effect = "The target can move up to 3\". It can move into combat. If it was in combat at the start of the move, it must end that move in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(ironjawzWaaagh);
    battleTraits.abilitys.add(mightyDestroyers);

    // Battle Traits
    //---------------------------------------------------------
    // Spell Lore

    Ability summonFoot = Ability("Summon Foot of Gork",);
    summonFoot.timing = "Your Hero Phase";
    summonFoot.typeName = "Ability (Activated)";
    summonFoot.color = "Yellow";
    summonFoot.castingValue = "7";
    summonFoot.keywords = "Spell, Summon";
    summonFoot.declare = "If there is not a friendly Foot of Gork on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.";
    summonFoot.effect = "Set up a Foot of Gork wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units. "
        "A Foot of Gork has 2 parts that must be set up within 9\" of each other.";

    Ability summonGork = Ability("Summon Gork-Roara",);
    summonGork.timing = "Your Hero Phase";
    summonGork.typeName = "Ability (Activated)";
    summonGork.color = "Yellow";
    summonGork.castingValue = "5";
    summonGork.keywords = "Spell, Summon";
    summonGork.declare = "If there is not a friendly Gork-Roara on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.";
    summonGork.effect = "Set up a Gork-Roara wholly within 12\" of the caster, visible to them and more than 9\" from all enemy units.";

    Ability summonMorkspit = Ability("Summon Morkspit Marsh",);
    summonMorkspit.timing = "Your Hero Phase";
    summonMorkspit.typeName = "Ability (Activated)";
    summonMorkspit.color = "Yellow";
    summonMorkspit.castingValue = "5";
    summonMorkspit.keywords = "Spell, Summon";
    summonMorkspit.declare = "If there is not a friendly Morkspit Marsh on the battlefield, pick a friendly Ironjawz Wizard to cast this spell, then make a casting roll of 2D6.";
    summonMorkspit.effect = "Set up a Morkspit Marsh wholly within 18\" of the caster and visible to them.";

    Ability bashEmLadz = Ability("Bash 'Em, Ladz",);
    bashEmLadz.timing = "Your Hero Phase";
    bashEmLadz.typeName = "Ability (Activated)";
    bashEmLadz.color = "Yellow";
    bashEmLadz.castingValue = "6";
    bashEmLadz.keywords = "Spell, Unlimited";
    bashEmLadz.declare = "Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly Ironjawz unit wholly within 12\" of them to be the target, "
        "then make a casting roll of 2D6.";
    bashEmLadz.effect = "The target’s melee weapons have Crit (2 Hits) until the start of your next turn";

    Ability greatHand = Ability("Da Great Big Green Hand of Gork",);
    greatHand.timing = "Your Hero Phase";
    greatHand.typeName = "Ability (Activated)";
    greatHand.color = "Yellow";
    greatHand.castingValue = "7";
    greatHand.keywords = "Spell";
    greatHand.declare = "Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly unit wholly within 12\" of them and not in combat to be the "
        "target, then make a casting roll of 2D6.";
    greatHand.effect = "Remove the target from the battlefield and set it up again wholly within 24\" of the caster and more than 9\" from all enemy units.";

    Ability mightyEadbutt = Ability("Mighty 'Eadbutt",);
    mightyEadbutt.timing = "Your Hero Phase";
    mightyEadbutt.typeName = "Ability (Activated)";
    mightyEadbutt.color = "Yellow";
    mightyEadbutt.castingValue = "6";
    mightyEadbutt.keywords = "Spell";
    mightyEadbutt.declare = "Pick a friendly Ironjawz Wizard to cast this spell, pick a visible enemy unit within 18\" of them to be the target, then make a casting roll of 2D6.";
    mightyEadbutt.effect = "Inflict D3 mortal damage on the target. If the target is a Wizard, inflict 3 mortal damage on the target instead.";

    SpellLore spellLore = SpellLore();
    spellLore.abilitys.add(summonFoot);
    spellLore.abilitys.add(summonGork);
    spellLore.abilitys.add(summonMorkspit);
    spellLore.abilitys.add(bashEmLadz);
    spellLore.abilitys.add(greatHand);
    spellLore.abilitys.add(mightyEadbutt);

    // Spell Lore
    //---------------------------------------------------------
    // Battle Formation

    Ability naturalDisaster = Ability("Natural Disaster",);
    naturalDisaster.typeName = "Ability (Passive)";
    naturalDisaster.color = "Orange";
    naturalDisaster.effect = "If you make an unmodified charge roll of 8+ for a friendly non-Hero Ironjawz unit, "
        "add 1 to the Attacks characteristic of that unit’s melee weapons for the rest of the turn.";

    BattleFormation battleFormation = BattleFormation();
    battleFormation.abilitys.add(naturalDisaster);

    // Battle Formation
    //---------------------------------------------------------
    //

    settings.army.unitList = units;

    settings.army.battleTraitsList.clear();
    settings.army.battleTraitsList.add(battleTraits);

    settings.army.battleFormationsList.clear();
    settings.army.battleFormationsList.add(battleFormation);

    settings.army.spellLore = spellLore;

    return settings;
  }
}