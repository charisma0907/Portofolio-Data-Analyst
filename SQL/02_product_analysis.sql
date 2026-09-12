/*
==========================================================
ANALISIS PERFORMA PRODUK
==========================================================

Latar Belakang:
Perusahaan ingin mengetahui performa setiap produk untuk
mendukung pengambilan keputusan terkait strategi penjualan,
promosi, dan pengelolaan persediaan.

Tujuan Analisis:
1. Mengidentifikasi produk terlaris.
2. Mengidentifikasi produk dengan penjualan terendah.
3. Mengetahui produk dengan pendapatan tertinggi.
4. Mengetahui produk dengan pendapatan terendah.
5. Mengidentifikasi produk dengan rating tinggi tetapi
   penjualan rendah.

Tabel yang digunakan:

1. products
   Digunakan untuk memperoleh informasi produk seperti
   nama produk, kategori, brand, stok, dan rating.

2. order_items
   Digunakan untuk menghitung jumlah produk yang terjual
   dan total pendapatan setiap produk.

==========================================================
*/
/*
----------------------------------------------------------
Pertanyaan Bisnis 1
----------------------------------------------------------
Produk apa saja yang memiliki jumlah penjualan tertinggi?

Tujuan:
Mengetahui produk yang paling diminati pelanggan sehingga
perusahaan dapat menentukan prioritas pengadaan stok.
----------------------------------------------------------
*/
-- ======================================================
-- 10 Produk Terlaris Berdasarkan Jumlah Penjualan
-- ======================================================
SELECT
    p.product_id,
    p.name,
    p.category,
    SUM(oi.quantity) AS total_Unit_terjual
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category
ORDER BY total_Unit_terjual DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 2
----------------------------------------------------------
Produk apa saja yang memiliki jumlah penjualan terendah?

Tujuan:
Mengidentifikasi produk yang kurang diminati sehingga
dapat dipertimbangkan strategi promosi atau evaluasi
persediaannya.
----------------------------------------------------------
*/
-- ======================================================
-- 10 Produk dengan Penjualan Terendah
-- ======================================================
SELECT
    p.product_id,
    p.name,
    p.category,
SUM(oi.quantity) AS total_unit_terjual 
  FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category
ORDER BY total_unit_terjual ASC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 3
----------------------------------------------------------
Produk apa yang memberikan pendapatan terbesar?

Tujuan:
Mengetahui produk yang paling berkontribusi terhadap
pendapatan perusahaan.
----------------------------------------------------------
*/
-- ======================================================
-- 10 Produk dengan Pendapatan Tertinggi
-- ======================================================
SELECT
    p.product_id,
    p.name,
    p.category,
SUM(oi.subtotal_idr) AS total_revenue
  FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category
ORDER BY total_revenue DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 4
----------------------------------------------------------
Produk apa yang menghasilkan pendapatan paling rendah?

Tujuan:
Mengidentifikasi produk yang kurang memberikan kontribusi
terhadap pendapatan perusahaan.
----------------------------------------------------------
*/
-- ======================================================
-- 10 Produk dengan Pendapatan Terendah
-- ======================================================
SELECT
    p.product_id,
    p.name,
    p.category,
    SUM(oi.subtotal_idr) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category
ORDER BY total_revenue ASC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 5
----------------------------------------------------------
Produk apa saja yang memiliki rating tertinggi?

Tujuan:
Mengetahui produk yang mendapatkan kepuasan pelanggan
tertinggi.
----------------------------------------------------------
*/
-- ======================================================
-- 10 Produk dengan Rating Pelanggan Tertinggi
-- ======================================================
SELECT
    product_id,
    name,
    category,
    avg_rating
FROM products
ORDER BY avg_rating DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 6
----------------------------------------------------------
Produk apa yang memiliki rating tinggi tetapi
penjualannya rendah?

Tujuan:
Menemukan peluang peningkatan penjualan melalui promosi
pada produk yang sebenarnya disukai pelanggan.
----------------------------------------------------------
*/
-- ======================================================
-- Produk dengan Rating Tinggi tetapi Penjualan Rendah
-- ======================================================
SELECT
    p.product_id,
    p.name,
    p.avg_rating AS average_rating,
    SUM(oi.quantity) AS total_unit_terjual
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.name,
    p.avg_rating
HAVING p.avg_rating >= 4.5
ORDER BY total_unit_terjual ASC;
