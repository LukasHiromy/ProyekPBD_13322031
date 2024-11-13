CREATE DATABASE harga_komoditas_pangan;

CREATE TABLE Komoditas (
Kode_Komoditas CHAR(10) PRIMARY KEY,
Nama_Komoditas VARCHAR(50),
Jenis_Komoditas VARCHAR (50)
);

INSERT INTO Komoditas (Kode_Komoditas, Nama_Komoditas, Jenis_Komoditas)
VALUES
-- Komoditas Pasar Tradisional
  ('KOM001', 'Beras', 'Bahan Pokok'),
  ('KOM002', 'Cabai', 'Bumbu Dapur'),
  ('KOM003', 'Kentang', 'Sayuran'),
  ('KOM004', 'Ikan Bandeng', 'Produk Perikanan'),
  ('KOM005', 'Telur Ayam', 'Produk Ternak'),
  ('KOM006', 'Gula Pasir', 'Bahan Pokok'),
  ('KOM007', 'Tepung Terigu', 'Bahan Pokok'),
  ('KOM008', 'Minyak Goreng', 'Bahan Pokok'),
  ('KOM009', 'Daging Ayam', 'Produk Ternak'),
  ('KOM010', 'Kacang Tanah', 'Kacang-kacangan');
  
INSERT INTO Komoditas (Kode_Komoditas, Nama_Komoditas, Jenis_Komoditas)
VALUES
-- Komoditas Pasar Grosir
  ('KOM011', 'Bawang Merah', 'Bumbu Dapur'),
  ('KOM012', 'Wortel', 'Sayuran'),
  ('KOM013', 'Sapi', 'Produk Ternak'),
  ('KOM014', 'Jagung', 'Sayuran'),
  ('KOM015', 'Susu', 'Produk Ternak'),
  ('KOM016', 'Garam', 'Bumbu Dapur'),
  ('KOM017', 'Teh', 'Minuman'),
  ('KOM018', 'Jahe', 'Bumbu Dapur'),
  ('KOM019', 'Apel', 'Buah-buahan'),
  ('KOM020', 'Roti', 'Produk Roti');

INSERT INTO Komoditas (Kode_Komoditas, Nama_Komoditas, Jenis_Komoditas)
VALUES
-- Komoditas Pasar Modern
  ('KOM021', 'Mie Instan', 'Makanan Instan'),
  ('KOM022', 'Susu Kental Manis', 'Minuman'),
  ('KOM023', 'Yogurt', 'Minuman'),
  ('KOM024', 'Pisang', 'Buah-buahan'),
  ('KOM025', 'Kentang Goreng Frozen', 'Makanan Beku'),
  ('KOM026', 'Saus Tomat', 'Bumbu Dapur'),
  ('KOM027', 'Makanan Ringan', 'Snack'),
  ('KOM028', 'Minuman Soda', 'Minuman Ringan'),
  ('KOM029', 'Sarden Kaleng', 'Produk Olahan Ikan'),
  ('KOM030', 'Paket Bumbu Masak', 'Bumbu Dapur');

CREATE TABLE Lokasi (
Kode_Lokasi CHAR(10) PRIMARY KEY,
Nama_Lokasi VARCHAR(50)
);

INSERT INTO Lokasi (Kode_Lokasi, Nama_Lokasi)
VALUES
('LOK01', 'Balige'),
('LOK02', 'Laguboti'),
('LOK03', 'Porsea');

CREATE TABLE Pasar (
Kode_Pasar CHAR(10) PRIMARY KEY,
Jenis_Pasar VARCHAR (50)
);

INSERT INTO Pasar (Kode_Pasar, Jenis_Pasar)
VALUES
('JP01', 'Tradisional'),
('JP02', 'Grosir'),
('JP03', 'Modern');

CREATE TABLE Waktu (
Kode_Waktu CHAR(10) PRIMARY KEY,
Tanggal_Bulan_Tahun DATE
);

