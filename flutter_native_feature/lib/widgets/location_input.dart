import 'package:flutter/material.dart';
import 'package:flutter_native_feature/screens/maps_screen.dart';
import 'package:location/location.dart';
import 'package:flutter_native_feature/helpers/location_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationInput extends StatefulWidget {


  final Function _pickedLocation;

  LocationInput(this._pickedLocation);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String _previewImageUrl;


  void _showPreview(double lat, double lng){
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(lat, lng);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
    widget._pickedLocation(lat, lng);
  }



  Future<void> _getUserLocation() async {

    try{
      final localLocation = await Location().getLocation();
      _showPreview(localLocation.latitude, localLocation.longitude);
    } catch (error){
      return;
    }
  }

  Future<void> _selectOnMap() async{
    final  selectedLocation = await Navigator.of(context).push<LatLng>(
        MaterialPageRoute(
          fullscreenDialog: true,
            builder: (ctx)=> MapsScreen(isSelecting: true,)));
    if(selectedLocation == null){
      return;
    }
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: _previewImageUrl == null ?
            Text('Aucun lieu choisi', textAlign: TextAlign.center,):
            Image.network(_previewImageUrl, fit: BoxFit.cover,width: double.infinity,)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: _getUserLocation,
              icon: Icon(Icons.location_on),
              label: Text('Position actuel'),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text('Choisir position'),
              textColor: Theme.of(context).primaryColor,
            )
          ],)
      ],
    );
  }
}
