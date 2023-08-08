import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kidsworld/models/apps/userInfo.Model.dart';

import '../screens/authen/authen.Controller.dart';
import '../utility/app.Utility.dart';

class FireAuth extends GetxController{
  static FireAuth get instance => Get.put(FireAuth());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  late Rx<User?> firebaseUser = Rx<User?>(_firebaseAuth.currentUser);

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_firebaseAuth.currentUser);
    firebaseUser.bindStream(_firebaseAuth.userChanges());
    // ever(firebaseUser, _setInitialSreen);
    super.onReady();
  }

  _setInitialSreen(User? user){
    // user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(()=> Dashboard());
  }

  void signUp(UserInfoModel user, Function onSuccess, Function(String) onRegisterError){
    _firebaseAuth
      .createUserWithEmailAndPassword(email: user.email!, password: user.password!)
      .then((userInfo) {
        user.code = userInfo.user!.uid;
        _createUser(user, onSuccess, onRegisterError);
        addSharedPreferences("token", user.token);
        print(userInfo);
      }).catchError((err){
        _onSignUpErr(err.code, onRegisterError);
      });
  }

  _createUser(UserInfoModel user, Function onSuccess, Function(String) onRegisterError) async {
    await db.collection("users").doc(user.code).set(user.toJson())
      .whenComplete(() => onSuccess())
      .catchError((error, stackTrance)=>
        onRegisterError("SignUp fail, please try again")
      );
  }

  void signIn(String email, String pass,String token, Function onSuccess, Function(String) onSignInError){
    _firebaseAuth
      .signInWithEmailAndPassword(email: email, password: pass)
      .then((userInfo) {
        updateToken(userInfo.user!.uid,token);
        addSharedPreferences("token", token);
        print("on SignIn success");
        onSuccess();
      }).catchError((err){
        onSignInError("SignIn fail, please try again");
      });
  }

  void signOut(){
    removeSharedPreferences("token");
    _firebaseAuth.signOut();
    // AuthenController.instance.onReady();
  }

  Future<void> updateToken(String userUid,String token) async {
    await db.collection("users").doc(userUid)
      .update({
        "token": token
      });
  }

  Future<UserInfoModel> getUserDetails(String email) async {
    final snapshot = await db.collection("users").where("email",isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserInfoModel.fromJson(e.data())).single;
    return userData;
  }

  void loginWithPhone(String phone) async {
    try {
      await _firebaseAuth.signInWithPhoneNumber(phone);
    } on FirebaseAuthException catch (e) {
      if(e.code == 'invalid-phone-number'){
        Get.snackbar("Error", "Invalid Phone No");
      }
    } catch (_) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void _onSignUpErr(String code, Function(String) onRegisterError){
    switch(code) {
      case "invalid-email":
      case "invalid-credential":
        onRegisterError("Invalid email");
        break;
      case "email-already-in-use":
        onRegisterError("Email has existed");
        break;
      case "weak-password":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("SignUp fail, please try again");
        break;
    }
  }

  Future<void> updateUser(String currentPassword, UserInfoModel userInfo, Function onSuccess, Function(String) onRegisterError) async {
      final user = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential).then((value){
        user.updatePassword(userInfo.password!).then((_) async {
          await db.collection("users").doc(user.uid)
            .update({
              "name": userInfo.name,
              "password": userInfo.password
            });
          onSuccess();
        }).catchError((error) {
          print("Update mật khẩu thất bại");
          onRegisterError(error.toString());
        });
      }).catchError((error){
        print("Xác nhận người dùng thất bại");
        onRegisterError("Email hoặc mật cũ không đúng");
      });
  }
}