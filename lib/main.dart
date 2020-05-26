import 'package:flutter/material.dart';
import 'package:reto_1/src/page/error_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reto_1/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Reto 1',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'MX'), 
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
      ],
      initialRoute: 'loader',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        print("Ruta llamada: ${settings.name}");
        return MaterialPageRoute(
          builder: ( context ) => ErrorPage(),
        );
      },
    );
  }
}
