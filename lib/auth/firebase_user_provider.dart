import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RSEnterpriseAdminFirebaseUser {
  RSEnterpriseAdminFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RSEnterpriseAdminFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RSEnterpriseAdminFirebaseUser> rSEnterpriseAdminFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RSEnterpriseAdminFirebaseUser>(
            (user) => currentUser = RSEnterpriseAdminFirebaseUser(user));
