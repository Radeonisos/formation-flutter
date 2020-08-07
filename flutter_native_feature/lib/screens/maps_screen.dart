import 'package:flutter/material.dart';
import 'package:flutter_native_feature/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {

  final PlaceLocation initialPosition;
  final bool isSelecting;



  MapsScreen({this.initialPosition =  const PlaceLocation(latitude: 48.8534, longitude: 2.3488), this.isSelecting = false});

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  LatLng _pickedLocation;

  void _selectLocation(LatLng position){
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte'),
        actions: <Widget>[
          if (widget.isSelecting )
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null ? null: () {
                Navigator.of(context).pop(_pickedLocation);
              },
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(widget.initialPosition.latitude, widget.initialPosition.longitude),zoom: 14),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelecting) ?
        null:
        {
          Marker(markerId: MarkerId('m1'), position: _pickedLocation ?? LatLng(widget.initialPosition.latitude, widget.initialPosition.longitude)),
        },

      ),
    );
  }
}
