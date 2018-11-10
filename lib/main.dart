import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/keys.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:nimebox/store/store.dart';
import 'package:nimebox/screens/screens.dart';

void main() {
  final store =
      Store<AppState>(appReducer, initialState: AppState(), middleware: [
    LoggingMiddleware.printer(),
    appMiddleware,
  ]);
  runApp(NimeboxApp(
    store: store,
  ));
}

class NimeboxApp extends StatelessWidget {
  final Store<AppState> store;

  NimeboxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Nimebox',
          navigatorKey: Keys.navKey,
          theme: ThemeData(
              primaryColor: Colors.white,
              accentColor: Colors.indigo,
              hintColor: Colors.grey,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.indigo),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              )),
          routes: {'/': (context) => NewsScreen()},
        ));
  }
}
