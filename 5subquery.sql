-- NIM : 13322031
-- Nama : Lukas Hiromy Simatupang
-- Prodi : D3TK

USE harga_komoditas_pangan;

-- 1. Menampilkan daftar komoditas beserta jumlah harga yang lebih besar daripada rata-rata harga keseluruhan
SELECT Nama_Komoditas
FROM Komoditas
WHERE Kode_Komoditas IN (
	SELECT Kode_Komoditas
	FROM Harga
	WHERE Harga > (
		SELECT AVG(Harga)
		FROM Harga
	)
);

-- 2. Menampilkan jenis pasar dan lokasi yang memiliki harga terendah pada jenis komoditas "Buah-buahan"
SELECT Jenis_Pasar, (
	SELECT Nama_Lokasi
	FROM Lokasi
	WHERE Kode_Lokasi = (
		SELECT Kode_Lokasi
		FROM Harga
		WHERE Kode_Pasar = Pasar.Kode_Pasar 
		AND Kode_Komoditas IN (
			SELECT Kode_Komoditas
			FROM Komoditas
			WHERE Jenis_Komoditas = 'Buah-buahan'
		) 
		AND Harga = (
			SELECT MIN(Harga)
			FROM Harga
			WHERE Kode_Pasar = Pasar.Kode_Pasar
		AND Kode_Komoditas IN (
			SELECT Kode_Komoditas
			FROM Komoditas
			WHERE Jenis_Komoditas = 'Buah-buahan'
		)
		)
	)
) AS Nama_Lokasi
FROM Pasar;

-- 3. Menampilkan daftar komoditas yang memiliki harga tertinggi pada tanggal tertentu
SELECT K.Nama_Komoditas, H.Harga
FROM Komoditas K
INNER JOIN Harga H ON K.Kode_Komoditas = H.Kode_Komoditas
WHERE H.Kode_Waktu = (
	SELECT Kode_Waktu
	FROM Waktu
	WHERE Tanggal_Bulan_Tahun = '2023-03-08'
)
AND H.Harga = (
	SELECT MAX(Harga)
	FROM Harga
	WHERE Kode_Waktu = (
		SELECT Kode_Waktu
		FROM Waktu
		WHERE Tanggal_Bulan_Tahun = '2023-03-08'
	)
);

-- 4. Menampilkan jumlah harga komoditas dengan 2 kondisi waktu tertentu
SELECT Total_Harga_WKT1 + Total_Harga_WKT2 AS Total_Harga
FROM (
    SELECT
        (SELECT SUM(H1.Harga) FROM Harga H1 WHERE H1.Kode_Komoditas = 'KOM001' AND H1.Kode_Waktu = 'WKT01') AS Total_Harga_WKT1,
        (SELECT SUM(H2.Harga) FROM Harga H2 WHERE H2.Kode_Komoditas = 'KOM001' AND H2.Kode_Waktu = 'WKT02') AS Total_Harga_WKT2
    FROM
        DUAL
) AS subquery;

-- 5. Menampilkan Nama Komoditas, Nama_Lokasi, Jenis_Pasar, dan Waktu untuk menentukan harga tertinggi pada waktu tertentu
SELECT K.Nama_Komoditas,
L.Nama_Lokasi,
P.Jenis_Pasar,
W.Tanggal_Bulan_Tahun
FROM Komoditas K
INNER JOIN Harga H ON K.Kode_Komoditas = H.Kode_Komoditas
INNER JOIN Lokasi L ON H.Kode_Lokasi = L.Kode_Lokasi
INNER JOIN Pasar P ON H.Kode_Pasar = P.Kode_Pasar
INNER JOIN Waktu W ON H.Kode_Waktu = W.Kode_Waktu
WHERE W.Tanggal_Bulan_Tahun = '2023-02-01'
AND H.Harga = (
	SELECT MAX(Harga)
	FROM Harga
	WHERE Kode_Waktu = W.Kode_Waktu
);