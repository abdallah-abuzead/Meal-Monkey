import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
CollectionReference _userCollection = FirebaseFirestore.instance.collection('user');

class CustomUser {
  String? name, email, mobileNo, address, password;
  Timestamp? createdAt, updatedAt;

  CustomUser({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.address,
    required this.password,
  });

  CustomUser.fromJson(Map<String, dynamic> user) {
    this.name = user['name'];
    this.email = user['email'];
    this.mobileNo = user['mobile_no'];
    this.address = user['address'];
    this.password = user['password'];
    this.createdAt = user['created_at'];
    this.updatedAt = user['updated_at'];
  }

  Map<String, dynamic> toMap() => {
        'name': this.email,
        'email': this.email,
        'mobile_no': this.email,
        'address': this.email,
        'password': this.password,
        'created_at': this.createdAt,
        'updated_at': this.updatedAt,
      };

  static String? get currentUserEmail => _auth.currentUser?.email;

  static User? get currentUser => _auth.currentUser;

  Future add() async {
    this.createdAt = this.updatedAt = Timestamp.now();
    await _userCollection
        .add(this.toMap())
        .then((value) => print('User added'))
        .catchError((error) => print('Failed to add User: $error'));
  }

  static Future<CustomUser> getCurrentUser() async {
    final users = await _userCollection.where('email', isEqualTo: currentUserEmail).get();
    return CustomUser.fromJson(users.docs.first.data() as Map<String, dynamic>);
  }

  static Future signOut() async {
    await _auth.signOut();
  }
}
