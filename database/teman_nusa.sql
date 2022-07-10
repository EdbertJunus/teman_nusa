-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2022 at 04:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teman_nusa`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_avatar`
--

CREATE TABLE `ms_avatar` (
  `AvatarId` int(11) NOT NULL,
  `AvatarPrice` int(11) NOT NULL,
  `AvatarImageURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_avatar`
--

INSERT INTO `ms_avatar` (`AvatarId`, `AvatarPrice`, `AvatarImageURL`) VALUES
(1, 50, 'https://i.pravatar.cc/300?u=avatar1'),
(2, 50000, 'https://i.pravatar.cc/300?u=avatar2'),
(3, 500, 'https://i.pravatar.cc/300?u=avatar3\r\n'),
(4, 2500, 'https://i.pravatar.cc/300?u=avatar4');

-- --------------------------------------------------------

--
-- Table structure for table `ms_chat`
--

CREATE TABLE `ms_chat` (
  `ChatId` int(11) NOT NULL,
  `SenderId` int(11) NOT NULL,
  `ReceiverId` int(11) NOT NULL,
  `ChatContent` text NOT NULL,
  `ChatDateTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_chat`
--

INSERT INTO `ms_chat` (`ChatId`, `SenderId`, `ReceiverId`, `ChatContent`, `ChatDateTime`) VALUES
(5, 4, 5, 'Hello Bro', '2022-07-08'),
(6, 5, 7, 'Hallo Edbet', '2022-07-10'),
(7, 5, 7, 'Mau main game gak ?\r\n', '2022-07-10'),
(8, 7, 5, 'Ohh Ayo\r\n', '2022-07-10'),
(9, 7, 5, 'bntr ya, toilet', '2022-07-10'),
(10, 5, 8, 'Hallo', '2022-07-10'),
(11, 8, 5, 'Hallo Juga', '2022-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `ms_job_type`
--

CREATE TABLE `ms_job_type` (
  `JobTypeId` int(11) NOT NULL,
  `JobTypeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_job_type`
--

INSERT INTO `ms_job_type` (`JobTypeId`, `JobTypeName`) VALUES
(6, 'Web Design'),
(7, 'Web Programming'),
(8, 'Machine Learning Specialist'),
(9, 'Digital Marketing'),
(10, 'Data Science'),
(11, 'Accounting'),
(12, 'Data Engineer'),
(13, 'Project Management'),
(14, 'Product Development');

-- --------------------------------------------------------

--
-- Table structure for table `ms_transaction`
--

CREATE TABLE `ms_transaction` (
  `TransactionId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `TransactionDate` date NOT NULL,
  `TransactionType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_transaction`
--

INSERT INTO `ms_transaction` (`TransactionId`, `UserId`, `TransactionDate`, `TransactionType`) VALUES
(4, 4, '2022-07-07', 'Avatar'),
(7, 4, '2022-07-07', 'Top Up Coin'),
(8, 4, '2022-07-07', 'Top Up Coin'),
(9, 4, '2022-07-07', 'Top Up Coin'),
(10, 4, '2022-07-07', 'Change Account Visibility'),
(11, 5, '2022-07-07', 'Top Up Coin'),
(12, 4, '2022-07-07', 'Avatar'),
(13, 4, '2022-07-07', 'Top Up Coin'),
(14, 4, '2022-07-07', 'Top Up Coin'),
(15, 4, '2022-07-07', 'Top Up Coin'),
(16, 4, '2022-07-07', 'Top Up Coin'),
(17, 4, '2022-07-07', 'Avatar'),
(18, 4, '2022-07-07', 'Avatar'),
(19, 4, '2022-07-07', 'Avatar'),
(20, 4, '2022-07-07', 'Top Up Coin'),
(21, 4, '2022-07-07', 'Top Up Coin'),
(22, 4, '2022-07-07', 'Top Up Coin'),
(23, 4, '2022-07-07', 'Top Up Coin'),
(24, 4, '2022-07-07', 'Top Up Coin'),
(25, 4, '2022-07-07', 'Top Up Coin'),
(26, 4, '2022-07-07', 'Top Up Coin'),
(27, 4, '2022-07-07', 'Top Up Coin'),
(28, 4, '2022-07-07', 'Top Up Coin'),
(29, 4, '2022-07-07', 'Top Up Coin'),
(30, 4, '2022-07-07', 'Top Up Coin'),
(31, 4, '2022-07-07', 'Top Up Coin'),
(32, 4, '2022-07-07', 'Avatar'),
(33, 4, '2022-07-07', 'Avatar'),
(34, 5, '2022-07-08', 'Avatar'),
(35, 4, '2022-07-08', 'Change Account Visibility'),
(36, 6, '2022-07-08', 'Top Up Coin'),
(37, 6, '2022-07-08', 'Top Up Coin'),
(38, 6, '2022-07-08', 'Top Up Coin'),
(39, 6, '2022-07-08', 'Top Up Coin'),
(40, 6, '2022-07-08', 'Top Up Coin'),
(41, 6, '2022-07-08', 'Top Up Coin'),
(42, 6, '2022-07-08', 'Top Up Coin'),
(43, 6, '2022-07-08', 'Top Up Coin'),
(44, 6, '2022-07-08', 'Top Up Coin'),
(45, 6, '2022-07-08', 'Top Up Coin'),
(46, 6, '2022-07-08', 'Top Up Coin'),
(47, 6, '2022-07-08', 'Top Up Coin'),
(48, 6, '2022-07-08', 'Top Up Coin'),
(49, 6, '2022-07-08', 'Top Up Coin'),
(50, 6, '2022-07-08', 'Top Up Coin'),
(51, 6, '2022-07-08', 'Top Up Coin'),
(52, 6, '2022-07-08', 'Top Up Coin'),
(53, 6, '2022-07-08', 'Top Up Coin'),
(54, 6, '2022-07-08', 'Top Up Coin'),
(55, 6, '2022-07-08', 'Top Up Coin'),
(56, 6, '2022-07-08', 'Top Up Coin'),
(57, 6, '2022-07-08', 'Top Up Coin'),
(58, 6, '2022-07-08', 'Top Up Coin'),
(59, 6, '2022-07-08', 'Top Up Coin'),
(60, 6, '2022-07-08', 'Top Up Coin'),
(61, 6, '2022-07-08', 'Top Up Coin'),
(62, 6, '2022-07-08', 'Top Up Coin'),
(63, 6, '2022-07-08', 'Top Up Coin'),
(64, 6, '2022-07-08', 'Top Up Coin'),
(65, 6, '2022-07-08', 'Top Up Coin'),
(66, 6, '2022-07-08', 'Top Up Coin'),
(67, 6, '2022-07-08', 'Top Up Coin'),
(68, 6, '2022-07-08', 'Top Up Coin'),
(69, 6, '2022-07-08', 'Top Up Coin'),
(70, 6, '2022-07-08', 'Top Up Coin'),
(71, 6, '2022-07-08', 'Avatar'),
(72, 8, '2022-07-10', 'Top Up Coin'),
(73, 8, '2022-07-10', 'Top Up Coin'),
(74, 8, '2022-07-10', 'Avatar'),
(75, 8, '2022-07-10', 'Avatar'),
(76, 8, '2022-07-10', 'Avatar'),
(77, 8, '2022-07-10', 'Change Account Visibility'),
(78, 8, '2022-07-10', 'Change Account Visibility');

-- --------------------------------------------------------

--
-- Table structure for table `ms_transaction_detail`
--

CREATE TABLE `ms_transaction_detail` (
  `TransactionDetailId` int(11) NOT NULL,
  `TransactionId` int(11) NOT NULL,
  `TransactionItemName` varchar(255) NOT NULL,
  `TransactionImageURL` varchar(255) DEFAULT NULL,
  `TransactionItemPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_transaction_detail`
--

INSERT INTO `ms_transaction_detail` (`TransactionDetailId`, `TransactionId`, `TransactionItemName`, `TransactionImageURL`, `TransactionItemPrice`) VALUES
(2, 4, '1', 'https://i.pravatar.cc/300?u=avatar1', 50),
(5, 7, 'Top Up Coin', NULL, 100),
(6, 8, 'Top Up Coin', NULL, 100),
(7, 9, 'Top Up Coin', NULL, 100),
(8, 10, 'Private', NULL, 50),
(9, 11, 'Top Up Coin', NULL, 100),
(10, 12, '1', 'https://i.pravatar.cc/300?u=avatar1', 50),
(11, 13, 'Top Up Coin', NULL, 100),
(12, 14, 'Top Up Coin', NULL, 100),
(13, 15, 'Top Up Coin', NULL, 100),
(14, 16, 'Top Up Coin', NULL, 100),
(15, 17, '3', 'https://i.pravatar.cc/300?u=avatar3', 500),
(16, 18, '1', 'https://i.pravatar.cc/300?u=avatar1', 50),
(17, 19, '1', 'https://i.pravatar.cc/300?u=avatar1', 50),
(18, 20, 'Top Up Coin', NULL, 100),
(19, 21, 'Top Up Coin', NULL, 100),
(20, 22, 'Top Up Coin', NULL, 100),
(21, 23, 'Top Up Coin', NULL, 100),
(22, 24, 'Top Up Coin', NULL, 100),
(23, 25, 'Top Up Coin', NULL, 100),
(24, 26, 'Top Up Coin', NULL, 100),
(25, 27, 'Top Up Coin', NULL, 100),
(26, 28, 'Top Up Coin', NULL, 100),
(27, 29, 'Top Up Coin', NULL, 100),
(28, 30, 'Top Up Coin', NULL, 100),
(29, 31, 'Top Up Coin', NULL, 100),
(30, 32, '3', 'https://i.pravatar.cc/300?u=avatar3', 500),
(31, 33, '3', 'https://i.pravatar.cc/300?u=avatar3', 500),
(32, 34, '4', 'https://i.pravatar.cc/300?u=avatar4', 2500),
(33, 35, 'Public', NULL, 5),
(34, 36, 'Top Up Coin', NULL, 100),
(35, 37, 'Top Up Coin', NULL, 100),
(36, 38, 'Top Up Coin', NULL, 100),
(37, 39, 'Top Up Coin', NULL, 100),
(38, 40, 'Top Up Coin', NULL, 100),
(39, 41, 'Top Up Coin', NULL, 100),
(40, 42, 'Top Up Coin', NULL, 100),
(41, 43, 'Top Up Coin', NULL, 100),
(42, 44, 'Top Up Coin', NULL, 100),
(43, 45, 'Top Up Coin', NULL, 100),
(44, 47, 'Top Up Coin', NULL, 100),
(45, 48, 'Top Up Coin', NULL, 100),
(46, 49, 'Top Up Coin', NULL, 100),
(47, 52, 'Top Up Coin', NULL, 100),
(48, 53, 'Top Up Coin', NULL, 100),
(49, 54, 'Top Up Coin', NULL, 100),
(50, 56, 'Top Up Coin', NULL, 100),
(51, 57, 'Top Up Coin', NULL, 100),
(52, 58, 'Top Up Coin', NULL, 100),
(53, 59, 'Top Up Coin', NULL, 100),
(54, 60, 'Top Up Coin', NULL, 100),
(55, 61, 'Top Up Coin', NULL, 100),
(56, 63, 'Top Up Coin', NULL, 100),
(57, 64, 'Top Up Coin', NULL, 100),
(58, 65, 'Top Up Coin', NULL, 100),
(59, 66, 'Top Up Coin', NULL, 100),
(60, 67, 'Top Up Coin', NULL, 100),
(61, 68, 'Top Up Coin', NULL, 100),
(62, 69, 'Top Up Coin', NULL, 100),
(63, 70, 'Top Up Coin', NULL, 100),
(64, 71, '4', 'https://i.pravatar.cc/300?u=avatar4', 2500),
(65, 72, 'Top Up Coin', NULL, 100),
(66, 73, 'Top Up Coin', NULL, 100),
(67, 74, '1', 'https://i.pravatar.cc/300?u=avatar1', 50),
(68, 75, '3', 'https://i.pravatar.cc/300?u=avatar3', 500),
(69, 76, '4', 'https://i.pravatar.cc/300?u=avatar4', 2500),
(70, 77, 'Private', NULL, 50),
(71, 78, 'Public', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ms_user`
--

CREATE TABLE `ms_user` (
  `UserId` int(11) NOT NULL,
  `UserFullName` varchar(255) NOT NULL,
  `UserGender` varchar(255) NOT NULL,
  `UserLinkedIn` varchar(255) NOT NULL,
  `UserHandphone` varchar(255) NOT NULL,
  `UserRegisterPrice` int(11) NOT NULL,
  `UserEmail` varchar(255) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserWalletBalance` int(11) NOT NULL,
  `UserAccountType` varchar(255) NOT NULL,
  `UserProfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_user`
--

INSERT INTO `ms_user` (`UserId`, `UserFullName`, `UserGender`, `UserLinkedIn`, `UserHandphone`, `UserRegisterPrice`, `UserEmail`, `UserPassword`, `UserWalletBalance`, `UserAccountType`, `UserProfile`) VALUES
(4, 'Nael', 'Female', 'https://www.linkedin.com/in/naeljeff', '081212345213', 119383, 'naelj15@gmail.com', 'asdasd123', 235, 'Public', 'beruang.jpg'),
(5, 'Kevin Ichi No Kata', 'Female', 'https://www.linkedin.com/in/kevintan', '12345678910', 110725, 'demonslayer@gmail.com', 'asdasd123', 6975, 'Public', 'beruang.jpg'),
(6, 'Edbert', 'Male', 'https://www.linkedin.com/in/edbertyang', '081260521234', 100885, 'edbertyang88@gmail.com', 'asdasd123', 100, 'Public', 'whitebear.jpg'),
(7, 'Edbert Junus', 'Male', 'https://www.linkedin.com/in/edbertyang', '812605583388', 120289, 'edbert002@binus.ac.id', 'asdasd123', 4811, 'Public', 'beruang.jpg'),
(8, 'Andi', 'Male', 'https://www.linkedin.com/in/edbert', '081260521212', 104596, 'andi@gmail.com', 'asdasd123', 17599, 'Public', 'panda.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ms_user_avatar_collection`
--

CREATE TABLE `ms_user_avatar_collection` (
  `AvatarCollectionId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `AvatarId` int(11) NOT NULL,
  `SenderUserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_user_avatar_collection`
--

INSERT INTO `ms_user_avatar_collection` (`AvatarCollectionId`, `UserId`, `AvatarId`, `SenderUserId`) VALUES
(12, 6, 1, 4),
(13, 4, 1, NULL),
(15, 6, 3, 4),
(16, 4, 3, NULL),
(17, 5, 4, NULL),
(18, 6, 4, NULL),
(19, 8, 1, NULL),
(20, 8, 3, NULL),
(22, 4, 4, 8),
(23, 7, 1, 5),
(24, 7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ms_user_chosen_job`
--

CREATE TABLE `ms_user_chosen_job` (
  `ChosenJobId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `JobTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_user_chosen_job`
--

INSERT INTO `ms_user_chosen_job` (`ChosenJobId`, `UserId`, `JobTypeId`) VALUES
(1, 4, 8),
(2, 4, 10),
(3, 4, 11),
(4, 4, 13),
(5, 5, 6),
(6, 5, 9),
(7, 5, 14),
(8, 6, 6),
(9, 6, 7),
(10, 6, 11),
(11, 7, 6),
(12, 7, 10),
(13, 7, 14),
(14, 8, 7),
(15, 8, 11),
(16, 8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `ms_wishlist`
--

CREATE TABLE `ms_wishlist` (
  `WishListId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `FavoritedUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_wishlist`
--

INSERT INTO `ms_wishlist` (`WishListId`, `UserId`, `FavoritedUserId`) VALUES
(8, 4, 3),
(12, 4, 5),
(13, 5, 4),
(14, 5, 6),
(15, 6, 4),
(16, 8, 5),
(17, 7, 5),
(18, 5, 7),
(19, 5, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ms_avatar`
--
ALTER TABLE `ms_avatar`
  ADD PRIMARY KEY (`AvatarId`);

--
-- Indexes for table `ms_chat`
--
ALTER TABLE `ms_chat`
  ADD PRIMARY KEY (`ChatId`),
  ADD KEY `SenderId` (`SenderId`),
  ADD KEY `ReceiverId` (`ReceiverId`);

--
-- Indexes for table `ms_job_type`
--
ALTER TABLE `ms_job_type`
  ADD PRIMARY KEY (`JobTypeId`);

--
-- Indexes for table `ms_transaction`
--
ALTER TABLE `ms_transaction`
  ADD PRIMARY KEY (`TransactionId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `ms_transaction_detail`
--
ALTER TABLE `ms_transaction_detail`
  ADD PRIMARY KEY (`TransactionDetailId`),
  ADD KEY `TransactionId` (`TransactionId`);

--
-- Indexes for table `ms_user`
--
ALTER TABLE `ms_user`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `ms_user_avatar_collection`
--
ALTER TABLE `ms_user_avatar_collection`
  ADD PRIMARY KEY (`AvatarCollectionId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `AvatarId` (`AvatarId`);

--
-- Indexes for table `ms_user_chosen_job`
--
ALTER TABLE `ms_user_chosen_job`
  ADD PRIMARY KEY (`ChosenJobId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `JobTypeId` (`JobTypeId`);

--
-- Indexes for table `ms_wishlist`
--
ALTER TABLE `ms_wishlist`
  ADD PRIMARY KEY (`WishListId`),
  ADD KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ms_avatar`
--
ALTER TABLE `ms_avatar`
  MODIFY `AvatarId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ms_chat`
--
ALTER TABLE `ms_chat`
  MODIFY `ChatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ms_job_type`
--
ALTER TABLE `ms_job_type`
  MODIFY `JobTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ms_transaction`
--
ALTER TABLE `ms_transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `ms_transaction_detail`
--
ALTER TABLE `ms_transaction_detail`
  MODIFY `TransactionDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `ms_user`
--
ALTER TABLE `ms_user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ms_user_avatar_collection`
--
ALTER TABLE `ms_user_avatar_collection`
  MODIFY `AvatarCollectionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ms_user_chosen_job`
--
ALTER TABLE `ms_user_chosen_job`
  MODIFY `ChosenJobId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ms_wishlist`
--
ALTER TABLE `ms_wishlist`
  MODIFY `WishListId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ms_chat`
--
ALTER TABLE `ms_chat`
  ADD CONSTRAINT `ms_chat_ibfk_1` FOREIGN KEY (`SenderId`) REFERENCES `ms_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ms_chat_ibfk_2` FOREIGN KEY (`ReceiverId`) REFERENCES `ms_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ms_transaction`
--
ALTER TABLE `ms_transaction`
  ADD CONSTRAINT `ms_transaction_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `ms_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ms_transaction_detail`
--
ALTER TABLE `ms_transaction_detail`
  ADD CONSTRAINT `ms_transaction_detail_ibfk_1` FOREIGN KEY (`TransactionId`) REFERENCES `ms_transaction` (`TransactionId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ms_user_avatar_collection`
--
ALTER TABLE `ms_user_avatar_collection`
  ADD CONSTRAINT `ms_user_avatar_collection_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `ms_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ms_user_avatar_collection_ibfk_2` FOREIGN KEY (`AvatarId`) REFERENCES `ms_avatar` (`AvatarId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ms_user_chosen_job`
--
ALTER TABLE `ms_user_chosen_job`
  ADD CONSTRAINT `ms_user_chosen_job_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `ms_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ms_user_chosen_job_ibfk_2` FOREIGN KEY (`JobTypeId`) REFERENCES `ms_job_type` (`JobTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ms_wishlist`
--
ALTER TABLE `ms_wishlist`
  ADD CONSTRAINT `ms_wishlist_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `ms_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
