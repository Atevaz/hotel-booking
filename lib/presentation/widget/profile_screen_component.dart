import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';

class ProfileScreenComponent extends StatelessWidget {
  final String componentTitle;
  final Icon componentIcon;
  final Function()? onTap;

  const ProfileScreenComponent({
    Key? key,
    required this.componentTitle,
    required this.componentIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      title: MediumText(
        text: componentTitle,
      ),
      trailing: componentIcon,
    );
  }
}
