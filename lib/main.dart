import 'package:flutter/material.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/middleware.dart';
import 'package:nimebox/store/reducer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/keys.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:nimebox/screens/screens.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
          ),
          home: MainScreen(),
        ));
  }
}
