import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? photoUrl;
  String? email;

  UserModel({this.name, this.photoUrl, this.email});

  factory UserModel.fromFirebaseUser(User firebaseUser) {
    String? name = firebaseUser.providerData[0].displayName;
    String? photoUrl = firebaseUser.providerData[0].photoURL;
    String? email = firebaseUser.providerData[0].email;
    UserModel aux = UserModel(name: name, photoUrl: photoUrl, email: email);
    return aux;
  }
}
