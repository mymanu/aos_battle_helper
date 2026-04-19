import 'package:aos_battle_helper/classes/unit.dart';

import 'forces.dart';

class Roster {
  Roster(this.id, this.name);

  List<dynamic> costDynamic = [];
  List<dynamic> costLimitsDynamic = [];
  List<dynamic> forcesDynamic = [];

  //TODO unitList vlt in Army verschieben anstatt in Roster??
  List<Unit> unitList = [];

  Forces forces = Forces("id", "name");

  String id = "ABC";
  String name = "Army Name";
  String battleScribeVersion = "2.03";

  /*String generatedBy = "https://newrecruit.eu";
  String gameSystemId = "e51d-b1a3-75fc-dc3g";
  String gameSystemName = "Age of Sigmar 4.0";
  String gameSystemRevision = "89";
  String xmlns = "http://www.battlescribe.net/schema/rosterSchema";
   */

  //List<dynamic> forcesDynamic;

  Roster.fromJson(Map<String, dynamic> json)
    : id = json["id"] as String,
      name = json["name"] as String,
      forces = Forces.fromJsonList(json['forces']);

  /*List<Forces> createForcesList(List<dynamic> data) {
    List<Forces> forcesList = [];
    for (dynamic forceUnit in data) {
      forcesList.add(Forces.fromJsonList(forceUnit["forces"]));
    }
    return forcesList;
  }

   */
}
