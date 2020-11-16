SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharecode`
--

CREATE DATABASE sharecode;
USE sharecode;

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`id`, `language_id`, `title`, `description`, `content`, `creation_date`, `author_id`) VALUES
(40, 62, 'Hello World', 'The famous Helloworld in C++.', '#include <iostream>\n\nint main() {\n    std::cout << \"Hello World!\";\n    return 0;\n}', '2020-06-22 19:40:20', 44),
(41, 63, 'Foreach Loop', 'A simple foreach example.', '<?php\n\nforeach ($array as $key => $value) {\n    echo \"$key : $value.\\n\";\n}', '2020-06-22 19:40:20', 42),
(42, 64, 'Check os version', 'The easy way to check you os version.', '$ cat /etc/os-release', '2020-06-22 19:40:20', 44),
(43, 65, 'Bubble Sort', 'Implementation of Bubble Sort - O(n²).', 'def bubbleSort(arr):\n    n = len(arr)\n    for i in range(n):\n        for j in range(0, n-i-1):\n            if arr[j] > arr[j+1] :\n                arr[j], arr[j+1] = arr[j+1], arr[j]\n    return arr', '2020-06-22 19:40:20', 43),
(44, 66, 'Async function', 'A delayed call in javascript.', 'function delayedFunction() {\n    alert(\'Hello\');\n}\nsetTimeout(delayedFunction, 3000);', '2020-06-22 19:40:20', 41),
(45, 67, 'Interface definition', 'Simple interface definition.', 'interface Person {\n    fullName: string;\n    toString();\n}', '2020-06-22 19:40:20', 39),
(46, 68, 'Simple Thread', 'A basic thread implementation.', 'public class MyThread extends Thread {\n    public void run(){\n        System.out.println(\"MyThread running\");\n    }\n}\n    \nMyThread myThread = new MyThread();\nmyTread.start();', '2020-06-22 19:40:20', 43),
(47, 69, 'Properties definition', 'How to define properties.', 'public class SaleItem\n{\n   public string Name { get; set; }\n   public decimal Price { get; set; }\n}', '2020-06-22 19:40:20', 39),
(48, 70, 'Group by Query', 'Group by example.', 'SELECT SUBJECT, YEAR, Count(*)\nFROM Student\nGROUP BY SUBJECT, YEAR;', '2020-06-22 19:40:20', 36),
(49, 64, 'Hello', 'Another helloworld', '$ echo \"hello\"', '2020-06-22 20:28:12', 43),
(50, 68, 'test', 'test description', 'public class test {\r\n    private int id;\r\n}', '2020-06-22 20:33:16', 43);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `fullname`, `shortname`) VALUES
(62, 'C++', 'cpp'),
(63, 'PHP', 'php'),
(64, 'SH', 'sh'),
(65, 'Python', 'py'),
(66, 'Javascript', 'js'),
(67, 'Typescript', 'ts'),
(68, 'Java', 'java'),
(69, 'C#', 'cs'),
(70, 'SQL', 'sql');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nickname` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nickname`, `roles`, `password`) VALUES
(35, 'arturo', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$b2U5M2ozRXY5dlBvR3dwZQ$7emzGwXx3jWHmGaQSNhAQOYW59o30Vtywi1XHcJQUeI'),
(36, 'eladio', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dmtNcnUvc3g2NFl4M3djTQ$/JVXMsujjhDMdmrTZO81tWc6oltB8bvxwUSNzvPtdLE'),
(37, 'alanna', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$a2x3aVVBSzExVWZrTE8ueA$5Ejc7aFuuf+edYciS8ZpQdF1GN8SN2lmOTVuVvWmDQ8'),
(38, 'ben', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dmNycnhxNUxyWFk2bWFlSg$0Serf3W1hOFnyX+pYak5bUPHRXaHtWs5U8Ro63NKy9E'),
(39, 'ayana', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WUwvSy9xem5BU0pkb3hGMQ$sLE34NBW/oQC9/gIkpo0nZwFN2DuTp6CRpe4h9+ar5k'),
(40, 'kris', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$TG0ycE9rUVFZdmRkSXNpRQ$IZa4dC+zXfO5OqrKHXlWzVntCgHCqD/BqIzbPJe/qZk'),
(41, 'nat', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$VWxqMWxjS2hxV2cxZVZaRA$musFnhh+2zRx9/WWGKWOKN9HHnMVk/cJ3Cutwh5nfGM'),
(42, 'delfina', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Y3V1bE14LnRhRFQvMHBtUA$6VTbVlJbSWpFGhOxWmkh8AT3WxM064tRvPytkCNb99o'),
(43, 'icie', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Ty5ISTFlYWdrZVNlTFFaUw$o3IyQaI2dXsAv7wROs2k7icFUdmOHAW64npbSXjjR/A'),
(44, 'pearlie', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ckVncjBueXUyTkNteTVlWA$l4o/mvqUvwE1C1Xaviaf8pL4DqmwqykMjydZlKSHpv8'),
(45, 'totototototo', '[]', '$argon2id$v=19$m=65536,t=4,p=1$dUlsQ3dHYW9hc0V0TjBDQw$LPWD9Egmwv8pX4KzcfkYLgmFh35X+Ztwn+bNWUW4kcA'),
(46, 'azerty', '[]', '$argon2id$v=19$m=65536,t=4,p=1$NDdMdlVJYXE1NVA4bzVMSg$oowU47rdrmE6nUv8APuYxVgivH5PYENkjswMt29JAU4'),
(47, 'tototututoto', '[]', '$argon2id$v=19$m=65536,t=4,p=1$VUhJYmRNdVFIUXlOSWlpUg$worVmm0QjDavsS+OQJTMqTXXJOepOdUBUMz2QmWTJek');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7715309882F1BAF4` (`language_id`),
  ADD KEY `IDX_77153098F675F31B` (`author_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649A188FE64` (`nickname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `code`
--
ALTER TABLE `code`
  ADD CONSTRAINT `FK_7715309882F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `FK_77153098F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
