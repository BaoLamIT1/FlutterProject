
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In Method
  Future<User?> signInWithGoogle() async {
    try {
      // Bước 1: Người dùng thực hiện Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // Người dùng hủy đăng nhập

      // Bước 2: Lấy thông tin xác thực từ tài khoản Google
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Bước 3: Tạo credential từ Google Auth
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Bước 4: Đăng nhập vào Firebase bằng credential
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      // Bước 5: Lấy thông tin User từ Firebase
      final User? user = userCredential.user;

      if (user != null) {
        print("Google Sign-In Successful:");
        print("User ID: ${user.uid}");
        print("Email: ${user.email}");
        print("Display Name: ${user.displayName}");
      }

      return user; // Trả về User đã đăng nhập
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: $e");
      return null;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  // Google Sign-Out Method
  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print("User has been signed out.");
    } catch (e) {
      print("Error during Google Sign-Out: $e");
    }
  }
}
