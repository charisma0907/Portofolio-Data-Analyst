/*
==========================================================
ANALISIS WAKTU PENJUALAN
==========================================================

Latar Belakang:

Selain mengetahui performa penjualan secara keseluruhan,
perusahaan juga perlu memahami pola penjualan berdasarkan
waktu. Analisis ini membantu perusahaan dalam mengetahui
periode penjualan tertinggi, tren pertumbuhan penjualan,
serta menentukan strategi promosi pada periode tertentu.

Tujuan Analisis:

1. Menganalisis jumlah transaksi setiap bulan.
2. Menganalisis total pendapatan setiap bulan.
3. Menganalisis jumlah produk terjual setiap bulan.
4. Mengidentifikasi hari dengan jumlah transaksi tertinggi.
5. Mengidentifikasi bulan dengan rata-rata nilai transaksi tertinggi.

Tabel yang digunakan:

1. orders
   Digunakan untuk memperoleh informasi tanggal transaksi.

2. order_items
   Digunakan untuk menghitung jumlah produk yang terjual
   dan total pendapatan.

==========================================================
*/

/*
----------------------------------------------------------
Pertanyaan Bisnis 1
----------------------------------------------------------
Bagaimana jumlah transaksi pada setiap bulan?

Tujuan:
Mengetahui tren jumlah transaksi setiap bulan sehingga
perusahaan dapat mengidentifikasi periode dengan aktivitas
penjualan tertinggi maupun terendah.

----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Transaksi Setiap Bulan
-- ======================================================

SELECT
    strftime('%Y-%m', o.order_date) AS bulan,
    COUNT(DISTINCT o.order_id) AS total_transactions
FROM orders o
GROUP BY
    bulan
ORDER BY
    bulan;

/*
----------------------------------------------------------
Pertanyaan Bisnis 2
----------------------------------------------------------
Bagaimana total pendapatan pada setiap bulan?

Tujuan:
Mengetahui perkembangan pendapatan perusahaan dari waktu
ke waktu sebagai dasar evaluasi performa bisnis.

----------------------------------------------------------
*/

-- ======================================================
-- Total Pendapatan Setiap Bulan
-- ======================================================

SELECT
    strftime('%Y-%m', o.order_date) AS bulan,
    SUM(oi.subtotal_idr) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    bulan
ORDER BY
    bulan;

/*
----------------------------------------------------------
Pertanyaan Bisnis 3
----------------------------------------------------------
Bagaimana jumlah produk yang berhasil terjual pada setiap
bulan?

Tujuan:
Menganalisis tren penjualan produk dari waktu ke waktu
untuk mendukung perencanaan stok.

----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Produk Terjual Setiap Bulan
-- ======================================================

SELECT
    strftime('%Y-%m', o.order_date) AS bulan,
    SUM(oi.quantity) AS total_unit_terjual
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    bulan
ORDER BY
    bulan;

/*
----------------------------------------------------------
Pertanyaan Bisnis 4
----------------------------------------------------------
Pada tanggal berapa jumlah transaksi paling tinggi terjadi?

Tujuan:
Mengidentifikasi hari dengan aktivitas transaksi
tertinggi sehingga perusahaan dapat menentukan waktu
yang tepat untuk menjalankan promosi.

----------------------------------------------------------
*/

-- ======================================================
-- Hari dengan Jumlah Transaksi Tertinggi
-- ======================================================

SELECT
    o.order_date,
    COUNT(DISTINCT o.order_id) AS total_transactions
FROM orders o
GROUP BY
    o.order_date
ORDER BY
    total_transactions DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 5
----------------------------------------------------------
Bulan mana yang memiliki rata-rata nilai transaksi
tertinggi?

Tujuan:
Mengidentifikasi periode dengan rata-rata transaksi
terbesar sehingga perusahaan dapat mengevaluasi faktor
yang memengaruhi peningkatan nilai pembelian pelanggan.

----------------------------------------------------------
*/

-- ======================================================
-- Rata-rata Nilai Transaksi Setiap Bulan
-- ======================================================

SELECT
    strftime('%Y-%m', o.order_date) AS bulan,
    ROUND(AVG(oi.subtotal_idr),2) AS average_order_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    bulan
ORDER BY
    average_order_value DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 7
----------------------------------------------------------
Hari apa dalam satu minggu yang memiliki jumlah transaksi
terbanyak?

Tujuan:
Mengidentifikasi hari dengan aktivitas transaksi tertinggi
berdasarkan jumlah pesanan yang diterima perusahaan.

Hasil analisis ini dapat digunakan sebagai dasar dalam
menentukan waktu yang paling efektif untuk menjalankan
program promosi, meningkatkan kapasitas operasional,
menyesuaikan jumlah sumber daya, serta merencanakan
strategi pemasaran pada hari-hari dengan potensi
penjualan tertinggi.

Kriteria Analisis:
- Mengelompokkan seluruh transaksi berdasarkan hari
  dalam satu minggu.
- Menghitung jumlah transaksi pada setiap hari.
- Mengurutkan hasil berdasarkan jumlah transaksi dari
  yang tertinggi hingga terendah.

----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Transaksi Berdasarkan Hari dalam Seminggu
-- ======================================================

SELECT
    CASE strftime('%w', o.order_date)
        WHEN '0' THEN 'Minggu'
        WHEN '1' THEN 'Senin'
        WHEN '2' THEN 'Selasa'
        WHEN '3' THEN 'Rabu'
        WHEN '4' THEN 'Kamis'
        WHEN '5' THEN 'Jumat'
        WHEN '6' THEN 'Sabtu'
    END AS hari,

    COUNT(DISTINCT o.order_id) AS total_transactions

FROM orders o

GROUP BY
    hari

ORDER BY
    total_transactions DESC;
