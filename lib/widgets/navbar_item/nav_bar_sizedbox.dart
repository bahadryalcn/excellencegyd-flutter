import 'package:flutter/cupertino.dart';

class NavBarSizedBox extends StatelessWidget {
  final value;
  const NavBarSizedBox(this.value);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width / value,
    );
  }
}
