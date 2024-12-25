import 'package:flutter/material.dart';
import 'package:ocotomiro/models/inventory_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DetailController {
  final InventoryDocument document;

  const DetailController({Key? key, required this.document}) ;
  Future<void> generatePdf(BuildContext context) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
           // Replace with your screen content
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text('Document ID:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.id}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Date:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.date.toLocal().toString().split(' ')[0]}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Placement:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.placement}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Organization:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.organization}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Item Info:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 40)),
              pw.Text('Item Name', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.line.itemName}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Item Code:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.line.itemCode}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Quantity:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.line.quantity}',style: pw.TextStyle(fontSize: 20)),
              pw.Text('Made by:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 30)),
              pw.Text('${document.madeBy}',style: pw.TextStyle(fontSize: 20)),
            ],
          )
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
}