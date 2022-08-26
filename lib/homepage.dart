// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sav_money_project/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String fontMedium = "Airbnb Cereal Medium", fontBold = "Airbnb Cereal Bold";

  Widget buttonWidget(String img, String title) {
    return Column(
      children: [
        Image.asset(
          img,
          height: 30,
          width: 30,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 11, fontFamily: fontMedium),
        ),
      ],
    );
  }

  Widget gettingStarted({
    required String mainText,
    required String subText,
    required String icon,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
      child: Container(
        height: 140,
        width: 170,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder: (context, columnConstraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: columnConstraints.maxWidth,
                  height: columnConstraints.maxHeight * 0.4,
                  child: Text(
                    mainText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: fontMedium),
                  ),
                ),
                SizedBox(
                  height: columnConstraints.maxHeight * 0.55,
                  width: columnConstraints.maxWidth,
                  child: LayoutBuilder(builder: (context, rowConstraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: rowConstraints.maxWidth * 0.45,
                          child: Text(
                            subText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontFamily: fontMedium),
                          ),
                        ),
                        SizedBox(
                          width: rowConstraints.maxWidth * 0.5,
                          child: Image.asset(
                            icon,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    );
                  }),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget customRadioButton(bool selected, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
      child: Container(
        decoration: selected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(1, 96, 254, 1.0),
                  Color.fromRGBO(1, 71, 206, 1.0)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter))
            : BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(1, 2))
              ], borderRadius: BorderRadius.circular(14), color: Colors.white),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              title,
              style: TextStyle(
                  color:
                      selected ? Colors.white : Color.fromRGBO(51, 51, 51, 1.0),
                  fontFamily: fontMedium,
                  fontSize: 11),
            ),
          ),
        ),
      ),
    );
  }

  Widget customCategories(String img, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: SizedBox(
        width: 75,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      img,
                    ),
                  )),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(51, 51, 51, 1.0),
                  fontSize: 12,
                  fontFamily: fontMedium),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(240, 243, 255, 1.0),
            Color.fromRGBO(255, 255, 255, 1.0),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  //Profile pic and name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: SizedBox(
                      height: constraints.maxHeight * 0.1,
                      width: constraints.maxWidth,
                      child: LayoutBuilder(
                        builder: (context, rowConstraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: rowConstraints.maxHeight,
                                width: rowConstraints.maxHeight,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/pro_pic.png"))),
                              ),
                              SizedBox(
                                  height: rowConstraints.maxHeight,
                                  width: rowConstraints.maxWidth -
                                      (rowConstraints.minHeight + 8),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Hello,\n",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: fontMedium,
                                            fontSize: 13),
                                        children: [
                                          TextSpan(
                                            text: "Maria 👋",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: fontMedium,
                                                fontSize: 28),
                                          ),
                                        ]),
                                    textAlign: TextAlign.left,
                                  ))
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  //Card
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You have 5344 available in your accounts",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: fontMedium,
                              fontSize: 10),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 160,
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(6, 79, 140, 1.0),
                                  width: 2),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(240, 243, 255, 1.0),
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //heading line
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Savings",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontFamily: fontMedium),
                                    ),
                                    //Amount row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "AED  ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromRGBO(
                                                          51, 51, 51, 1.0)
                                                      .withOpacity(0.6),
                                                  fontFamily: fontMedium),
                                            ),
                                            Text(
                                              "2065",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color.fromRGBO(
                                                      51, 51, 51, 1.0),
                                                  fontFamily: fontMedium),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Image.asset(
                                              "assets/icons/Mobile_Banking.png",
                                              height: 40),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                //Thirds row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "In 3 Goal Accounts",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontFamily: fontMedium),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/icon_1.png",
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "assets/icons/icon_2.png",
                                          height: 18,
                                          width: 18,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Buttons Row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Center(
                      child: SizedBox(
                        width: constraints.maxWidth * 0.85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Button 1
                            buttonWidget(
                                "assets/icons/icon_3.png", "Start Saving"),

                            //Button 2
                            buttonWidget(
                                "assets/icons/icon_4.png", "Transactions"),

                            //Button 3
                            buttonWidget(
                                "assets/icons/icon_5.png", "Sav Rules"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //rewards
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(1, 96, 254, 1.0),
                                Color.fromRGBO(255, 75, 75, 1.0)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/img/gift_box.png",
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Unlock exciting rewards\n",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontMedium,
                                      fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: "Save more to earn more",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: fontBold,
                                          fontSize: 10),
                                    ),
                                  ]),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                    child: Text(
                      "Getting Started",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontMedium,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  //Getting Started ListView
                  SizedBox(
                    height: 160,
                    width: constraints.maxWidth,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        gettingStarted(
                            mainText: "Beginners\nGuide",
                            subText: "See how it works",
                            icon: "assets/icons/icon_6.png"),
                        gettingStarted(
                            mainText: "Complete Your \nProfile",
                            subText: "Win exciting cashback",
                            icon: "assets/icons/icon_7.png"),
                        SizedBox(
                          width: 16,
                        )
                      ],
                    ),
                  ),

                  //title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                    child: Text(
                      "Popular Sav Jars",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontMedium,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  //Popular Sav Jars ListView
                  SizedBox(
                    height: 60,
                    width: constraints.maxWidth,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            borderRadius: BorderRadius.circular(
                                selectedIndex == 0 ? 16 : 14),
                            child: customRadioButton(
                                selectedIndex == 0 ? true : false,
                                "Bucket List Goals")),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          borderRadius: BorderRadius.circular(
                              selectedIndex == 1 ? 16 : 14),
                          child: customRadioButton(
                              selectedIndex == 1 ? true : false,
                              "The Inevitables"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          borderRadius: BorderRadius.circular(
                              selectedIndex == 2 ? 16 : 14),
                          child: customRadioButton(
                              selectedIndex == 2 ? true : false,
                              "Small Luxuries of Life"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          borderRadius: BorderRadius.circular(
                              selectedIndex == 3 ? 16 : 14),
                          child: customRadioButton(
                              selectedIndex == 3 ? true : false, "School Fees"),
                        ),
                        SizedBox(
                          width: 16,
                        )
                      ],
                    ),
                  ),

                  //Categories ListView
                  SizedBox(
                    height: 150,
                    width: constraints.maxWidth,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        customCategories("assets/img/img_1.jpeg", "Travel"),
                        customCategories("assets/img/img_2.jpeg", "Gadgets"),
                        customCategories("assets/img/img_3.jpeg", "New Home"),
                        customCategories("assets/img/img_4.jpeg", "Cars"),
                        customCategories("assets/img/img_5.jpeg", "Appliances"),
                        SizedBox(
                          width: 16,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    ));
  }
}
