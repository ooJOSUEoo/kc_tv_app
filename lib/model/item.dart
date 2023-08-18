class Item{

  late String url;
  late String title;
  late String miniatura;
  late String duracion;
  late String fecha;
  late String descripcion;
  

   Item({ required this.url, 
          required this.title, 
          required this.miniatura,
          required this.duracion,
          required this.fecha,
          required this.descripcion
    });

    Item.fromJsonMap(Map<String, dynamic> json ){
     url         = json['url'];
     title       = json['title'];
     miniatura    = json['miniatura'];
     duracion    = json['duracion'];
     fecha       = json['fecha'];
     descripcion = json['descripcion'];
  }

}