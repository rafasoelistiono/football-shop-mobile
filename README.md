# Tugas 7

### 1. Apa itu Widget Tree pada Flutter dan Hubungan Parent-Child?

Seluruh elemen yang tampil di layar disebut dengan **widget**. Struktur dari beberapa widget disebut **Widget Tree**, yaitu representasi dari struktur semua widget yang membentuk UI aplikasi. Hubungan antarwidget dapat diibaratkan seperti pohon keluarga, di mana terdapat satu widget utama sebagai root di bagian paling atas, kemudian setiap widget bisa memiliki widget lain di dalamnya. Widget yang berada di luar disebut **parent**, sementara yang di dalam disebut **child**. Hubungan tersebut membentuk hierarki yang memungkinkan mengatur bagaimana tampilan dan perilaku antarwidget saling berhubungan. Sebagai contoh, widget `Column` yang berperan sebagai parent untuk mengatur beberapa widget `Text` di dalamnya secara vertikal. 

---

### 2. Widget yang Digunakan dalam Proyek Ini (Tugas 7)

 Beberapa widget yang digunakan antara lain ; **MaterialApp** berfungsi sebagai widget utama yang membungkus seluruh aplikasi dan menyediakan elemen-elemen Material Design seperti tema dan navigasi. **StatelessWidget** digunakan untuk membuat widget yang tampilannya tidak berubah secara dinamis, seperti `MyHomePage`, `InfoCard`, dan `ItemCard`. **Scaffold** memberikan struktur dasar halaman seperti `AppBar` dan `body`. **AppBar** menampilkan navbar yang berisi judul atau tombol aksi, sedangkan **Text** digunakan untuk menampilkan tulisan. **Card** menampilkan informasi dalam bentuk kotak, sementara **Container** digunakan untuk pengaturan tata letak seperti padding, margin, dan warna latar. **MediaQuery** membantu mendapatkan informasi ukuran layar perangkat, dan **Column** mengatur anak-anaknya secara vertikal. **SizedBox** memberikan jarak antarwidget, **Material** memberikan visual Material Design, dan **InkWell** berfungsi sebagai elemen yang merespons sentuhan dengan efek. **ScaffoldMessenger** digunakan untuk menampilkan widget sementara seperti **SnackBar**, yang menampilkan notifikasi singkat di bagian bawah layar. Selain itu, **Icon**, **Padding**, dan **Center** masing-masing digunakan untuk menampilkan ikon, memberikan space, dan menempatkan elemen di tengah layar.

---

### 3. Apa Fungsi Widget MaterialApp dan Mengapa Sering Digunakan sebagai Root?

**MaterialApp** merupakan widget inti dalam Flutter yang menyediakan fondasi bagi aplikasi berbasis **Material Design**. Fungsi utamanya adalah menyediakan tema (theming), sistem navigasi (routing), dan dukungan lokalisasi (localization). Dengan **MaterialApp**, pengembang dapat menentukan gaya visual seperti warna, font, serta pengaturan tombol yang secara otomatis berlaku ke seluruh widget di bawahnya. Selain itu, **MaterialApp** juga mengelola perpindahan halaman melalui sistem rute (routes) dan mendukung berbagai bahasa dan format lokal. Karena menyediakan konteks dan fungsionalitas penting ini, **MaterialApp** hampir selalu digunakan sebagai *root widget* dari sebuah aplikasi Flutter. Ia menjadi pondasi utama yang memungkinkan widget lain di dalamnya berfungsi dengan benar.

---

### 4. Perbedaan Antara StatelessWidget dan StatefulWidget

Perbedaan utama antara **StatelessWidget** dan **StatefulWidget** adalah pada kemampuan dalam mengelola **state** atau data yang dapat berubah seiring waktu. **StatelessWidget** bersifat statis dan tidak memiliki state ; tampilannya murni bergantung pada data yang diterima dari luar. Widget jenis ini cocok digunakan untuk elemen UI yang tidak berubah atau statis, seperti teks atau ikon. Sebaliknya, **StatefulWidget** bersifat dinamis karena memiliki objek `State` yang dapat berubah selama run. Ketika data diubah menggunakan metode `setState()`, Flutter akan merebuild tampilan widget tersebut agar menampilkan perubahan terbaru. Widget jenis ini digunakan untuk bagian UI yang bersifat interaktif atau berubah secara real-time.

---

### 5. Apa itu BuildContext dan Mengapa Penting?

