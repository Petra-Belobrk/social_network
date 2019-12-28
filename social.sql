-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2019 at 06:47 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `comment`, `commentOn`, `commentBy`, `commentAt`) VALUES
(3, 'blabla', 5, 4, '2019-12-20 11:45:26'),
(4, 'hi', 2, 4, '2019-12-22 22:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followID`, `sender`, `receiver`, `followOn`) VALUES
(2, 4, 1, '0000-00-00 00:00:00'),
(3, 4, 3, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `likeBy`, `likeOn`) VALUES
(1, 4, 11);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(1, 'hi', 4, 1, '2019-12-28 03:00:00', 0),
(3, 'dfgd', 1, 4, '2019-12-28 13:47:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','retweet','like','mention') NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `target`, `type`, `time`, `status`) VALUES
(1, 4, 1, 1, 'mention', '2019-12-27 16:00:00', 1),
(2, 3, 4, 3, 'follow', '2019-12-28 17:52:34', 0),
(3, 1, 4, 14, 'mention', '2019-12-28 17:52:45', 0),
(4, 1, 4, 15, 'mention', '2019-12-28 18:47:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `createdOn`) VALUES
(1, 'php', '0000-00-00 00:00:00'),
(2, 'coding', '0000-00-00 00:00:00'),
(3, 'tag', '2019-12-12 10:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweetID` int(11) NOT NULL,
  `status` varchar(140) NOT NULL,
  `tweetBy` int(11) NOT NULL,
  `retweetID` int(11) NOT NULL,
  `retweetBy` int(11) NOT NULL,
  `tweetImage` varchar(255) NOT NULL,
  `likesCount` int(11) NOT NULL,
  `retweetCount` int(11) NOT NULL,
  `postedOn` datetime NOT NULL,
  `retweetMsg` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweetID`, `status`, `tweetBy`, `retweetID`, `retweetBy`, `tweetImage`, `likesCount`, `retweetCount`, `postedOn`, `retweetMsg`) VALUES
(1, 'Hello', 1, 1, 4, '', 0, 0, '2019-12-10 09:57:51', ''),
(2, 'New', 1, 0, 0, '', 0, 0, '2019-12-10 16:07:31', ''),
(3, '', 4, 0, 0, 'users/68_lrg-800x400.jpg', 0, 0, '2019-12-10 17:09:31', ''),
(5, '#php', 4, 0, 0, '', 0, 0, '2019-12-10 17:28:05', ''),
(6, 'My new #tag', 4, 0, 0, '', 0, 0, '2019-12-12 10:10:06', ''),
(8, 'bla', 4, 0, 0, '', 0, 0, '2019-12-22 23:10:08', ''),
(9, 'bla', 4, 0, 0, '', 0, 0, '2019-12-22 23:10:12', ''),
(11, '', 4, 0, 0, 'users/4153.jpg', 1, 0, '2019-12-22 23:12:50', ''),
(12, 'whaaat!!', 4, 0, 0, '', 0, 0, '2019-12-28 12:54:48', ''),
(13, '#php', 4, 0, 0, 'users/1935.jpg', 0, 0, '2019-12-28 15:48:50', ''),
(14, '@arafel likeee', 4, 0, 0, '', 0, 0, '2019-12-28 17:52:45', ''),
(15, '@arafel likeee', 4, 0, 0, '', 0, 0, '2019-12-28 18:47:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `screenName` varchar(255) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) NOT NULL,
  `followers` int(11) NOT NULL,
  `bio` varchar(140) NOT NULL,
  `country` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screenName`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(1, 'arafel', 'arafel@net.hr', '$2y$12$cAjkJ7GG1YIPKEIOoba8/uyI0YYOCJ9EnEE0PflgNkZ22TA6AKa.6', 'arafel', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 0, 1, '', '', ''),
(3, 'nesto', 'nesto@gmail.com', '$2y$12$MwQN7LCt0e/3qTze7P8WfurakizrVGl4Rnn3AN3mIT769/PscsfTq', '', '', '', 0, 1, '', '', ''),
(4, 'danynew', 'deny@gmail.com', '$2y$12$irOEHnAkzn0MqklXxWScHO54BiAw58QyDHZTjf3jMxDGFNnvBNaaG', 'deny', 'users/profile.jpg', 'assets/images/defaultCoverImage.png', 2, 0, 'nekaj', 'UK', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweetID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
