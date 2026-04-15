class Profiles {
  Profiles(this.id, this.name);

  //Characteristics characteristics = Characteristics("test", "test");

  String id = "Yoyoyo";
  String name = "Gandalf";

  /*
  "id": "e8e5-8560-5331-37a",
  "name": "Megaboss",
  "hidden": false,
  "typeId": "ff03-376e-972f-8ab2",
  "typeName": "Unit",
  "from": "entry"
   */

  List<dynamic> characteristics = [];

  Profiles.fromJsonList(List<dynamic> json)
      : id = json.elementAt(0)["id"] as String,
        name = json.elementAt(0)["name"] as String,
        characteristics = json.elementAt(0)["characteristics"];
/*
  List<Characteristics> createCharList(List<dynamic> data) {
    List<Characteristics> characteristicsList = [];
    for (dynamic characteristicsUnit in data) {
      characteristicsList.add(Characteristics.fromJsonList(characteristicsUnit["characteristics"]));
    }
    return characteristicsList;
  }
 */
}