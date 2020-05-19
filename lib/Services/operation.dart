import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataService{

  final String uid;

  DataService({this.uid});

  final CollectionReference _collectionReference= Firestore.instance.collection('player data');

  Future setData(String name,String country) async{
    return await _collectionReference.document(uid).setData({
      'name':name,
      'country' : country
    });

  }


  ///get data
Stream<QuerySnapshot> get player {
    return _collectionReference.snapshots();
}



}