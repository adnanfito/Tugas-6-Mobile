import 'package:flutter/material.dart';

class TampilDataPage extends StatelessWidget {
  // Variabel ini masih sama, menerima data dari form
  final String nama;
  final String nim;
  final String tahunLahir; // Tetap diterima sebagai String

  const TampilDataPage({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  // --- FUNGSI BARU UNTUK MENGHITUNG UMUR ---
  String _hitungUmur() {
    // 1. Dapatkan tahun sekarang secara dinamis
    int tahunSekarang = DateTime.now().year;

    // 2. Konversi 'tahunLahir' (String) menjadi angka (int)
    //    Kita pakai tryParse untuk keamanan jika inputnya kosong atau bukan angka
    int? tahunLahirInt = int.tryParse(tahunLahir);

    // 3. Cek apakah konversi berhasil
    if (tahunLahirInt != null) {
      // 4. Jika berhasil, hitung umurnya
      int umur = tahunSekarang - tahunLahirInt;
      return "$umur tahun"; // Mengembalikan hasil, misal: "24 tahun"
    } else {
      // 5. Jika gagal (misal user input "abc"), tampilkan pesan ini
      return "Tahun lahir tidak valid";
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- Panggil fungsi kalkulasi di dalam build method ---
    String umur = _hitungUmur();

    return Scaffold(
      appBar: AppBar(title: const Text('Data yang Disimpan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $nama', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('NIM: $nim', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),

            // --- PERUBAHAN UTAMA DI SINI ---
            // Kita tidak lagi menampilkan 'tahunLahir' secara langsung,
            // tapi menampilkan hasil dari variabel 'umur'
            Text('Umur: $umur', style: const TextStyle(fontSize: 20)),

            // (Opsional) Kamu bisa tetap tampilkan tahun lahir
            // untuk konfirmasi jika mau:
            // Text(
            //   '(Tahun Lahir: $tahunLahir)',
            //   style: const TextStyle(fontSize: 16, color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }
}
