class Selections {
  Selections(this.id, this.name);

  String id;
  String name;
  String type = "-1";

  /*
  "entryId": "4079-fb73-a4d7-7b0d::4e07-f63a-6315-b48b",
  "number": 1,
  "type": "unit",
  "from": "entry"
   */

  List<dynamic> profilesDynamic = [];
  List<dynamic> selectionsDynamic = [];
  List<dynamic> categoriesDynamic = [];
  List<dynamic> rulesDynamic = [];
}