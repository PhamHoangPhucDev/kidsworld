import 'dart:async';

import '../validators/validations.Validator.dart';

class ProductBloc {

  final StreamController _nameController = StreamController.broadcast();
  final StreamController _commentController = StreamController.broadcast();
        
  var nameValidation = StreamTransformer.fromHandlers(
    handleData: (name, sink) {
      sink.add(Validations.isValidName(name as String?));
    },
  );
  var commentValidation = StreamTransformer.fromHandlers(
    handleData: (comment, sink) {
      sink.add(Validations.isValidComment(comment as String?));
    },
  );

  Stream get nameStream => _nameController.stream.transform(nameValidation);
  Sink get nameSink => _nameController.sink;

  Stream get commentStream => _commentController.stream.transform(commentValidation);
  Sink get commentSink => _commentController.sink;


  bool isValid({name,comment}) {
    if(Validations.isValidName(name) != null){
      return false;
    }
    if(Validations.isValidComment(comment) != null){
      return false;
    }
    return true;
  }

  void dispose() {
    _commentController.close();
    _nameController.close();
  }
}