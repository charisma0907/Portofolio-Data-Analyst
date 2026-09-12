/*
==========================================================
ANALISIS INVENTARIS
==========================================================

Latar Belakang:

Perusahaan perlu memastikan persediaan produk dikelola
secara optimal agar tidak terjadi kehabisan stok maupun
penumpukan stok yang dapat meningkatkan biaya penyimpanan.

Tujuan Analisis:

1. Mengidentifikasi produk dengan stok tertinggi.
2. Mengidentifikasi produk dengan stok terendah.
3. Mengidentifikasi produk dengan penjualan tinggi tetapi stok rendah.
4. Mengidentifikasi produk dengan stok tinggi tetapi penjualan rendah.
5. Mengidentifikasi produk yang berpotensi mengalami kehabisan stok.

Tabel yang digunakan:

1. products
   Digunakan untuk memperoleh informasi stok,
   nama produk, kategori, dan harga.

2. order_items
   Digunakan untuk mengetahui jumlah unit yang telah terjual.

==========================================================
*/
/*
----------------------------------------------------------
Pertanyaan Bisnis 1
----------------------------------------------------------
Produk apa saja yang memiliki stok tertinggi?

Tujuan:
Mengetahui produk dengan jumlah persediaan terbesar agar
perusahaan dapat mengevaluasi apakah stok tersebut telah
sesuai dengan permintaan pasar.
----------------------------------------------------------
*/

-- ======================================================
-- 10 Produk dengan Stok Tertinggi
-- ======================================================

SELECT
    product_id,
    name,
    category,
    stock
FROM products
ORDER BY stock DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 2
----------------------------------------------------------
Produk apa saja yang memiliki stok terendah?

Tujuan:
Mengidentifikasi produk yang hampir kehabisan stok sehingga
perusahaan dapat segera melakukan proses pengadaan kembali.
----------------------------------------------------------
*/

-- ======================================================
-- 10 Produk dengan Stok Terendah
-- ======================================================

SELECT
    product_id,
    name,
    category,
    stock
FROM products
ORDER BY stock ASC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 3
----------------------------------------------------------
Produk apa saja yang memiliki penjualan tinggi tetapi
stoknya rendah?

Tujuan:
Mengidentifikasi produk dengan permintaan tinggi yang
berpotensi mengalami kehabisan stok sehingga perlu
diprioritaskan untuk restock.
----------------------------------------------------------
*/

-- ======================================================
-- Produk dengan Penjualan Tinggi tetapi Stok Rendah
-- ======================================================

SELECT
    p.product_id,
    p.name,
    p.category,
    p.stock,
    SUM(oi.quantity) AS total_unit_terjual
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category,
    p.stock
HAVING p.stock < 50
ORDER BY total_unit_terjual DESC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 4
----------------------------------------------------------
Produk apa saja yang memiliki stok tinggi tetapi
penjualannya rendah?

Tujuan:
Mengidentifikasi produk yang berpotensi menjadi
slow-moving inventory sehingga dapat dipertimbangkan
untuk dilakukan promosi atau evaluasi pembelian.
----------------------------------------------------------
*/

-- ======================================================
-- Produk dengan Stok Tinggi tetapi Penjualan Rendah
-- ======================================================

SELECT
    p.product_id,
    p.name,
    p.category,
    p.stock,
    SUM(oi.quantity) AS total_unit_terjual
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category,
    p.stock
HAVING p.stock > 300
ORDER BY total_unit_terjual ASC
LIMIT 10;

/*
----------------------------------------------------------
Pertanyaan Bisnis 5
----------------------------------------------------------
Produk apa saja yang berpotensi mengalami kehabisan stok?

Tujuan:
Mengidentifikasi produk dengan jumlah stok yang sangat
rendah agar perusahaan dapat segera melakukan pengadaan
kembali sebelum terjadi kehabisan stok.
----------------------------------------------------------
*/

-- ======================================================
-- Produk yang Berpotensi Mengalami Kehabisan Stok
-- ======================================================

SELECT
    product_id,
    name,
    category,
    stock
FROM products
WHERE stock <= 20
ORDER BY stock ASC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 6
----------------------------------------------------------
Produk apa saja yang memiliki stok di atas rata-rata
persediaan perusahaan?

Tujuan:
Mengidentifikasi produk dengan jumlah stok yang lebih
tinggi dibandingkan rata-rata sehingga dapat dilakukan
evaluasi terhadap efektivitas pengelolaan persediaan.
----------------------------------------------------------
*/

-- ======================================================
-- Produk dengan Stok di Atas Rata-rata Persediaan
-- ======================================================

SELECT
    product_id,
    name,
    category,
    stock
FROM products
WHERE stock >
(
    SELECT AVG(stock)
    FROM products
)
ORDER BY stock DESC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 7
----------------------------------------------------------
Produk apa saja yang memiliki stok di bawah rata-rata
persediaan perusahaan?

Tujuan:
Mengidentifikasi produk yang memiliki stok lebih rendah
dibandingkan rata-rata sehingga dapat menjadi prioritas
dalam proses pengadaan kembali.
----------------------------------------------------------
*/

-- ======================================================
-- Produk dengan Stok di Bawah Rata-rata Persediaan
-- ======================================================

SELECT
    product_id,
    name,
    category,
    stock
FROM products
WHERE stock <
(
    SELECT AVG(stock)
    FROM products
)
ORDER BY stock ASC;

/*
----------------------------------------------------------
Pertanyaan Bisnis 8
----------------------------------------------------------
Produk mana yang memiliki rasio stok terhadap penjualan
tertinggi?

Tujuan:
Mengidentifikasi produk dengan persediaan yang jauh lebih
besar dibandingkan jumlah penjualannya sehingga berpotensi
mengalami overstock.
----------------------------------------------------------
*/

-- ======================================================
-- Rasio Stok terhadap Jumlah Penjualan Produk
-- ======================================================

SELECT
    p.product_id,
    p.name,
    p.category,
    p.stock,
    SUM(oi.quantity) AS total_unit_terjual,
    ROUND(
        p.stock * 1.0 /
        SUM(oi.quantity),
        2
    ) AS rasio_stok_penjualan
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category,
    p.stock
ORDER BY rasio_stok_penjualan DESC
LIMIT 10;
