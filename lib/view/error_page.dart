import 'package:flutter/material.dart';
import 'package:websitegyd/router/router.dart';

class ErrorPage extends StatelessWidget {
  static Route<dynamic> route() {
    return SimpleRoute(
      name: '/error',
      title: 'Error Page',
      builder: (_) => ErrorPage(),
    );
  }

  static Route<dynamic> routeAnim() {
    return FadeRoute(
      name: '/error',
      title: 'Error Page',
      builder: (_) => ErrorPage(),
    );
  }

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
            colors: [Colors.black, Colors.black],
          ),
        ),
        // child:
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       'applicationName'.tr,
        //       style: TextStyle(
        //         fontSize: deviceSize.width / 20.toInt(),
        //         color: Colors.white,
        //       ),
        //     ),
        //     Text(
        //       'applicationName'.tr,
        //       style: TextStyle(
        //         fontSize: deviceSize.width / 20.toInt(),
        //         color: Colors.white,
        //       ),
        //     ),
        //     Text(
        //       'something_went_wrong'.tr,
        //       style: TextStyle(
        //         fontSize: deviceSize.width / 50.toInt(),
        //         color: Colors.white,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
