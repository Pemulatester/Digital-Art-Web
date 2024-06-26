-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2024 pada 12.55
-- Versi server: 8.2.0
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `username` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`user_id`, `first_name`, `last_name`, `password`, `username`) VALUES
(1, 'testAdmin', 'tests', '12345678', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buy`
--

CREATE TABLE `buy` (
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total` int NOT NULL,
  `order_id` int NOT NULL,
  `autoincrement` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buy`
--

INSERT INTO `buy` (`product_id`, `user_id`, `quantity`, `total`, `order_id`, `autoincrement`) VALUES
(1, 1, 2, 20000, 1, 1),
(3, 1, 10, 200000, 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total` int NOT NULL,
  `autoincrement` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Manhwa'),
(2, 'Anime'),
(3, 'Full Art');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupon`
--

CREATE TABLE `coupon` (
  `coupon_code` varchar(50) NOT NULL,
  `money` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `coupon`
--

INSERT INTO `coupon` (`coupon_code`, `money`) VALUES
('1122', 10000),
('1233', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `status`) VALUES
(1, 1, 'pending'),
(2, 1, 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` int NOT NULL,
  `icon_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `date_added`, `description`, `price`, `icon_name`) VALUES
(1, 'fanart', 1, '2024-06-25 00:00:00', 'Baguss', 10000, 'chibi.jpeg'),
(2, 'Nahida 4K', 2, '2024-06-25 00:00:00', 'Nahida WANGYYYYYYYYY', 200000, 'nahida 4k (2).jpg'),
(3, 'fanart genshin', 1, '2024-06-26 00:00:00', 'Human', 20000, 'ffcef82c84fa012b823b68a95d337025.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sellers`
--

CREATE TABLE `sellers` (
  `usr_id` int NOT NULL,
  `usr_name` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sellers`
--

INSERT INTO `sellers` (`usr_id`, `usr_name`, `first_name`, `last_name`, `password`) VALUES
(1, 'seller', 'Artis', 'Tristan', '12345678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userss`
--

CREATE TABLE `userss` (
  `user_id` int NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(34) NOT NULL,
  `wallet` int NOT NULL,
  `address` varchar(200) NOT NULL,
  `username` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `userss`
--

INSERT INTO `userss` (`user_id`, `first_name`, `last_name`, `password`, `wallet`, `address`, `username`) VALUES
(1, 'a', 'a', '12345678', 199880000, 'a', 'a'),
(3, 'c', 'c', '12345678', 0, 'c', 'c');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`autoincrement`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`autoincrement`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_code`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`usr_id`);

--
-- Indeks untuk tabel `userss`
--
ALTER TABLE `userss`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buy`
--
ALTER TABLE `buy`
  MODIFY `autoincrement` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `autoincrement` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
