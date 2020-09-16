import 'package:flutter/material.dart';
import 'package:http_request/post_result_model.dart';
import 'package:http_request/user.mode.dart';

class MainHttpRequest extends StatefulWidget {
  @override
  _MainHttpRequestState createState() => _MainHttpRequestState();
}

class _MainHttpRequestState extends State<MainHttpRequest> {
  PostResult postResult;
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text((postResult != null)
                ? postResult.id +
                    " | " +
                    postResult.name +
                    " | " +
                    postResult.job +
                    " | " +
                    postResult.created
                : "Tidak ada data"),
            RaisedButton(
              onPressed: () {
                PostResult.connectToAPI("Acho", "Web Programmer").then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text("POST"),
            ),
            Text((user != null)
                ? user.id + " | " + user.name
                : "Tidak ada data"),
            RaisedButton(
              onPressed: () {
                User.connectToAPI("3").then((value) {
                  user = value;
                  setState(() {});
                });
              },
              child: Text("GET"),
            )
          ],
        ),
      ),
    );
  }
}
