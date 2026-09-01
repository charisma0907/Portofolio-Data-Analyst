/*
==========================================================
ANALISIS KATEGORI PRODUK
==========================================================

Latar Belakang:

Perusahaan perlu mengetahui kategori dan merek produk yang
memberikan kontribusi terbesar terhadap penjualan agar
dapat menentukan strategi pemasaran, pengadaan stok,
dan pengembangan produk.

Tujuan Analisis:

1. Mengidentifikasi kategori dengan jumlah penjualan tertinggi.
2. Mengidentifikasi kategori dengan pendapatan tertinggi.
3. Mengidentifikasi brand dengan jumlah penjualan tertinggi.
4. Mengidentifikasi brand dengan pendapatan tertinggi.
5. Mengidentifikasi kategori dengan rata-rata rating tertinggi.

Tabel yang digunakan:

1. products
   Digunakan untuk memperoleh informasi kategori, brand,
   dan rating produk.

2. order_items
   Digunakan untuk menghitung jumlah penjualan dan
   total pendapatan setiap kategori maupun brand.

==========================================================
*/

/*
----------------------------------------------------------
Pertanyaan Bisnis 1
----------------------------------------------------------
Kategori produk apa yang memiliki jumlah penjualan
tertinggi?

Tujuan:
Mengidentifikasi kategori yang paling diminati pelanggan
berdasarkan jumlah unit yang berhasil terjual.
----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Penjualan Berdasarkan Kategori Produk
-- ======================================================

SELECT
    p.category,
    SUM(oi.quantity) AS total_unit_terjual
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.category
ORDER BY total_unit_terjual DESC;


/*
----------------------------------------------------------
Pertanyaan Bisnis 2
----------------------------------------------------------
Kategori produk apa yang menghasilkan pendapatan terbesar?

Tujuan:
Mengetahui kategori produk yang memberikan kontribusi
pendapatan paling besar bagi perusahaan.
----------------------------------------------------------
*/

-- ======================================================
-- Pendapatan Berdasarkan Kategori Produk
-- ======================================================

SELECT
    p.category,
    SUM(oi.subtotal_idr) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.category
ORDER BY total_revenue DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 3
----------------------------------------------------------
Brand apa yang memiliki jumlah penjualan tertinggi?

Tujuan:
Mengidentifikasi brand yang paling diminati pelanggan
berdasarkan jumlah unit yang terjual.
----------------------------------------------------------
*/

-- ======================================================
-- Jumlah Penjualan Berdasarkan Brand
-- ======================================================

SELECT
    p.brand,
    SUM(oi.quantity) AS total_unit_terjual
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.brand
ORDER BY total_unit_terjual DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 4
----------------------------------------------------------
Brand apa yang menghasilkan pendapatan terbesar?

Tujuan:
Mengetahui brand yang memberikan kontribusi pendapatan
terbesar bagi perusahaan.
----------------------------------------------------------
*/

-- ======================================================
-- Pendapatan Berdasarkan Brand
-- ======================================================

SELECT
    p.brand,
    SUM(oi.subtotal_idr) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.brand
ORDER BY total_revenue DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 5
----------------------------------------------------------
Kategori produk apa yang memiliki rata-rata rating
pelanggan tertinggi?

Tujuan:
Mengetahui kategori produk dengan tingkat kepuasan
pelanggan terbaik berdasarkan rata-rata rating.
----------------------------------------------------------
*/

-- ======================================================
-- Rata-rata Rating Berdasarkan Kategori Produk
-- ======================================================

SELECT
    category,
    ROUND(AVG(avg_rating),2) AS average_rating
FROM products
GROUP BY
    category
ORDER BY average_rating DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 6
----------------------------------------------------------
Kategori produk mana yang memiliki rata-rata harga
produk tertinggi?

Tujuan:
Mengidentifikasi kategori produk dengan nilai rata-rata
harga tertinggi sehingga perusahaan dapat memahami
kategori premium yang berpotensi memberikan margin
keuntungan lebih besar serta menjadi dasar dalam
menentukan strategi penjualan dan pemasaran.
----------------------------------------------------------
*/

-- ======================================================
-- Rata-rata Harga Produk Berdasarkan Kategori
-- ======================================================

SELECT
    category,
    ROUND(AVG(price_idr),0) AS average_price
FROM products
GROUP BY
    category
ORDER BY average_price DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 7
----------------------------------------------------------
Brand mana yang memiliki rata-rata rating di atas
rata-rata seluruh produk, tetapi jumlah penjualannya
masih rendah?

Tujuan:
Mengidentifikasi brand yang memiliki kualitas produk
yang baik berdasarkan penilaian pelanggan, namun belum
mampu menghasilkan penjualan yang optimal.

Analisis ini bertujuan untuk menemukan peluang bisnis,
di mana brand dengan kualitas tinggi tetapi penjualan
rendah dapat diprioritaskan dalam strategi promosi,
peningkatan visibilitas produk, maupun evaluasi strategi
pemasaran agar potensi penjualannya dapat meningkat.

Kriteria Analisis:
- Menghitung rata-rata rating setiap brand.
- Membandingkan rata-rata rating brand dengan rata-rata
  rating seluruh produk.
- Menampilkan hanya brand yang memiliki rata-rata rating
  di atas rata-rata keseluruhan.
- Mengurutkan hasil berdasarkan jumlah unit terjual dari
  yang paling rendah untuk mengidentifikasi brand yang
  memiliki kualitas baik namun masih kurang diminati.
----------------------------------------------------------
*/

-- ======================================================
-- Brand dengan Rating di Atas Rata-rata tetapi
-- Jumlah Penjualan Rendah
-- ======================================================

SELECT
    p.brand,
    ROUND(AVG(p.avg_rating), 2) AS average_rating,
    SUM(oi.quantity) AS total_unit_terjual
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.brand
HAVING AVG(p.avg_rating) >
(
    SELECT AVG(avg_rating)
    FROM products
)
ORDER BY total_unit_terjual ASC;
