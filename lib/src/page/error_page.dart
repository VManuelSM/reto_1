import 'package:flutter/material.dart';
import 'package:reto_1/src/util/colors_util.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['dark'],
        title: Text("Error"),
        ),
        body: Center(
          child: Text("Ha ocurrido un error"),
        ),
    );
  }
}