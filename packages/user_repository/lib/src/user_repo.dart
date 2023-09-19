import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
  Stream<User?> get myuser;

  get user => null;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<Myuser> signUp(Myuser myuser, String password);

  Future<void> setUserData(Myuser user);
}
