import 'dart:async';

import 'package:kidsworld/models/apps/userInfo.Model.dart';

import '../firebase/auth.Firebase.dart';
import '../validators/validations.Validator.dart';

class AuthBloc {

  final _fireAuth = FireAuth();

  final StreamController _nameController = StreamController.broadcast();
  final StreamController _emailController = StreamController.broadcast();
  final StreamController _passOldController = StreamController.broadcast();
  final StreamController _passController = StreamController.broadcast();
  final StreamController _passConfirmController = StreamController.broadcast();
  final StreamController _phoneController = StreamController.broadcast();
        
  var emailValidation = StreamTransformer.fromHandlers(
    handleData: (email, sink) {
      sink.add(Validations.isValidEmail(email as String?));
    },
  );
  var passOldValidation = StreamTransformer.fromHandlers(
    handleData: (passOld, sink) {
      sink.add(Validations.isValidPass(passOld as String?));
    },
  );
  var passValidation = StreamTransformer.fromHandlers(
    handleData: (pass, sink) {
      sink.add(Validations.isValidPass(pass as String?));
    },
  );
  var passConfirmValidation = StreamTransformer.fromHandlers(
    handleData: (passJson, sink) {
      sink.add(Validations.isValidPassConfirm(passJson as Map<String,String>));
    },
  );
  var nameValidation = StreamTransformer.fromHandlers(
    handleData: (name, sink) {
      sink.add(Validations.isValidName(name as String?));
    },
  );
  var phoneValidation = StreamTransformer.fromHandlers(
    handleData: (phone, sink) {
      sink.add(Validations.isValidPhone(phone as String?));
    },
  );

  Stream get nameStream => _nameController.stream.transform(nameValidation);
  Sink get nameSink => _nameController.sink;

  Stream get emailStream => _emailController.stream.transform(emailValidation);
  Sink get emailSink => _emailController.sink;

  Stream get passOldStream => _passOldController.stream.transform(passOldValidation);
  Sink get passOldSink => _passOldController.sink;

  Stream get passStream => _passController.stream.transform(passValidation);
  Sink get passSink => _passController.sink;

  Stream get passConfirmStream => _passConfirmController.stream.transform(passConfirmValidation);
  Sink get passConfirmSink => _passConfirmController.sink;

  Stream get phoneStream => _phoneController.stream.transform(phoneValidation);
  Sink get phoneSink => _phoneController.sink;

  bool isValid(passConfirm, name, phone,{email,pass,passOld}) {
    if(email!=null){
      if(Validations.isValidEmail(email) != null){
        return false;
      }
    }
    if(passOld != null){
      if(Validations.isValidPass(passOld) != null){
        return false;
      }
    }
    if(pass != null){
      if(Validations.isValidPass(pass) != null){
        return false;
      }
    }
    if(Validations.isValidPassConfirm({"pass":pass,"passConfirm":passConfirm}) != null){
      return false;
    }
    if(Validations.isValidName(name) != null){
      return false;
    }
    if(Validations.isValidPhone(phone) != null){
      return false;
    }
    return true;
  }

  void signUp(UserInfoModel user, Function onSuccess, Function(String) onRegisterError){
    _fireAuth.signUp(user, onSuccess, onRegisterError);
  }

  void signIn(String email, String pass, String token, Function onSuccess, Function(String) onSignInError){
    _fireAuth.signIn(email, pass, token, onSuccess, onSignInError);
  }

  void updateUser(String currentPassword,UserInfoModel user, Function onSuccess, Function(String) onRegisterError){
    _fireAuth.updateUser(currentPassword, user, onSuccess, onRegisterError);
  }
  void dispose() {
    _emailController.close();
    _passController.close();
    _nameController.close();
    _phoneController.close();
    _passConfirmController.close();
    _passOldController.close();
  }
}