import 'forces.dart';

class Roster {
  Roster(
    this.id,
    this.name,
    this.battleScribeVersion,
    this.forces,
    //this.forcesDynamic,
  );

  //Costs costs;
  //CostLimits costLimits;

  Forces forces;

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
      /*
        battleScribeVersion: Address.fromJson(json['address'],
        */
      forces = Forces.fromJsonList(json['forces']);

      //forcesDynamic = json['forces'];

  List<Forces> createForcesList(List<dynamic> data) {
    List<Forces> forcesList = [];
    for (dynamic forceUnit in data) {
      forcesList.add(Forces.fromJsonList(forceUnit["forces"]));
    }
    return forcesList;
  }
}
