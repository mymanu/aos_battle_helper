import 'package:flutter/material.dart';

import '../classes/ability.dart';
import '../classes/battleFormation.dart';
import '../classes/settings.dart';
import '../classes/unit.dart';
import 'HomePage.dart';

class RegimentChooser extends StatefulWidget {
  RegimentChooser({super.key, required this.settings});

  Settings settings;

  Ability? regimentAbility = Ability("chosen Regiment Ability");
  Ability? enhancement = Ability("chosen Enhancement");

  @override
  _Regimentchooser createState() => _Regimentchooser();
}

class _Regimentchooser extends State<RegimentChooser> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Please choose ONE Regiment Ability"),

          SizedBox(height: 10),

          RadioGroup<Ability>(
            groupValue: widget.regimentAbility,
            onChanged: (Ability? value) {
              setState(() {
                widget.regimentAbility = value;

                List<Ability> regimentAsBattleFormation = [value!];
                BattleFormation battleForm = BattleFormation();
                battleForm.abilitys = regimentAsBattleFormation;
                List<BattleFormation> battleFormationList = [battleForm];
                widget.settings.army.battleFormationsList = battleFormationList;
              });
            },
            child: Column(
              //crossAxisAlignment: .start,
              children: <Widget>[
                Text("Selected Ability: " + widget.regimentAbility!.name),
                ListTile(
                  title: Text(widget.settings.regimentAbilities[0].name),
                  leading: Radio<Ability>(
                    value: widget.settings.regimentAbilities[0],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trigger: " +
                          widget.settings.regimentAbilities[0].timing,),
                      Text(""),
                      widget.settings.regimentAbilities[0].effect.contains("-1")
                          ? Text(widget.settings.regimentAbilities[0].declare)
                          : widget.settings.regimentAbilities[0].declare.contains(
                        "-1",
                      )
                          ? Text(widget.settings.regimentAbilities[0].effect)
                          : Text(
                        widget.settings.regimentAbilities[0].declare +
                            "\n\n" +
                            widget.settings.regimentAbilities[0].effect,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(widget.settings.regimentAbilities[1].name),
                  leading: Radio<Ability>(
                    value: widget.settings.regimentAbilities[1],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trigger: " +
                          widget.settings.regimentAbilities[1].timing,),
                      Text(""),
                      widget.settings.regimentAbilities[1].effect.contains("-1")
                          ? Text(widget.settings.regimentAbilities[1].declare)
                          : widget.settings.regimentAbilities[1].declare.contains(
                        "-1",
                      )
                          ? Text(widget.settings.regimentAbilities[1].effect)
                          : Text(
                        widget.settings.regimentAbilities[1].declare +
                            "\n\n" +
                            widget.settings.regimentAbilities[1].effect,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //-------------------------------------------------------------------

          SizedBox(height: 10),

          Text("Please choose ONE Enhancement"),

          SizedBox(height: 10),

          RadioGroup<Ability>(
            groupValue: widget.enhancement,
            onChanged: (Ability? value) {
              setState(() {
                widget.enhancement = value;
                widget.settings.chosenEnhancement = value!;
              });
            },
            child: Column(
              //crossAxisAlignment: .start,
              children: <Widget>[
                Text("Selected Ability: " + widget.enhancement!.name),
                ListTile(
                  title: Text(widget.settings.enhancements[0].name),
                  leading: Radio<Ability>(
                    value: widget.settings.enhancements[0],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trigger: " +
                          widget.settings.enhancements[0].timing,),
                      Text(""),
                      widget.settings.enhancements[0].effect.contains("-1")
                          ? Text(widget.settings.enhancements[0].declare)
                          : widget.settings.enhancements[0].declare.contains(
                        "-1",
                      )
                          ? Text(widget.settings.enhancements[0].effect)
                          : Text(
                        widget.settings.enhancements[0].declare +
                            "\n\n" +
                            widget.settings.enhancements[0].effect,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(widget.settings.enhancements[1].name),
                  leading: Radio<Ability>(
                    value: widget.settings.enhancements[1],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trigger: " +
                          widget.settings.enhancements[1].timing,),
                      Text(""),
                      widget.settings.enhancements[1].effect.contains("-1")
                          ? Text(widget.settings.enhancements[1].declare)
                          : widget.settings.enhancements[1].declare.contains(
                        "-1",
                      )
                          ? Text(widget.settings.enhancements[1].effect)
                          : Text(
                        widget.settings.enhancements[1].declare +
                            "\n\n" +
                            widget.settings.enhancements[1].effect,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(widget.settings.enhancements[2].name),
                  leading: Radio<Ability>(
                    value: widget.settings.enhancements[2],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trigger: " +
                          widget.settings.enhancements[2].timing,),
                      Text(""),
                      widget.settings.enhancements[2].effect.contains("-1")
                          ? Text(widget.settings.enhancements[2].declare)
                          : widget.settings.enhancements[2].declare.contains(
                        "-1",
                      )
                          ? Text(widget.settings.enhancements[2].effect)
                          : Text(
                        widget.settings.enhancements[2].declare +
                            "\n\n" +
                            widget.settings.enhancements[2].effect,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(widget.settings.enhancements[3].name),
                  leading: Radio<Ability>(
                    value: widget.settings.enhancements[3],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trigger: " +
                          widget.settings.enhancements[3].timing,),
                      Text(""),
                      widget.settings.enhancements[3].effect.contains("-1")
                          ? Text(widget.settings.enhancements[3].declare)
                          : widget.settings.enhancements[3].declare.contains(
                        "-1",
                      )
                          ? Text(widget.settings.enhancements[3].effect)
                          : Text(
                        widget.settings.enhancements[3].declare +
                            "\n\n" +
                            widget.settings.enhancements[3].effect,
                      ),
                    ],
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
