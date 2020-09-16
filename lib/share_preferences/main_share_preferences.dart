import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainSharePreferences extends StatefulWidget {
  @override
  _MainSharePreferencesState createState() => _MainSharePreferencesState();
}

class _MainSharePreferencesState extends State<MainSharePreferences> {
  TextEditingController controller = TextEditingController(text: "No name");
  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama", controller.text);
    pref.setBool("ison", isOn);
  }

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("nama") ?? "No name";
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("ison") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
            ),
            Switch(
              value: isOn,
              onChanged: (newValue) {
                setState(() {
                  isOn = newValue;
                });
              },
            ),
            RaisedButton(
              child: Text("Save"),
              onPressed: () {
                saveData();
              },
            ),
            RaisedButton(
              child: Text("Load"),
              onPressed: () {
                getNama().then((s) {
                  controller.text = s;
                  setState(() {});
                });
                getOn().then((b) {
                  isOn = b;
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
