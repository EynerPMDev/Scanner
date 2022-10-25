import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/model/scanner_model.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanListProvider>(context);
    scanProvider.cargarScanPorTipo("other");
    List<ScannerModel> scaneos = scanProvider.scans;
    if (scanProvider.scans.isEmpty) {
      return const Center(child: Text('No hay scaneos de tipo: OTROS'));
    } else {
      String separator = ":  ";
      return ListView.builder(
          itemCount: scaneos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title:
                  Text('${scaneos[index].id}$separator${scaneos[index].valor}'),
            );
          });
    }
  }
}
