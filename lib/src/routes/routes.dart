import 'package:flutter/widgets.dart';
import 'package:reto_1/src/page/detail_page.dart';
import 'package:reto_1/src/page/home_page.dart';
import 'package:reto_1/src/page/loader_page.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder> {

    '/'           : (BuildContext context) => HomePage(),
    'loader'      : (BuildContext context) => LoaderPage(),
    'detail'      : (BuildContext context) => DetailPage(),

  };

}