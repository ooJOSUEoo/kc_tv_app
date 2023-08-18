import 'package:kc_tv_app/model/item.dart';

class Items{
  List<Item> items = <Item>[];

  Items();

  Items.fromJsonList( List<dynamic> jsonList ){
    //if (jsonList == null ) return;

    for (var dato in jsonList){
      final item = Item.fromJsonMap(dato);
      items.add(item);  
    }
  }

}