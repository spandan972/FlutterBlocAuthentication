
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
Stream<<Myuser?> get Myuser?;


  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<Myuser> signUp(Myuser myuser, String password);
}
