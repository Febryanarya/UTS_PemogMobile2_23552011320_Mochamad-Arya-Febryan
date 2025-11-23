Nama  : Mochamad Arya Febryan
NPM   : 23552011320
Kelas : TIF RP-23 CNS A


1. Jelaskan perbedaan antara Cubit dan Bloc dalam arsitektur Flutter.

Jawaban:
Cubit dan Bloc sama-sama merupakan bagian dari state management dalam Flutter yang berasal dari library flutter_bloc, namun memiliki perbedaan utama pada cara mengelola state.

Cubit	Bloc
Lebih sederhana dan ringan	Lebih kompleks dibanding Cubit
Menggunakan fungsi sederhana untuk mengubah state	Menggunakan konsep event dan state
Tidak memerlukan event, langsung memanggil metode	Perubahan state terjadi dengan mengirim event
Cocok untuk aplikasi kecil-menengah	Cocok untuk aplikasi besar dan lebih terstruktur
Lebih sedikit boilerplate code	Boilerplate lebih banyak tetapi fleksibel

Kesimpulan:
Cubit adalah versi lebih sederhana dari Bloc dan lebih cepat diimplementasikan. Bloc lebih terstruktur untuk aplikasi kompleks.

2. Mengapa penting untuk memisahkan antara model data, logika bisnis, dan UI dalam pengembangan aplikasi Flutter?

Jawaban:
Pemilahan ini mengikuti prinsip Clean Architecture dan memberikan beberapa manfaat:

Kode lebih mudah dibaca dan dikelola

Memudahkan pengembangan tim, karena setiap bagian dapat dikerjakan terpisah

Mudah melakukan pengujian (testing) karena logika bisnis tidak bercampur dengan tampilan

Meningkatkan skalabilitas, aplikasi dapat berkembang tanpa perlu merombak total strukturnya

Mengurangi bug, karena perubahan UI tidak mempengaruhi logika bisnis

3. Sebutkan dan jelaskan minimal tiga state yang mungkin digunakan dalam CartCubit beserta fungsinya.

Jawaban:
State yang mungkin dipakai dalam CartCubit antara lain:

Nama State	Penjelasan
CartInitial	Kondisi awal ketika keranjang masih kosong
CartUpdated	State yang menyimpan data keranjang setiap kali item ditambah, dikurangi, atau dihapus
CartLoading	Digunakan saat proses update keranjang sedang berlangsung sebelum mengirim state baru
CartError	Muncul jika terjadi kesalahan saat mengubah state cart
CartSummaryState	Menyimpan data total jumlah item dan total harga
