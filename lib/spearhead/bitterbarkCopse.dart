import '../classes/ability.dart';
import '../classes/battleTraits.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import '../classes/weapon.dart';
import 'spearheadGeneralSpells.dart';

class BitterbarkCopse {
  Settings pickBitterbarkCopse(Settings settings) {
    //---------------------------------------------------------
    // General BRANCHWYCH

    Weapon greenwood = Weapon("greenwood", "Greenwood Scythe and Bittergrub");
    greenwood.attack = "3";
    greenwood.hit = "3+";
    greenwood.wound = "4+";
    greenwood.rend = "1";
    greenwood.damage = "D3";

    Ability harmony = Ability("Verdurous Harmony");
    harmony.typeName = "Ability (Activated)";
    harmony.timing = "Your Hero Phase";
    harmony.color = "Yellow";
    harmony.declare =
        "Pick a visible friendly unit wholly within 18\" of this unit to be the target, then make a casting roll of 2D6.";
    harmony.effect =
        "On a 7+, you can return 1 slain model to the target unit. If you picked a Tree‑Revenants unit, you can return D3 slain models instead of 1.";

    List<Ability> generalSpells = [
      SpearheadGeneralSpells().getGuardedHero(),
      harmony,
    ];

    Unit general = Unit.withSpells("Jorvan Kreel", generalSpells);
    general.id = "General";
    general.weapons.add(greenwood);
    general.move = "6\"";
    general.health = "5";
    general.save = "5+";
    general.control = "2";
    general.keywords = "Hero, Wizard, Infantry";

    // General BRANCHWYCH
    //---------------------------------------------------------
    // TREELORD

    Weapon strangle = Weapon("strangle", "Strangleroots");
    strangle.range = "10\"";
    strangle.attack = "3";
    strangle.hit = "3+";
    strangle.wound = "2+";
    strangle.rend = "1";
    strangle.damage = "2";

    Weapon sweeping = Weapon("sweeping", "Sweeping Blows");
    sweeping.attack = "5";
    sweeping.hit = "4+";
    sweeping.wound = "2+";
    sweeping.rend = "1";
    sweeping.damage = "2";

    Weapon talons = Weapon("talons", "Massive Impaling Talons");
    talons.attack = "2";
    talons.hit = "4+";
    talons.wound = "2+";
    talons.rend = "2";
    talons.damage = "3";

    Ability shake = Ability("Groundshaker");
    shake.typeName = "Ability (Activated)";
    shake.timing = "Any Combat Phase";
    shake.color = "Red";
    shake.declare =
        "Pick an enemy unit in combat with this unit to be the target, then roll a dice.";
    shake.effect = "On a 4+, the target has Strike-last this phase.";

    Ability damaged = Ability("Battle Damaged");
    damaged.typeName = "Ability (Passive)";
    damaged.color = "Black";
    damaged.effect =
        "While this unit has 10 or more damage points, the Attacks characteristic of its Massive Impaling Talons is 1.";

    List<Ability> treelordSpells = [shake, damaged];

    Unit treelord = Unit.withSpells("Treelord", treelordSpells);
    treelord.weapons.add(strangle);
    treelord.weapons.add(sweeping);
    treelord.weapons.add(talons);
    treelord.move = "5\"";
    treelord.health = "14";
    treelord.save = "3+";
    treelord.control = "5";
    treelord.keywords = "Monster";

    // TREELORD
    //---------------------------------------------------------
    // KURNOTH HUNTERS

    Weapon greatbow = Weapon("greatbow", "Kurnoth Greatbow");
    greatbow.range = "18\"";
    greatbow.attack = "2";
    greatbow.hit = "3+";
    greatbow.wound = "3+";
    greatbow.rend = "1";
    greatbow.damage = "2";

    Weapon claws = Weapon("claws", "Vicious Claws");
    claws.attack = "3";
    claws.hit = "3+";
    claws.wound = "3+";
    claws.rend = "-";
    claws.damage = "1";

    Ability everqueen = Ability("Envoys of the Everqueen");
    everqueen.typeName = "Ability (Passive)";
    everqueen.color = "Green";
    everqueen.effect =
        "While this unit is contesting an objective, friendly units contesting that objective have Ward (6+).";

    List<Ability> hunterSpells = [everqueen];

    Unit hunters = Unit.withSpells("Kurnoth Hunters", hunterSpells);
    hunters.weapons.add(greatbow);
    hunters.weapons.add(claws);
    hunters.move = "5\"";
    hunters.health = "5";
    hunters.save = "4+";
    hunters.control = "2";
    hunters.keywords = "Infantry";

    // KURNOTH HUNTERS
    //---------------------------------------------------------
    // TREE-REVENANTS

    Weapon blade = Weapon("blade", "Enchanted Blade");
    blade.attack = "2";
    blade.hit = "3+";
    blade.wound = "4+";
    blade.rend = "1";
    blade.damage = "1";

    Ability memories = Ability("Martial Memories");
    memories.typeName = "Ability (Active)";
    memories.timing = "Any Combat Phase";
    memories.color = "Red";
    memories.effect =
        "Pick 1 of the following effects to apply to this unit this phase: "
        "\nMemories of War: Add 1 to hit rolls for attacks made by this unit. "
        "\nMemories of Peace: Add 1 to save rolls for this unit.";

    List<Ability> revenantSpells = [memories];

    Unit revenants = Unit.withSpells("Tree-Revenants", revenantSpells);
    revenants.weapons.add(blade);
    revenants.move = "6\"";
    revenants.health = "3";
    revenants.save = "5+";
    revenants.control = "1";
    revenants.keywords = "Infantry, Reinforcements";

    // TREE-REVENANTS
    //---------------------------------------------------------
    // Unit-List Build

    List<Unit> units = [general, treelord, hunters, revenants];

    // Unit-List Build
    //---------------------------------------------------------
    // Battle Traits

    Ability ley = Ability("Ley Lines");
    ley.typeName = "Ability (Active)";
    ley.timing = "Once Per Turn, End of Any Turn";
    ley.color = "Purple";
    ley.effect =
        " Heal (1) each friendly unit that is within 3\" of any terrain features.";

    Ability strike = Ability("Strike and Fade");
    strike.typeName = "Ability (Active)";
    strike.timing = "Once Per Turn, End of Any Turn";
    strike.color = "Purple";
    strike.declare =
        "Pick a friendly unit that used a Fight ability this turn and is within 3\" of any terrain features, then roll a dice.";
    strike.effect =
        "On a 2+, remove that unit from the battlefield and set it up again so that "
        "each model in the unit is within 3\" of any terrain features and more than 6\" from all enemy units.";

    BattleTraits battleTraits = BattleTraits();
    battleTraits.abilitys.add(ley);
    battleTraits.abilitys.add(strike);

    // Battle Traits
    //---------------------------------------------------------
    // Regiment Abilities

    Ability vengeful = Ability("Vengeful Spirits of the Land");
    vengeful.typeName = "Ability (Active)";
    vengeful.timing = "Once Per Turn, End of Any Turn";
    vengeful.color = "Purple";
    vengeful.declare =
        "Pick an enemy unit that is contesting an objective and roll a dice.";
    vengeful.effect = "On a 4+, inflict D3 mortal damage on that enemy unit.";

    Ability walkers = Ability("Walkers of the Hidden Paths");
    walkers.typeName = "Ability (Active)";
    walkers.timing = "Once Per Turn, Your Movement Phase";
    walkers.color = "Grey";
    walkers.declare =
        "Pick a friendly unit that is within 3\" of any terrain features and not in combat.";
    walkers.effect =
        "Remove that unit from the battlefield and set it up again more than 6\" from all enemy units. "
        "\nThat unit cannot use Move abilities for the rest of the phase.";

    List<Ability> regimentAbilies = [vengeful, walkers];

    // Regiment Abilities
    //---------------------------------------------------------
    // Enhancements

    Ability regrow = Ability("Regrowth");
    regrow.keywords = "Enhancement";
    regrow.typeName = "Ability (Active)";
    regrow.timing = "Your Hero Phase";
    regrow.color = "Yellow";
    regrow.declare =
        "Pick a visible friendly unit wholly within 18\" of your general to be the target, then make a casting roll of 2D6.";
    regrow.effect = "On a 5+, Heal (D6) the target.";

    Ability warrior = Ability("Gnarled Warrior");
    warrior.keywords = "Enhancement";
    warrior.typeName = "Ability (Passive)";
    warrior.color = "Green";
    warrior.effect =
        "Ignore negative modifiers to save rolls for your general.";

    Ability tree = Ability("Treesong");
    tree.keywords = "Enhancement";
    tree.typeName = "Ability (Active)";
    tree.timing = "Your Hero Phase";
    tree.color = "Yellow";
    tree.declare =
        "Pick a visible friendly unit wholly within 12\" of your general to be the target, then make a casting roll of 2D6.";
    tree.effect =
        "On a 7+, add 1 to the Rend characteristic of the target unit’s melee weapons until the start of your next turn.";

    Ability seed = Ability("Seed of Rebirth");
    seed.keywords = "Enhancement";
    seed.typeName = "Ability (Passive)";
    seed.color = "Green";
    seed.effect =
        "If your general would be destroyed, before removing them from play, roll a dice. "
        "\nOn a 3+, your general is not destroyed and any remaining damage points inflicted on them have no effect. "
        "\nThen, Heal (1) your general. This unit cannot use this ability again for the rest of the battle.";

    List<Ability> enhancements = [regrow, warrior, tree, seed];

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
