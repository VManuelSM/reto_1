import 'package:flutter/material.dart';
import 'package:reto_1/src/util/colors_util.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: _loaderBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.chevron_right, color:colors['acentGreen'],),
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/');
        }
        ),
    );
  }

  Widget _loaderBody() => Stack(
        children: <Widget>[
          Container(
            width: 375.0,
            height: 667.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/img/loader_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 375.0,
            height: 667.0,
            decoration: BoxDecoration(
              color: const Color(0x4d1c1c1c),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 262.0),
            child: Container(
              width: 375.0,
              height: 144.0,
              decoration: BoxDecoration(
                color: const Color(0x671c1c1c),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 262.0),
            child: Text(
              'Green Place',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontSize: 54,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(62.0, 334.0),
            child: SizedBox(
              width: 252.0,
              child: Text(
                'Find your new home',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 23,
                  color: colors['acentYellow'],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]
      );
}