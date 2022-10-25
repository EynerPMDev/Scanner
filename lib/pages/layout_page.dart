import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/addresses_page.dart';
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/providers/selected_page_provider.dart';
import 'package:qr_scanner/widgets/custom_navigation_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [IconButton(icon: const Icon(Icons.delete), onPressed: () {})],
      ),
      body: _LayoutSelectedPage(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _LayoutSelectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedPageProvider = Provider.of<SelectedPageProvider>(context);
    final currentIndex = selectedPageProvider.selectedPageIndex;

    switch (currentIndex) {
      case 0:
        return const MapsPage();

      case 1:
        return const AddressesPage();

      default:
        return const MapsPage();
    }
  }
}
