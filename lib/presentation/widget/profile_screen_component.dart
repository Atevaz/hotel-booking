import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';

class ProfileScreenComponent extends StatelessWidget {
  final String componentTitle;
  final Icon componentIcon;
  const ProfileScreenComponent(
      {Key? key, required this.componentTitle, required this.componentIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MediumText(
        text: componentTitle,
      ),
      trailing: componentIcon,
    );
  }
}
