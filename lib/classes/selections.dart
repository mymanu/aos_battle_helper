import 'profiles.dart';

class Selections {
  Selections(this.id, this.name);

  //Profiles profiles;
  //Selections selections;
  //Costs costs;
  //Categories categories;

  String id = "Yoyoyo";
  String name = "Gandalf";

  /*
  "entryId": "4079-fb73-a4d7-7b0d::4e07-f63a-6315-b48b",
  "number": 1,
  "type": "unit",
  "from": "entry"
   */

  List<dynamic> profilesDynamic = [];

  Selections.fromJsonList(List<dynamic> json)
      : id = json.elementAt(0)["id"] as String,
        name = json.elementAt(0)["name"] as String,
        profilesDynamic = (json.elementAt(0)["profiles"]);
}