import 'package:flutter/material.dart';
import 'package:http_request/product_card/main_product_card.dart';
// import 'package:http_request/multi_provide_state/main_multi_provide.dart';
// import 'package:http_request/provider_state_management/main_state_management.dart';
// import 'package:http_request/main_get_data.dart';
// import 'package:http/http.dart';
// import 'package:http_request/main_http_request.dart';
// import 'package:http_request/share_preferences/main_share_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainProductCard());
  }
}
