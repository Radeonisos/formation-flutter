
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chats/xorhPkZ6FStv0K0LNJu8/messages').snapshots(),
        builder: (ctx, streamSnapshot){
          if(streamSnapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else {
            final documents = streamSnapshot.data.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (ctx, i) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(documents[i].get('text')),
                )
            );
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        },
      ),
    );
  }
}
