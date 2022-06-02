import 'package:flutter/material.dart';
import 'package:flutter_phone_auth_app/widgets/languages.dart';
import 'package:flutter_phone_auth_app/widgets/wave.dart';
import 'package:flutter_phone_auth_app/pages/sign_in.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: 130,
                ),
                "Please select the language".text.bold.size(30).make(),
                "You can change the language at any time"
                    .text
                    .align(TextAlign.center)
                    .size(18)
                    .make()
                    .w(250)
                    .p12(),
                Languages().py24(),
                SizedBox(
                  height: 3,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: "NEXT".text.semiBold.xl.make(),
                  style: TextButton.styleFrom(
                      minimumSize: Size(280, 70),
                      backgroundColor: Color.fromARGB(210, 3, 31, 79)),
                ),
                Waves().h(237),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
