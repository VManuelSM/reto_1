import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reto_1/src/models/house_model.dart';
import 'package:reto_1/src/util/colors_util.dart';

class HousesGrid extends StatelessWidget {
  final List<House> houses;

  HousesGrid({@required this.houses});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: houses.length,
        itemBuilder: (context, i) => _houseCard(context, houses[i]),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  Widget _houseCard(BuildContext context, House house) {
    final card = Container(
        color: colors['grey'],
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(5.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                  SingleChildScrollView(
                    child: Hero(
                        tag: house.image,
                        child: FadeInImage(
                          placeholder: AssetImage('assets/img/loading.gif'),
                          image: AssetImage('assets/img/${house.image}'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black38,
                          Colors.black45
                        ],
                      ),
                    ),
                    child: Text(
                      house.cost,
                      style: TextStyle(color: colors['acentYellow'], fontSize: 20.0),
                    ),
                  ),
                ])),
            Container( padding: EdgeInsets.all(5.0), child: Text(house.content, style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, maxLines: 5,)),
          ]),
        ));

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: house);
      },
    );
  }
}
