import 'package:nurulhudautan/component/bootom_bar.dart';
import 'package:nurulhudautan/view/agenda.dart';
import 'package:nurulhudautan/view/donation.dart';
import 'package:nurulhudautan/view/keuangan.dart';
import 'package:nurulhudautan/view/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nurulhudautan/base/assets.dart';
import 'package:nurulhudautan/base/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurulhudautan/base/routing.dart';
import 'package:nurulhudautan/base/send.dart';
import 'package:nurulhudautan/controller/main.dart';
import 'package:nurulhudautan/model/quran/surat.dart';

class PageMain extends StatefulWidget {
  const PageMain({super.key});

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  ControllerMain controller = Get.put(ControllerMain());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  // ignore: unused_field
  int _currentIndex = 0;
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
    } else if (_selectedIndex == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Material(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 380,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(0.862, 0.834),
                                          end: Alignment(-4.089, -5.416),
                                          colors: <Color>[
                                            Color(0xff41966f),
                                            Color(0x0041966f)
                                          ],
                                          stops: <double>[0, 1],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 48,
                                child: Align(
                                  child: SizedBox(
                                    width: 317,
                                    height: 160,
                                    child: Image.asset(
                                      'assets/masjid.png',
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle218R (2:4)
                                left: 1,
                                top: 104,
                                child: Align(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 280,
                                    child: Container(
                                      // height: Get.width / 2,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0, 4),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(
                                                  Icons.place,
                                                  color: Color(0xfff5ac1c),
                                                  size: 14,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  controller.city.value,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff626262),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                DateFormat("dd MMM yyyy")
                                                    .format(DateTime.now()),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff626262),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20, bottom: 12),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    controller.timeTo.value,
                                                    style: TextStyle(
                                                      fontSize: 32,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff626262),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Menuju ${controller.subTime.value}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff626262),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 12),
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xff52bf95),
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: BaseConst.shalatInt()
                                                  .map(
                                                    (index) => _itemShalat(
                                                      shalat: BaseConst
                                                          .shalat[index],
                                                      waktu: controller
                                                              .shalat.isNotEmpty
                                                          ? controller
                                                              .shalat[index]
                                                          : "-",
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 12),
                                            height: 40,
                                            width: double.infinity,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xff52bf95),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () => Get.toNamed(
                                                PageTo.shalat,
                                                parameters: {
                                                  DataSend.kota_id:
                                                      controller.kotaId,
                                                  DataSend.kota_name:
                                                      controller.city.value,
                                                },
                                              ),
                                              child: Text(
                                                "Lihat Semua",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // assalamualaikumHVF (2:6)
                                left: 13,
                                top: 57,
                                child: Align(
                                  child: SizedBox(
                                    width: 147,
                                    height: 22,
                                    child: Text(
                                      'Masjid Raya',
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // ahmadmaulanay7B (2:7)
                                left: 13,
                                top: 83,
                                child: Align(
                                  child: SizedBox(
                                    width: 290,
                                    height: 30,
                                    child: Text(
                                      'Nurul Huda Utan',
                                      style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => _itemSurat(
                    data: controller.data,
                    index: index,
                  ),
                  childCount: controller.data.length,
                ),
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

  Widget _itemShalat({
    required var shalat,
    required var waktu,
  }) {
    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                shalat,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff626262),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              waktu,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff626262),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemSurat({
    required List<ModelSurat> data,
    required var index,
  }) {
    double sizeNumbering = 40;
    return GestureDetector(
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          color: (index % 2 == 1) ? Colors.grey.shade50 : Colors.white,
          child: Row(
            children: [
              Container(
                width: sizeNumbering,
                height: sizeNumbering,
                margin: EdgeInsets.only(right: 12),
                child: Stack(
                  children: [
                    Container(
                      width: sizeNumbering,
                      height: sizeNumbering,
                      child: Image.asset(
                        BaseImage.numbering,
                        color: Color(0xff52bf95),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff52bf95),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 2),
                        child: Text(
                          data[index].sName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "${data[index].sJenis} | ${data[index].sJumlah} Ayat",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff52bf95),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 32,
                child: Image.asset(
                  BaseImage.surat(nomor: index + 1),
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Get.toNamed(
        PageTo.ayat,
        parameters: {
          DataSend.surat_id: data[index].sId.toString(),
          DataSend.surat_name: data[index].sName,
          DataSend.surat_trans: data[index].sArti,
          DataSend.surat_jumlah: data[index].sJumlah.toString(),
          DataSend.surat_jenis: data[index].sJenis,
        },
      ),
    );
  }
}
