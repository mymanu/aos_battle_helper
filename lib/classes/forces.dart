import 'forcesTwo.dart';

class Forces {
  Forces(this.id, this.name, this.forcesTwo);
  //Costs costs;
  //Categories categories;
  ForcesTwo forcesTwo;

  String id = "Yoyoyo";
  String name = "Gandalf";

  Forces.fromJsonList(List<dynamic> json)
      : id = json.elementAt(0)["id"] as String,
        name = json.elementAt(0)["name"] as String,
        forcesTwo = ForcesTwo.fromJsonList(json.elementAt(0)["forces"]);
}