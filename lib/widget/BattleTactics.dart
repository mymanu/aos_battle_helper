
class BattleTactics {

List<String> masterThePaths = [
    "Affray: Cut Off The Head:\n"
        "You complete this battle tactic at the end of your turn if an enemy Hero has been destroyed this battle.",

    "Strike: Seize the Paths:\nYou complete this battle tactic at the end of your turn if there are more friendly\n"
      "units in neutral territory than enemy units. If there is no neutral territory in the battleplan you are playing, you complete this tactic\n"
      "at the end of your turn if there are no enemy units within friendly territory.",

    "Domination: Envelop and Strangle:\n"
      "You complete this battle tactic at the end of your turn if at least three different friendly units are each wholly within 9\"\n"
      "of a different corner of the battlefield and only 1 of those corners is wholly within friendly territory.\n"
      "No more than 1 of those units can have been set up this turn."
];

List<String> restlessEnergy = [
    "Affray: Water With Blood:\n"
        "You complete this battle tactic at the end of your turn if you control an objective that was controlled by your opponent at the start of the turn.",

    "Strike: Invasive Species:\n"
        "You complete this battle tactic at the end of your turn if you control every objective that can be controlled within enemy territory.\n"
        "If there are no objectives within enemy territory, you complete this battle tactic at the end of your turn\n"
        "if you control every objective that was controlled by your opponent at the start of your turn.",

    "Domination: All Roots Entwined:\n"
        "You complete this battle tactic at the end of your turn if you control every objective on the battlefield that can be controlled."
];

List<String> interceptAndRecover = [
    "Card: "
"\n• At the start of the battle, your opponent must pick 3 of their units on the battlefield to be carrying a Ghyranite Treasure.\n"
"They cannot pick faction terrain features or Manifestations. A unit can only carry 1 Ghyranite Treasure. If your opponent has fewer than 3 units on the battlefield,\n"
"you automatically complete a number of these battle tactics, starting with the Domination battle tactic (followed by the Strike and then the Affray) until the number\n"
"of remaining uncompleted battle tactics equals the number of enemy units on the battlefield.\n"
        "• If you went second in the previous battle round and choose to go first in the current battle round, your opponent can remove 1 Ghyranite Treasure from one of\n"
        "their units at the start of the battle round.\n"
"• If an ability would remove a unit that was carrying treasure from the battlefield and that unit is not set up again as part of the same ability\n"
"(e.g. ‘Dark Apotheosis’ or ‘Red Ruin’), before removing that unit from the battlefield, your opponent must give the treasure it was carrying to another one\n"
"of their units that does not have a Ghyranite treasure within 3\" of that unit. If this is not possible, that unit counts as having been destroyed for the\n"
        "purpose of this battle tactics card."
        "\n\nAffray: Stolen Seedpod:\n"
        "You complete this battle tactic at the end of your turn if at least 1 enemy unit carrying a Ghyranite Treasure has been destroyed this battle.",

    "Strike: Contraband Aqua Ghyranis:\n"
        "You complete this battle tactic at the end of your turn if at least 2 enemy units carrying a Ghyranite Treasure have been destroyed this battle.",

    "Domination: Ley Line Taproot:\n"
        "You complete this battle tactic at the end of your turn if at least 3 enemy units carrying a Ghyranite Treasure have been destroyed this battle."
];

List<String> wrathfulCycles = [
    "Affray: Defiant Surge:\n"
        "You complete this battle tactic at the end of your turn if you control more objectives than your opponent.",

    "Strike: Daring Resurgence:\n"
        "You complete this battle tactic at the end of your turn if you are the underdog this battle round, there is at least\n"
        "1 friendly unit on the battlefield, and at least half of the friendly units on the battlefield (rounding up) used a Fight ability this turn.",

    "Domination: Master of Strategy:\n"
        "You complete this battle tactic at the end of your turn if there is a different friendly unit wholly within each large quarter of\n"
        "the battlefield, you control more objectives than your opponent, and there are no enemy units contesting any objectives that you control."
];

List<String> scoutingForce = [
    "Card: At the start of the battle, pick each friendly non-Hero Infantry and non-Hero Cavalry unit that was not set up in reserve with\n"
        "a Deploy ability to become a scout unit. You cannot complete these battle tactics with scout units that are in combat.\n"
        "Replacement units that replace scout units are also scout units.\n\n"
        "Affray: Raiding Party:\n"
        "You complete this battle tactic at the end of your turn if there are 3 or more friendly scout units wholly outside friendly territory.",

    "Strike: Bold Explorers:\n"
        "You complete this battle tactic at the end of your turn if 3 or more objectives or non-Faction Terrain terrain features that you control,\n"
        "in any combination, are being contested by any friendly scout units. Those objectives and terrain features must be within enemy territory.",

    "Domination: Courageous Adventurers:\n"
"You complete this battle tactic at the end of your turn if a friendly scout unit that was not set up this turn is contesting a non-Faction Terrain terrain\n"
        "feature that you control that is wholly within enemy territory and more than 6\" from friendly territory."
];

List<String> attunedToGhyran = [
"Affray: Sacred Centrality:\n"
"You complete this battle tactic at the end of your turn if there are at least 2 friendly units within 3\" of the centre of the battlefield that are not in combat.",

"Strike: Fey Strikes:\n"
"You complete this battle tactic at the end of your turn if all of the following are true:\n"
"• At least 2 friendly units moved as part of a Retreat ability this turn. Those units are the lure units.\n"
    "• At least 2 other friendly units used a Charge ability this turn and at least 1 of those units ended the charge move in combat with\n"
    "an enemy unit from which any of the lure units retreated.",

"Domination: Purification Rites:\n"
    "You complete this battle tactic at the end of your turn if there are no enemy units within friendly territory and no enemy units within neutral territory."
];
}

