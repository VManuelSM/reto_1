import 'package:flutter/material.dart';

import 'package:reto_1/src/util/colors_util.dart';
import 'package:reto_1/src/providers/houses_provider.dart';
import 'package:reto_1/src/widgets/house_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: colors['dark'],
      appBar: AppBar(
        backgroundColor: colors['dark'],
        title: Text("Inicio"),
      ),
      body: Padding(
      padding: EdgeInsets.all(8.0),
      child: _housesList()
    ),
    );
  }

  Widget _housesList() {

    return FutureBuilder(
    future: housesProvider.loadData(),
    initialData: [],
    builder: (context, AsyncSnapshot <List<dynamic>> snapshot){
      if (snapshot.hasData) return HousesGrid(houses: snapshot.data);
      else return Container(
        height: 400.0,
        child: Center(child: CircularProgressIndicator()),
      );
      
    }
  );

  }
    
} 