import 'package:flutter/material.dart';
import 'package:http_request/provider_state_management/application_color.dart';
import 'package:provider/provider.dart';

class MainStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return ChangeNotifierProvider<ApplicationColor>(
      // ignore: deprecated_member_use
      builder: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              "Provider State Management",
              style: TextStyle(color: applicationColor.color),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  color: applicationColor.color,
                  duration: Duration(milliseconds: 500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.all(5), child: Text("AB")),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Switch(
                      value: applicationColor.isLightBlue,
                      onChanged: (newValue) {
                        applicationColor.isLightBlue = newValue;
                      },
                    ),
                  ),
                  Container(margin: EdgeInsets.all(5), child: Text("LB"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