INSERT INTO Waktu (Kode_Waktu, Tanggal_Bulan_Tahun)
VALUES
('WKT01', '2023-02-01'),
('WKT02', '2023-03-08'),
('WKT03', '2023-04-15'),
('WKT04', '2023-05-22');

CREATE TABLE Harga (
Kode_Harga CHAR(10) PRIMARY KEY,
Kode_Komoditas CHAR(10),
Kode_Lokasi CHAR(10),
Kode_Pasar CHAR(10),
Kode_Waktu CHAR(10),
Harga DECIMAL(18, 2),
FOREIGN KEY (Kode_Komoditas) REFERENCES Komoditas(Kode_Komoditas),
FOREIGN KEY (Kode_Lokasi) REFERENCES Lokasi(Kode_Lokasi),
FOREIGN KEY (Kode_Pasar) REFERENCES Pasar(Kode_Pasar),
FOREIGN KEY (Kode_Waktu) REFERENCES Waktu(Kode_Waktu)
);

INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
-- pasar tradisional balige
  ('HRG001', 'KOM001', 'LOK01', 'JP01', 'WKT01', 12000),
  ('HRG002', 'KOM002', 'LOK01', 'JP01', 'WKT01', 25000),
  ('HRG003', 'KOM003', 'LOK01', 'JP01', 'WKT01', 6000),
  ('HRG004', 'KOM004', 'LOK01', 'JP01', 'WKT01', 40000),
  ('HRG005', 'KOM005', 'LOK01', 'JP01', 'WKT01', 18000),
  ('HRG006', 'KOM006', 'LOK01', 'JP01', 'WKT01', 12000),
  ('HRG007', 'KOM007', 'LOK01', 'JP01', 'WKT01', 9000),
  ('HRG008', 'KOM008', 'LOK01', 'JP01', 'WKT01', 15000),
  ('HRG009', 'KOM009', 'LOK01', 'JP01', 'WKT01', 25000),
  ('HRG010', 'KOM010', 'LOK01', 'JP01', 'WKT01', 8000),

-- pasar grosir balige 
  ('HRG011', 'KOM011', 'LOK01', 'JP02', 'WKT01', 22000),
  ('HRG012', 'KOM012', 'LOK01', 'JP02', 'WKT01', 5000),
  ('HRG013', 'KOM013', 'LOK01', 'JP02', 'WKT01', 100000),
  ('HRG014', 'KOM014', 'LOK01', 'JP02', 'WKT01', 3500),
  ('HRG015', 'KOM015', 'LOK01', 'JP02', 'WKT01', 24000),
  ('HRG016', 'KOM016', 'LOK01', 'JP02', 'WKT01', 8000),
  ('HRG017', 'KOM017', 'LOK01', 'JP02', 'WKT01', 5000),
  ('HRG018', 'KOM018', 'LOK01', 'JP02', 'WKT01', 10000),
  ('HRG019', 'KOM019', 'LOK01', 'JP02', 'WKT01', 15000),
  ('HRG020', 'KOM020', 'LOK01', 'JP02', 'WKT01', 5000),

-- pasar modern balige
  ('HRG021', 'KOM021', 'LOK01', 'JP03', 'WKT01', 3000),
  ('HRG022', 'KOM022', 'LOK01', 'JP03', 'WKT01', 8000),
  ('HRG023', 'KOM023', 'LOK01', 'JP03', 'WKT01', 12000),
  ('HRG024', 'KOM024', 'LOK01', 'JP03', 'WKT01', 5000),
  ('HRG025', 'KOM025', 'LOK01', 'JP03', 'WKT01', 15000),
  ('HRG026', 'KOM026', 'LOK01', 'JP03', 'WKT01', 5000),
  ('HRG027', 'KOM027', 'LOK01', 'JP03', 'WKT01', 7000),
  ('HRG028', 'KOM028', 'LOK01', 'JP03', 'WKT01', 5000),
  ('HRG029', 'KOM029', 'LOK01', 'JP03', 'WKT01', 10000),
  ('HRG030', 'KOM030', 'LOK01', 'JP03', 'WKT01', 6000);
  
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
-- pasar tradisional Laguboti
  ('HRG031', 'KOM001', 'LOK02', 'JP01', 'WKT01', 11500),
  ('HRG032', 'KOM002', 'LOK02', 'JP01', 'WKT01', 24000),
  ('HRG033', 'KOM003', 'LOK02', 'JP01', 'WKT01', 5500),
  ('HRG034', 'KOM004', 'LOK02', 'JP01', 'WKT01', 39000),
  ('HRG035', 'KOM005', 'LOK02', 'JP01', 'WKT01', 17500),
  ('HRG036', 'KOM006', 'LOK02', 'JP01', 'WKT01', 11000),
  ('HRG037', 'KOM007', 'LOK02', 'JP01', 'WKT01', 8500),
  ('HRG038', 'KOM008', 'LOK02', 'JP01', 'WKT01', 14000),
  ('HRG039', 'KOM009', 'LOK02', 'JP01', 'WKT01', 23500),
  ('HRG040', 'KOM010', 'LOK02', 'JP01', 'WKT01', 7500),

