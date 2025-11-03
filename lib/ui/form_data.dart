import 'package:flutter/material.dart';
import 'package:testing/ui/tampil_data.dart';

class FormTampilan extends StatefulWidget {
  const FormTampilan({Key? key}) : super(key: key);

  @override
  State<FormTampilan> createState() => _FormTampilanState();
}

class _FormTampilanState extends State<FormTampilan> {
  // 3. Buat TextEditingController untuk setiap field
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  // 4. Jangan lupa dispose controller untuk menghindari kebocoran memori
  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  // Fungsi yang akan dipanggil saat tombol Simpan ditekan
  void _simpanData() {
    // Ambil data dari controller
    final String nama = _namaController.text;
    final String nim = _nimController.text;
    final String tahunLahir = _tahunLahirController.text;

    // Data ini (nama, nim, tahunLahir) sekarang tersimpan di dalam state ini
    // dan siap dikirim ke halaman selanjutnya.

    // 5. Navigasi ke TampilDataPage dan kirim datanya
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TampilDataPage(nama: nama, nim: nim, tahunLahir: tahunLahir),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulir Data Diri')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 6. Hubungkan controller ke TextField
            TextField(
              controller: _namaController, // Hubungkan di sini
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukkan nama lengkap Anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nimController, // Hubungkan di sini
              decoration: InputDecoration(
                labelText: 'NIM',
                hintText: 'Masukkan NIM Anda',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _tahunLahirController, // Hubungkan di sini
              decoration: InputDecoration(
                labelText: 'Tahun Lahir',
                hintText: 'Contoh: 2001',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24.0), // Beri jarak lebih
            // 7. Tambahkan tombol Simpan
            ElevatedButton(
              onPressed: _simpanData, // Panggil fungsi _simpanData
              child: const Text('Simpan'),
              // Membuat tombol jadi lebar
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
