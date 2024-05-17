import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:file_picker/file_picker.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  List<String> textFieldNames = ['Name', 'Phone', 'Date', 'Category'];

  Future<void> _previewPDF() async {
    final pdf = await _generatePDF();
    final pdfPath = (await getTemporaryDirectory()).path + "/bill.pdf";
    final pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(await pdf.save());
    // Display PDF preview
    if (pdfFile.existsSync()) {
      PDFDocument document = await PDFDocument.fromFile(pdfFile);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PDFViewer(document: document),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to load PDF.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<pw.Document> _generatePDF() async {
    final List<String> values = [
      _nameController.text,
      _phoneController.text,
      _dateController.text,
      _categoryController.text,
    ];

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              // Header
              pw.Container(
                alignment: pw.Alignment.center,
                margin: pw.EdgeInsets.only(bottom: 20.0),
                child: pw.Text(
                  'Bill Information',
                  style: pw.TextStyle(
                    fontSize: 20.0,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              // Body
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: List.generate(textFieldNames.length, (index) {
                  return pw.Text('${textFieldNames[index]}: ${values[index]}');
                }),
              ),
            ],
          );
        },
      ),
    );

    return pdf;
  }

  Future<void> _submit() async {
    final pdf = await _generatePDF();
    String fileName = _nameController.text.isNotEmpty ? _nameController.text : 'bill';

    // Open file picker to select the directory
    String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath != null) {
      // Save PDF to the selected directory
      final output = Directory(directoryPath);
      final file = File("${output.path}/$fileName.pdf");
      await file.writeAsBytes(await pdf.save());

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('PDF Generated'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('The bill PDF has been saved at:'),
              SizedBox(height: 8),
              Text(file.path, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Dynamically generated text fields
            Expanded(
              child: ListView.builder(
                itemCount: textFieldNames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: index == 0
                          ? _nameController
                          : index == 1
                          ? _phoneController
                          : index == 2
                          ? _dateController
                          : _categoryController,
                      decoration: InputDecoration(
                        hintText: textFieldNames[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _previewPDF, // Preview PDF
              child: Text('Preview PDF'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submit, // Generate and save PDF
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
