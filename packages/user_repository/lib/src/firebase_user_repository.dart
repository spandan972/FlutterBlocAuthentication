import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/my_user.dart';
import 'user_repo.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  @override
  //represents current aithenticated user and changes auth state when state changemaps firebase user to user
  Stream<User?> get User {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

//Logs out user wich changes the state of firebaseauth
  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString() as num);
      rethrow;
    }

    @override
    Future<void> signIn(String email, String password) async {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }

    @override
    Future<Myuser> signUp(Myuser myuser, String password) async {
      try {
        UserCredential user =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: myuser.email, password: password);

        myuser = myuser.copyWith(id: user.user!.uid);
        return myuser;
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }
  }
}
