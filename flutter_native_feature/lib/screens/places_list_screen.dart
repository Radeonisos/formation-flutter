import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_feature/providers/great_places_provider.dart';
import 'package:flutter_native_feature/screens/add_place_screen.dart';
import 'package:flutter_native_feature/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes lieux'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaceProvider>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snap) => snap.connectionState == ConnectionState.waiting?
        Center(child: CircularProgressIndicator(),) :
        Consumer<GreatPlaceProvider>(
          child: Center(child: Text('Aucun lieu ajouté'),),
          builder: (ctx, places, ch) => places.items.length <= 0?
          ch:
          ListView.builder(
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(backgroundImage: FileImage(places.items[i].image),),
              title: Text(places.items[i].title),
              subtitle: Text(places.items[i].location.address),
              onTap: (){
                Navigator.of(context).pushNamed(PlaceDetailScreen.routeName, arguments: places.items[i].id);
              },
            ),
            itemCount: places.items.length,),
        ),
      ),
    );
  }
}
