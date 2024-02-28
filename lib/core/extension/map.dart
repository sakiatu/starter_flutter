
extension MapExtension on Map {

  List<T> getList<T>(String value,T Function(dynamic e) generator){
    return List.from(this[value]??[]).map(generator).toList();
  }

}
