import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/settings.dart';
import 'HomePage.dart';

class RegimentChooser extends StatefulWidget {
  RegimentChooser({
    super.key,
    required this.settings,
  });

  Settings settings;

  String? test = "-3";
  Ability? regimentAbility = Ability("chosenAbility");

  @override
  _Regimentchooser createState() => _Regimentchooser();
}

class _Regimentchooser extends State<RegimentChooser> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Choose Regiment Ability"),

          SizedBox(height: 10,),

          RadioGroup<String>(
            groupValue: widget.test,
            onChanged: (String? value) {
              setState(() {
                widget.test = value;
              });
            },
            child: Column(
              //crossAxisAlignment: .start,
              children: <Widget>[
                Text("Selected: " + widget.test!),
                ListTile(
                  title: Text(widget.settings.regimentAbilities[0].name),
                  leading: Radio<String>(
                    toggleable: true,
                    //value: widget.settings.regimentAbilities[0],
                    value: "1",
                  ),
                ),
                ListTile(
                  title: Text(widget.settings.regimentAbilities[1].name),
                  leading: Radio<String>(
                    //toggleable: true,
                    //value: widget.settings.regimentAbilities[1],
                    value: "2",
                  ),
                ),
              ],
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

  void _navigateToMenu(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(title: "Age of Sigmar Battle Helper", settings: settings),
      ),
    );
  }
}