-- pasar grosir Laguboti
  ('HRG041', 'KOM011', 'LOK02', 'JP02', 'WKT01', 21000),
  ('HRG042', 'KOM012', 'LOK02', 'JP02', 'WKT01', 4800),
  ('HRG043', 'KOM013', 'LOK02', 'JP02', 'WKT01', 98000),
  ('HRG044', 'KOM014', 'LOK02', 'JP02', 'WKT01', 3200),
  ('HRG045', 'KOM015', 'LOK02', 'JP02', 'WKT01', 23000),
  ('HRG046', 'KOM016', 'LOK02', 'JP02', 'WKT01', 7800),
  ('HRG047', 'KOM017', 'LOK02', 'JP02', 'WKT01', 4800),
  ('HRG048', 'KOM018', 'LOK02', 'JP02', 'WKT01', 9500),
  ('HRG049', 'KOM019', 'LOK02', 'JP02', 'WKT01', 14000),
  ('HRG050', 'KOM020', 'LOK02', 'JP02', 'WKT01', 4800),

-- pasar modern Laguboti
  ('HRG051', 'KOM021', 'LOK02', 'JP03', 'WKT01', 2800),
  ('HRG052', 'KOM022', 'LOK02', 'JP03', 'WKT01', 7500),
  ('HRG053', 'KOM023', 'LOK02', 'JP03', 'WKT01', 11000),
  ('HRG054', 'KOM024', 'LOK02', 'JP03', 'WKT01', 4500),
  ('HRG055', 'KOM025', 'LOK02', 'JP03', 'WKT01', 13000),
  ('HRG056', 'KOM026', 'LOK02', 'JP03', 'WKT01', 4500),
  ('HRG057', 'KOM027', 'LOK02', 'JP03', 'WKT01', 6500),
  ('HRG058', 'KOM028', 'LOK02', 'JP03', 'WKT01', 4500),
  ('HRG059', 'KOM029', 'LOK02', 'JP03', 'WKT01', 9000),
  ('HRG060', 'KOM030', 'LOK02', 'JP03', 'WKT01', 5500);
  
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
-- Pasar Tradisional Porsea
  ('HRG061', 'KOM001', 'LOK03', 'JP01', 'WKT01', 12000),
  ('HRG062', 'KOM002', 'LOK03', 'JP01', 'WKT01', 25000),
  ('HRG063', 'KOM003', 'LOK03', 'JP01', 'WKT01', 6000),
  ('HRG064', 'KOM004', 'LOK03', 'JP01', 'WKT01', 40000),
  ('HRG065', 'KOM005', 'LOK03', 'JP01', 'WKT01', 18000),
  ('HRG066', 'KOM006', 'LOK03', 'JP01', 'WKT01', 12000),
  ('HRG067', 'KOM007', 'LOK03', 'JP01', 'WKT01', 9000),
  ('HRG068', 'KOM008', 'LOK03', 'JP01', 'WKT01', 15000),
  ('HRG069', 'KOM009', 'LOK03', 'JP01', 'WKT01', 24000),
  ('HRG070', 'KOM010', 'LOK03', 'JP01', 'WKT01', 8000),

