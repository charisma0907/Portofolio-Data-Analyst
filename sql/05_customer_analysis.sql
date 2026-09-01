/*
==========================================================
ANALISIS PELANGGAN
==========================================================

Latar Belakang:

Memahami perilaku pelanggan merupakan langkah penting
dalam meningkatkan penjualan dan loyalitas pelanggan.
Melalui analisis ini, perusahaan dapat mengidentifikasi
pelanggan dengan aktivitas transaksi tertinggi, pelanggan
yang memberikan kontribusi pendapatan terbesar, serta pola
pembelian yang dapat dijadikan dasar dalam menyusun
strategi pemasaran.

Tujuan Analisis:

1. Mengidentifikasi pelanggan dengan jumlah transaksi terbanyak.
2. Mengidentifikasi pelanggan dengan total pembelian terbesar.
3. Mengidentifikasi pelanggan dengan rata-rata nilai transaksi tertinggi.
4. Mengidentifikasi pelanggan yang membeli produk paling beragam.
5. Mengidentifikasi pelanggan dengan total pembelian di atas rata-rata.

Tabel yang digunakan:

1. orders
   Digunakan untuk memperoleh informasi transaksi,
   customer_id, dan order_id.

2. order_items
   Digunakan untuk menghitung nilai transaksi serta
   jumlah produk yang dibeli oleh pelanggan.

==========================================================
*/

/*
----------------------------------------------------------
Pertanyaan Bisnis 1
----------------------------------------------------------
Pelanggan mana yang memiliki jumlah transaksi terbanyak?

Tujuan:
Mengidentifikasi pelanggan yang paling aktif melakukan
transaksi sehingga perusahaan dapat mempertahankan
loyalitas mereka melalui program khusus.

----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Transaksi Berdasarkan Pelanggan
-- ======================================================

SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_transactions
FROM orders o
GROUP BY
    o.customer_id
ORDER BY total_transactions DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 2
----------------------------------------------------------
Pelanggan mana yang memiliki total nilai pembelian
terbesar?

Tujuan:
Mengidentifikasi pelanggan dengan kontribusi pendapatan
tertinggi sehingga perusahaan dapat memberikan program
loyalitas atau penawaran eksklusif.

----------------------------------------------------------
*/

-- ======================================================
-- Total Pembelian Berdasarkan Pelanggan
-- ======================================================

SELECT
    o.customer_id,
    SUM(oi.subtotal_idr) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    o.customer_id
ORDER BY total_revenue DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 3
----------------------------------------------------------
Pelanggan mana yang memiliki rata-rata nilai transaksi
tertinggi?

Tujuan:
Mengidentifikasi pelanggan dengan nilai transaksi rata-rata
terbesar sehingga perusahaan dapat memahami karakteristik
pelanggan dengan daya beli tinggi.

----------------------------------------------------------
*/

-- ======================================================
-- Rata-rata Nilai Transaksi Pelanggan
-- ======================================================

SELECT
    o.customer_id,
    ROUND(AVG(oi.subtotal_idr),2) AS average_order_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    o.customer_id
ORDER BY average_order_value DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 4
----------------------------------------------------------
Pelanggan mana yang membeli jenis produk paling beragam?

Tujuan:
Mengidentifikasi pelanggan dengan variasi pembelian
tertinggi sehingga perusahaan dapat memahami pelanggan
yang memiliki minat terhadap berbagai kategori produk.

----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Produk Berbeda yang Dibeli Pelanggan
-- ======================================================

SELECT
    o.customer_id,
    COUNT(DISTINCT oi.product_id) AS total_jenis_produk
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    o.customer_id
ORDER BY total_jenis_produk DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 5
----------------------------------------------------------
Pelanggan mana yang memiliki total nilai pembelian di
atas rata-rata seluruh pelanggan?

Tujuan:
Mengidentifikasi pelanggan bernilai tinggi berdasarkan
total pembelian yang melebihi rata-rata seluruh pelanggan.

Analisis ini dapat digunakan sebagai dasar dalam
menentukan program loyalitas, promosi eksklusif,
atau strategi retensi pelanggan.

Kriteria Analisis:
- Menghitung total pembelian setiap pelanggan.
- Menghitung rata-rata total pembelian seluruh pelanggan.
- Menampilkan pelanggan dengan total pembelian di atas
  rata-rata tersebut.

----------------------------------------------------------
*/

-- ======================================================
-- Pelanggan dengan Total Pembelian di Atas Rata-rata
-- ======================================================

SELECT
    o.customer_id,
    SUM(oi.subtotal_idr) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
    o.customer_id
HAVING SUM(oi.subtotal_idr) >
(
    SELECT AVG(total_revenue)
    FROM
    (
        SELECT
            SUM(subtotal_idr) AS total_revenue
        FROM orders o
        JOIN order_items oi
        ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    )
)
ORDER BY total_revenue DESC;

