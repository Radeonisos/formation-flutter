import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {

  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storeImage;
  final _picker = ImagePicker();


  Future<void> takePicture() async{
    PickedFile image = await _picker.getImage(source: ImageSource.camera, maxWidth: 600);
    if(image == null){
      return;
    }
    setState(() {
      _storeImage = File(image.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storeImage.path);
    final savedImage = await _storeImage.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storeImage != null
              ? Image.file(_storeImage, fit: BoxFit.cover, width: double.infinity,)
              : Text("Pas d'image", textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10,),
        Expanded(
            child: FlatButton.icon(
                onPressed: takePicture,
                icon: Icon(Icons.camera),
                textColor: Theme.of(context).primaryColor,
                label: Text('Prendre une Photo'))
        )
      ],
    );
  }
}
