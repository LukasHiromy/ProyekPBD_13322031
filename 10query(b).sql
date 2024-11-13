-- NIM : 13322031
-- Nama : Lukas Hiromy Simatupang
-- Prodi : D3TK

USE harga_komoditas_pangan;

-- 1. Menampilkan semua data dari tabel Komoditas 
SELECT * FROM Komoditas;

-- 2. Menampilkan nama komoditas beserta jenisnya
SELECT Nama_Komoditas, Jenis_Komoditas FROM Komoditas;

-- 3. Menampilkan jumlah komoditas yang ada dalam tabel
SELECT COUNT(*) AS Total_Komoditas FROM Komoditas;

-- 4. Menampilkan komoditas dengan nama yang diawali huruf "P"
SELECT * FROM Komoditas WHERE Nama_Komoditas LIKE 'P%';

-- 5. Menampilkan komoditas dengan jenis "Sayuran" dan "Buah"
SELECT * FROM Komoditas WHERE Jenis_Komoditas IN ('Sayuran', 'Buah-buahan');

-- 6. Menampilkan komoditas dengan nama terpanjang
SELECT * FROM Komoditas ORDER BY LENGTH(Nama_Komoditas) DESC LIMIT 1;

-- 7. Menampilkan rata-rata harga komoditas
SELECT AVG(Harga) AS Rata_Harga FROM Harga;

-- 8. Menampilkan komoditas dengan harga tertinggii
SELECT * FROM Komoditas
WHERE Kode_Komoditas IN (
	SELECT Kode_Komoditas FROM Harga
	WHERE Harga = (SELECT MAX(Harga) FROM Harga)
);

-- 9. Menampilkan komoditas yang tidak memiliki harga
SELECT * FROM Komoditas
WHERE Kode_Komoditas NOT IN (
	SELECT Kode_Komoditas 
	FROM Harga
);

-- 10. Menampilkan komoditas dengan jumlah harga yang di input lebih dari lima 
SELECT Kode_Komoditas, 
COUNT(*) AS Jumlah_Harga FROM Harga
GROUP BY Kode_Komoditas HAVING COUNT(*) > 5;