-- Pasar Grosir Porsea
  ('HRG071', 'KOM011', 'LOK03', 'JP02', 'WKT01', 22000),
  ('HRG072', 'KOM012', 'LOK03', 'JP02', 'WKT01', 5000),
  ('HRG073', 'KOM013', 'LOK03', 'JP02', 'WKT01', 95000),
  ('HRG074', 'KOM014', 'LOK03', 'JP02', 'WKT01', 3500),
  ('HRG075', 'KOM015', 'LOK03', 'JP02', 'WKT01', 22000),
  ('HRG076', 'KOM016', 'LOK03', 'JP02', 'WKT01', 8000),
  ('HRG077', 'KOM017', 'LOK03', 'JP02', 'WKT01', 5000),
  ('HRG078', 'KOM018', 'LOK03', 'JP02', 'WKT01', 10000),
  ('HRG079', 'KOM019', 'LOK03', 'JP02', 'WKT01', 15000),
  ('HRG080', 'KOM020', 'LOK03', 'JP02', 'WKT01', 5000),

-- Pasar Modern Porsea
  ('HRG081', 'KOM021', 'LOK03', 'JP03', 'WKT01', 5000),
  ('HRG082', 'KOM022', 'LOK03', 'JP03', 'WKT01', 8000),
  ('HRG083', 'KOM023', 'LOK03', 'JP03', 'WKT01', 12000),
  ('HRG084', 'KOM024', 'LOK03', 'JP03', 'WKT01', 4000),
  ('HRG085', 'KOM025', 'LOK03', 'JP03', 'WKT01', 18000),
  ('HRG086', 'KOM026', 'LOK03', 'JP03', 'WKT01', 4000),
  ('HRG087', 'KOM027', 'LOK03', 'JP03', 'WKT01', 6000),
  ('HRG088', 'KOM028', 'LOK03', 'JP03', 'WKT01', 4000),
  ('HRG089', 'KOM029', 'LOK03', 'JP03', 'WKT01', 8000),
  ('HRG090', 'KOM030', 'LOK03', 'JP03', 'WKT01', 5000);
  
