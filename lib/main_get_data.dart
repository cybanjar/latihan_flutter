import 'package:flutter/material.dart';
import 'package:http_request/user_get_data.dart';

class MainGetData extends StatefulWidget {
  @override
  _MainGetDataState createState() => _MainGetDataState();
}

class _MainGetDataState extends State<MainGetData> {
  String output = "No data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Get Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(output),
            RaisedButton(
              onPressed: () {
                User.getUsers("2").then((users) {
                  output = "";
                  for (int i = 0; i < users.length; i++)
                    output = output + "[ " + users[i].name + " ] ";
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
