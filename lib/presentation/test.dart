import 'package:booking_hotel/presentation/widget/progress_dialog.dart';
import 'package:booking_hotel/presentation/widget/switch_botton.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: TextButton(onPressed: (){},child: Text('Test')),
    );
  }
}
