import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.pink],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'applicationName'.tr,
              style: TextStyle(
                fontSize: deviceSize.width / 20.toInt(),
                color: Colors.white,
              ),
            ),
            Text(
              'something_went_wrong'.tr,
              style: TextStyle(
                fontSize: deviceSize.width / 50.toInt(),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
