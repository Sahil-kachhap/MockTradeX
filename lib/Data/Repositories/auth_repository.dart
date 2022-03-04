import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository{
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String? name, required String? email, required String? password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);
    }on FirebaseAuthException catch(e){
       if(e.code == 'weak-password'){
         throw Exception('The password provided is too weak');
       }else if(e.code == 'email-already-in-use'){
         throw Exception('User Already Exist for this email.');
       }
    } catch (e){
      throw Exception(e.toString());
    }
  }

  Future<void> SignIn({required String? email, required String? password}) async{
      try{
        await _firebaseAuth.signInWithEmailAndPassword(email: email!, password: password!);
      }on FirebaseAuthException catch(e){
         if(e.code == 'user-not-found'){
           throw Exception('No user Found.');
         }else if(e.code == 'wrong password'){
           throw Exception('wrong password entered. Try Again!');
         }
      }
   }
  
  Future<void> SignOut() async{
    try{
      await _firebaseAuth.signOut();
    }catch(e){
      throw Exception(e);
    }
  }

}