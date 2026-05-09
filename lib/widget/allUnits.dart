import 'package:flutter/material.dart';

import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';

class allUnits extends StatefulWidget {
  allUnits({super.key, required this.title, required this.settings});

  Settings settings;
  String title;
  Color phaseColor = Colors.teal;

  @override
  _allUnits createState() => _allUnits();
}

class _allUnits extends State<allUnits> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    List<Unit> unitsThisPhase = [];

    //Ab hier Units in unitsThisPhase
    for (Unit unit in widget.settings.army.unitList) {
      unitsThisPhase.add(unit);
    }

    //TODO ab Hier wird das UI gebaut, ab hier kann sich Jenny austoben.
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: calculateTextColor(widget.phaseColor)),),
        centerTitle: true,
        backgroundColor: widget.phaseColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: calculateTextColor(widget.phaseColor)),
            onPressed: () {
              setState(() {
                widget.settings.commandPoints =
                    widget.settings.commandPoints + 1;
              });
            },
          ),
          Text(
            "CP: " + widget.settings.commandPoints.toString(),
            style: TextStyle(color: calculateTextColor(widget.phaseColor)),
          ),
          IconButton(
            icon: Icon(Icons.remove, color: calculateTextColor(widget.phaseColor)),
            onPressed: () {
              setState(() {
                widget.settings.commandPoints =
                    widget.settings.commandPoints - 1;
              });
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.blueGrey.shade800,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              _navigateToMenu(context, widget.settings);
            },
            child: Text("Menü"),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.orange,
              backgroundColor: Colors.blueGrey.shade800,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              _navigateBack(context, widget.settings);
            },
            child: Text("Zurück"),
          ),
          SizedBox(width: 50),
        ],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          //Ab hier Kacheln für Units in der unitsThisPhase List bauen
          SliverPadding(
            padding: const EdgeInsets.only(right: 50),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                /*
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                */
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                  ) {
                return Card(
                  child: unitsThisPhase[index].erledigt
                      ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        unitsThisPhase[index].erledigt = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          unitsThisPhase[index].name,
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.done, size: 100),
                        /*
                              Container(
                                height: 100,
                                width: 100,
                                child: LayoutBuilder(
                                  builder: (context, constraint) {
                                    return new Icon(
                                      Icons.done,
                                      size: constraint.biggest.height,
                                    );
                                  },
                                ),
                              ),
                              */
                      ],
                    ),
                  )
                      :  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            unitsThisPhase[index].name,
                            style: TextStyle(
                              backgroundColor: widget.phaseColor,
                              fontWeight: FontWeight.bold,
                              color: calculateTextColor(
                                widget.phaseColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //TODO Hier Content der Card einfügen einer Unit
                      Text("Health: " + unitsThisPhase[index].health),
                      Text("Move: " + unitsThisPhase[index].move),
                      Text("Save: " + unitsThisPhase[index].save),
                      Text("Control: " + unitsThisPhase[index].control),
                      /*
                            ListTile(
                              leading: Icon(Icons.album),
                              title: Text(spells[index].title),
                              subtitle: Text(spells[index].details),
                            ),
                            */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: Text("Unit erledigt"),
                            onPressed: () {
                              setState(() {
                                unitsThisPhase[index].erledigt =
                                true;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: Text("Item $index"),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                );
              }, childCount: unitsThisPhase.length),
            ),
          ),
        ],
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void _navigateBack(BuildContext context, Settings settings) {
    Navigator.of(context).pop(
    );
  }

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }
}
