import 'selections.dart';

class ForcesTwo {
  ForcesTwo(this.id, this.name, this.selections);

  Selections selections;
  //Categories categories;

  String id = "Yoyoyo";
  String name = "Gandalf";

  /*
  "entryId": "48a1-e075-c797-5605::376a-6b97-8699-dd59",
  "catalogueId": "832c-fd6-a535-ffae",
  "catalogueRevision": 38,
  "catalogueName": "Ironjawz"
   */

  ForcesTwo.fromJsonList(List<dynamic> json)
      : id = json.elementAt(0)["id"] as String,
        name = json.elementAt(0)["name"] as String,
        selections = Selections.fromJsonList(json.elementAt(0)["selections"]);
}