import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final googleSignIn = GoogleSignIn();
  
  GoogleSignInAccount user;

  Future<UserCredential> signInWithGoogle() async{
    //trigger authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    //obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;
    
    //create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );
  
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async{
    try{
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      return true;
    }catch(e){
        return null;
    }
  }

  Future<UserCredential> createUser(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  //Shorter version ng taas
  Future<UserCredential> signInWIthEmailAndPassword(String email, String password) async => 
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
}