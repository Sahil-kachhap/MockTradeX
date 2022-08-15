import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/user.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(
      {required String? name,
      required String? email,
      required String? password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      await userSetup(name!, email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('User Already Exist for this email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createUser(
      {required String? name, required String? email}) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    CryptoUser _user = CryptoUser(name: name, email: email, uid: docUser.id);
    final json = {'id': _user.uid, 'name': _user.name, 'email': _user.email};

    await docUser.set(json);
  }

  Future<void> userSetup(String name, String email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    users.doc(uid).set({'Name': name, 'email': email, 'uid': uid});
    print("uid: $uid");
  }

  Future<void> SignIn(
      {required String? email, required String? password}) async {
    try {
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user Found.');
      } else if (e.code == 'wrong password') {
        throw Exception('wrong password entered. Try Again!');
      }
    }
  }

  Future<void> SignOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