**BuildContext** adalah sebuah objek yang merepresentasikan lokasi suatu widget di dalam **Widget Tree**. Setiap widget memiliki konteksnya sendiri, yang berfungsi sebagai "alamat" atau identitas posisi widget dalam struktur aplikasi. Melalui `BuildContext`, sebuah widget dapat mengetahui posisinya serta mengakses data atau layanan dari widget lain yang menjadi parentnya. Misalnya, `Theme.of(context)` digunakan untuk mendapatkan tema dari aplikasi, `MediaQuery.of(context)` digunakan untuk mengetahui ukuran layar perangkat, dan `ScaffoldMessenger.of(context)` digunakan untuk menampilkan `SnackBar`. Tanpa `BuildContext`, sebuah widget tidak dapat berinteraksi dengan elemen-elemen lain dalam hierarki aplikasi. Karena itu, `BuildContext` menjadi elemen penting dalam proses membangun dan mengelola tampilan di Flutter.

---

### 6. Konsep "Hot Reload" vs. "Hot Restart"

**Hot Reload** dan **Hot Restart** merupakan konsep yang melihat perubahan kode secara instan tanpa harus memulai ulang aplikasi sepenuhnya. **Hot Reload** bekerja dengan men-inject perubahan kode ke dalam **Dart Virtual Machine** yang sedang berjalan dan membangun ulang bagian *widget tree* yang terpengaruh tanpa menghapus state aplikasi. Artinya, data yang aktif, seperti teks dalam form atau posisi scroll, tetap tersimpan. Fitur ini sangat cepat untuk perubahan kecil pada UI atau logika ringan. Sementara itu, **Hot Restart** memuat ulang seluruh aplikasi dengan menghancurkan VM lama dan membuat yang baru. Proses ini menghapus seluruh state dan mengembalikan aplikasi ke kondisi awal seperti saat pertama dijalankan. Hot Restart digunakan saat perubahan yang dilakukan cukup besar, misalnya pada `main()` atau `initState()`, atau ketika **state** aplikasi menjadi tidak konsisten.

---

# Tugas 8

### 1. Perbedaan antara Navigator.push() dan Navigator.pushReplacement()

`Navigator.push()` digunakan untuk menambahkan route baru ke atas tumpukan. sehingga halaman sebelumnya tetap tersimpan di bawah, dan dapat dikembalikan dengan tombol “Back”. Dalam aplikasi saya digunakan ketika berpindah dari halaman utama ke form "Add Product" agar pengguna dapat kembali ke halaman utama.

`Navigator.pushReplacement()` digunakan untuk mengganti route saat ini dengan yang baru/halaman lama dihapus dari stack. Dalam aplikasi saya digunakan dalam **Drawer** untuk perpindahan antara halaman utama.

---

### 2. Cara memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman

Scaffold : Menjadi kerangka dasar untuk setiap halaman seperti AppBar, Body, dan Drawer.

AppBar : Bertugas menampilkan judul halaman dan memberikan warna serta gaya teks yang seragam di seluruh kode aplikasi.

Drawer : Bertugas menyediakan navigasi antar halaman utama seperti dalam aplikasi yakni Home dan Add Product, serta menampilkan SnackBar saat berpindah halaman.

Contoh pemanfaatannya yakni :
```
Scaffold(
  appBar: AppBar(
    title: Text('Football Shop'),
    backgroundColor: Theme.of(context).colorScheme.primary,
  ),
  drawer: const LeftDrawer(),
  body: ...
)
```
---

### 3. kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form

Kelebihan menggunakan layout widget tersebut diantaranya:
* Padding untuk memberikan jarak antar elemen yang cakupannya untuk beberapa children didalamnya (field input, tombol) sehingga tampilan tidak menempel dan memiliki sekat.

* SingleChildScrollView : karena form bisa memiliki banyak field panjang dan terkadang melebihi tinggi layar di perangkat. Dengan SingleChildScrollView, pengguna dapat scroll tampilan sehingga semua field bisa diakses tanpa terpotong atau overflow. Hal ini mendukung responsifitas dan adaptif. 

* ListView / Column : digunakan untuk menyusun elemen form secara vertikal. ListView bisa digunakan apabila jumlah item banyak dan harus scroll otomatis. Di form saya menggunakan Column di dalam SingleChildScrollView, dengan Padding antar elemen.

---

### 4. menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko

Agar menampilkan identitas visual yang konsisten, saya menggunakan pendekatan dengan beberapa cara, salah satunya:

* Mendefinisikan theme `ThemeData` di MaterialApp dengan colorScheme khusus, misalnya primarySwatch warna khas toko (dalam aplikasi saya warna merah) dan secondary color sesuai dengan opacity atau aksen warna utama.

* Menggunakan warna `Theme.of(context).colorScheme.primary` untuk AppBar, dan konsisten menggunakan warna tersebut di DrawerHeader, tombol utama, dan elemen accent lain.
---
