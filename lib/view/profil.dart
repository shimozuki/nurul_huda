import 'package:appmuslim/component/bootom_bar.dart';
import 'package:appmuslim/view/agenda.dart';
import 'package:appmuslim/view/donation.dart';
import 'package:appmuslim/view/keuangan.dart';
import 'package:appmuslim/view/page_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;
  int _selectedIndex = 4;
  // ignore: unused_field
  int _currentIndex = 4;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AgendaPage()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Keuangan()),
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Donation()),
      );
    } else if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageMain()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/nurul_huda_mosque.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(children: []),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Card(
                      margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                      child: Container(
                        width: 310.0,
                        height: 290.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Information",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Divider(
                                color: Colors.grey[300],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.phone_android_outlined,
                                    color: Colors.green,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "+62 8234-0566-987",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Phone Number",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.facebook,
                                    color: Colors.blueAccent[400],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nurul Huda desa stowe brang",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Facebook",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.inbox_outlined,
                                    color: Colors.pinkAccent[400],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nurulhudastober",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Instagram",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.credit_card_outlined,
                                    color: Colors.yellow[500],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "0093-01-042775-50-1",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Bank Mandiri",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 20.0,
            right: 20.0,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Pengurus',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "16",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                    Container(
                      child: Column(children: [
                        Text(
                          'Imam',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '19',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Ustat',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '19',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
