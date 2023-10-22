import 'package:flutter/material.dart';

Widget unDefinedPage() {
  return Scaffold(
    appBar: AppBar(
      title: const Text('e-commerce'),
    ),
    body: const Center(child: Text('Un Defined path')),
  );
}

Widget defaultFormField(
        {required TextEditingController controller,
        required String label,
         bool isPass=false,
        required Function validate,
          required TextInputAction inputAction,
       }) =>
    TextFormField(
       textInputAction: inputAction ,
      controller: controller,
      obscureText: isPass,
      validator: (value) {
        validate(value);
        return null;
      },
      decoration: InputDecoration(
          // suffixIcon: isPass == true
          //     ? IconButton(
          //         onPressed: () {
          //           showPassFun!();
          //         },
          //         icon: showPass
          //             ? Icon(Icons.visibility)
          //             : Icon(Icons.visibility_off),
          //       )
          //     : null,
          filled: true,
          fillColor: Colors.white,
          hintText: label,

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent))),
    );
