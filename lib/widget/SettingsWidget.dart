import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/spellLore.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  @override
  _SettingsWidget createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    //String envTitle = Env.environmentName ?? "";
    //String title = widget.title + ' - ' + envTitle;
    String title = widget.title;
    //String title = widget.title + "Phase";

    //---------------------------------------------------------
    // Megaboss

    List<Ability> megabossSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Alright, Get´ Em",
        "Passive",
        "Orange",
        "If a friendly IRONJAWZ unit uses the ‘Counter-charge’ command while it is wholly within 12\" of this unit, spend 1 command point to use that command instead of 2.",
      ),
      Ability.color(
        "Obsessed With Violence",
        "Passive",
        "Black",
        "Add 1 to hit rolls for this unit’s attacks while it is in combat. Add 1 to this unit’s Move characteristic while it is not in combat.",
      ),
    ];

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

    // Megaboss
    //---------------------------------------------------------
    // Ardboyz

    List<Ability> ardboyzSpells = [
      Ability.color(
        "Shield Bash",
        "Any Combat Phase",
        "Red",
        "Make a shield bash roll of D6 for each model in this unit that is within 3\" of the target. For each 6+, inflict 1 mortal damage on the target.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit",
      ),
      Ability.color(
        "Standard Bearer",
        "Passive",
        "Purple",
        "While this unit contains any standard bearers, add 1 to this unit’s control score.",
      ),
    ];

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

    // Ardboyz
    //---------------------------------------------------------
    // Brutes

    List<Ability> brutesSpells = [
      Ability.color(
        "You Messin'?",
        "Passive",
        "Purple",
        "Enemy units with a Health characteristic of 1 or 2 cannot contest objectives while they are in combat with this unit.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit.",
      ),
    ];

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

    // Brutes
    //---------------------------------------------------------
    // Gore-gruntas

    List<Ability> goreGruntaSpells = [
      Ability.color(
        "Gore-grunta Charge",
        "Any Charge Phase",
        "Orange",
        "Declare: If this unit charged this phase, pick an enemy unit within 1\" of it to be the target.\nEffect: Roll a D3. On a 2+, inflict an amount of mortal damage on the target equal to the roll. Add 1 to the mortal damage inflicted (if any) if the target is Cavalry.",
      ),
      Ability.color(
        "Champion",
        "Passive",
        "Red",
        "Add 1 to the Attacks characteristic of weapons used by champions in this unit.",
      ),
    ];

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

    // Gore-gruntas
    //---------------------------------------------------------
    // Weirdnob Shaman

    List<Ability> shamanSpells = [
      Ability.color(
        "Guarded Hero",
        "Passive",
        "Black",
        "If this Hero is within the combat range of a friendly unit that is not a Hero:\n• Subtract 1 from hit rolls for shooting attacks that target this Hero.\n• If this Hero is Infantry, they cannot be picked as the target of shooting attacks made by models more than 12\" from them.",
      ),
      Ability.color(
        "Brutal Power",
        "Passive",
        "Yellow",
        "Add 1 to this unit’s power level while there are any friendly Ironjawz units that have 10 or more models wholly within 12\" of it.",
      ),
    ];

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

    // Weirdnob Shaman
    //---------------------------------------------------------
    // Bossrokk Tower

    List<Ability> towerSpells = [
      Ability.color(
        "Man da Tower!",
        "Passive",
        "Black",
        "While this terrain feature has a Shouty Boss:\n• The Shouty Boss cannot use Move abilities.\n• Instead of measuring range or visibility to the Shouty Boss, measure to this terrain feature instead.\n• All attacks that would target the Shouty Boss target this terrain feature instead.\n• If this terrain feature is destroyed, before removing it from the battlefield, inflict D3 mortal damage on the Shouty Boss. Then, set up the Shouty Boss on the battlefield within 3\" of this terrain feature and not in combat. That unit is no longer the Shouty Boss. If it is not possible to set up the Shouty Boss, it is slain.",
      ),
      Ability.color(
        "Up We Go!",
        "Your Hero Phase",
        "Yellow",
        "Declare: If this terrain feature does not have a Shouty Boss , pick a friendly Ironjawz Infantry Hero that is not in combat and is within 3\" of it to be the target.\nEffect: Place the target on this terrain feature. The target is now a Shouty Boss (see ‘Man da Tower’).",
      ),
      Ability.color(
        "Aggressively Bossy",
        "Once Per Turn, Your Hero Phase",
        "Yellow",
        "Declare: Pick a visible enemy unit within 18\" of this terrain feature to be the target.\nEffect: Roll a dice. Add 1 to the roll if this terrain feature has a Shouty Boss. On a 4+, pick 1 of the following effects to apply to the target until the start of your next turn:\nDat's Ours, Ya Git!: Subtract 3 from the target's control score.\nZog Off Wiv Ya Magic!: Subtract 1 from casting rolls and/or chanting rolls for the target.\nOi! Hold it!: Subtract 1 from the number of dice rolled when making charge rolls for the target, to a minimum of 1.",
      ),
      Ability.color(
        "I'm Off!",
        "Your Movement Phase",
        "Gray",
        "Effect: If this terrain feature has a Shouty Boss that was not placed on it this turn, set up the Shouty Boss on the battlefield wholly within 6\" of this terrain feature and not in combat. That unit is no longer a Shouty Boss.",
      ),
    ];

    Unit tower = Unit.withSpells("Bossrokk Tower", towerSpells);
    tower.move = "-";
    tower.health = "12";
    tower.save = "4+";
    tower.control = "-";

    // Bossrokk Tower
    //---------------------------------------------------------
    // Manifestation

    List<Ability> footSpells = [
      Ability.color(
        "Multiple Parts",
        "Passive",
        "Black",
        "When a number of damage points equal to this Manifestation's Health characteristic are allocated to it, this Manifestation is destroyed and all its parts are removed from play.",
      ),
      Ability.color(
        "Ward Save",
        "Passive",
        "Black",
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.",
      ),
      Ability.color(
        "Wandering Destruction",
        "Once Per Turn, Your Movement Phase",
        "Gray",
        "Declare: Pick a part of this Manifestation to be the target.\nRemove the target from the battlefield and set it up again on the battlefield wholly within 9\" of the other part of this Manifestation.\nThen, roll a D3 for each enemy unit within 3\" of the target. On a 2+:\n• Inflict an amount of mortal damage on the target equal to the roll.\n• That unit has the Stomped keyword until the start of your next turn.\n• Subtract 1 from the number of dice rolled when making charge rolls for Stomped units, to a minimum of 1.",
      ),
    ];

    Unit foot = Unit.withSpells("Foot of Gork", footSpells);
    foot.health = "8";
    foot.save = "4+";
    foot.banishment = "7+";

    List<Ability> gorkSpells = [
      Ability.color(
        "Ward Save",
        "Passive",
        "Black",
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.",
      ),
      Ability.color(
        "Bellowing Waaagh!-Cries",
        "Your Hero Phase",
        "Yellow",
        "Declare: Pick a friendly Ironjawz or Kruleboyz Wizard or Priest within 3\" of this Manifestation to be the target.\nEffect: Pick either 1 or 2 to add to casting rolls or chanting rolls for the target until the start of your next turn. Then, roll a number of dice equal to the number picked. For each 1-2, allocate 1 damage point to the target (ward rolls cannot be made for those damage points). For each 5+, until the start of your next turn, add 1 to charge rolls for friendly Kruleboyz or Ironjawz units while they are wholly within 12\" of this Manifestation. Friendly units can be affected by this ability multiple times and the effects are cumulative.",
      ),
    ];

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

    List<Ability> morkspitSpells = [
      Ability.color(
        "Ward Save",
        "Passive",
        "Black",
        "6+\nIn step 1 of the damage sequence (see 18.0), make a ward roll of D6 for each damage point in this unit’s damage pool. If the roll equals or exceeds this unit’s ward value, remove that damage point from the damage pool.",
      ),
      Ability.color(
        "Tricksy Footing",
        "Passive",
        "Yellow",
        "Subtract 3 from the control score of enemy units while they are within 6\" of this Manifestation.",
      ),
      Ability.color(
        "Grasping Gunge",
        "Passive",
        "Gray",
        "Enemy units cannot use Run abilities while they are within 6\" of this Manifestation.",
      ),
    ];

    Unit morkspit = Unit.withSpells("Morkspit Marsh", morkspitSpells);
    morkspit.health = "8";
    morkspit.save = "5+";
    morkspit.banishment = "7+";

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
    ironjawzWaaagh.keywords = "WAAAGH!";
    ironjawzWaaagh.color = "Orange";
    ironjawzWaaagh.details =
        "Declare: Pick a friendly Ironjawz Hero to be the target. You cannot pick the same Hero to be the target of this ability more than once per battle.\nEffect: For the rest of the turn, the following effects apply to friendly Ironjawz units while they are wholly within 18\" of the target:\n• Add 1 to charge rolls for those units.\n• Add 1 to the Attacks characteristic of those units’ melee weapons.";

    Ability mightyDestroyers = Ability("Mighty Destroyers");
    mightyDestroyers.timing = "Once Per Turn (Army), Any Hero Phase";
    mightyDestroyers.color = "Yellow";
    mightyDestroyers.details =
        "Declare: Pick a friendly Ironjawz unit that was not set up this turn to be the target.\nEffect: The target can move up to 3\". It can move into combat. If it was in combat at the start of the move, it must end that move in combat.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(ironjawzWaaagh);
    battleTraits.abilitys.add(mightyDestroyers);

    // Battle Traits
    //---------------------------------------------------------
    // Spell Lore

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

    Ability bashEmLadz = Ability("Bash 'Em, Ladz");
    bashEmLadz.timing = "Your Hero Phase";
    bashEmLadz.color = "Yellow";
    bashEmLadz.castingValue = "6";
    bashEmLadz.keywords = "Spell, Unlimited";
    bashEmLadz.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly Ironjawz unit wholly within 12\" of them to be the target, then make a casting roll of 2D6.\nEffect: The target’s melee weapons have Crit (2 Hits) until the start of your next turn";

    Ability greatHand = Ability("Da Great Big Green Hand of Gork");
    greatHand.timing = "Your Hero Phase";
    greatHand.color = "Yellow";
    greatHand.castingValue = "7";
    greatHand.keywords = "Spell";
    greatHand.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible friendly unit wholly within 12\" of them and not in combat to be the target, then make a casting roll of 2D6.\nEffect: Remove the target from the battlefield and set it up again wholly within 24\" of the caster and more than 9\" from all enemy units.";

    Ability mightyEadbutt = Ability("Mighty 'Eadbutt");
    mightyEadbutt.timing = "Your Hero Phase";
    mightyEadbutt.color = "Yellow";
    mightyEadbutt.castingValue = "6";
    mightyEadbutt.keywords = "Spell";
    mightyEadbutt.details =
        "Declare: Pick a friendly Ironjawz Wizard to cast this spell, pick a visible enemy unit within 18\" of them to be the target, then make a casting roll of 2D6.\nEffect: Inflict D3 mortal damage on the target. If the target is a Wizard, inflict 3 mortal damage on the target instead.";

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

    Ability naturalDisaster = Ability("Natural Disaster");
    naturalDisaster.timing = "Passive";
    naturalDisaster.color = "Orange";
    naturalDisaster.details =
        "If you make an unmodified charge roll of 8+ for a friendly non-Hero Ironjawz unit, add 1 to the Attacks characteristic of that unit’s melee weapons for the rest of the turn.";

    BattleFormation battleFormation = BattleFormation();
    battleFormation.abilitys.add(naturalDisaster);

    // Battle Formation
    //---------------------------------------------------------
    //

    widget.settings.army.unitList = units;

    widget.settings.army.battleTraitsList.clear();
    widget.settings.army.battleTraitsList.add(battleTraits);

    widget.settings.army.battleFormationsList.clear();
    widget.settings.army.battleFormationsList.add(battleFormation);

    widget.settings.army.spellLore = spellLore;

    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
          child: Column(
              children: [
                Text("Test-Text"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.blueGrey.shade800,
                    shadowColor: Colors.black,
                    padding: const EdgeInsets.all(10.0),
                    minimumSize: Size(250, 100),
                    maximumSize: Size(510, 510),
                  ),
                  child: Text(
                    'add Command-Point Spells',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    addCommandSpells();
                  },
                ),
              ]
          )
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void addCommandSpells() {
    List<Ability> commandSpells = [];

    Ability rally = Ability.color(
      "Rally",
      "Any Hero Phase",
      "Yellow",
      "Declare: Choose a friendly unit which is not in combat to use this ability."
          "\nEffect: Make 6x D6 Rallyroles. For each 4+ you gain 1 Rallypoint. You can use them as following:"
          "\n - Heal(1) this unit for each spent Rallypoint"
          "\n - You can use Rallypoints in the amount of health of 1 model to revive it.",
    );
    commandSpells.add(rally);

    widget.settings.commandAbilitys = commandSpells;
  }
}
