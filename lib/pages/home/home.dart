import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kitabisa_clone/const/colors.dart';
import 'package:kitabisa_clone/pages/home/widgets/doa_card.dart';
import 'package:kitabisa_clone/pages/home/widgets/donation_card.dart';
import 'package:kitabisa_clone/pages/home/widgets/favorite_card.dart';
import 'package:kitabisa_clone/pages/home/widgets/favorite_category_widget.dart';
import 'package:kitabisa_clone/pages/home/widgets/icon_menu.dart';
import 'package:kitabisa_clone/pages/home/widgets/pilihan_kitabisa_card.dart';
import 'package:kitabisa_clone/pages/home/widgets/section1.dart';
import 'dart:math';

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
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            margin: constraints.maxWidth > 600
                ? EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.25)
                : EdgeInsets.all(0),
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
                          image: 'assets/icons/icon-donasi.png',
                          title: 'Donasi'),
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
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
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
                            DonationCard(
                                title:
                                    'Anak tukang becak ditabrak, KOMA & Kritis',
                                image: 'assets/images/donasi 1.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                            DonationCard(
                                title:
                                    'Anak tukang becak ditabrak, KOMA & Kritis',
                                image: 'assets/images/donasi 2.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                            DonationCard(
                                title:
                                    'Anak tukang becak ditabrak, KOMA & Kritis',
                                image: 'assets/images/donasi 3.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Image.asset(
                    'assets/images/flashsale.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
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
                            DonationCard(
                                title: "Sedekah untuk penghapal Al-Qur'an",
                                image: 'assets/images/program spesial1.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                            DonationCard(
                                title:
                                    'Selamatkan satwa liar korban perdagangan',
                                image: 'assets/images/program spesial 2.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                            DonationCard(
                                title:
                                    'Anak tukang becak ditabrak, KOMA & Kritis',
                                image: 'assets/images/program spesial 3.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pilihan Kitabisa',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Text('Lihat lainnya',
                              style: TextStyle(
                                  color: CustomColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 260,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            PilihanKitaBisaCard(
                                title: "Pahala mengalir selamanya: wakaf 26",
                                image: 'assets/images/program pilihan 1.jpeg',
                                amount: 'Rp 108.231.080',
                                progress: 0.2,
                                remainDate: '8 hari lagi'),
                            PilihanKitaBisaCard(
                                title: "Jumat berkah wakaf air bersih",
                                image: 'assets/images/program pilihan 2.jpeg',
                                amount: 'Rp 34.231.080',
                                progress: 0.5,
                                remainDate: '8 hari lagi'),
                            PilihanKitaBisaCard(
                                title: "Sedekah Al-Quran untuk 200 lebih hafiz",
                                image: 'assets/images/programpilihan3.jpeg',
                                amount: 'Rp 89.231.080',
                                progress: 0.8,
                                remainDate: '8 hari lagi'),
                            PilihanKitaBisaCard(
                                title: "Sedekah Al-Quran untuk 200 lebih hafiz",
                                image: 'assets/images/programpilihan3.jpeg',
                                amount: 'Rp 89.231.080',
                                progress: 0.8,
                                remainDate: '8 hari lagi'),
                            Container(
                              width: 180,
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/arrow-right.svg',
                                      color: CustomColors.primary,
                                    ),
                                    Text(
                                      'Lihat Semua',
                                      style: TextStyle(
                                          color: CustomColors.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 20, top: 10),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Doa-doa #OrangBaik',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Text('Lihat lainnya',
                                style: TextStyle(
                                    color: CustomColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 280,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: 350,
                                child: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DoaCard(
                                      name: 'Anonim',
                                      bio: 'Tuhan yesus bantu',
                                      ago: 'semenit',
                                      pray:
                                          'Semoga tindakan medis segera bisa diambil untuk adik ini dan bisa tumbuh sehat bermain dan bahagia seperti anak sehat yang lain',
                                      aminCount: '5 menit',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 350,
                                child: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DoaCard(
                                      name: 'John Doe',
                                      bio: 'Orang Dermawan',
                                      ago: '5 jam',
                                      pray: 'Semoga bermanfaat',
                                      aminCount: '100',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 350,
                                child: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DoaCard(
                                      name: 'Jono Suparno',
                                      bio: 'Orang Dermawan',
                                      ago: '10 hari',
                                      pray: 'Semoga dimurahkan rezekinya',
                                      aminCount: '4',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 180,
                                height: 200,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/arrow-right.svg',
                                        color: CustomColors.primary,
                                      ),
                                      Text(
                                        'Lihat Semua',
                                        style: TextStyle(
                                            color: CustomColors.primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Pilih Kategori Favoritmu',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            FavoriteCategoryWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            FavoriteCard(image: 'assets/images/program_favorit1.png',
                            title: 'Infaq Yatim: Kebahagian untuk 500 anak-anak Yatim',
                              name: 'Yuk Peduli',
                              amount: 'Rp. 974.304.200',
                              dayRemain: '57',
                            ),
                            FavoriteCard(image: 'assets/images/program_favorit2.jpg',
                              title: '10.000 Qurban untuk Korban Bencana',
                              name: 'Rumah Zakat',
                              amount: 'Rp. 6.788.893.929',
                              dayRemain: '210',
                            ),
                            FavoriteCard(image: 'assets/images/program_favorit3.jpg',
                              title: 'Bantu selesaikan masjid pondok quran 2 yg tertunda',
                              name: 'Rumah Zakat',
                              amount: 'Rp. 234.843.992',
                              dayRemain: '79',
                            ),
                            Center(
                              child: Container(
                                width: 200,
                                height: 30,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  onPressed: () {},
                                  color: Color(0XFFE7F5FF),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Lihat Semua',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: CustomColors.primary,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 10,
                                              color: CustomColors.primary,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    children: [
                      Text('Ramadhan, Waktunya Cari Berkah!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                      SizedBox(height: 20,),
                      Text('Maksimal ibadah di bulan suci dengan berdonasi mulai\nRp.1000 ke galang dana yang paling dekat di hati.', style: TextStyle(
                        fontSize: 17
                      ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/icons/btn-google-play.png', width: 180, height: 100),
                          Image.asset('assets/icons/btn-app-store.png', width: 180, height: 100),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('Tentang Kitabisa | Syarat & Ketentuan | Pusat Bantuan', style: TextStyle(color: Colors.grey, fontSize: 17),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(FontAwesomeIcons.facebookF, color: Colors.black, size: 16.0),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(FontAwesomeIcons.twitter, color: Colors.black, size: 16.0),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(FontAwesomeIcons.instagram, color: Colors.black, size: 16.0),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(FontAwesomeIcons.youtube, color: Colors.black, size: 16.0),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(FontAwesomeIcons.tiktok, color: Colors.black, size: 16.0),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(FontAwesomeIcons.linkedin, color: Colors.black, size: 16.0),
                        ),
                      ],),
                      SizedBox(height: 20,),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 40,),
                      Text('Copyright © 2022 Kitabisa. All Rights Reserved', style: TextStyle(color: Colors.grey, fontSize: 16),),
                      SizedBox(height: 20,),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
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
        color: Colors.grey[200],
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
