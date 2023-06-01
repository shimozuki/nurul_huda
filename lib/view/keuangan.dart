import 'package:appmuslim/api/pemasukan_service.dart';
import 'package:appmuslim/api/pengeluaran_service.dart';
import 'package:appmuslim/component/bootom_bar.dart';
import 'package:appmuslim/model/pemasukan/pemasukan_model.dart';
import 'package:appmuslim/model/pengeluaran/pengeluaran_model.dart';
import 'package:appmuslim/view/agenda.dart';
import 'package:appmuslim/view/donation.dart';
import 'package:appmuslim/view/page_main.dart';
import 'package:appmuslim/view/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keuangan extends StatefulWidget {
  const Keuangan({super.key});

  @override
  State<Keuangan> createState() => _KeuanganState();
}

class _KeuanganState extends State<Keuangan> {
  int _selectedIndex = 2;
  int _currentIndex = 2;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AgendaPage()),
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Donation()),
      );
    } else if (_selectedIndex == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } else if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageMain()),
      );
    }
  }

  List<PemasukanModel> pemasukanList = [];
  List<Pengeluaran> pengeluaranList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    PemasukanService pemasukanService = PemasukanService();
    PengeluaranService pengeluaranService = PengeluaranService();

    try {
      List<PemasukanModel> data = await pemasukanService.getPemasukanData();
      List<Pengeluaran> result = await pengeluaranService.getPengeluaran();
      setState(() {
        pemasukanList = data;
        pengeluaranList = result;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final myController = TextEditingController();
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              'Data Keuangan',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xff52bf95),
            automaticallyImplyLeading: false,
            titleSpacing: 15,
            toolbarHeight: 64,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Column(
                children: const [
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Color.fromARGB(148, 228, 227, 227),
                  ),
                  TabBar(
                    tabs: [
                      Tab(
                        text: 'Pemasukan',
                      ),
                      Tab(
                        text: 'Pengeluaran',
                      ),
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorWeight: 2,
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              pemasukanList.isEmpty
                  ? Center(
                      child: Text('On Process'),
                    )
                  : ListView.builder(
                      itemCount: pemasukanList.length,
                      itemBuilder: (context, index) {
                        final order = pemasukanList[index];
                        return Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: 249,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => Orderdetail(
                                    //           noOrderan: order.noOrder)),
                                    // );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          width: 64,
                                          height: 64,
                                          child: Image.asset(
                                            'assets/masuk.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          // frame56z7Z (141:16)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // sb1230405LBR (15:37)
                                                order.nama,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.1725,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                // itemsfUb (15:39)
                                                '${order.tglPemasukan}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.1725,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                // wedmarch082023150000zmm (78:72)
                                                'Rp. +${order.totalBayar}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.1725,
                                                  color: Color(0xff52bf95),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
              // konten tab kedua
              pengeluaranList.isEmpty
                  ? Center(
                      child: Text('Belum Ada Pengeluaran'),
                    )
                  : ListView.builder(
                      itemCount: pengeluaranList.length,
                      itemBuilder: (context, index) {
                        final pengeluaran = pengeluaranList[index];
                        return Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: 249,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => Orderdetail(
                                    //           noOrderan: order.noOrder)),
                                    // );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          width: 64,
                                          height: 64,
                                          child: Image.asset(
                                            'assets/upload.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          // frame56z7Z (141:16)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // sb1230405LBR (15:37)
                                                pengeluaran.keterangan,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.1725,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                // itemsfUb (15:39)
                                                '${pengeluaran.tglPengeluaran}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.1725,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                // wedmarch082023150000zmm (78:72)
                                                'Rp. -${pengeluaran.nominal}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.1725,
                                                  color: Color.fromARGB(
                                                      255, 189, 91, 91),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: _selectedIndex,
            onTabTapped: _onTabTapped,
          ),
        ),
      ),
    );
  }
}
