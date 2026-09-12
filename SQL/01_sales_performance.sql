/*
==========================================================
ANALISIS PERFORMA PENJUALAN
==========================================================

Tujuan Analisis:
Menganalisis performa penjualan perusahaan berdasarkan
jumlah transaksi, total pendapatan, total produk terjual,
dan rata-rata nilai transaksi.

Tabel yang digunakan:
1. orders
   Digunakan untuk menghitung jumlah transaksi.

2. order_items
   Digunakan untuk menghitung total pendapatan,
   total produk terjual, dan rata-rata nilai transaksi.

==========================================================
*/

------------------------------------------------------------
-- Pertanyaan Bisnis 1
-- Berapa jumlah transaksi yang terjadi?
------------------------------------------------------------

SELECT
    COUNT(*) AS total_transactions
FROM orders;

------------------------------------------------------------
-- Pertanyaan Bisnis 2
-- Berapa total pendapatan yang diperoleh perusahaan?
------------------------------------------------------------

SELECT
    SUM(subtotal_idr) AS total_revenue
FROM order_items;

------------------------------------------------------------
-- Pertanyaan Bisnis 3
-- Berapa total produk yang berhasil terjual?
------------------------------------------------------------

SELECT
    SUM(quantity) AS total_products_sold
FROM order_items;

------------------------------------------------------------
-- Pertanyaan Bisnis 4
-- Berapa rata-rata nilai transaksi pelanggan (AOV)?
------------------------------------------------------------

SELECT
    ROUND(
        SUM(subtotal_idr) * 1.0 /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM order_items;
