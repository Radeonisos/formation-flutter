import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_feature/models/place.dart';
import 'package:flutter_native_feature/helpers/db_helper.dart';
import 'package:flutter_native_feature/helpers/location_helper.dart';


class GreatPlaceProvider with ChangeNotifier {

  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(String title, File image, PlaceLocation placeLocation) async{

    final address = await LocationHelper.getPlaceAddress(placeLocation.latitude, placeLocation.longitude);
    final updatedLocation = PlaceLocation(
      longitude: placeLocation.longitude,
      latitude: placeLocation.latitude,
      address: address
    );
    final newPlace = Place(
      id: DateTime.now().toString(),
    image: image,
    title: title,
    location: updatedLocation);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
        'places',
        {'id': newPlace.id,
          'title': newPlace.title,
          'image': newPlace.image.path,
          'loc_lat': newPlace.location.latitude,
          'loc_lng': newPlace.location.longitude,
          'address': newPlace.location.address});
  }


  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList.map((item) => Place(
      id: item['id'],
      title: item['title'],
      image: File(item['image']),
      location: PlaceLocation(latitude: item['loc_lat'], longitude: item['loc_lng'], address: item['address'])
    )).toList();
    notifyListeners();
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

}