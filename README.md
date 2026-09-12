# 📊 Laporan Performa Penjualan & Inventaris E-Commerce (2022-2025)

## 📌 Gambaran Proyek (Project Overview)

Proyek ini menganalisis data penjualan dan inventaris e-commerce menggunakan SQL untuk mengidentifikasi kinerja penjualan, produk terlaris, inventaris yang kurang laku, dan memberikan rekomendasi bisnis untuk optimasi inventaris.

## 🎯 Masalah Bisnis (Business Problem)

Sebagai Analis Data di sebuah perusahaan e-commerce, saya bertugas menganalisis data penjualan dan inventaris untuk mengidentifikasi produk terlaris, produk yang kurang laku, dan memberikan rekomendasi untuk manajemen inventaris yang lebih baik.

## 🎯 Tujuan Proyek (Project Objectives)

- Menganalisis kinerja penjualan
- Mengidentifikasi produk terlaris
- Mendeteksi persediaan yang lambat terjual
- Menganalisis tingkat persediaan
- Berikan rekomendasi bisnis.
  
## 📂 Kumpulan Data (Dataset)

| Tabel | Deskripsi |
|--------|-------------|
| Produk (Products) | Data master produk|
| Pesanan (Orders) | Pesanan pelanggan |
| Barang pesanan (Order Items) | Detail barang |

## 🔄 Proses Analisis Data (Data Analysis Process)

Analisis dilakukan secara terstruktur mulai dari pemeriksaan data hingga penyusunan rekomendasi bisnis. Proses ini bertujuan memastikan data yang digunakan akurat, analisis menjawab permasalahan bisnis, dan hasilnya dapat digunakan sebagai dasar pengambilan keputusan.

### 1. 📥 Pemahaman Data (Data Understanding)
Memahami struktur dan hubungan antar dataset yang terdiri dari data produk, pesanan, dan detail transaksi. Tahap ini dilakukan untuk mengidentifikasi kolom penting yang diperlukan dalam analisis penjualan dan inventaris.

### 2. 🧹 Pembersihan & Validasi Data (Data Cleaning & Validation)
Melakukan pemeriksaan terhadap kualitas data, termasuk nilai kosong (NULL), data duplikat, format data, serta konsistensi nilai antar tabel untuk memastikan data siap digunakan dalam proses analisis.

### 3. 🔗 Pengolahan Data dengan SQL (Data Processing)
Menggabungkan beberapa tabel menggunakan SQL JOIN serta melakukan agregasi dan perhitungan menggunakan fungsi seperti SUM, COUNT, AVG, GROUP BY, dan CASE WHEN untuk menghasilkan metrik yang dibutuhkan dalam analisis.

### 4. 🔍 Analisis Data (Data Analysis)
Melakukan analisis terhadap beberapa aspek utama bisnis, meliputi performa penjualan, produk terlaris, kategori produk, pergerakan inventaris, performa merek, serta tren pendapatan berdasarkan periode waktu.

### 5. 📊 Perhitungan KPI (KPI Calculation)
Menghitung indikator utama seperti total pendapatan, jumlah pesanan, jumlah unit terjual, rata-rata rating produk, serta metrik lainnya untuk memberikan gambaran menyeluruh mengenai performa bisnis.

### 6. 📈 Visualisasi Data (Data Visualization)
Membangun dashboard interaktif menggunakan Looker Studio untuk menyajikan KPI, tren pendapatan, performa kategori, produk terlaris, dan informasi bisnis lainnya agar hasil analisis lebih mudah dipahami.

### 7. 💡 Insight & Rekomendasi Bisnis (Business Insights & Recommendations)
Menginterpretasikan hasil analisis untuk mengidentifikasi pola, peluang, dan potensi permasalahan bisnis. Temuan tersebut kemudian digunakan untuk menyusun rekomendasi terkait strategi penjualan, pengelolaan inventaris, dan optimalisasi produk.

## 🔗 Live Interactive Dashboard
👉 [Klik di sini untuk membuka Dashboard Interaktif di Looker Studio]https://datastudio.google.com/reporting/6cd7b636-f09a-4b51-9e73-fe0df273b32a

----

![E-Commerce Sales Dashboard](sql/07_Dasboard-preview.png)

## 🔑 Temuan Utama (Key Insights)
* **Total Pendapatan:** Mencapai **Rp1.531.780.000** dengan total pesanan sebanyak **3.000** transaksi dan **6.440** unit barang terjual.
* **Rata-Rata Nilai Pesanan (AOV):** Berada di angka **Rp307.216** dengan tingkat kepuasan pelanggan yang baik (Rating **4,267**).
* **Kategori Dominan:** Kategori **Dress** mendominasi pendapatan terbesar dibandingkan kategori pakaian lainnya.
* **Produk Terlaris:** **Dress Mini Casual Sandangindo** menjadi produk paling menguntungkan dengan total pendapatan **Rp23.001.000** (49 unit terjual).
* **Merek Teratas:** Merek **Rianji Apparel** memimpin penjualan terbanyak dengan total kontribusi sebesar **Rp184.801.000**.

---

## 💡 Rekomendasi Bisnis (Business Recommendations)
1. **Optimasi Stok (Inventory Management):** Prioritaskan ketersediaan stok untuk kategori *Dress* dan merek *Rianji Apparel* untuk mencegah potensi kehabisan barang (*lost sales*).
2. **Strategi Bundling Promosi:** Buat paket penawaran khusus atau diskon untuk kategori produk yang penjualannya lambat (*slow-moving*) seperti *Kaos* atau *Kemeja* agar perputaran inventaris lebih cepat.
3. **Pertahankan Kualitas:** Menjaga standar produk mengingat *rating* pelanggan sudah tergolong tinggi di angka 4,26.
---

## 🛠 Alat yang Digunakan (Tools)

- **SQL / SQLite:** Untuk pembersihan data, ekstraksi, dan analisis kueri.
- **Microsoft Excel:** Untuk olah data awal dan validasi data.
- **Looker Studio:** Untuk pembuatan *dashboard* interaktif dan visualisasi data.
