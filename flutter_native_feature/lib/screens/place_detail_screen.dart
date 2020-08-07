import 'package:flutter/material.dart';
import 'package:flutter_native_feature/providers/great_places_provider.dart';
import 'package:flutter_native_feature/screens/maps_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {

  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {

    final id = ModalRoute.of(context).settings.arguments;
    final place = Provider.of<GreatPlaceProvider>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(place.image,
            fit: BoxFit.cover,
            width: double.infinity,),
          ),
          SizedBox(height: 10,),
          Text(place.location.address,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey
          ),),
          SizedBox(height: 10,),
          FlatButton(
            child: Text('Sur la carte'),
            textColor: Theme.of(context).primaryColor,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (ctx)=> MapsScreen(isSelecting: false,initialPosition: place.location,)));
            },
          )
        ],
      ),
    );
  }
}
