import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}


class _RunMyAppState extends State<RunMyApp> {
  //this is a variable that holds the location for the current theme, light, dark or system default
  ThemeMode _themeMode = ThemeMode.system;

  //this is a method that sets the theme to initial default and changes theme when used
  //there is only 1 theme defined in the code - the default
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  //this is where we build the widget tree/logistics
  //Widget is a type of class that arleady has its parameters built, theres a default Widget, 
  @override
  Widget build(BuildContext context) {
     //dependencies are here based on Material App
    return MaterialApp(
      //class ThemeData is defined from the flutter/material.dart package
      theme: ThemeData(primarySwatch: Colors.blueGrey),

      // standard dark theme
      darkTheme: ThemeData.dark(),
      //the light theme of the app
      themeMode: _themeMode,
      //debug banner 
      debugShowCheckedModeBanner: false,
      //home defined by the scaffold
      home: Scaffold(
        //title
        appBar: AppBar(
          title: Text('This is how we get down '),
        ),
        //main content, centered using the Center widget
        body: Center(
          //there is a parent child structure, so child is nested within the parent
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose the Theme:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Change theme & rebuild to
                  // show it using these buttons
                  //uses event listener "onPressed"
                  ElevatedButton(
                      onPressed: () {
                        changeTheme(ThemeMode.light);
                      },
                      child: Text('Light theme')),
                  ElevatedButton(
                      onPressed: () {
                        changeTheme(ThemeMode.dark);
                      },
                      child: Text('Dark theme')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
