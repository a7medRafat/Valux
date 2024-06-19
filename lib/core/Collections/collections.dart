import 'package:cloud_firestore/cloud_firestore.dart';

import '../local_storage/hive_keys.dart';
import '../local_storage/user_storage.dart';

class Collections {
  static CollectionReference<Map<String, dynamic>> orders = FirebaseFirestore.instance
      .collection('users')
      .doc(UserData().getData(id: Keys.user)!.id.toString())
      .collection('orders');
}
