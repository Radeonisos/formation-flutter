import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_feature/models/place.dart';
import 'package:flutter_native_feature/providers/great_places_provider.dart';
import 'package:flutter_native_feature/widgets/image_input.dart';
import 'package:flutter_native_feature/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {

  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  final _titleController = TextEditingController();
  File _pickedImage;
  PlaceLocation _placeLocation;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng){
    _placeLocation = PlaceLocation(latitude: lat, longitude: lng);
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null || _placeLocation == null){
      return;
    }
    Provider.of<GreatPlaceProvider>(context, listen: false).addPlace(_titleController.text, _pickedImage, _placeLocation);
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un lieux'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Titre'
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10,),
                    ImageInput(_selectImage),
                    SizedBox(height: 10,),
                    LocationInput(_selectPlace)

                  ],
                ),
              ),
            ),
          ),

          RaisedButton.icon(
              onPressed: _savePlace,
              elevation: 0,
              color: Theme.of(context).accentColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              icon: Icon(Icons.add),
              label: Text('Ajouter'))
        ],
      ),
    );
  }
}
