import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app_demo/Services/Api/ApiServices.dart';
import 'package:web_app_demo/Utils/constents.dart';

class Screen_NewLead extends StatefulWidget {
  const Screen_NewLead({super.key});

  @override
  State<Screen_NewLead> createState() => _Screen_NewLeadState();
}

class _Screen_NewLeadState extends State<Screen_NewLead> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
          child: Column(
        children: [leadNavBar(), newleadForm()],
      )),
    ));
  }

  newleadForm() {
    return Container(
      height: screenHeight! / 1.1,
      child: ScreenTypeLayout.builder(mobile: (value) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'MobileNo'),
              ),
              TextFormField(
                controller: mailController,
                decoration: InputDecoration(labelText: 'Email'),
              )
            ],
          ),
        );
      }, desktop: (value) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(labelText: 'MobileNo'),
              ),
              TextFormField(
                controller: mailController,
                decoration: InputDecoration(labelText: 'Email'),
              )
            ],
          ),
        );
      }),
    );
  }

  leadNavBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      child: ScreenTypeLayout.builder(
        desktop: (value) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [Icon(Icons.menu), Text('New Lead')],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (nameController.text != '' &&
                            mobileController.text != '') {
                          var response = await Api().createlead(
                              context: context,
                              name: nameController.text,
                              mobile: mobileController.text);
                          if (response) {
                            nameController.clear();
                            mobileController.clear();
                            mailController.clear();
                          }
                        }
                      },
                      child: Text('Save'))
                ]),
          );
        },
        mobile: (value) {
          return Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [Icon(Icons.menu), Text('New Lead')],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (nameController.text != '' &&
                            mobileController.text != '') {
                          var response = await Api().createlead(
                              context: context,
                              name: nameController.text,
                              mobile: mobileController.text);
                          if (response) {
                            nameController.clear();
                            mobileController.clear();
                            mailController.clear();
                          }
                        }
                      },
                      child: Text('Save'))
                ]),
          );
        },
      ),
    );
  }
}
