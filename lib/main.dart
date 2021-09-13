import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:examinfirebase/pages/network_net.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'introduction/introduction.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    String string;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        string = 'Mobile: Online';
        break;
      case ConnectivityResult.wifi:
        string = 'WiFi: Online';
        break;
      case ConnectivityResult.none:
      default:
        string = 'Offline';
    }
    if (string == 'Offline') {
      return NetworkProblem();
    }  else{
      return Introduction();
    }
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
