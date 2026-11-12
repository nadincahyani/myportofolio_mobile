Nama : Nadin Putri Cahyani
NPM : 2506623332
Kelas : PBP E

### Tugas 7
## Pertanyaan Reflektif 
1. **Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!**
   - Widget tree adalah struktur hirarki hierarkis di mana antarmuka aplikasi Flutter dibangun dari kumpulan widget yang saling bersarang (nested). Hubungan parent-child bekerja dengan cara widget induk (parent) mengatur tata letak, ukuran, atau batasan (constraints) bagi widget anak (child), sementara widget anak merender elemen visual atau fungsionalitas spesifik yang ada di dalamnya.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**
   - `MaterialApp`: Widget utama yang membungkus aplikasi dan menyediakan konfigurasi dasar seperti tema, judul, dan rute navigasi.
   - `Scaffold`: Menyediakan kerangka visual tata letak standar Material Design (seperti `appBar` dan `body`).
   - `AppBar`: Menampilkan bilah navigasi di bagian atas layar.
   - `SingleChildScrollView`: Memungkinkan konten di dalam body dapat digulir (scroll) untuk mencegah terjadinya overflow layar.
   - `Padding`: Memberikan jarak ruang kosong (padding) di sekeliling widget anaknya.
   - `Column`: Menyusun widget anak secara vertikal (ke bawah).
   - `Row`: Menyusun widget anak secara horizontal (mendatar).
   - `Card`: Wadah dengan efek bayangan (elevasi) untuk membungkus kartu informasi.
   - `Text`: Menampilkan teks di layar.
   - `SizedBox`: Memberikan kotak dengan ukuran tinggi atau lebar tertentu untuk memberi jarak antar widget.
   - `Center`: Memposisikan widget anaknya agar berada di tengah-tengah ruang yang tersedia.
   - `GridView.count`: Menyusun daftar widget dalam bentuk grid atau kisi dengan jumlah kolom tertentu.
   - `Material`: Menyediakan efek visual material design (seperti warna latar dan sudut melengkung).
   - `InkWell`: Menambahkan efek animasi sentuhan interaktif (ripple effect) saat sebuah widget ditekan.
   - `Container`: Kotak serbaguna untuk mengatur ukuran, dekorasi, dan padding komponen.
   - `Icon`: Menampilkan ikon grafis vektor bawaan.

3. **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**
   - `MaterialApp` berfungsi sebagai fondasi utama aplikasi yang mengatur konfigurasi global seperti pustaka desain Material, manajemen rute (navigation routes), tema warna (`ThemeData`), judul aplikasi, dan pelokalan. Widget ini digunakan sebagai root widget karena menyatukan seluruh komponen material design yang dibutuhkan aplikasi agar dapat berjalan secara konsisten di berbagai platform.

4. **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?**
   - `StatelessWidget` adalah widget yang bersifat statis (tidak memiliki state yang dapat berubah setelah dirender; tampilannya murni bergantung pada konfigurasi awal). Sebaliknya, `StatefulWidget` dapat melacak dan memutasi perubahan state secara dinamis menggunakan fungsi `setState()`, sehingga antarmuka dapat diperbarui ulang (re-rendered) ketika data berubah. Kita memilih `StatelessWidget` untuk komponen tampilan tetap, dan `StatefulWidget` untuk komponen yang memerlukan interaktivitas dinamis (seperti form input, tombol counter, atau pengambilan data asinkron).

5. **Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?**
   - `BuildContext` adalah objek yang mereferensikan lokasi suatu widget di dalam widget tree. `BuildContext` sangat penting karena memungkinkan widget untuk mengetahui posisinya dan mengakses data warisan dari widget induknya (seperti tema aplikasi lewat `Theme.of(context)` atau navigasi lewat `Navigator.of(context)`). Di dalam metode `build`, context diteruskan sebagai parameter untuk membangun elemen turunan yang bergantung pada konfigurasi hierarki di atasnya.

6. **Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?**
   - Hot reload memasukkan file kode yang telah diubah ke dalam Dart Virtual Machine yang sedang berjalan tanpa mereset status aplikasi (variabel state tetap utuh), sehingga proses pembaruan UI menjadi sangat cepat. Hot restart, di sisi lain, memuat ulang seluruh aplikasi dari awal dan mereset status state ke kondisi nol. Kita tidak bisa mengandalkan hot reload dan harus melakukan hot restart atau full restart ketika terjadi perubahan pada struktur global (seperti inisialisasi variabel di dalam fungsi `main()`, perubahan pada kelas state, penambahan aset baru, atau modifikasi pada konfigurasi native platform).

## AI Disclosure
- Tool yang Digunakan: Google Gemini
- Tautan Log / Sesi percakapan: [Sesi Percakapan Gemini]( )
- Strategi Prompting:
  1. Mengonsultasikan panduan instalasi Dart SDK di Windows melalui beberapa pilihan metode (winget, Chocolatey, atau manual ZIP) serta menentukan opsi paling praktis.
  2. Meminta verifikasi terkait penempatan direktori proyek Flutter di folder lokal profil pengguna serta penanganan peringatan path ganda antara Dart bawaan Flutter dan winget.
  3. Meminta solusi terhadap pesan error Hypervisor driver saat instalasi Android Studio dan langkah pengecekan diagnostik menggunakan `flutter doctor`.
  4. Mendiskusikan struktur impor file antara `main.dart` dan `menu.dart` serta melakukan pembersihan cache terminal dan *reload window* pada VS Code.

- Bagian yang Dibantu AI:
  1. Penjelasan rekomendasi pemilihan instalasi Dart menggunakan `winget` agar lebih praktis bagi pengguna Windows.
  2. Panduan langkah demi langkah untuk memindahkan jalur `flutter\bin` ke posisi teratas pada Environment Variables (PATH) Windows serta cara menyegarkan cache PowerShell.
  3. Solusi penanganan error komponen Android Emulator Hypervisor Driver serta cara mengabaikan peringatan komponen Visual Studio yang tidak wajib untuk pengembangan Android/Web.
  4. Penjelasan alur ketergantungan berkas (entry point) di Flutter di mana `main.dart` mengimpor `menu.dart` untuk merender halaman utama aplikasi.

- Keterbatasan AI & Perbaikan Mandiri:
  1. AI memberikan panduan teoritis dan langkah-langkah administratif sistem operasi, namun eksekusi langsung perubahan Environment Variables, restart terminal, dan verifikasi perangkat menggunakan `flutter devices` dilakukan secara mandiri di komputer lokal.
  2. Pengujian perintah `flutter run -d chrome` serta pengecekan visual aplikasi di peramban Google Chrome dijalankan dan diverifikasi secara langsung oleh pengguna.