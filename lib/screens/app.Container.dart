import 'package:flutter/material.dart';
import 'package:kidsworld/blocs/auth.Bloc.dart';

class AppScreen extends InheritedWidget {
  AppScreen({super.key,required this.authBloc, required super.child});
  final AuthBloc authBloc;
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw false;
  }

  static AppScreen of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppScreen>()!;
  }
}

