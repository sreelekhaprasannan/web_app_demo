import 'package:flutter/material.dart';
import 'package:pwa_install/pwa_install.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app_demo/Utils/constents.dart';
import 'package:web_app_demo/Widgets/navBar.dart';

class Screen_LeadView extends StatefulWidget {
  const Screen_LeadView({super.key});

  @override
  State<Screen_LeadView> createState() => _Screen_LeadViewState();
}

class _Screen_LeadViewState extends State<Screen_LeadView> {
  String msg = 'disabled';
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (PWAInstall().installPromptEnabled) {
      msg = 'enabled';
    }
    // PWAInstall().promptInstall_();
    print(msg);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: screenHeight,
        child: Column(
          children: [
            NavBar(),
            leadListView(),
          ],
        ),
      )),
    );
  }

  leadListView() {
    return Container(
      height: screenHeight! / 1.6,
      child: ScreenTypeLayout.builder(
        mobile: (value) {
          return Container(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile();
                },
                separatorBuilder: ((context, index) => Divider()),
                itemCount: 5),
          );
        },
        desktop: (value) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            height: screenHeight! / 1.5,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('Title')),
                    Expanded(child: Text('Status'))
                  ],
                ),
                Container(
                  height: screenHeight! / 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile();
                      },
                      separatorBuilder: ((context, index) => Divider()),
                      itemCount: 5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
