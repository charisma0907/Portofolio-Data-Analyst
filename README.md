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

Analisis dilakukan secara terstruktur mulai dari pemeriksaan data hingga penyusunan rekomendasi bisnis untuk menghasilkan insight yang relevan dalam pengambilan keputusan.

1. **📥 Pemahaman Data (Data Understanding)**  
   Memahami struktur, atribut, dan hubungan antar dataset produk, pesanan, dan detail transaksi.

2. **🧹 Pembersihan & Validasi Data (Data Cleaning & Validation)**  
   Memeriksa nilai kosong, duplikasi, format data, dan konsistensi data sebelum proses analisis.

3. **🔗 Pengolahan Data dengan SQL (Data Processing)**  
   Menggabungkan tabel menggunakan JOIN serta melakukan agregasi menggunakan SUM, COUNT, AVG, GROUP BY, dan CASE WHEN.

4. **🔍 Analisis Data (Data Analysis)**  
   Menganalisis performa penjualan, produk, kategori, inventaris, merek, dan tren pendapatan berdasarkan periode waktu.

5. **📊 Perhitungan KPI (KPI Calculation)**  
   Menghitung total pendapatan, jumlah pesanan, unit terjual, rata-rata rating produk, dan metrik utama lainnya.

6. **📈 Visualisasi Data (Data Visualization)**  
   Membangun dashboard interaktif di Looker Studio untuk menyajikan KPI, tren pendapatan, kategori, dan produk terlaris.

7. **💡 Insight & Rekomendasi Bisnis (Business Insights & Recommendations)**  
   Menginterpretasikan hasil analisis menjadi insight dan rekomendasi untuk mendukung strategi penjualan dan pengelolaan inventaris.
   
## 🔗 Live Interactive Dashboard
👉 [Klik di sini untuk membuka Dashboard Interaktif di Looker Studio]https://datastudio.google.com/reporting/6cd7b636-f09a-4b51-9e73-fe0df273b32a

----

![E-Commerce Sales Dashboard](Images)

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
