
enum ProductQueries{
limit
}

extension ProductQueriesExtensions on ProductQueries{

  MapEntry<String,String?> toMapEntry(String value){

    switch (this) {
     
      case ProductQueries.limit:
      return MapEntry('limit', value);
      
       
  }
}
}