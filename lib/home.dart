import 'package:demoui/controller/screen_controller.dart';
import 'package:demoui/request_screen.dart';
import 'package:demoui/request_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'feed_button.dart';
import 'feed_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screenController = Get.put(ScreenController());

  PageController? pageController;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('SelectedPage: $screenController.selectedPage');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
              backgroundColor: Colors.grey,
            ),
          ),
          title: Row(
            children: [
              Obx(
                () => TabButton(
                  text: "  Feed  ",
                  pageNumber: 0,
                  selectedPage: screenController.selectedPage.value,
                  onPressed: () {
                    screenController.changePage(0);
                    pageController!.animateToPage(0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                ),
              ),
              Obx(
                () => TabButton(
                  text: "  Requests  ",
                  pageNumber: 1,
                  selectedPage: screenController.selectedPage.value,
                  onPressed: () {
                    screenController.changePage(1);
                    pageController!.animateToPage(1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                ),
              ),
            ],
          ),
          actions: [
            Container(
              width: 30,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'iPhone 11 Pro/Vector.svg',
                      fit: BoxFit.cover,
                      height: 6.94,
                      width: 27.69,
                    ),
                    SvgPicture.asset(
                      'iPhone 11 Pro/Vector-1.svg',
                      fit: BoxFit.cover,
                      height: 6.94,
                      width: 27.69,
                    ),
                    SvgPicture.asset(
                      'iPhone 11 Pro/Vector-2.svg',
                      fit: BoxFit.cover,
                      height: 6.94,
                      width: 27.69,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              margin: EdgeInsets.only(right: 3),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    'assets/iPhone 11 Pro 2/Vector.svg',
                    height: 31.04,
                    width: 36.54,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body:  PageView(
        onPageChanged: (int page) {
          screenController.selectedPage.value = page;
        },
        controller: pageController,
        children: [
          FeedScreen(),
          RequestTabScreen(),
        ],
      ),
      floatingActionButton: Obx(() => (screenController.selectedPage.value == 0)
          ? FeedButton()
          : Container()),
    );
  }
}

class TabButton extends StatelessWidget {
  final String? text;
  final int? selectedPage;
  final int? pageNumber;
  final onPressed;
  TabButton({this.text, this.selectedPage, this.pageNumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: selectedPage == pageNumber
              ? Color.fromRGBO(255, 85, 115, 1)
              : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: text == "  Feed  "
                  ? BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))
                  : BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
        ),
        child: Text(
          text!,
          style: TextStyle(
              color: selectedPage == pageNumber
                  ? Colors.white
                  : Color.fromRGBO(150, 150, 150, 1)),
        ));
  }
}
