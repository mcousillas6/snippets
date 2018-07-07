import 'package:flutter/material.dart';
import 'package:snippets/bloc/counter_bloc.dart';

class AppProvider extends InheritedWidget {
  // Here we should store all our blocs to pass down our app.
  final CounterBloc counterBloc;

  AppProvider({
    Key key,
    @required Widget child,
  }) : counterBloc = CounterBloc(),
       super(key: key, child: child);

  @override bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CounterBloc userBlocOf(BuildContext context) => (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider).counterBloc;

}
