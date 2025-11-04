Tentu, ini adalah penjelasan alur *passing state/data* yang bisa kamu salin langsung ke file `README.md`.

-----

## Alur Passing Data (State) dari Form ke Halaman Tampil Data

Proses pengiriman data dari `form_data.dart` ke `tampil_data.dart` menggunakan metode *Constructor Parameter Passing* yang dipicu oleh `Navigator.push`.

Berikut adalah alur langkah demi langkahnya:

### 1\. Persiapan di `form_data.dart`

Halaman form (`form_data.dart`) diubah menjadi **`StatefulWidget`** agar dapat "mengingat" data yang diinput oleh pengguna. Data dari setiap `TextField` ditampung di dalam variabel **`TextEditingController`**.

```dart
// file: form_data.dart

// 1. Controller untuk menampung teks
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _tahunLahirController = TextEditingController();

// 2. TextField dihubungkan ke controller
TextField(
  controller: _namaController,
  decoration: InputDecoration(labelText: 'Nama'),
),
// ... (TextField untuk NIM dan Tahun Lahir)
```

### 2\. Pengiriman Data Saat Tombol Ditekan

Ketika tombol "Simpan" (`ElevatedButton`) ditekan, fungsi `_simpanData` akan dieksekusi.

1.  Fungsi ini mengambil nilai teks mentah (String) dari setiap `TextEditingController` menggunakan properti `.text`.
2.  Data tersebut kemudian "dilemparkan" ke halaman `TampilDataPage` dengan memasukkannya sebagai parameter ke dalam *constructor* `TampilDataPage`.
3.  **`Navigator.push`** digunakan untuk berpindah halaman sekaligus membawa data tersebut.

<!-- end list -->

```dart
// file: form_data.dart

void _simpanData() {
  // 1. Ambil data dari controller
  final String nama = _namaController.text;
  final String nim = _nimController.text;
  final String tahunLahir = _tahunLahirController.text;

  // 2. Panggil Navigator.push dan kirim data via constructor
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TampilDataPage( // Data dimasukkan di sini
        nama: nama,
        nim: nim,
        tahunLahir: tahunLahir,
      ),
    ),
  );
}
```

### 3\. Penerimaan Data di `tampil_data.dart`

Halaman `tampil_data.dart` adalah **`StatelessWidget`** yang tidak perlu mengelola *state*, hanya menerima dan menampilkan data.

1.  Widget ini mendeklarasikan variabel `final` untuk setiap data yang akan diterimanya.
2.  Sebuah **constructor** dibuat dengan parameter `required` yang sesuai. Constructor inilah yang "menangkap" data yang dikirim oleh `Navigator.push` dari langkah sebelumnya.

<!-- end list -->

```dart
// file: tampil_data.dart

class TampilDataPage extends StatelessWidget {
  // 1. Deklarasi properti untuk menampung data
  final String nama;
  final String nim;
  final String tahunLahir;

  // 2. Constructor untuk "menangkap" data yang dikirim
  const TampilDataPage({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  // ... (sisa kode)
}
```

### 4\. Penggunaan Data di Halaman Tampil Data

Setelah data diterima dan disimpan di dalam properti `final` (seperti `this.nama`), data tersebut siap digunakan di dalam method `build` untuk ditampilkan ke pengguna.

Dalam kasus ini, data `tahunLahir` diolah terlebih dahulu oleh fungsi `_hitungUmur()` (yang juga menggunakan properti `this.tahunLahir`) sebelum akhirnya semua data ditampilkan oleh `Widget Text`.

```dart
// file: tampil_data.dart

@override
Widget build(BuildContext context) {
  // Data 'tahunLahir' diolah terlebih dahulu
  String umur = _hitungUmur(); 

  return Scaffold(
    appBar: AppBar(title: const Text('Data yang Disimpan')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 4. Data dari constructor langsung dipakai di sini
          Text('Nama: $nama', style: const TextStyle(fontSize: 20)),
          Text('NIM: $nim', style: const TextStyle(fontSize: 20)),
          Text('Umur: $umur', style: const TextStyle(fontSize: 20)),
        ],
      ),
    ),
  );
}
```

## Screenshot Aplikasi

<img width="625" height="881" alt="image" src="https://github.com/user-attachments/assets/228d67cd-9e9d-4675-b62c-b1bf84811fd8" />

<img width="628" height="878" alt="image" src="https://github.com/user-attachments/assets/290d47ce-bdd0-4b44-899a-6a64e9f77efd" />