-- Pasar Tradisional Balige (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG091', 'KOM001', 'LOK01', 'JP01', 'WKT02', 12500.00),
  ('HRG092', 'KOM002', 'LOK01', 'JP01', 'WKT02', 35000.00),
  ('HRG093', 'KOM003', 'LOK01', 'JP01', 'WKT02', 9000.00),
  ('HRG094', 'KOM004', 'LOK01', 'JP01', 'WKT02', 55000.00),
  ('HRG095', 'KOM005', 'LOK01', 'JP01', 'WKT02', 25000.00),
  ('HRG096', 'KOM006', 'LOK01', 'JP01', 'WKT02', 13000.00),
  ('HRG097', 'KOM007', 'LOK01', 'JP01', 'WKT02', 8000.00),
  ('HRG098', 'KOM008', 'LOK01', 'JP01', 'WKT02', 17000.00),
  ('HRG099', 'KOM009', 'LOK01', 'JP01', 'WKT02', 22000.00),
  ('HRG100', 'KOM010', 'LOK01', 'JP01', 'WKT02', 7000.00);

-- Pasar Grosir Balige (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG101', 'KOM011', 'LOK01', 'JP02', 'WKT02', 28000.00),
  ('HRG102', 'KOM012', 'LOK01', 'JP02', 'WKT02', 15000.00),
  ('HRG103', 'KOM013', 'LOK01', 'JP02', 'WKT02', 130000.00),
  ('HRG104', 'KOM014', 'LOK01', 'JP02', 'WKT02', 18000.00),
  ('HRG105', 'KOM015', 'LOK01', 'JP02', 'WKT02', 35000.00),
  ('HRG106', 'KOM016', 'LOK01', 'JP02', 'WKT02', 7000.00),
  ('HRG107', 'KOM017', 'LOK01', 'JP02', 'WKT02', 5000.00),
  ('HRG108', 'KOM018', 'LOK01', 'JP02', 'WKT02', 12000.00),
  ('HRG109', 'KOM019', 'LOK01', 'JP02', 'WKT02', 18000.00),
  ('HRG110', 'KOM020', 'LOK01', 'JP02', 'WKT02', 6000.00);

-- Pasar Modern Balige (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG111', 'KOM021', 'LOK01', 'JP03', 'WKT02', 6000.00),
  ('HRG112', 'KOM022', 'LOK01', 'JP03', 'WKT02', 9000.00),
  ('HRG113', 'KOM023', 'LOK01', 'JP03', 'WKT02', 12000.00),
  ('HRG114', 'KOM024', 'LOK01', 'JP03', 'WKT02', 6000.00),
  ('HRG115', 'KOM025', 'LOK01', 'JP03', 'WKT02', 18000.00),
  ('HRG116', 'KOM026', 'LOK01', 'JP03', 'WKT02', 4000.00),
  ('HRG117', 'KOM027', 'LOK01', 'JP03', 'WKT02', 8000.00),
  ('HRG118', 'KOM028', 'LOK01', 'JP03', 'WKT02', 5000.00),
  ('HRG119', 'KOM029', 'LOK01', 'JP03', 'WKT02', 15000.00),
  ('HRG120', 'KOM030', 'LOK01', 'JP03', 'WKT02', 3000.00);

-- Pasar Tradisional Laguboti (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG121', 'KOM001', 'LOK02', 'JP01', 'WKT02', 13500.00),
  ('HRG122', 'KOM002', 'LOK02', 'JP01', 'WKT02', 38000.00),
  ('HRG123', 'KOM003', 'LOK02', 'JP01', 'WKT02', 9500.00),
  ('HRG124', 'KOM004', 'LOK02', 'JP01', 'WKT02', 59000.00),
  ('HRG125', 'KOM005', 'LOK02', 'JP01', 'WKT02', 27000.00),
  ('HRG126', 'KOM006', 'LOK02', 'JP01', 'WKT02', 14500.00),
  ('HRG127', 'KOM007', 'LOK02', 'JP01', 'WKT02', 8500.00),
  ('HRG128', 'KOM008', 'LOK02', 'JP01', 'WKT02', 17500.00),
  ('HRG129', 'KOM009', 'LOK02', 'JP01', 'WKT02', 23000.00),
  ('HRG130', 'KOM010', 'LOK02', 'JP01', 'WKT02', 7500.00);

-- Pasar Grosir Laguboti (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG131', 'KOM011', 'LOK02', 'JP02', 'WKT02', 29500.00),
  ('HRG132', 'KOM012', 'LOK02', 'JP02', 'WKT02', 16000.00),
  ('HRG133', 'KOM013', 'LOK02', 'JP02', 'WKT02', 138000.00),
  ('HRG134', 'KOM014', 'LOK02', 'JP02', 'WKT02', 19000.00),
  ('HRG135', 'KOM015', 'LOK02', 'JP02', 'WKT02', 37000.00),
  ('HRG136', 'KOM016', 'LOK02', 'JP02', 'WKT02', 7500.00),
  ('HRG137', 'KOM017', 'LOK02', 'JP02', 'WKT02', 5500.00),
  ('HRG138', 'KOM018', 'LOK02', 'JP02', 'WKT02', 13000.00),
  ('HRG139', 'KOM019', 'LOK02', 'JP02', 'WKT02', 19000.00),
  ('HRG140', 'KOM020', 'LOK02', 'JP02', 'WKT02', 6500.00);

-- Pasar Modern Laguboti (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG141', 'KOM021', 'LOK02', 'JP03', 'WKT02', 5500.00),
  ('HRG142', 'KOM022', 'LOK02', 'JP03', 'WKT02', 8000.00),
  ('HRG143', 'KOM023', 'LOK02', 'JP03', 'WKT02', 12500.00),
  ('HRG144', 'KOM024', 'LOK02', 'JP03', 'WKT02', 6500.00),
  ('HRG145', 'KOM025', 'LOK02', 'JP03', 'WKT02', 18500.00),
  ('HRG146', 'KOM026', 'LOK02', 'JP03', 'WKT02', 3500.00),
  ('HRG147', 'KOM027', 'LOK02', 'JP03', 'WKT02', 7500.00),
  ('HRG148', 'KOM028', 'LOK02', 'JP03', 'WKT02', 4800.00),
  ('HRG149', 'KOM029', 'LOK02', 'JP03', 'WKT02', 13500.00),
  ('HRG150', 'KOM030', 'LOK02', 'JP03', 'WKT02', 2800.00);
  
-- Pasar Tradisional Porsea (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG151', 'KOM001', 'LOK03', 'JP01', 'WKT02', 14000.00),
  ('HRG152', 'KOM002', 'LOK03', 'JP01', 'WKT02', 39000.00),
  ('HRG153', 'KOM003', 'LOK03', 'JP01', 'WKT02', 10000.00),
  ('HRG154', 'KOM004', 'LOK03', 'JP01', 'WKT02', 62000.00),
  ('HRG155', 'KOM005', 'LOK03', 'JP01', 'WKT02', 29000.00),
  ('HRG156', 'KOM006', 'LOK03', 'JP01', 'WKT02', 15000.00),
  ('HRG157', 'KOM007', 'LOK03', 'JP01', 'WKT02', 8800.00),
  ('HRG158', 'KOM008', 'LOK03', 'JP01', 'WKT02', 18000.00),
  ('HRG159', 'KOM009', 'LOK03', 'JP01', 'WKT02', 24000.00),
  ('HRG160', 'KOM010', 'LOK03', 'JP01', 'WKT02', 7800.00);

-- Pasar Grosir Porsea (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG161', 'KOM011', 'LOK03', 'JP02', 'WKT02', 30000.00),
  ('HRG162', 'KOM012', 'LOK03', 'JP02', 'WKT02', 16500.00),
  ('HRG163', 'KOM013', 'LOK03', 'JP02', 'WKT02', 142000.00),
  ('HRG164', 'KOM014', 'LOK03', 'JP02', 'WKT02', 19500.00),
  ('HRG165', 'KOM015', 'LOK03', 'JP02', 'WKT02', 38000.00),
  ('HRG166', 'KOM016', 'LOK03', 'JP02', 'WKT02', 7800.00),
  ('HRG167', 'KOM017', 'LOK03', 'JP02', 'WKT02', 5700.00),
  ('HRG168', 'KOM018', 'LOK03', 'JP02', 'WKT02', 13500.00),
  ('HRG169', 'KOM019', 'LOK03', 'JP02', 'WKT02', 19500.00),
  ('HRG170', 'KOM020', 'LOK03', 'JP02', 'WKT02', 6700.00);

-- Pasar Modern Porsea (WKT02)
INSERT INTO Harga (Kode_Harga, Kode_Komoditas, Kode_Lokasi, Kode_Pasar, Kode_Waktu, Harga)
VALUES
  ('HRG171', 'KOM021', 'LOK03', 'JP03', 'WKT02', 7200.00),
  ('HRG172', 'KOM022', 'LOK03', 'JP03', 'WKT02', 10800.00),
  ('HRG173', 'KOM023', 'LOK03', 'JP03', 'WKT02', 16000.00),
  ('HRG174', 'KOM024', 'LOK03', 'JP03', 'WKT02', 9800.00),
  ('HRG175', 'KOM025', 'LOK03', 'JP03', 'WKT02', 27000.00),
  ('HRG176', 'KOM026', 'LOK03', 'JP03', 'WKT02', 5200.00),
  ('HRG177', 'KOM027', 'LOK03', 'JP03', 'WKT02', 9600.00),
  ('HRG178', 'KOM028', 'LOK03', 'JP03', 'WKT02', 6900.00),
  ('HRG179', 'KOM029', 'LOK03', 'JP03', 'WKT02', 17800.00),
  ('HRG180', 'KOM030', 'LOK03', 'JP03', 'WKT02', 4100.00);