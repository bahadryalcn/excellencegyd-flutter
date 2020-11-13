import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:websitegyd/extensions/extensions.dart';
import 'package:websitegyd/models/nav_bar_item_model.dart';

class NavBarItemDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    bool _isHovering = false;
    return Row(
      children: [
        Text(
          model.title,
          style: TextStyle(
            color: _isHovering
                ? Colors.red.withOpacity(0.7)
                : Theme.of(context).accentColor,
          ),
        ).showCursorOnHover,
      ],
    );
  }
}
