-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Okt 2021 pada 15.17
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diagnosa_depresi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `nama_gejala` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `nama_gejala`) VALUES
(1, 'Sedih'),
(2, 'Kelelahan melakukan aktivitas'),
(3, 'kurang berkonsentrasi'),
(4, 'Bosan atau jenuh'),
(5, 'Sering melamun'),
(6, 'Tidak bersemangat'),
(7, 'Sering galau'),
(8, 'Pesimis mengenai masa depan'),
(9, 'Sering menangis dengan alasan yang tidak jelas '),
(10, 'Mempunyai gangguan tidur atau insomnia'),
(11, 'Sering cemas'),
(12, 'Kecewa dengan diri sendiri'),
(13, 'Terganggu dengan segala hal'),
(14, 'Lebih sering terlihat murung'),
(15, 'Kehilangan minat dalam kegiatan atau hobi yang dulu disenangi'),
(16, 'Kesepian'),
(17, 'Mempunyai perasaan bersalah'),
(18, 'Mempunyai perasaan dihukum'),
(19, 'Mempunyai perasaan benci terhadap diri sendiri'),
(20, 'Mudah tersinggung'),
(21, 'Kehilangan selera makan'),
(22, 'Khawatir tentang penampilan'),
(23, 'Sangat sensitif atau mudah marah terhadap orang di sekitar'),
(24, 'Lebih suka menyendiri'),
(25, 'Mempunyai pikiran untuk bunuh diri'),
(26, 'Sulit mengambil keputusan'),
(27, 'Sulit melakukan kegiatan dengan baik'),
(28, 'Ada perubahan penambahan atau penurunan berat badan'),
(29, 'Kurang percaya diri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengetahuan`
--

CREATE TABLE `pengetahuan` (
  `id_pengetahuan` int(11) NOT NULL,
  `kode_penyakit` varchar(100) NOT NULL,
  `id_gejala` int(12) NOT NULL,
  `mb` float NOT NULL,
  `md` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengetahuan`
--

INSERT INTO `pengetahuan` (`id_pengetahuan`, `kode_penyakit`, `id_gejala`, `mb`, `md`) VALUES
(1, 'M', 1, 0.75, 0.25),
(2, 'M', 2, 0.75, 0.25),
(3, 'M', 3, 0.75, 0.25),
(4, 'M', 4, 0.85, 0.15),
(5, 'M', 5, 0.75, 0.25),
(6, 'M', 7, 0.75, 0.25),
(7, 'R', 1, 0.75, 0.25),
(8, 'R', 2, 0.75, 0.25),
(9, 'R', 6, 0.7, 0.3),
(10, 'R', 8, 0.65, 0.35),
(11, 'R', 10, 0.75, 0.25),
(12, 'R', 11, 0.7, 0.3),
(13, 'R', 14, 0.65, 0.35),
(14, 'R', 15, 0.8, 0.2),
(15, 'R', 16, 0.75, 0.25),
(16, 'R', 22, 0.65, 0.35),
(17, 'S', 1, 0.75, 0.25),
(18, 'S', 9, 0.65, 0.35),
(19, 'S', 12, 0.65, 0.35),
(20, 'S', 13, 0.6, 0.4),
(21, 'S', 16, 0.75, 0.25),
(22, 'S', 17, 0.75, 0.25),
(23, 'S', 20, 0.65, 0.35),
(24, 'S', 23, 0.7, 0.3),
(25, 'S', 27, 0.75, 0.25),
(26, 'B', 1, 0.75, 0.25),
(27, 'B', 9, 0.65, 0.35),
(28, 'B', 12, 0.65, 0.35),
(29, 'B', 13, 0.6, 0.4),
(30, 'B', 17, 0.75, 0.25),
(31, 'B', 18, 0.75, 0.25),
(32, 'B', 19, 0.75, 0.25),
(33, 'B', 21, 0.75, 0.25),
(34, 'B', 24, 0.65, 0.35),
(35, 'B', 25, 0.8, 0.2),
(36, 'B', 26, 0.75, 0.25),
(37, 'B', 28, 0.75, 0.25),
(38, 'B', 29, 0.85, 0.15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `nama_penyakit` varchar(100) NOT NULL,
  `kode_penyakit` varchar(100) NOT NULL,
  `solusi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `nama_penyakit`, `kode_penyakit`, `solusi`) VALUES
(1, 'Gangguan Mood', 'M', 'Olahraga setiap pagi dan tersenyum serta selalu berpikir positif'),
(2, 'Depresi Ringan', 'R', 'Olahraga, melakukan terapi cahaya, menulis suasana hati dalam buku harian dan menyimpannya, dapatkan dukungan dari kelompok atau orang terdekat'),
(3, 'Depresi Sedang', 'S', 'Meditasi, Mencari teman curhat, mengalihkan pikiran dengan melakukan hobi, konsultasi ke psikiater atau psikolog klinis '),
(4, 'Depresi Berat', 'B', 'Rutin berolahraga, berpikir positif, meditasi, terapi cahaya, terapi kognitif, konsultasi ke psikiater atau psikolog klinis');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indeks untuk tabel `pengetahuan`
--
ALTER TABLE `pengetahuan`
  ADD PRIMARY KEY (`id_pengetahuan`);

--
-- Indeks untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `pengetahuan`
--
ALTER TABLE `pengetahuan`
  MODIFY `id_pengetahuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
