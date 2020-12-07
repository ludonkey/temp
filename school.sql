SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

CREATE DATABASE school;
USE school;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `classname` varchar(255) NOT NULL,
  `mainTeacherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `classname`, `mainTeacherId`) VALUES
(1, 'Gryffindor', 8),
(2, 'Hufflepuff', 3),
(3, 'Ravenclaw', 6),
(4, 'Slytherin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `classId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `firstname`, `lastname`, `classId`) VALUES
(1, 'Lavender', 'Brown', 1),
(2, 'Seamus', 'Finnigan', 1),
(3, 'Hermione', 'Granger', 1),
(7, 'Ernie', 'Macmillan', 2),
(8, 'Hannah', 'Abbott', 2),
(9, 'Justin', 'Finch-Fletchley', 2),
(10, 'Terry', 'Boot', NULL),
(11, 'Mandy', 'Brocklehurst', NULL),
(12, 'Michael', 'Corner', NULL),
(13, 'Millicent', 'Bulstrode', 4),
(14, 'Vincent', 'Crabbe', 4),
(15, 'Tracey', 'Davis', 4),
(16, 'Neville', 'Longbottom', 1),
(17, 'Parvati', 'Patil', 1),
(18, 'Harry', 'Potter', NULL),
(19, 'Susan', 'Bones', 2),
(20, 'Megan', 'Jones', 2),
(21, 'Anthony', 'Goldstein', NULL),
(22, 'Su', 'Li', NULL),
(23, 'Morag', 'McDougal', NULL),
(24, 'Gregory', 'Goyle', 4),
(25, 'Daphne', 'Greengrass', 4),
(26, 'Draco', 'Malfoy', 4),
(27, 'Dean', 'Thomas', 1),
(28, 'Ronald', 'Weasley', 1),
(29, 'Padma', 'Patil', NULL),
(30, 'Lisa', 'Turpin', NULL),
(31, 'Theodore', 'Nott', 4),
(32, 'Pansy', 'Parkinson', 4),
(33, 'Blaise', 'Zabini', 4);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`) VALUES
(1, 'Astronomy'),
(2, 'Charms'),
(3, 'Dark Arts'),
(4, 'Flying'),
(5, 'Herbology'),
(6, 'History of Magic'),
(7, 'Potions'),
(8, 'Transfiguration'),
(9, 'Arithmancy'),
(10, 'Divination');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `firstname`, `lastname`) VALUES
(1, 'Severus', 'Snape'),
(2, 'Sybill', 'Trelawney'),
(3, 'Pomona', 'Sprout'),
(4, 'Remus', 'Lupin'),
(5, 'Rubeus', 'Hagrid'),
(6, 'Filius', 'Flitwick'),
(7, 'Albus', 'Dumbledore'),
(8, 'Minerva', 'McGonagall'),
(9, 'Aurora', 'Sinistra'),
(10, 'Amycus', 'Carrow'),
(11, 'Rolanda', 'Hooch'),
(12, 'Horace', 'Slughorn');

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

CREATE TABLE `teaching` (
  `teacherId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`teacherId`, `subjectId`) VALUES
(1, 3),
(1, 7),
(3, 5),
(6, 2),
(8, 8),
(9, 1),
(10, 3),
(11, 4),
(12, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CLASS_MAIN_TEACHER_ID` (`mainTeacherId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_STUDENT_CLASSID` (`classId`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teaching`
--
ALTER TABLE `teaching`
  ADD PRIMARY KEY (`teacherId`,`subjectId`),
  ADD KEY `subjectId` (`subjectId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `FK_CLASS_MAIN_TEACHER_ID` FOREIGN KEY (`mainTeacherId`) REFERENCES `teacher` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_STUDENT_CLASSID` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_STUDENT_CLASS_ID` FOREIGN KEY (`classId`) REFERENCES `class` (`id`);

--
-- Constraints for table `teaching`
--
ALTER TABLE `teaching`
  ADD CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`),
  ADD CONSTRAINT `teaching_ibfk_2` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
