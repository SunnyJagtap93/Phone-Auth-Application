import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth_app/pages/home_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:velocity_x/velocity_x.dart';

enum LoginScreen { SHOW_MOBILE_ENTER_WIDGET, SHOW_OTP_FORM_WIDGET }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  // TextEditingController OtpFieldController = TextEditingController();

  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";
  String smsCode = "";

  void SignOutME() async {
    await _auth.signOut();
  }

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_page()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }

  showMobilePhoneWidget(context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              "Please enter your mobile Number".text.bold.size(23).make(),
              "You'll receive 4 digit code to verify next"
                  .text
                  .align(TextAlign.center)
                  .size(17)
                  .make()
                  .w(250)
                  .py20(),
              SizedBox(
                height: 27,
              ),
              Center(
                child: IntlPhoneField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            labelText: ("Mobile Number"),
                            border:
                                OutlineInputBorder(borderSide: BorderSide())),
                        initialCountryCode: 'IN')
                    .px(25),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _auth.verifyPhoneNumber(
                      phoneNumber: "+91${phoneController.text}",
                      verificationCompleted: (phoneAuthCredential) async {},
                      verificationFailed: (verificationFailed) {
                        print(verificationFailed);
                      },
                      codeSent: (verificationID, resendingToken) async {
                        setState(() {
                          currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                          this.verificationID = verificationID;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationID) async {});
                },
                child: "CONTINUE".text.semiBold.xl.make(),
                style: TextButton.styleFrom(
                    minimumSize: Size(380, 70),
                    backgroundColor: Color.fromARGB(210, 3, 31, 79)),
              ),
              SizedBox(
                height: 16,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  showOtpFormWidget(context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              "Verify Phone".text.bold.size(30).make(),
              "Code is sent to ${phoneController.text}"
                  .text
                  .align(TextAlign.center)
                  .size(18)
                  .make()
                  .w(250)
                  .p12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_textFieldOTP()],
              ).p(16),
              SizedBox(
                height: 10,
              ),
              "Don't Receive The Code ?" "Request Again".text.bold.make(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationID, smsCode: smsCode);
                  signInWithPhoneAuthCred(phoneAuthCredential);
                },
                child: "VERIFY AND CONTINUE".text.semiBold.xl.make(),
                style: TextButton.styleFrom(
                    minimumSize: Size(380, 70),
                    backgroundColor: Color.fromARGB(210, 3, 31, 79)),
              ),
              SizedBox(
                height: 16,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 40,
      fieldWidth: 55,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.blue,
      ),
      style: TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET
          ? showMobilePhoneWidget(context)
          : showOtpFormWidget(context),
    );
  }
}
