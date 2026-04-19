import 'package:flutter/material.dart';

import '../classes/settings.dart';
import 'StartofBattle.dart';
import 'ArmyImport.dart';
import 'SettingsWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title, required this.settings});

  Settings settings;
  String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //String envTitle = Env.environmentName ?? "";
    //String title = widget.title + ' - ' + envTitle;
    String title = widget.title;

    List<Color> buttonColors = [
      Colors.orange.shade800,
      Colors.indigoAccent,
      Colors.redAccent,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.grey,
      Colors.grey,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title), //Text('Logged In'),
        centerTitle: true,
        actions: [
          // TextButton(
          //   child: Text('Logout',
          //       style: TextStyle(fontSize: 24, color: Colors.white)),
          //   onPressed: () {
          //     // final provider =
          //     //   Provider.of<GoogleSignInProvider>(context, listen: false);
          //     // provider.logout();
          //   },
          // )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //SizedBox(height: 25),
              const Text(
                'Hauptmenü',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              /*const Text(
                  'You have pushed the button in the right corner this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),*/
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Spiel starten',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToStartofBattle(context, widget.settings);
                },
              ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Armee importieren',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToArmyImport(context, widget.settings);
                },
              ),

              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Einstellungen',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _navigateToSettings(context, widget.settings);
                },
              ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey.shade800,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: Size(250, 100),
                  maximumSize: Size(510, 510),
                ),
                child: Text(
                  'Credits',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //_navigateToCredits(context);
                },
              ),
            ],
          ),
        ),

        /*
      Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),

              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(20.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[0],
                        shadowColor: Colors.black,
                        minimumSize: Size(80, 60),
                        maximumSize: Size(150, 60),
                      ),
                      child: Text(
                        'Spiel starten',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: calculateTextColor(buttonColors[0])),
                        // Storage
                      ),
                      onPressed: () {
                        _navigateToStartofBattle(context);
                      },
                    ),

                    SizedBox(width: 85),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[1],
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(110, 110),
                        maximumSize: Size(110, 110),
                      ),
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: calculateTextColor(buttonColors[1])),
                      ),
                      onPressed: () {
                        //_navigateToShoppingList(context);
                      },
                    ),
                  ]
              ),
              /*
              SizedBox(height: 60),

              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(20.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[2],
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(110, 110),
                        maximumSize: Size(110, 110),
                      ),
                      child: Text(
                        'Frisch eingekauft',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.settings.calculateTextColor(buttonColors[2])),
                      ),
                      onPressed: () {
                        _navigateToBoughtItems(context);
                      },
                    ),

                    SizedBox(width: 85),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[3],
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(110, 110),
                        maximumSize: Size(110, 110),
                      ),
                      child: Text(
                        'MHD-Liste',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.settings.calculateTextColor(buttonColors[3])),
                      ),
                      onPressed: () {
                        _navigateToMHD_list(context);
                      },
                    ),
                  ]
              ),

              SizedBox(height: 30),

              Row (
                  children: [
                    SizedBox(width: 125),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[4],
                        shadowColor: Colors.black,
                        //padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(80, 60),
                        maximumSize: Size(150, 60),
                      ),
                      child: Text(
                        'Produkt anlegen',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.settings.calculateTextColor(buttonColors[4])),
                      ),
                      onPressed: () {
                        _navigateToEditProductPage(context);
                      },
                    ),
                  ]
              ),


              SizedBox(height: 30),

              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(20.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[5],
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(110, 110),
                        maximumSize: Size(110, 110),
                      ),
                      child: Text(
                        'Database Upload',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.settings.calculateTextColor(buttonColors[5])),
                      ),
                      onPressed: () {
                        _navigateToDBUpload(context);
                      },
                    ),

                    SizedBox(width: 85),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[6],
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: Size(110, 110),
                        maximumSize: Size(110, 110),
                      ),
                      child: Text(
                        'Shopping List Example',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.settings.calculateTextColor(buttonColors[6])),
                      ),
                      onPressed: () {
                        _navigateToShoppinListWidget(context);
                      },
                    ),
                  ]
              ),

              Row(
                children: [
                  Spacer(),
                  Padding(padding: EdgeInsets.all(20.0),
                    child:
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Environment name: ${Env.environmentName}", style: TextStyle(color: Colors.white)),
                        Text("API Base URL: ${Env.apiBaseUrl}", style: TextStyle(color: Colors.white)),
                        Text("Debug: ${Env.debug ? 'YES' : 'NO'}", style: TextStyle(color: Colors.white)),
                        Text("ENV Pfad: ${Env.databaseURL}", style: TextStyle(color: Colors.white, fontSize: 10)),
                        Text("DB Pfad: " + widget.settings.dbPath, style: TextStyle(color: Colors.white, fontSize: 10)),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),

              Row(
                children: [
                  Padding(padding: EdgeInsets.all(20.0)),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors[7],
                      shadowColor: Colors.black,
                      padding: const EdgeInsets.all(10.0),
                      minimumSize: Size(110, 110),
                      maximumSize: Size(110, 110),
                    ),
                    child: Text(
                      'DB Wechsel',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: widget.settings.calculateTextColor(buttonColors[7])),
                    ),
                    onPressed: () {
                      if (widget.settings.dbPath.contains("Frankreich")) {
                        widget.settings.dbPath = "Haushalt_MJ/Produkte/Produkte-Sammlung";
                      } else if (widget.settings.dbPath.contains("Haushalt_MJ")){
                        widget.settings.dbPath = "Eltern_Manu";
                      } else {
                        widget.settings.dbPath = "Frankreich";
                      }
                      setState(() {

                      });
                      print(widget.settings.dbPath);
                      // String test = Env.databaseURL ?? "";
                      // if(path.contains(test)) {
                      //   path = Env.databaseURL2 ?? "";
                      // } else {
                      //   path = Env.databaseURL ?? "";
                      // }
                      //print(path);
                    },
                  ),

                ],
              ),
               */

              SizedBox(height: 50,),
            ],
          ),
        ),
       */
      ),
    );
  }

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  void _navigateToStartofBattle(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StartofBattle(title: "Start of Battle Round", settings: settings),
      ),
    );
  }

  void _navigateToArmyImport(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArmyImport(title: "Armee importieren", settings: settings),
      ),
    );
  }

  void _navigateToSettings(BuildContext context, Settings settings) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsWidget(title: "Einstellungen", settings: settings),
      ),
    );
  }
}
