import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/config.dart';

class MenuItemWidget extends StatefulWidget {
  final IconData iconName;

  const MenuItemWidget({Key key, this.iconName}) : super(key: key);
  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(
          () {
            isSelected = !isSelected;
          },
        );
      },
      child: ClayContainer(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        borderRadius: 10,
        color: primaryColor,
        surfaceColor: isSelected ? activeColor1 : primaryColor,
        child: Icon(
          widget.iconName,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
