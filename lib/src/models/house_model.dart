class House {

  String name;
  String cost;
  String content;
  String image;

  House({
    this.name,
    this.cost,
    this.content,
    this.image,
  });

  House.fromJsonMap(Map<String, dynamic> json) {
    this.name     = json['name'];
    this.cost     = json['cost'];
    this.content  = json['content'];
    this.image    = json['image'];
  }

}

class Houses {

  List <House> items = List();

  Houses();

  Houses.fromJsonList(List<dynamic> jsonList) {
    if ( jsonList == null ) return;
    for ( var item in jsonList ) {
      final house = House.fromJsonMap(item);
      items.add(house);
    }
  }
  
}