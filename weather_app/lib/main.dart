import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  final TextEditingController _controller = TextEditingController();
  String cityName = '';
  int temperature = 0;
  String weatherCondition = '';

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void fetchWeather() {
    setState(() {
      cityName = _controller.text;
      temperature = Random().nextInt(15) + 15;
      weatherCondition = ['sunny', 'cloudy', 'rainy'][Random().nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Application'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Input City Name below:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City Name',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: fetchWeather,
                child: Text('Fetch Weather'),
              ),
              SizedBox(height: 20),
              Text(
                'City: $cityName',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Temperature: $temperature°C',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Weather Condition: $weatherCondition',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      changeTheme(ThemeMode.light);
                    },
                    child: Text('Light theme'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      changeTheme(ThemeMode.dark);
                    },
                    child: Text('Dark theme'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
