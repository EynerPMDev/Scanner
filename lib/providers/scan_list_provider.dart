import 'package:flutter/material.dart';
import 'package:qr_scanner/database/db_scanner.dart';
import 'package:qr_scanner/model/scanner_model.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScannerModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScannerModel> nuevoScan(String valor) async {
    final nuevoScan = ScannerModel(valor: valor);
    final id = await DbScanner.db.nuevoScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DbScanner.db.getTodosLosScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DbScanner.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DbScanner.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DbScanner.db.deleteScan(id);
    scans.removeWhere((element) => element.id == id);
  }
}
