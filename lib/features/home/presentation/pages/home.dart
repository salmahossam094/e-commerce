
import 'package:flutter/material.dart';

import '../../../login/domain/entities/LoginEntity.dart';

class HomeScreen extends StatelessWidget {
  LoginEntity loginEntity;

   HomeScreen(this.loginEntity,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('hello ${loginEntity.user?.name??''} '),
      ),
    );
  }
}
