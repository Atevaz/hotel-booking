import 'package:flutter/material.dart';

class HomeSliverAppBarImageView extends StatelessWidget {
  const HomeSliverAppBarImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        "https://images.unsplash.com/photo-1529619768328-e37af76c6fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        fit: BoxFit.cover,
      ),
    );
  }
}
