// ignore_for_file: unused_field

import 'package:nurulhudautan/api/agenda_service.dart';
import 'package:nurulhudautan/component/bootom_bar.dart';
import 'package:nurulhudautan/model/agenda/agenda_model.dart';
import 'package:nurulhudautan/view/donation.dart';
import 'package:nurulhudautan/view/gallery.dart';
import 'package:nurulhudautan/view/keuangan.dart';
import 'package:nurulhudautan/view/page_main.dart';
import 'package:nurulhudautan/view/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int _selectedIndex = 1;
  int _currentIndex = 1;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Keuangan()),
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

  List<Agenda> _agendaList = []; // Variabel untuk menyimpan data agenda

  @override
  void initState() {
    super.initState();
    _fetchAgendaList(); // Panggil metode untuk mengambil data agenda dari API
  }

  Future<void> _fetchAgendaList() async {
    try {
      final agendaList = await ApiService.getAgendaList();
      setState(() {
        _agendaList =
            agendaList; // Perbarui variabel dengan data agenda yang diperoleh
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Agenda Kegiatan',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff52bf95),
          iconTheme: const IconThemeData(
            color: Colors.white, // Ubah warna icon menjadi hitam
          ),
          elevation: 0.5,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryPage(),
                  ),
                );
              },
              child: Icon(
                Icons.image_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: ListView.builder(
                    itemCount: _agendaList.length,
                    shrinkWrap: true, // Set shrinkWrap to true
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final template = _agendaList[index];
                      return Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        width: 249,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Templatedetail(
                                  //             templateItems: template.items,
                                  //             nama_template: template.nama,
                                  //           )),
                                  // );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 80,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                        width: 65,
                                        height: 65,
                                        child: Container(
                                          width: 40, // Lebar kotak
                                          height: 40, // Tinggi kotak
                                          decoration: BoxDecoration(
                                            color: Color(
                                                0xff52bf95), // Warna latar belakang kotak
                                            borderRadius: BorderRadius.circular(
                                                8), // Mengatur sudut melengkung pada kotak
                                          ),
                                          child: Icon(
                                            Icons
                                                .assignment_outlined, // Ikon yang ingin ditampilkan
                                            color: Colors.white, // Warna ikon
                                            size: 24, // Ukuran ikon
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // frame56z7Z (141:16)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 15, 0, 7.5),
                                        // height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // sb1230405LBR (15:37)
                                              template.judul,
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
                                              // wedmarch082023150000zmm (78:72)
                                              '${template.tglAwal} ${template.jamAwal} - ${template.jamAkhir}',
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
                                              'keterangan : ${template.keterangan}',
                                              style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1725,
                                                color: Color(0xff000000),
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
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
