-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2022 at 06:35 PM
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
(33, 4, '2022-07-07', 'Avatar');

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
(31, 33, '3', 'https://i.pravatar.cc/300?u=avatar3', 500);

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
(4, 'Nael', 'Female', 'https://www.linkedin.com/in/naeljeff', '081212345213', 119383, 'naelj15@gmail.com', 'asdasd123', 240, 'Private', 'beruang.jpg'),
(5, 'Kevin Ichi No Kata', 'Female', 'https://www.linkedin.com/in/kevintan', '12345678910', 110725, 'demonslayer@gmail.com', 'asdasd123', 9475, 'Public', 'beruang.jpg'),
(6, 'Edbert', 'Male', 'https://www.linkedin.com/in/edbertyang', '081260521234', 100885, 'edbertyang88@gmail.com', 'asdasd123', 100, 'Public', 'whitebear.jpg');

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
(9, 5, 3, 4),
(10, 5, 1, 4),
(12, 6, 1, 4),
(13, 4, 1, NULL),
(15, 6, 3, 4),
(16, 4, 3, NULL);

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
(10, 6, 11);

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
(8, 4, 3);

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
  MODIFY `ChatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ms_job_type`
--
ALTER TABLE `ms_job_type`
  MODIFY `JobTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ms_transaction`
--
ALTER TABLE `ms_transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ms_transaction_detail`
--
ALTER TABLE `ms_transaction_detail`
  MODIFY `TransactionDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `ms_user`
--
ALTER TABLE `ms_user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ms_user_avatar_collection`
--
ALTER TABLE `ms_user_avatar_collection`
  MODIFY `AvatarCollectionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ms_user_chosen_job`
--
ALTER TABLE `ms_user_chosen_job`
  MODIFY `ChosenJobId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ms_wishlist`
--
ALTER TABLE `ms_wishlist`
  MODIFY `WishListId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
