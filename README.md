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
