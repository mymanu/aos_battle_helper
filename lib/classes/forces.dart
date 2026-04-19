import 'forcesTwo.dart';

class Forces {
  Forces(this.id, this.name);
  //Costs costs;
  //Categories categories;
  ForcesTwo forcesTwo = ForcesTwo("id", "name");

  List<dynamic> costDynamic = [];
  List<dynamic> categoriesDynamic = [];
  List<dynamic> forcesTwoDynamic = [];

  String id = "Yoyoyo";
  String name = "Gandalf";

  Forces.fromJsonList(List<dynamic> json)
      : id = json.elementAt(0)["id"] as String,
        name = json.elementAt(0)["name"] as String,
        forcesTwo = ForcesTwo.fromJsonList(json.elementAt(0)["forces"]);
}