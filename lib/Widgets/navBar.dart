import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app_demo/Pages/Lead/newLead.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: mobileNavBar(),
      desktop: desktopNavBar(),
    );
  }

  Widget mobileNavBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(children: [
            Icon(Icons.menu),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              'Lead',
              style: TextStyle(fontSize: 20),
            ),
          ]),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Screen_NewLead()));
                  },
                  child: const Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      Text(
                        'Add Lead',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget desktopNavBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Wrap(children: [
            Icon(Icons.menu),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              'Lead',
              style: TextStyle(fontSize: 20),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(5.0),
              //   child: PopupMenuButton(
              //       child: Container(
              //         decoration: BoxDecoration(
              //             border:
              //                 Border.all(color: Colors.grey.withOpacity(.2)),
              //             borderRadius: BorderRadius.all(Radius.circular(8))),
              //         padding: EdgeInsets.all(10),
              //         child: Row(
              //           children: [
              //             Icon(Icons.list),
              //             Column(
              //               children: [
              //                 Icon(Icons.arrow_drop_up_rounded, size: 20),
              //                 Icon(Icons.arrow_drop_down_rounded, size: 20)
              //               ],
              //             )
              //           ],
              //         ),
              //       ),
              //       itemBuilder: (context) {
              //         return [
              //           PopupMenuItem(
              //             child: null,
              //           )
              //         ];
              //       }),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton(
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(.2)),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.refresh_outlined),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: null,
                        )
                      ];
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton(
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(.2)),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.more_horiz),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: null,
                        )
                      ];
                    }),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Screen_NewLead()));
                  },
                  child: const Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      Text(
                        'Add Lead',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
