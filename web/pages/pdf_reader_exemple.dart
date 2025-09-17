import 'package:rdart/rdart.dart';

class PdfReaderExemple extends Rview {
  static final String url = "pdfreader";
  final pdfCtrl = PdfController();

  @override
  Relement build() {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Demo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          gap: 16,
          children: [
            // Contrôles externes (optionnels)
            Row(
              children: [
                ElevatedButton(
                  label: Text ('Page 1'),
                  onPressed: () => pdfCtrl.setPage(1),
                ),
                ElevatedButton(
                  label: Text('Page 5'),
                  onPressed: () => pdfCtrl.setPage(5),
                ),
                ElevatedButton(
                  label: Text('Zoom 120%'),
                  onPressed: () => pdfCtrl.setZoom(120),
                ),
                OutlinedButton(
                  label: Text('−'),
                  onPressed: () => pdfCtrl.zoomOut(),
                ),
                OutlinedButton(
                  label: Text('+'),
                  onPressed: () => pdfCtrl.zoomIn(),
                ),
              ],
            ),

            // Le lecteur
            PdfReader(
              src: '/assets/castor.pdf',
              controller: pdfCtrl,
              initialPage: 1,
              initialZoom: 110,
              height: 700,
              showToolbar: true,
            ),
          ],
        ),
      ),
    );
  }
}
