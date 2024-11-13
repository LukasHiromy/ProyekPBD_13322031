-- NIM : 13322031
-- Nama : Lukas Hiromy Simatupang
-- Prodi : D3TK

USE harga_komoditas_pangan;

-- 1.seperti select * dengan menggunakan alias
SELECT K.Nama_Komoditas,
K.Jenis_Komoditas, 
L.Nama_Lokasi, 
P.Jenis_Pasar, 
W.Tanggal_Bulan_Tahun AS waktu, 
H.Harga
FROM Harga H
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
JOIN Lokasi L ON H.Kode_Lokasi = L.Kode_Lokasi
JOIN Pasar P ON H.Kode_Pasar = P.Kode_Pasar
JOIN Waktu W ON H.Kode_Waktu = W.Kode_Waktu;

-- 2.Menampilkan Komoditas berdasarkan lokasi
SELECT K.Nama_Komoditas, 
K.Jenis_Komoditas,
L.Nama_Lokasi,
P.Jenis_Pasar, 
H.Harga
FROM Harga H
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
JOIN Lokasi L ON H.Kode_Lokasi = L.Kode_Lokasi
JOIN Pasar P ON H.Kode_Pasar = P.Kode_Pasar
WHERE K.Nama_Komoditas = 'Beras' AND L.Nama_Lokasi = 'Balige';

-- 3.Menampilkan semua data harga yang tercatat pada tanggal tertentu
SELECT K.Nama_Komoditas,
K.Jenis_Komoditas, 
L.Nama_Lokasi,
P.Jenis_Pasar,
W.Tanggal_Bulan_Tahun, 
H.Harga
FROM Harga H
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
JOIN Lokasi L ON H.Kode_Lokasi = L.Kode_Lokasi
JOIN Pasar P ON H.Kode_Pasar = P.Kode_Pasar
JOIN Waktu W ON H.Kode_Waktu = W.Kode_Waktu
WHERE W.Tanggal_Bulan_Tahun = '2023-02-01';

-- 4.Menampilkan rata-rata harga komoditas pada setiap lokasi dan jenis pasar
SELECT L.Nama_Lokasi, 
P.Jenis_Pasar,
AVG(H.Harga) AS Rata_Rata_Harga
FROM Harga H
JOIN Lokasi L ON H.Kode_Lokasi = L.Kode_Lokasi
JOIN Pasar P ON H.Kode_Pasar = P.Kode_Pasar
GROUP BY L.Nama_Lokasi, P.Jenis_Pasar;

-- 5.Menampilkan jumlah harga komoditas tertentu di setiap jenis pasar
SELECT P.Jenis_Pasar, 
COUNT(H.Harga) AS Jumlah_Harga
FROM Harga H
JOIN Pasar P ON H.Kode_Pasar = P.Kode_Pasar
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
WHERE K.Nama_Komoditas = 'Beras'
GROUP BY P.Jenis_Pasar;

-- 6.Menampilkan komoditas dengan harga tertinggi
SELECT K.Nama_Komoditas, 
W.Tanggal_Bulan_Tahun, 
H.Harga
FROM Harga H
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
JOIN Waktu W ON H.Kode_Waktu = W.Kode_Waktu
WHERE H.Harga = (
    SELECT MAX(Harga)
    FROM Harga
);

-- 7.Menampilkan rata-rata harga komoditas berdasarkan jenis komoditas
SELECT K.Jenis_Komoditas, AVG(H.Harga) AS Rata_Rata_Harga
FROM Komoditas K
LEFT JOIN Harga H ON K.Kode_Komoditas = H.Kode_Komoditas
GROUP BY K.Jenis_Komoditas;

-- 8. Menampilkan 5 komoditas dengan harga tertinggi pada setiap jenis pasar:
SELECT P.Jenis_Pasar, K.Nama_Komoditas, H.Harga
FROM Pasar P
JOIN Harga H ON P.Kode_Pasar = H.Kode_Pasar
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
WHERE (H.Kode_Pasar, H.Harga) IN (
    SELECT Kode_Pasar, MAX(Harga)
    FROM Harga
    GROUP BY Kode_Pasar
)
ORDER BY P.Jenis_Pasar, H.Harga DESC
LIMIT 5;

-- 9. Menampilkan 5 komoditas dengan harga terendah pada setiap jenis pasar
SELECT P.Jenis_Pasar, K.Nama_Komoditas, H.Harga
FROM Pasar P
JOIN Harga H ON P.Kode_Pasar = H.Kode_Pasar
JOIN Komoditas K ON H.Kode_Komoditas = K.Kode_Komoditas
WHERE (H.Kode_Pasar, H.Harga) IN (
    SELECT Kode_Pasar, MIN(Harga)
    FROM Harga
    GROUP BY Kode_Pasar
)
ORDER BY P.Jenis_Pasar, H.Harga ASC
LIMIT 5;

-- 10. Menampilkan total harga komoditas pada setiap tanggal
SELECT W.Tanggal_Bulan_Tahun, SUM(H.Harga) AS Total_Harga
FROM Waktu W
JOIN Harga H ON W.Kode_Waktu = H.Kode_Waktu
GROUP BY W.Tanggal_Bulan_Tahun;