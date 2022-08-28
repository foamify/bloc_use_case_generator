import '../model/city_model.dart';

class RemoteService {
  Future<List<City>?> getCities() async {
    return [
      City(id: 0, name: 'Istanbul'),
      City(id: 1, name: 'Berlin'),
      City(id: 2, name: 'Amsterdam'),
      City(id: 3, name: 'Madrid'),
      City(id: 4, name: 'New York'),
    ];
  }
}
