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
- Tautan Log / Sesi percakapan: [Sesi Percakapan Gemini](https://share.gemini.google/4IyTTNW2Asf5)
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

### Tugas 8
## Pertanyaan Reflektif
1. **Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**
- Navigator.push() digunakan untuk membuka halaman baru tanpa menghapus halaman sebelumnya dari navigation stack. Jadi, pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol Back.
- Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang dibuka dengan halaman baru. Halaman sebelumnya tidak lagi berada di posisi aktif dalam navigation stack.
- Navigator.pop() digunakan untuk menutup halaman yang sedang dibuka dan kembali ke halaman sebelumnya.

Pada aplikasi ini, kartu aksi Add Experience dan Add Project menggunakan Navigator.push() untuk membuka halaman formulir. Dengan begitu, pengguna bisa kembali ke halaman utama setelah selesai mengisi formulir atau menekan tombol Back.

Sementara itu, pada LeftDrawer, opsi Home menggunakan Navigator.pushReplacement() untuk membuka kembali MyHomePage. Dengan cara ini, halaman yang sedang dibuka langsung digantikan oleh halaman utama sehingga pengguna bisa kembali ke halaman Home dari halaman lain.

2. **Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**
Scaffold digunakan sebagai kerangka utama setiap halaman. Di dalamnya terdapat AppBar sebagai bagian atas halaman, Drawer sebagai menu navigasi, dan body sebagai tempat menampilkan konten utama.

Penggunaan struktur yang sama pada MyHomePage, ProjectFormPage, dan ExperienceFormPage membuat tampilan aplikasi lebih konsisten. Pengguna juga tidak perlu mempelajari ulang letak menu navigasi setiap kali berpindah halaman.

Contohnya, warna utama portofolio diambil menggunakan Theme.of(context).colorScheme.primary. Warna ini digunakan sebagai warna latar AppBar di beberapa halaman dan juga sebagai warna utama tombol Save. Dengan begitu, tampilan setiap halaman tetap memiliki identitas warna yang sama.

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**
Formulir menggunakan Column karena susunan input lebih mudah dibaca jika ditampilkan secara vertikal, dari satu field ke field berikutnya. Khusus untuk pemilihan tanggal mulai dan selesai, digunakan Row agar kedua input bisa ditampilkan berdampingan.

Widget SizedBox dan Padding digunakan untuk memberikan jarak antarfield maupun antara field dan tombol. Tujuannya supaya formulir tidak terlihat terlalu padat dan setiap bagian lebih mudah dibedakan.

Selain itu, digunakan SingleChildScrollView agar seluruh isi formulir tetap bisa diakses dengan cara menggulir layar. Hal ini penting terutama ketika aplikasi dibuka di layar yang kecil atau ketika keyboard muncul saat pengguna sedang mengisi formulir. Dengan begitu, field maupun tombol Save tetap bisa dijangkau.

4. **Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**
- GlobalKey<FormState> digunakan untuk mengakses kondisi atau state dari widget Form. Melalui key ini, aplikasi bisa menjalankan proses validasi seluruh input ketika tombol Save ditekan.
- validator berisi aturan untuk memeriksa apakah nilai yang dimasukkan pengguna sudah sesuai dengan ketentuan. Sementara itu, validate() digunakan untuk menjalankan seluruh validator pada field yang ada di dalam formulir.

Contohnya, jika pengguna mengisi bagian Role / Position hanya dengan spasi seperti "   ", input tersebut akan ditolak karena dianggap belum mengisi data yang valid. Contoh lainnya adalah deskripsi yang kurang dari 10 karakter atau tanggal selesai yang lebih awal daripada tanggal mulai.

Pemilihan jenis input dan keyboard saja belum cukup untuk memastikan data yang dimasukkan benar. Misalnya, penggunaan keyboard teks hanya memudahkan pengguna dalam mengetik, tetapi tidak bisa memastikan bahwa input tidak kosong atau hanya berisi spasi. Begitu juga dengan pemilihan tanggal, yang belum tentu mencegah pengguna memilih tanggal selesai sebelum tanggal mulai. Oleh karena itu, tetap diperlukan validasi untuk memastikan data yang disimpan sudah memenuhi ketentuan.

## AI Disclosure
- Tool yang Digunakan: Google Gemini
- Tautan Log / Sesi percakapan: [Sesi Percakapan Gemini]()
- Strategi Prompting:
- Bagian yang Dibantu AI: