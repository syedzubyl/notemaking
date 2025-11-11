import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'second.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const secondfun());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Brightness _getSystemBrightness(BuildContext context) {
//     return MediaQuery.platformBrightnessOf(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Brightness brightness = _getSystemBrightness(context);
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
//     );

//     return MaterialApp(
//       theme: brightness == Brightness.dark
//           ? ThemeData.dark()
//           : ThemeData.light(),
//       home: Scaffold(body: Center(child: Text('Hello, Flutter!'))),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();
  void toggleTheme() {
    setState(() {
      themeData = themeData.brightness == Brightness.dark
          ? ThemeData.light()
          : ThemeData.dark();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Update system UI overlay style based on theme
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
        statusBarIconBrightness: themeData.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarIconBrightness:
            themeData.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeData.brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text("theme checker"),

          actions: [
            IconButton(
              icon: Icon(
                themeData.brightness == Brightness.dark
                    ? Icons.wb_sunny
                    : Icons.nightlight_round,
              ),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children :<Widget> [
              Text(
                'Current Theme: ${themeData.brightness == Brightness.dark ? "Dark" : "Light"}',
                style: TextStyle(fontSize: 24),
              ),
             SizedBox(height: 20),
             ElevatedButton(
               onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context) => const secondfun()));},
               child: Text('Toggle Theme'),)
               ]
           ),
          
        ),
      ),
    );
  }
}
