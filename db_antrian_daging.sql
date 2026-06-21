-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.4.32-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.15.0.7171
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk db_antrian_qurban
CREATE DATABASE IF NOT EXISTS `db_antrian_qurban` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_antrian_qurban`;

-- membuang struktur untuk table db_antrian_qurban.antrian
CREATE TABLE IF NOT EXISTS `antrian` (
  `id_antrian` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_antrian` int(11) NOT NULL,
  `id_warga` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `status` enum('menunggu','dipanggil','selesai') DEFAULT 'menunggu',
  `waktu_daftar` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_dipanggil` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_antrian`),
  KEY `id_warga` (`id_warga`),
  KEY `id_wilayah` (`id_wilayah`),
  CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`id_warga`) REFERENCES `data_warga` (`id_warga`),
  CONSTRAINT `antrian_ibfk_2` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id_wilayah`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_antrian_qurban.antrian: ~10 rows (lebih kurang)
DELETE FROM `antrian`;
INSERT INTO `antrian` (`id_antrian`, `nomor_antrian`, `id_warga`, `id_wilayah`, `status`, `waktu_daftar`, `waktu_dipanggil`) VALUES
	(1, 1, 1, 1, 'selesai', '2026-04-20 00:05:00', '2026-04-20 00:30:00'),
	(2, 2, 2, 1, 'selesai', '2026-04-20 00:10:00', '2026-04-20 00:45:00'),
	(3, 3, 3, 2, 'selesai', '2026-04-20 00:12:00', '2026-04-20 01:00:00'),
	(4, 4, 4, 2, 'selesai', '2026-04-20 00:15:00', '2026-04-20 01:15:00'),
	(5, 5, 5, 3, 'selesai', '2026-04-20 00:20:00', '2026-04-20 01:30:00'),
	(6, 6, 6, 3, 'selesai', '2026-04-20 00:22:00', '2026-04-20 01:45:00'),
	(7, 7, 7, 4, 'selesai', '2026-04-20 00:30:00', '2026-04-20 02:00:00'),
	(8, 8, 8, 4, 'selesai', '2026-04-20 00:35:00', '2026-05-03 05:21:04'),
	(9, 9, 9, 5, 'selesai', '2026-04-20 00:40:00', '2026-05-03 05:21:14'),
	(10, 10, 10, 5, 'menunggu', '2026-04-20 00:45:00', NULL);

-- membuang struktur untuk table db_antrian_qurban.data_warga
CREATE TABLE IF NOT EXISTS `data_warga` (
  `id_warga` int(11) NOT NULL AUTO_INCREMENT,
  `nik` char(16) NOT NULL,
  `nama_warga` varchar(100) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `id_wilayah` int(11) NOT NULL,
  PRIMARY KEY (`id_warga`),
  UNIQUE KEY `nik` (`nik`),
  KEY `id_wilayah` (`id_wilayah`),
  CONSTRAINT `data_warga_ibfk_1` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id_wilayah`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_antrian_qurban.data_warga: ~10 rows (lebih kurang)
DELETE FROM `data_warga`;
INSERT INTO `data_warga` (`id_warga`, `nik`, `nama_warga`, `no_hp`, `id_wilayah`) VALUES
	(1, '1801012501000001', 'Poppy Andarwati', '081234567890', 1),
	(2, '1801012501000002', 'Arafi Akbar', '081234567891', 1),
	(3, '1801012501000003', 'Zarava Ayu', '081234567892', 2),
	(4, '1801012501000004', 'Arkana Danu', '081234567893', 2),
	(5, '1801012501000005', 'Keira Azzahra', '081234567894', 3),
	(6, '1801012501000006', 'Dion Pratama', '081234567895', 3),
	(7, '1801012501000007', 'Agum Putra', '081234567896', 4),
	(8, '1801012501000008', 'Hana Maira', '081234567897', 4),
	(9, '1801012501000009', 'Rakana Alam', '081234567898', 5),
	(10, '1801012501000010', 'Alan Diansyah', '081234567899', 5);

-- membuang struktur untuk table db_antrian_qurban.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_antrian_qurban.user: ~2 rows (lebih kurang)
DELETE FROM `user`;
INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`, `created_at`) VALUES
	(1, 'admin', 'admin123', 'Panitia Qurban Utama', '2026-05-01 08:46:12'),
	(2, 'petugas1', 'petugas123', 'Ahmad Fauzan', '2026-05-01 08:46:12');

-- membuang struktur untuk table db_antrian_qurban.wilayah
CREATE TABLE IF NOT EXISTS `wilayah` (
  `id_wilayah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_wilayah` varchar(50) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_wilayah`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_antrian_qurban.wilayah: ~5 rows (lebih kurang)
DELETE FROM `wilayah`;
INSERT INTO `wilayah` (`id_wilayah`, `nama_wilayah`, `keterangan`) VALUES
	(1, 'RT 01/RW 01', 'Blok A - Sebelah Masjid'),
	(2, 'RT 02/RW 01', 'Blok B - Dekat Posyandu'),
	(3, 'RT 01/RW 02', 'Blok C - Perumahan Baru'),
	(4, 'RT 02/RW 02', 'Blok D - Gang Melati'),
	(5, 'RT 01/RW 03', 'Blok E - Ujung Selatan');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
