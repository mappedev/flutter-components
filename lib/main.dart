import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:components/src/pages/home_page_temp.dart';
import 'package:components/src/pages/alert_page.dart';

import 'package:components/src/routes/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      // home: HomePage(),
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => AlertPage(),
        );
      },
    );
  }
}
