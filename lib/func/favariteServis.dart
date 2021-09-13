import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examinfirebase/model/favarite.dart';

class FavariteService {
  final String? uidMeal;
  FavariteService({this.uidMeal});

  final CollectionReference _reference =
  FirebaseFirestore.instance.collection("Favorites");

  Future writeFirestore(String image, String name1, String name2, String cost,int index,
      {bool state = false}) async {
    return await _reference.doc(uidMeal).set({
      'image': image,
      'name1': name1,
      'name2': name2,
      'cost': cost,
      'index': index,
      'state': state,
    });
  }

  Future deleteFirestore(String uidMeal) async {
    return await _reference
        .doc(uidMeal)
        .delete()
        .then((value) => print("Delete qilinde"))
        .catchError(
          (e) => print("Error $e"),
    );
  }

  List<Favarite> _addDatas(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      return Favarite(
        image: doc['image'],
        name1: doc['name1'],
        name2: doc['name2'],
        cost: doc['cost'],
        index: doc['index'],
        state: doc['state'],
      );
    }).toList();
  }

  Stream<List<Favarite>> get orders {
    return _reference.snapshots().map(_addDatas);
  }
}
