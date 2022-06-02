
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  int _value = 0;

  @override
  void initstate() {
    super.initState();
    _value = 0;
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              "Please Select Your Profile".text.bold.size(30).make(),
              Container(
                margin: const EdgeInsets.only(
                    top: 40, bottom: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: Row(children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (_) {
                        setState(() {
                          _value = 1;
                        });
                      },
                    ),
                  ),
                  Image.asset("assets/images/warehouse.png").h(55).w(100),
                  Column(
                    children: [
                      "Shipper".text.xl2.bold.make().p12(),
                      "description".text.size(10).make(),
                      "description".text.size(10).make(),
                    ],
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 0, bottom: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(7.5),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: Column(children: [
                  Row(children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (_) {
                          setState(() {
                            _value = 2;
                          });
                        },
                      ).p(12.5),
                    ),
                    Image.asset("assets/images/delivery.png").h(100).w(100),
                    Column(
                      children: [
                        "Transporter".text.xl2.bold.make().p12(),
                        "description".text.size(10).make(),
                        "description".text.size(10).make(),
                      ],
                    ),
                  ]),
                ]),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => VerifyNumber(number: data['code']! + _enterPhoneNumber.text,)));
                },
                child: "CONTINUE".text.semiBold.xl.make(),
                style: TextButton.styleFrom(
                    minimumSize: Size(500, 70),
                    backgroundColor: Color.fromARGB(210, 3, 31, 79)),
              )
            ],
          ),
        ),
      ).p(16),
    );
  }
}
