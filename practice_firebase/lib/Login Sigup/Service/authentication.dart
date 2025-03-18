import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // Lấy thông tin người dùng hiện tại
  User? get currentUser => _auth.currentUser;
  // Lấy FCM token
  Future<String?> getFCMToken() async {
    try {
      // Kiểm tra quyền thông báo (chỉ cần thiết cho iOS)
      await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      // Lấy token
      String? token = await _messaging.getToken();
      return token;
    } catch (e) {
      print('Lỗi khi lấy FCM token: $e');
      return null;
    }
  }

  // Đăng ký người dùng mới
  Future<String> signUpUser({
    required String displayName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String result = "Đã xảy ra lỗi";

    try {
      // Tạo tài khoản với Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Lấy FCM token
      String? fcmToken = await getFCMToken();

      // Lưu thông tin người dùng vào Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'displayName': displayName,
        'email': email,
        'role': 'patient', // Mặc định là bệnh nhân
        'fcmToken': fcmToken,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Cập nhật displayName cho user
      await userCredential.user!.updateDisplayName(displayName);

      result = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = 'Mật khẩu quá yếu';
      } else if (e.code == 'email-already-in-use') {
        result = 'Email này đã được sử dụng';
      } else if (e.code == 'invalid-email') {
        result = 'Email không hợp lệ';
      } else {
        result = e.message ?? 'Đã xảy ra lỗi khi đăng ký';
      }
    } catch (e) {
      result = e.toString();
    }

    return result;
  }

  // Đăng nhập người dùng và trả về role
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> result = {
      "status": "error",
      "message": "Đã xảy ra lỗi",
      "role": null
    };

    try {
      // Đăng nhập với Firebase Auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Cập nhật FCM token sau khi đăng nhập thành công
      await updateFCMToken();

      // Lấy thông tin role từ Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
        String? role = userData?['role'] as String?;

        result = {
          "status": "success",
          "message": "Đăng nhập thành công",
          "role": role ?? 'patient' // Mặc định là patient nếu không có role
        };
      } else {
        result = {
          "status": "error",
          "message": "Không tìm thấy thông tin người dùng",
          "role": null
        };
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        result["message"] = 'Không tìm thấy tài khoản với email này';
      } else if (e.code == 'wrong-password') {
        result["message"] = 'Mật khẩu không đúng';
      } else {
        result["message"] = e.message ?? 'Đã xảy ra lỗi khi đăng nhập';
      }
    } catch (e) {
      result["message"] = e.toString();
    }

    return result;
  }
  // Cập nhật FCM token
  Future<void> updateFCMToken() async {
    if (_auth.currentUser != null) {
      String? fcmToken = await getFCMToken();

      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'fcmToken': fcmToken,
        'lastLogin': FieldValue.serverTimestamp(),
      });
    }
  }
  // Đăng xuất
  Future<void> signOut() async {
    // Xóa FCM token trước khi đăng xuất
    if (_auth.currentUser != null) {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'fcmToken': null,
      });
    }

    await _auth.signOut();
  }
  // Lấy thông tin người dùng từ Firestore
  Future<Map<String, dynamic>?> getUserData() async {
    if (_auth.currentUser != null) {
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      return userDoc.data() as Map<String, dynamic>?;
    }
    return null;
  }
}
