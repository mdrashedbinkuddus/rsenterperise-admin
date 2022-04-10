import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RafiaEnterpriseFirebaseUser {
  RafiaEnterpriseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RafiaEnterpriseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RafiaEnterpriseFirebaseUser> rafiaEnterpriseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RafiaEnterpriseFirebaseUser>(
            (user) => currentUser = RafiaEnterpriseFirebaseUser(user));
