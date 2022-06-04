import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitabisa_clone/const/colors.dart';
import 'package:kitabisa_clone/pages/home/widgets/donation_card.dart';
import 'package:kitabisa_clone/pages/home/widgets/icon_menu.dart';
import 'package:kitabisa_clone/pages/home/widgets/section1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List banners = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.jpg',
    'assets/banners/banner4.jpg',
    'assets/banners/banner5.png',
  ];

  int _carouselIndex = 0;

  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bannersWidget = [
      Image.asset(banners[0]),
      Image.asset(banners[1]),
      Image.asset(banners[2]),
      Image.asset(banners[3]),
      Image.asset(banners[4]),
    ];

    final List<Widget> _widgetOptions = <Widget>[
      SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            print('constraint : ${constraints.maxWidth}');
            return Container(
              margin: constraints.maxWidth > 600 ? EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.25) : EdgeInsets.all(0),
              child: Column(
                children: [
                  Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: SectionOne()),
                  Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Stack(
                        children: [
                          CarouselSlider(
                              items: bannersWidget,
                              options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                viewportFraction: 1.0,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _carouselIndex = index;
                                  });
                                },
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              )),
                          Positioned(
                            bottom: 0,
                            top: 200,
                            right: 0,
                            left: 0,
                            child: DotsIndicator(
                              dotsCount: bannersWidget.length,
                              position: _carouselIndex.toDouble(),
                              decorator: DotsDecorator(
                                size: const Size.square(9.0),
                                activeSize: const Size(18.0, 9.0),
                                color: Colors.white,
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 30, right: 30),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconMenu(
                            image: 'assets/icons/icon-donasi.png', title: 'Donasi'),
                        IconMenu(
                            image: 'assets/icons/icon-zakat.png', title: 'Zakat'),
                        IconMenu(
                            image: 'assets/icons/menu_galang_dana.png',
                            title: 'Galang Dana'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Penggalangan Dana Mendesak ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 260,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              DonationCard(title: 'Anak tukang becak ditabrak, KOMA & Kritis', image: 'assets/images/donasi 1.jpeg',
                                  amount: 'Rp 34.231.080', progress: 0.2, remainDate: '8 hari lagi'),
                              DonationCard(title: 'Anak tukang becak ditabrak, KOMA & Kritis', image: 'assets/images/donasi 2.jpeg',
                                  amount: 'Rp 34.231.080', progress: 0.2, remainDate: '8 hari lagi'),
                              DonationCard(title: 'Anak tukang becak ditabrak, KOMA & Kritis', image: 'assets/images/donasi 3.jpeg',
                                  amount: 'Rp 34.231.080', progress: 0.2, remainDate: '8 hari lagi'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Image.asset('assets/images/flashsale.png', fit: BoxFit.fitWidth,),
                  ),

                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Program Spesial Kitabisa',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 260,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              DonationCard(title: "Sedekah untuk penghapal Al-Qur'an", image: 'assets/images/program spesial1.jpeg',
                                  amount: 'Rp 34.231.080', progress: 0.2, remainDate: '8 hari lagi'),
                              DonationCard(title: 'Selamatkan satwa liar korban perdagangan', image: 'assets/images/program spesial 2.jpeg',
                                  amount: 'Rp 34.231.080', progress: 0.2, remainDate: '8 hari lagi'),
                              DonationCard(title: 'Anak tukang becak ditabrak, KOMA & Kritis', image: 'assets/images/program spesial 3.jpeg',
                                  amount: 'Rp 34.231.080', progress: 0.2, remainDate: '8 hari lagi'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            );
          }
        ),
      ),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 50,
                    width: kIsWeb ? 400 : 200,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: null,
                        ),
                        counter: SizedBox.shrink(),
                        labelStyle:
                            TextStyle(fontSize: 13, color: Colors.white),
                        hintStyle: TextStyle(fontSize: 13, color: Colors.white),
                        hintText: 'Coba cari "Tolong menolong"',
                        fillColor: Colors.lightBlueAccent[200],
                        filled: true,
                        // prefixIcon: Icon(Icons.vpn_key),
                        contentPadding:
                            EdgeInsets.fromLTRB(16.0, 0.0, 5.0, 0.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide:
                                BorderSide(color: CustomColors.primary)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide:
                                BorderSide(color: CustomColors.primary)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide:
                                BorderSide(color: CustomColors.primary)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
      body: Container(
        color: Colors.white10,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200), topRight: Radius.circular(200)),
      ),
      child: BottomNavigationBar(
        iconSize: 40,
        elevation: 0,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: CustomColors.primary),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/home_navbar_active.svg',
                color: CustomColors.primary),
            icon: SvgPicture.asset('assets/icons/home_navbar.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/plus_navbar_active.svg',
                color: CustomColors.primary),
            icon: SvgPicture.asset('assets/icons/plus_navbar.svg'),
            label: 'Galang Dana',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
                'assets/icons/donasi_navbar_active.svg',
                color: CustomColors.primary),
            icon: SvgPicture.asset('assets/icons/donasi_navbar.svg'),
            label: 'Donasi Saya',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/inbox_navbar_active.svg',
                color: CustomColors.primary),
            icon: SvgPicture.asset('assets/icons/inbox_navbar.svg'),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/account_navbar.svg',
                color: CustomColors.primary),
            icon: SvgPicture.asset('assets/icons/account_navbar.svg'),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
