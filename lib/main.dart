import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/layout_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/selected_page_provider.dart';

void main() => runApp(const Startup());

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScanListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'QR Scanner',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => const LayoutPage(),
          'mapa': (_) => const MapPage(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
