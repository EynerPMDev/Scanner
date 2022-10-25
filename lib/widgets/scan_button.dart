import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanListProvider>(context);
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.camera_alt_outlined),
        onPressed: () async {
          final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF',
            'Cancelar',
            false,
            ScanMode.QR,
          );
          final newScan = scanProvider.nuevoScan(barcodeScanRes);
        });
  }
}
