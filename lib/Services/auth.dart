import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/Services/operation.dart';
import 'package:flutterapp/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  ///create user object bsed on firebse user
  
  User _userFromFirbaseUser(user){
    return user != null ? User(uid:user.uid) : null;
  }



  ///authentication change user stream


  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirbaseUser);
  }


  /// anonymous sign in

  Future anonsign() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirbaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }



///  sign in  with email and password
Future signinwithemailpass(email,password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email:email , password: password);
      FirebaseUser user= result.user;

      return _userFromFirbaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
}


///  register with email an password

  Future registerwithemailpass(String email, String password) async{

    try{
         AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
         FirebaseUser user = result.user;
         DataService(uid:user.uid).setData('maxwell','australia');
          return _userFromFirbaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }

  }



/// sign out

    Future signOut() async {
      try{
         return await _auth.signOut();
      }catch(e){
        print(e.toString());
      }
    }
}