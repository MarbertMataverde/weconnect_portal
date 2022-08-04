import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

Future<bool> checkAccessCode(
  String accessCode,
  context,
) async {
  late bool isExisted;

  await _firebaseFirestore.collection('access-code').doc(accessCode).get().then(
        (value) => value.exists ? isExisted = true : isExisted = false,
      );
  return isExisted;
}
