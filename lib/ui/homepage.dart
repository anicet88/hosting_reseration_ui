// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            const SearchSection(),
            HotelSection(),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_rounded),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: d_green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 20),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Text(
        'Hotel Booking',
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_outline_rounded,
              color: Colors.grey, size: 20),
          onPressed: () {},
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.place, color: Colors.grey, size: 20))
      ],
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HotelSection()),
                    );
                  },
                  child:
                      const Icon(Icons.search, color: Colors.white, size: 26),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    primary: d_green,
                    shape: const CircleBorder(),
                    shadowColor: Colors.white,
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose date',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '12 Dec - 22 Dec',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ])),
            Container(
                margin: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of rooms',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1 Room - 2 Adults',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ]))
          ],
        )
      ]),
    );
  }
}

class HotelSection extends StatelessWidget {
  HotelSection({super.key});
  // define a list of hotels with their details
  final List<Map> hotels = [
    {
      'name': 'Rifoum Hotel',
      'address': 'Foumban, Cameroon',
      'price': 100,
      'image': 'images/hotel_1.png',
    },
    {
      'name': 'Hotel Baba',
      'address': 'Bafoussam',
      'price': 200,
      'image': 'images/hotel_2.png',
    },
    {
      'name': 'Hotel Manguier',
      'address': 'Douala',
      'price': 300,
      'image': 'images/hotel_3.png',
    },
    {
      'name': 'Hotel la vallée',
      'address': 'Yaoundé',
      'price': 400,
      'image': 'images/hotel_4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    //return a Container with a list of hotels in a column of cards
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hotels',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Sort by',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_drop_down,
                        color: Colors.grey[600], size: 20)
                  ],
                )
              ],
            ),
          ),
          Column(
            children: hotels.map((hotel) => HotelCard(hotel)).toList(),
          )
        ]));
  }
}

class HotelCard extends StatelessWidget {
  final Map hotel;
  const HotelCard(this.hotel);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(hotel['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel['name'],
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            hotel['address'],
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${hotel['price']}',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[700]),
                              Icon(Icons.star, color: Colors.yellow[700]),
                              Icon(Icons.star, color: Colors.yellow[700]),
                              Icon(Icons.star, color: Colors.yellow[700]),
                              Icon(Icons.star, color: Colors.grey[400]),
                              SizedBox(width: 5),
                              Text(
                                '4.5',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.grey[600], size: 16),
                              SizedBox(width: 5),
                              Text(
                                '1.2 km to city',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])))
          ],
        ));
  }
}
