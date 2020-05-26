import 'package:flutter/material.dart';
import 'package:reto_1/src/models/house_model.dart';
import 'package:reto_1/src/util/colors_util.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _name      = "";
  String _lastName  = "";
  String _email     = "";

  @override
  Widget build(BuildContext context) {

    final House house = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: colors['dark'],
      body: CustomScrollView(
        slivers: <Widget>[
           _createAppBar(house),
          SliverList(
            delegate: SliverChildListDelegate(
            [
              SizedBox( height: 10.0),
              _description(house),
              Container( padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0), child: Divider(color: Colors.white)),
              Container(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),child: Text("More details?", style: TextStyle(color: Colors.white, fontSize: 25),)),
              _names(),
              _createEmail(),
              Container( padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0), 
              child:Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                      color: Colors.green,
                  onPressed: (){}, 
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Send', style: TextStyle(fontSize: 20))
                  )
                  ),
              )),
            ]
          )),
        ]
      )
    );
  }

  Widget _createAppBar(House house) {

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: colors['dark'],
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(house.name),
        background: Hero(
              tag: house.image,
              child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: AssetImage('assets/img/${house.image}'),
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds:150),
                  ),
              )
      ),
    );

  }

  Widget _names()=> Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      child: Row(
        children: <Widget>[
          Expanded(child: _nameTextField()),
          Padding(padding: EdgeInsets.only(right: 5.0)),
          Expanded(child: _lastNameTextField()),
        ]
      ),
    );

  Widget _description(House house) => Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        children: [
          Text(house.content, style: TextStyle(color: Colors.white, fontSize: 20))
        ]
      )
    );

  Widget _nameTextField() => TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: colors['grey'],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(20.0)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: "Name",
        labelStyle: TextStyle(color: colors['acentGreen']),
        hintText: "Name",
        focusColor: colors['acentGreen'],
        hoverColor: colors['acentGreen'],
        hintStyle: TextStyle(color: colors['acentGreen']),
        icon: Icon(Icons.person_outline, color: colors['acentGreen'],),
      ),
      onChanged: (value){
        setState(() {
          _name = value;
        });
      },
    );

  Widget _lastNameTextField() => TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: colors['grey'],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(20.0)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: "Last Name",
        labelStyle: TextStyle(color: colors['acentGreen']),
        hintText: "Last Name",
        hintStyle: TextStyle(color: colors['acentGreen']),
      ),
      onChanged: (value){
        setState(() {
          _lastName = value;
        });
      },
    );

  Widget _createEmail() => Container(
    padding: EdgeInsets.all(15.0),
    child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        fillColor: colors['grey'],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(20.0)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
          labelText: "Email",
          labelStyle: TextStyle(color: colors['acentGreen']),
          suffixIcon: Icon(Icons.alternate_email, color: colors['acentGreen'],),
          icon: Icon(Icons.email, color: colors['acentGreen'],),
        ),
        onChanged: (value){
          setState(() {
            _email = value;
          });
        },
      ),
  );
}