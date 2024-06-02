import 'package:flutter/material.dart';
import 'rpe_table.dart';
import 'utils.dart';
import 'enum_definitions.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(title: 'RPE E1RM Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late TextEditingController _loadController;
  late TextEditingController _rpeController;
  late TextEditingController _repController;
  final String smallLogo = "images/logoLarge.svg";
  double load = 0.0;
  int reps = 0;
  String rpe = "";
  double e1rm = 0.0;


  @override
  void initState() {
    super.initState();
    _rpeController = TextEditingController();
    _repController = TextEditingController();
    _loadController = TextEditingController();
  }

  @override
  void dispose() {
    _rpeController.dispose();
    _repController.dispose();
    _loadController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        titleSpacing: 30,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.blue,
        title: Text(widget.title),


        leading: SvgPicture.asset(
          smallLogo,
          semanticsLabel: 'Genuine.PL Logo',
          width: 100,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 800,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      controller: _loadController,
                      decoration: InputDecoration(
                        hintText: "Enter load lifted here: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  DropdownMenu(
                    controller: _repController,
                    label: const Text('Repetitions'),
                    width: 200,
                    dropdownMenuEntries: <DropdownMenuEntry<RepLabel>>[
                      DropdownMenuEntry(value: RepLabel.oneRep, label: "1"),
                      DropdownMenuEntry(value: RepLabel.twoReps, label: "2"),
                      DropdownMenuEntry(value: RepLabel.threeReps, label: "3"),
                      DropdownMenuEntry(value: RepLabel.fourReps  , label: "4"),
                      DropdownMenuEntry(value: RepLabel.fiveReps, label: "5"),
                      DropdownMenuEntry(value: RepLabel.sixReps, label: "6"),
                      DropdownMenuEntry(value: RepLabel.sevenReps, label: "7"),
                      DropdownMenuEntry(value: RepLabel.eightReps, label: "8"),
                      DropdownMenuEntry(value: RepLabel.nineReps, label: "9"),
                      DropdownMenuEntry(value: RepLabel.tenReps, label: "10"),
                    ],
                  ),
                  DropdownMenu(
                    controller: _rpeController,
                    label: const Text('RPE'),
                    width: 130,
                    dropdownMenuEntries: <DropdownMenuEntry<RPELabel>>[
                      DropdownMenuEntry(value: RPELabel.rpe6, label: "6"),
                      DropdownMenuEntry(value: RPELabel.rpe65, label: "6.5"),
                      DropdownMenuEntry(value: RPELabel.rpe7, label: "7"),
                      DropdownMenuEntry(value: RPELabel.rpe75, label: "7.5"),
                      DropdownMenuEntry(value: RPELabel.rpe8, label: "8"),
                      DropdownMenuEntry(value: RPELabel.rpe85, label: "8.5"),
                      DropdownMenuEntry(value: RPELabel.rpe9, label: "9"),
                      DropdownMenuEntry(value: RPELabel.rpe95, label: "9.5"),
                      DropdownMenuEntry(value: RPELabel.rpe10, label: "10"),
                    ],
                  ),
                ],
              )
            ),
            ElevatedButton(
              child: Text("Calculate",
              style: TextStyle(
                fontSize: 20,
              )),
              onPressed: (){
                setState(() {
                  load = double.parse(_loadController.value.text);
                  reps = int.parse(_repController.value.text);
                  rpe = _rpeController.value.text;
                 e1rm = calculateE1RM(load, reps, rpe);
                });

              },

              ),
            Padding(
                padding: EdgeInsets.all(16.0), // Adds padding of 16.0 on all sides
                child: Container(
                    width: 800,
                    height: 400,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Your estimated 1 rep maximum is: $e1rm",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                          Table(

                              children: [
                                TableRow(children: [
                                  Text('RPE:'),
                                  Text('Load:')
                                ]),
                                TableRow(children: [
                                  Text('10'),
                                  Text('Placeholder')
                                ])
                              ]
                          )
                        ]
                    )
                )
            )

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
