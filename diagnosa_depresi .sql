-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Nov 2021 pada 09.25
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
(1, 'Sering merasa sedih'),
(2, 'Kelelahan melakukan \r\naktivitas'),
(3, 'Kurang berkonsentrasi'),
(4, 'Bosan atau jenuh'),
(5, 'Sering melamun'),
(6, 'Tidak bersemangat'),
(7, 'Sering galau'),
(8, 'Pesimis mengenai masa \r\ndepan'),
(9, 'Sering menangis dengan \r\nalasan yang tidak jelas '),
(10, 'Pola tidur terganggu'),
(11, 'Sering cemas'),
(12, 'Kecewa dengan diri sendiri'),
(13, 'Terganggu dengan segala \r\nhal'),
(14, 'Lebih sering terlihat murung'),
(15, 'Kehilangan minat dalam \r\nkegiatan atau hobi yang dulu \r\ndisenangi'),
(16, 'Kesepian'),
(17, 'Mempunyai perasaan \r\nbersalah'),
(18, 'Mempunyai perasaan \r\ndihukum'),
(19, 'Mempunyai perasaan benci \r\nterhadap diri sendiri '),
(20, 'Mudah tersinggung'),
(21, 'Kehilangan selera makan'),
(22, 'Khawatir tentang \r\npenampilan'),
(23, 'Sangat sensitif atau mudah \r\nmarah terhadap orang \r\ndisekitar'),
(24, 'Lebih suka menyendiri'),
(25, 'Mempunyai pikiran untuk \r\nbunuh diri'),
(26, 'Sulit mengambil keputusan'),
(27, 'Sulit melakukan kegiatan \r\ndengan baik'),
(28, 'Ada perubahan penambahan \r\natau penurunan berat badan'),
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
(9, 'M', 6, 0.7, 0.3),
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
  `solusi` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `nama_penyakit`, `kode_penyakit`, `solusi`) VALUES
(1, 'Gangguan Mood', 'M', 'Untuk mengatasi gangguan mood, yang anda dapat lakukan adalah menjalani gaya hidup sehat. Gaya hidup sehat yang dimaksud adalah olahraga yang teratur, tidur yang cukup, mengkonsumsi makanan sehat, dan mengelola stress agar dapat menjaga mood agar tetap stabil'),
(2, 'Depresi Ringan', 'R', 'Untuk mengatasi depresi ringan, anda harus mencoba untuk mencoba melakukan hal-hal baru yang menyenangkan dengan orang-orang terdekat, sehingga apabila jika anda merasa sulit, orang-orang terdekat anda dapat membantu anda mengatasi depresi ringan yang anda alami serta dapat meningkatkan suasana hati. Selain itu, anda juga dapat melakukan olahraga yang intens karena olahraga dapat memicu otak untuk mengeluarkan hormon endorfin yang dapat mengurangi stress. '),
(3, 'Depresi Sedang', 'S', 'Untuk mengatasi depresi sedang, anda dapat mencari teman-teman terdekat agar suasana hati dapat merasa lebih baik. Selain itu kamu juga dapat mengunjungi psikolog klinis untuk menceritakan apa yang anda alami serta mendapatkan nasihat yang tepat untuk depresi sedang yang anda alami. Untuk membantu meringankan depresi anda, anda dapat melakukan meditasi dan terapi cahaya secara rutin.'),
(4, 'Depresi Berat', 'B', 'Untuk mengatasi depresi berat, anda harus mengunjungi psikolog maupun psikiater terdekat untuk melakukan konsultasi dan pengecekan terhadap depresi yang anda alami serta mendapatkan terapi maupun pengobatan yang tepat dari psikiater atau psikolog yang anda kunjungi. Selain itu, penyesuaian gaya hidup juga diperlukan untuk membantu meringankan gejala-gejalanya. Anda juga perlu mencari dukungan dari keluarga atau orang-orang terdekat anda agar mereka dapat memberikan ketenangan dan mempercepat proses penyembuhan depresi berat yang anda alami');

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
