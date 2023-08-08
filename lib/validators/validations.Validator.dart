class Validations {
  static String? isValidEmail(String? email) {
    if(email == null || email.isEmpty) return "Email invalid";
    var isValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(!isValid) return "Email invalid";
    return null;
  }
  static String? isValidName(String? name) {
    if(name == null || name.isEmpty) return "Name invalid";
    return null; 
  }
  static String? isValidPhone(String? phone) {
    if(phone == null || phone.isEmpty) return "Phone invalid";
    return null; 
  }
  static String? isValidPass(String? pass) {
    if(pass == null || pass.isEmpty) return "Password invalid";
    if (pass.length < 6) return "Password require minimum 6 characters";
    return null; 
  }
  static String? isValidPassConfirm(Map<String,String> passJson) {
    if(passJson["passConfirm"] == null || passJson["passConfirm"]!.isEmpty){
      return "PassConfirm invalid";
    } 
    if(passJson["pass"] != passJson["passConfirm"]) return "Password was wrong";
    return null; 
  }
  static String? isValidComment(String? comment) {
    if(comment == null || comment.isEmpty) return "Comment invalid";
    return null; 
  }
}