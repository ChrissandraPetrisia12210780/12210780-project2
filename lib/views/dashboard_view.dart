import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:pendataanwarga/views/berita_panel.dart';
import 'package:provider/provider.dart';

class Dashboardview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final panels = [DashboardPanel(), BeritaPanel(), SizedBox()];
    return Consumer<DashboardProvider>(builder: (context, Provider, Widget) {
      return Scaffold(
          bottomNavigationBar: NavigatorBawah(),
          body: panels[Provider.indexTombol]);
    });
  }
}

class DashboardPanel extends StatelessWidget {
  const DashboardPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundDashboard(),
        InformasiPengguna(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                margin: EdgeInsets.zero,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      LabelBerita(),
                      ListBerita(),
                      SizedBox(),
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.all(10),
                        child: Wrap(
                          children: [
                            TombolMenu(
                                image: Image.asset(
                              'assets/icon1.png',
                              width: 50,
                            )),
                            TombolMenu(
                                image: Image.asset(
                              'assets/icon2.png',
                              width: 50,
                            )),
                            TombolMenu(
                                image: Image.asset(
                              'assets/icon3.png',
                              width: 50,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}

class BackgroundDashboard extends StatelessWidget {
  const BackgroundDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/background3.jpg',
      height: 230,
      fit: BoxFit.cover,
    );
  }
}

class TombolMenu extends StatelessWidget {
  final Image? image;
  const TombolMenu({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      child: Padding(
          padding: const EdgeInsets.all(18.0), child: image ?? SizedBox()),
    );
  }
}

class LabelBerita extends StatelessWidget {
  const LabelBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child:
          Align(alignment: Alignment.centerLeft, child: Text('Berita Terbaru')),
    );
  }
}

class ListBerita extends StatelessWidget {
  const ListBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/berita2.jpg',
                  height: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/berita1.jpg',
                  height: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/berita3.jpg',
                  height: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/berita4.jpg',
                  height: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorBawah extends StatelessWidget {
  const NavigatorBawah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final p = context.read<DashboardProvider>();

    return BottomNavigationBar(
      currentIndex: p.indexTombol,
      onTap: (value) {
        p.saatdiklik(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper), label: 'Berita'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear), label: 'Pengaturan')
      ],
    );
  }
}

class InformasiPengguna extends StatelessWidget {
  const InformasiPengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/jisoo.jpg',
              width: 60,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chrissandra Petrisia',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'chrissandra22@gmail.com',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/bell.png',
            width: 45,
          )
        ],
      ),
    );
  }
}
