-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 10, 2018 lúc 06:10 AM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nns_cusc_2408`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `active`
--

CREATE TABLE `active` (
  `a_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `a_name` text NOT NULL,
  `a_begin` date NOT NULL,
  `a_end` date NOT NULL,
  `a_note` text,
  `a_img` text NOT NULL,
  `a_number` int(8) NOT NULL,
  `a_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `active`
--

INSERT INTO `active` (`a_id`, `u_id`, `a_name`, `a_begin`, `a_end`, `a_note`, `a_img`, `a_number`, `a_active`, `created_at`, `updated_at`) VALUES
('1544153789', '114234', 'Khám phá tri thức', '2018-08-01', '2018-12-07', '<p>Tháng khám phá tri thức</p>', 'not img', 500, 1, '2018-12-07 03:36:29', '2018-12-07 04:17:10'),
('1544239611', '114234', 'Tháng vàng việc làm', '2018-12-01', '2018-12-30', '<p>tháng 12 trung t&acirc;m t&ocirc;̉ chức sự ki&ecirc;̣n học hỏi tham quan tại các c&ocirc;ng ty TP HCM</p>', 'not img', 5000, 1, '2018-12-08 03:26:51', '2018-12-08 05:06:49'),
('1544243150', '114234', 'Tuần lễ vàng', '2018-12-08', '2018-12-15', '<p>T&ocirc;̉ chức cu&ocirc;̣c thi thi&ecirc;́t k&ecirc;́ đ&ocirc;̀ họa</p>', 'not img', 1000, -1, '2018-12-08 04:25:50', '2018-12-08 04:26:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `active_achievement`
--

CREATE TABLE `active_achievement` (
  `aa_id` varchar(80) NOT NULL,
  `a_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `aa_name` text NOT NULL,
  `aa_scores` int(8) NOT NULL,
  `aa_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `active_achievement`
--

INSERT INTO `active_achievement` (`aa_id`, `a_id`, `cc_id`, `c_id`, `aa_name`, `aa_scores`, `aa_active`, `created_at`, `updated_at`) VALUES
('1544070358', '1544024917', '1536650574', '1536650607', 'Chủ nhiệm', 10, 1, '2018-12-06 04:25:58', '2018-12-06 04:25:58'),
('1544070424', '1544024917', '1536650574', '1536650607', 'Phụ việc', 5, 1, '2018-12-06 04:27:04', '2018-12-06 04:27:04'),
('1544153855', '1544153789', '1537695639', '1536650607', 'Trưởng nhóm', 10, 1, '2018-12-07 03:37:35', '2018-12-08 14:38:40'),
('1544153876', '1544153789', '1537694589', '1536626095', 'Thuyết trình', 8, 1, '2018-12-07 03:37:56', '2018-12-10 02:04:39'),
('1544407444', '1544153789', '1537694550', '1536626095', 'a', 1, 0, '2018-12-10 02:04:04', '2018-12-10 02:04:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assignment`
--

CREATE TABLE `assignment` (
  `as_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `cl_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `assignment`
--

INSERT INTO `assignment` (`as_id`, `u_id`, `cl_id`, `created_at`, `updated_at`) VALUES
('1544377452', '1544011582', '1544014477', '2018-12-09 17:44:12', '2018-12-09 17:44:12'),
('1544377453', '1544011582', '1544014750', '2018-12-09 17:44:12', '2018-12-09 17:44:12'),
('1544377454', '1544011582', '1544014776', '2018-12-09 17:44:12', '2018-12-09 17:44:12'),
('1544377455', '1544011582', '1544014794', '2018-12-09 17:44:12', '2018-12-09 17:44:12'),
('1544377456', '1544011582', '1544014819', '2018-12-09 17:44:12', '2018-12-09 17:44:12'),
('1544377458', '1544011582', '1544014847', '2018-12-09 17:44:13', '2018-12-09 17:44:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `c_id` varchar(80) NOT NULL,
  `c_item` varchar(8) NOT NULL,
  `c_name` text NOT NULL,
  `c_max_scores` int(11) NOT NULL,
  `c_type` int(11) NOT NULL,
  `c_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`c_id`, `c_item`, `c_name`, `c_max_scores`, `c_type`, `c_active`, `created_at`, `updated_at`) VALUES
('1536626095', 'B', 'CHUYÊN ĐỀ CHUYÊN MÔN', 60, 0, 1, '2018-09-11 00:34:55', '2018-09-10 17:51:37'),
('1536626114', 'C', 'DIỄN ĐÀN, CÂU LẠC BỘ, CÁC DỰ ÁN MÃ NGUỒN MỞ', 10000000, 1, 1, '2018-09-11 00:35:14', '2018-09-11 00:35:14'),
('1536626129', 'D', 'RÈN LUYỆN', 10000000, 1, 1, '2018-09-11 00:35:29', '2018-09-11 00:35:29'),
('1536626141', 'E', 'CÁC KỲ THI NHÓM 1(tính điểm cao nhất): CUSC talent, Creative Cup … cấp CUSC, Trường', 10000000, 1, 1, '2018-09-11 00:35:41', '2018-09-11 00:35:41'),
('1536626159', 'F', 'CÁC KỲ THI NHÓM 2 (tính điểm cao nhất): Các kỳ thi cấp tỉnh, thành phố …', 10000000, 1, 1, '2018-09-11 00:35:59', '2018-09-11 00:24:39'),
('1536627156', 'G', 'CÁC KỲ THI NHÓM 3(tính điểm cao nhất): Các kỳ thi quốc tế …', 10000000, 1, 1, '2018-09-11 00:52:36', '2018-09-11 00:52:36'),
('1536627170', 'H', 'HỌC TẬP', 10000000, 1, 1, '2018-09-11 00:52:50', '2018-09-11 00:52:50'),
('1536627194', 'I', 'TẶNG ĐIỂM', 10000000, 1, 1, '2018-09-11 00:53:14', '2018-09-11 00:53:14'),
('1536650607', 'A', 'ANH VĂN (Hoặc tương đương)', 60, 0, 1, '2018-09-11 07:23:27', '2018-09-11 00:24:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_child`
--

CREATE TABLE `category_child` (
  `cc_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `cc_item` varchar(8) NOT NULL COMMENT 'tieu muc cho muc con',
  `cc_name` text NOT NULL COMMENT 'ten muc con',
  `cc_max_scores` int(11) NOT NULL COMMENT 'Số điểm tối đa của 1 lần thực hiện',
  `cc_max_amount` int(11) NOT NULL COMMENT 'so luong cho phep tren mot don vi thoi gian',
  `cc_max_scores_cycle` int(11) NOT NULL COMMENT 'Số điểm tối đa có thể cho trong một chu kỳ',
  `cc_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category_child`
--

INSERT INTO `category_child` (`cc_id`, `c_id`, `cc_item`, `cc_name`, `cc_max_scores`, `cc_max_amount`, `cc_max_scores_cycle`, `cc_active`, `created_at`, `updated_at`) VALUES
('1536650574', '1536650607', '1', 'TOEIC – 255 đến 400', 20, 2, 10000000, 1, '2018-09-11 07:22:54', '2018-11-29 15:25:39'),
('1536737853', '1536627194', '1', 'Sinh viên các trường ĐH, CĐ đăng ký thành viên với CUSC', 2, 1, 2, 1, '2018-09-12 07:37:33', '2018-09-23 03:14:10'),
('1537694308', '1536650607', '2', 'TOEIC – 405 đến 600', 40, 1, 40, 1, '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694489', '1536650607', '3', 'TOEIC trên 600', 60, 1, 60, 1, '2018-09-23 09:21:29', '2018-09-23 09:21:29'),
('1537694550', '1536626095', '1', 'Tổ chức chuyên đề', 10, 3, 30, 1, '2018-09-23 09:22:30', '2018-09-23 09:22:30'),
('1537694589', '1536626095', '2', 'Báo cáo chuyên đề', 10, 3, 10, 1, '2018-09-23 09:23:09', '2018-11-23 09:28:03'),
('1537694620', '1536626095', '3', 'Tham dự chuyên đề', 2, 5, 10, 1, '2018-09-23 09:23:40', '2018-09-23 09:23:40'),
('1537694681', '1536626114', '1', 'Quản trị diễn đàn/ Chủ nhiệm câu lạc bộ, cập nhật mã nguồn cho dự án nguồn mở (hoạt động tích cực).', 10, 3, 10, 1, '2018-09-23 09:24:41', '2018-09-23 02:35:29'),
('1537695396', '1536626114', '2', 'Viết bài cho diễn đàn, câu lạc bộ, hỗ trợ các thành viên khác trong các dự án mã nguồn mở', 4, 4, 16, 1, '2018-09-23 09:36:36', '2018-09-23 09:36:36'),
('1537695526', '1536626114', '3', 'Tham gia mức thanh thành viên tích cực đăng nhập', 2, 5, 2, 1, '2018-09-23 09:38:46', '2018-11-23 09:28:19'),
('1537695568', '1536626129', '1', 'Tham quan kiến tập', 10, 1, 10, 1, '2018-09-23 09:39:28', '2018-09-23 09:39:28'),
('1537695611', '1536626129', '2', 'Tham dự OpenHouse', 5, 1, 5, 1, '2018-09-23 09:40:11', '2018-09-23 09:40:11'),
('1537695639', '1536626129', '3', 'Hoàn thành thực tập thực tế', 40, 1, 40, 1, '2018-09-23 09:40:39', '2018-09-23 09:40:39'),
('1537695699', '1536626129', '4', 'Làm việc thêm đúng chuyên ngành', 20, 1, 20, 1, '2018-09-23 09:41:39', '2018-09-23 09:41:39'),
('1537695743', '1536626129', '5', 'Hoàn thành mục tiêu đăng ký', 20, 1, 20, 1, '2018-09-23 09:42:23', '2018-09-23 09:42:23'),
('1537695797', '1536626141', '1', 'Tham gia', 10, 1, 10000000, 1, '2018-09-23 09:43:17', '2018-09-23 09:43:17'),
('1537695854', '1536626141', '2', 'Qua vòng sơ loại', 15, 1, 10000000, 1, '2018-09-23 09:44:14', '2018-09-23 09:44:14'),
('1537695885', '1536626141', '3', 'Khuyến khích', 20, 1, 10000000, 1, '2018-09-23 09:44:45', '2018-09-23 09:44:45'),
('1537695915', '1536626141', '4', 'Ba', 40, 1, 10000000, 1, '2018-09-23 09:45:15', '2018-09-23 09:45:15'),
('1537695937', '1536626141', '5', 'Nhì', 60, 1, 10000000, 1, '2018-09-23 09:45:37', '2018-09-23 09:45:37'),
('1537695961', '1536626141', '6', 'Nhất', 80, 1, 10000000, 1, '2018-09-23 09:46:01', '2018-09-23 09:46:01'),
('1537696027', '1536626159', '1', 'Tham giam', 10, 1, 10000000, 1, '2018-09-23 09:47:07', '2018-09-23 09:47:07'),
('1537696054', '1536626159', '2', 'Qua vòng sơ loại', 15, 1, 10000000, 1, '2018-09-23 09:47:34', '2018-09-23 09:47:34'),
('1537696109', '1536626159', '3', 'Khuyến khích', 30, 1, 10000000, 1, '2018-09-23 09:48:29', '2018-09-23 09:48:29'),
('1537696134', '1536626159', '4', 'Ba', 60, 1, 10000000, 1, '2018-09-23 09:48:54', '2018-09-23 09:48:54'),
('1537696160', '1536626159', '5', 'Nhì', 80, 1, 10000000, 1, '2018-09-23 09:49:20', '2018-09-23 09:49:20'),
('1537696216', '1536626159', '6', 'Nhất', 100, 1, 10000000, 1, '2018-09-23 09:50:16', '2018-09-23 09:50:16'),
('1537697113', '1536627156', '2', 'Qua vòng sơ loại', 15, 1, 15, 1, '2018-09-23 10:05:13', '2018-09-23 10:05:13'),
('1537697143', '1536627156', '3', 'Khuyến khích', 70, 1, 70, 1, '2018-09-23 10:05:43', '2018-09-23 10:05:43'),
('1537697195', '1536627156', '1', 'Tham gia', 10, 1, 10, 1, '2018-09-23 10:06:35', '2018-09-23 10:06:35'),
('1537697310', '1536627156', '4', 'Ba', 100, 1, 100, 1, '2018-09-23 10:08:30', '2018-09-23 10:08:30'),
('1537697352', '1536627156', '5', 'Nhì', 120, 1, 120, 1, '2018-09-23 10:09:12', '2018-09-23 10:09:12'),
('1537697382', '1536627156', '6', 'Nhất', 150, 1, 150, 1, '2018-09-23 10:09:42', '2018-09-23 10:09:42'),
('1537697421', '1536627170', '1', 'Hoàn thành mỗi khóa/workshop', 10, 1, 10, 1, '2018-09-23 10:10:21', '2018-09-23 10:10:21'),
('1537697445', '1536627170', '2', 'Điểm trung bình học kỳ >= 75%', 40, 1, 40, 1, '2018-09-23 10:10:45', '2018-09-23 10:10:45'),
('1537697468', '1536627170', '3', 'Điểm trung bình học kỳ >= 60%', 25, 1, 25, 1, '2018-09-23 10:11:08', '2018-09-23 10:11:08'),
('1537697489', '1536627170', '4', 'Điểm trung bình học kỳ >= 40%', 10, 1, 10, 1, '2018-09-23 10:11:29', '2018-09-23 03:11:40'),
('1537697527', '1536627170', '5', 'Không vi phạm kỷ luật', 15, 1, 15, 1, '2018-09-23 10:12:07', '2018-09-23 10:12:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_child_has_cycle`
--

CREATE TABLE `category_child_has_cycle` (
  `ccc_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `cy_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category_child_has_cycle`
--

INSERT INTO `category_child_has_cycle` (`ccc_id`, `cc_id`, `cy_id`, `created_at`, `updated_at`) VALUES
('1536650574', '1536650574', '1536305998', '2018-09-11 07:22:54', '2018-11-29 15:25:39'),
('1536737853', '1536737853', '1536306362', '2018-09-12 07:37:33', '2018-09-23 03:14:10'),
('1537694308', '1537694308', '1536305998', '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694489', '1537694489', '1536305998', '2018-09-23 09:21:29', '2018-09-23 09:21:29'),
('1537694550', '1537694550', '1536305998', '2018-09-23 09:22:30', '2018-09-23 09:22:30'),
('1537694589', '1537694589', '1536305998', '2018-09-23 09:23:09', '2018-11-23 09:28:03'),
('1537694620', '1537694620', '1536305998', '2018-09-23 09:23:40', '2018-09-23 09:23:40'),
('1537694682', '1537694681', '1536305998', '2018-09-23 09:24:42', '2018-09-23 02:35:29'),
('1537695396', '1537695396', '1536305998', '2018-09-23 09:36:36', '2018-09-23 09:36:36'),
('1537695526', '1537695526', '1536305998', '2018-09-23 09:38:46', '2018-11-23 09:28:19'),
('1537695568', '1537695568', '1536306397', '2018-09-23 09:39:28', '2018-09-23 09:39:28'),
('1537695611', '1537695611', '1536306411', '2018-09-23 09:40:11', '2018-09-23 09:40:11'),
('1537695639', '1537695639', '1536306397', '2018-09-23 09:40:39', '2018-09-23 09:40:39'),
('1537695699', '1537695699', '1536305998', '2018-09-23 09:41:39', '2018-09-23 09:41:39'),
('1537695743', '1537695743', '1536305998', '2018-09-23 09:42:23', '2018-09-23 09:42:23'),
('1537695797', '1537695797', '1536305998', '2018-09-23 09:43:17', '2018-09-23 09:43:17'),
('1537695854', '1537695854', '1536305998', '2018-09-23 09:44:14', '2018-09-23 09:44:14'),
('1537695885', '1537695885', '1536305998', '2018-09-23 09:44:45', '2018-09-23 09:44:45'),
('1537695915', '1537695915', '1536305998', '2018-09-23 09:45:15', '2018-09-23 09:45:15'),
('1537695937', '1537695937', '1536305998', '2018-09-23 09:45:37', '2018-09-23 09:45:37'),
('1537695961', '1537695961', '1536305998', '2018-09-23 09:46:01', '2018-09-23 09:46:01'),
('1537696028', '1537696027', '1536305998', '2018-09-23 09:47:08', '2018-09-23 09:47:08'),
('1537696054', '1537696054', '1536305998', '2018-09-23 09:47:34', '2018-09-23 09:47:34'),
('1537696109', '1537696109', '1536305998', '2018-09-23 09:48:29', '2018-09-23 09:48:29'),
('1537696134', '1537696134', '1536305998', '2018-09-23 09:48:54', '2018-09-23 09:48:54'),
('1537696160', '1537696160', '1536305998', '2018-09-23 09:49:20', '2018-09-23 09:49:20'),
('1537696216', '1537696216', '1536305998', '2018-09-23 09:50:16', '2018-09-23 09:50:16'),
('1537697083', '1537697083', '1536305998', '2018-09-23 10:04:43', '2018-09-23 10:04:43'),
('1537697113', '1537697113', '1536305998', '2018-09-23 10:05:13', '2018-09-23 10:05:13'),
('1537697143', '1537697143', '1536305998', '2018-09-23 10:05:43', '2018-09-23 10:05:43'),
('1537697195', '1537697195', '1536305998', '2018-09-23 10:06:35', '2018-09-23 10:06:35'),
('1537697310', '1537697310', '1536305998', '2018-09-23 10:08:30', '2018-09-23 10:08:30'),
('1537697352', '1537697352', '1536305998', '2018-09-23 10:09:12', '2018-09-23 10:09:12'),
('1537697382', '1537697382', '1536305998', '2018-09-23 10:09:42', '2018-09-23 10:09:42'),
('1537697421', '1537697421', '1536306362', '2018-09-23 10:10:21', '2018-09-23 10:10:21'),
('1537697446', '1537697445', '1536305998', '2018-09-23 10:10:46', '2018-09-23 10:10:46'),
('1537697468', '1537697468', '1536305998', '2018-09-23 10:11:08', '2018-09-23 10:11:08'),
('1537697489', '1537697489', '1536305998', '2018-09-23 10:11:29', '2018-09-23 03:11:40'),
('1537697527', '1537697527', '1536306397', '2018-09-23 10:12:07', '2018-09-23 10:12:07'),
('1542216508', '1542216508', '1536306362', '2018-11-14 17:28:28', '2018-11-14 17:28:28'),
('1542441965', '1542441965', '1536306397', '2018-11-17 08:06:05', '2018-11-17 01:06:22'),
('1544324942', '1544324942', '1536306411', '2018-12-09 03:09:02', '2018-12-09 03:28:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_child_has_roles`
--

CREATE TABLE `category_child_has_roles` (
  `ccr_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `r_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category_child_has_roles`
--

INSERT INTO `category_child_has_roles` (`ccr_id`, `cc_id`, `r_id`, `created_at`, `updated_at`) VALUES
('1537694308', '1537694308', '1536238582', '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694309', '1537694308', '1536238635', '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694490', '1537694489', '1536238582', '2018-09-23 09:21:30', '2018-09-23 09:21:30'),
('1537694491', '1537694489', '1536238635', '2018-09-23 09:21:30', '2018-09-23 09:21:30'),
('1537694550', '1537694550', '1536286076', '2018-09-23 09:22:30', '2018-09-23 09:22:30'),
('1537694620', '1537694620', '1536286076', '2018-09-23 09:23:40', '2018-09-23 09:23:40'),
('1537695329', '1537694681', '0826eaf8086b01749bf7ff65742a200c', '2018-09-23 09:35:29', '2018-09-23 09:35:29'),
('1537695396', '1537695396', '0826eaf8086b01749bf7ff65742a200c', '2018-09-23 09:36:36', '2018-09-23 09:36:36'),
('1537695568', '1537695568', '1536286076', '2018-09-23 09:39:28', '2018-09-23 09:39:28'),
('1537695611', '1537695611', '1536286076', '2018-09-23 09:40:11', '2018-09-23 09:40:11'),
('1537695639', '1537695639', '1536286076', '2018-09-23 09:40:39', '2018-09-23 09:40:39'),
('1537695699', '1537695699', '1536286076', '2018-09-23 09:41:39', '2018-09-23 09:41:39'),
('1537695743', '1537695743', '0826eaf8086b01749bf7ff65742a200c', '2018-09-23 09:42:23', '2018-09-23 09:42:23'),
('1537695744', '1537695743', '1536238582', '2018-09-23 09:42:23', '2018-09-23 09:42:23'),
('1537695745', '1537695743', '1536286076', '2018-09-23 09:42:23', '2018-09-23 09:42:23'),
('1537695797', '1537695797', '1536286076', '2018-09-23 09:43:17', '2018-09-23 09:43:17'),
('1537695798', '1537695797', '1536653649', '2018-09-23 09:43:17', '2018-09-23 09:43:17'),
('1537695854', '1537695854', '1536286076', '2018-09-23 09:44:14', '2018-09-23 09:44:14'),
('1537695855', '1537695854', '1536653649', '2018-09-23 09:44:14', '2018-09-23 09:44:14'),
('1537695885', '1537695885', '1536286076', '2018-09-23 09:44:45', '2018-09-23 09:44:45'),
('1537695886', '1537695885', '1536653649', '2018-09-23 09:44:45', '2018-09-23 09:44:45'),
('1537695915', '1537695915', '1536286076', '2018-09-23 09:45:15', '2018-09-23 09:45:15'),
('1537695916', '1537695915', '1536653649', '2018-09-23 09:45:15', '2018-09-23 09:45:15'),
('1537695937', '1537695937', '1536286076', '2018-09-23 09:45:37', '2018-09-23 09:45:37'),
('1537695938', '1537695937', '1536653649', '2018-09-23 09:45:37', '2018-09-23 09:45:37'),
('1537695961', '1537695961', '1536286076', '2018-09-23 09:46:01', '2018-09-23 09:46:01'),
('1537695962', '1537695961', '1536653649', '2018-09-23 09:46:01', '2018-09-23 09:46:01'),
('1537696028', '1537696027', '1536286076', '2018-09-23 09:47:08', '2018-09-23 09:47:08'),
('1537696029', '1537696027', '1536653649', '2018-09-23 09:47:08', '2018-09-23 09:47:08'),
('1537696054', '1537696054', '1536286076', '2018-09-23 09:47:34', '2018-09-23 09:47:34'),
('1537696055', '1537696054', '1536653649', '2018-09-23 09:47:34', '2018-09-23 09:47:34'),
('1537696109', '1537696109', '1536286076', '2018-09-23 09:48:29', '2018-09-23 09:48:29'),
('1537696110', '1537696109', '1536653649', '2018-09-23 09:48:29', '2018-09-23 09:48:29'),
('1537696134', '1537696134', '1536286076', '2018-09-23 09:48:55', '2018-09-23 09:48:55'),
('1537696136', '1537696134', '1536653649', '2018-09-23 09:48:55', '2018-09-23 09:48:55'),
('1537696160', '1537696160', '1536286076', '2018-09-23 09:49:20', '2018-09-23 09:49:20'),
('1537696161', '1537696160', '1536653649', '2018-09-23 09:49:20', '2018-09-23 09:49:20'),
('1537696216', '1537696216', '1536286076', '2018-09-23 09:50:16', '2018-09-23 09:50:16'),
('1537696218', '1537696216', '1536653649', '2018-09-23 09:50:17', '2018-09-23 09:50:17'),
('1537697083', '1537697083', '1536286076', '2018-09-23 10:04:43', '2018-09-23 10:04:43'),
('1537697113', '1537697113', '1536286076', '2018-09-23 10:05:13', '2018-09-23 10:05:13'),
('1537697143', '1537697143', '1536286076', '2018-09-23 10:05:43', '2018-09-23 10:05:43'),
('1537697195', '1537697195', '1536286076', '2018-09-23 10:06:35', '2018-09-23 10:06:35'),
('1537697310', '1537697310', '1536286076', '2018-09-23 10:08:30', '2018-09-23 10:08:30'),
('1537697352', '1537697352', '1536286076', '2018-09-23 10:09:12', '2018-09-23 10:09:12'),
('1537697382', '1537697382', '1536286076', '2018-09-23 10:09:42', '2018-09-23 10:09:42'),
('1537697421', '1537697421', '1536238582', '2018-09-23 10:10:21', '2018-09-23 10:10:21'),
('1537697446', '1537697445', '1536238582', '2018-09-23 10:10:46', '2018-09-23 10:10:46'),
('1537697468', '1537697468', '1536238582', '2018-09-23 10:11:08', '2018-09-23 10:11:08'),
('1537697500', '1537697489', '1536238582', '2018-09-23 10:11:40', '2018-09-23 10:11:40'),
('1537697527', '1537697527', '1536286076', '2018-09-23 10:12:07', '2018-09-23 10:12:07'),
('1537697650', '1536737853', '1536238635', '2018-09-23 10:14:10', '2018-09-23 10:14:10'),
('1537697651', '1536737853', '1536653712', '2018-09-23 10:14:10', '2018-09-23 10:14:10'),
('1542216508', '1542216508', '1536286076', '2018-11-14 17:28:28', '2018-11-14 17:28:28'),
('1542441982', '1542441965', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-17 08:06:22', '2018-11-17 08:06:22'),
('1542990483', '1537694589', '1536286076', '2018-11-23 16:28:03', '2018-11-23 16:28:03'),
('1542990499', '1537695526', '0826eaf8086b01749bf7ff65742a200c', '2018-11-23 16:28:19', '2018-11-23 16:28:19'),
('1543505140', '1536650574', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-29 15:25:40', '2018-11-29 15:25:40'),
('1543505141', '1536650574', '1536238582', '2018-11-29 15:25:40', '2018-11-29 15:25:40'),
('1544326137', '1544324942', 'b2cba2a7a5499bd67320ba3d4046dc2e', '2018-12-09 03:28:57', '2018-12-09 03:28:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `cl_id` varchar(80) NOT NULL,
  `cl_name` varchar(45) DEFAULT NULL,
  `cl_code` varchar(16) NOT NULL,
  `cl_active` tinyint(4) NOT NULL,
  `u_manager_id` varchar(80) NOT NULL,
  `sy_id` varchar(80) NOT NULL,
  `m_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`cl_id`, `cl_name`, `cl_code`, `cl_active`, `u_manager_id`, `sy_id`, `m_id`, `created_at`, `updated_at`) VALUES
('1544014477', 'Lập trình viên Quốc tế K1', 'CL0001', 1, '1544006432', '1536293003', '1536300555', '2018-12-05 12:54:37', '2018-12-05 12:54:37'),
('1544014750', 'Lập trình viên Quốc tế Khóa K2', 'CL0002', 1, '1544006432', '1536293003', '1536300555', '2018-12-05 12:59:10', '2018-12-05 12:59:10'),
('1544014776', 'Mỹ thuật đa phương tiện K1', 'CL0003', 1, '1544006491', '1536293003', '1536301079', '2018-12-05 12:59:36', '2018-12-05 12:59:36'),
('1544014794', 'Mỹ thuật đa phương tiện K2', 'CL0004', 1, '1544006491', '1536293003', '1536301079', '2018-12-05 12:59:54', '2018-12-05 12:59:54'),
('1544014819', 'An toàn an ninh thông tin K1', 'CL0005', 1, '1544006529', '1536293003', '1536301128', '2018-12-05 13:00:19', '2018-12-05 13:00:19'),
('1544014847', 'An toàn an ninh thông tin K2', 'CL0006', 1, '1544006529', '1536293003', '1536301128', '2018-12-05 13:00:47', '2018-12-05 13:00:47'),
('1544106544', 'Phát triển ứng dụng Android K1', 'CL0007', 1, '1544006570', '1536293003', '1536301140', '2018-12-06 14:29:04', '2018-12-06 14:29:04'),
('1544106585', 'Phát triển ứng dụng Android K2', 'CL0008', 1, '1544006570', '1536293003', '1536301140', '2018-12-06 14:29:45', '2018-12-06 14:29:45'),
('1544106633', 'Cao đẳng Thiết kế đồ họa K1', 'CL0009', 1, '1544006432', '1536290446', '1536301151', '2018-12-06 14:30:33', '2018-12-06 14:30:33'),
('1544106688', 'Cao đẳng Thiết kế đồ họa K2', 'CL0010', 1, '1544006432', '1536293003', '1536301151', '2018-12-06 14:31:28', '2018-12-06 14:31:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `cm_id` varchar(80) NOT NULL,
  `ss_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `cm_note` text NOT NULL,
  `cm_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cycle`
--

CREATE TABLE `cycle` (
  `cy_id` varchar(80) NOT NULL,
  `cy_name` text NOT NULL,
  `cy_long` text NOT NULL,
  `cy_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cycle`
--

INSERT INTO `cycle` (`cy_id`, `cy_name`, `cy_long`, `cy_active`, `created_at`, `updated_at`) VALUES
('1536305998', 'Mỗi học kỳ', '6 tháng', 1, '2018-09-07 07:39:58', '2018-09-07 07:25:10'),
('1536306362', 'Khóa LTV Quốc tế', 'Toàn khóa học', 1, '2018-09-07 07:46:02', '2018-12-07 02:21:31'),
('1536306397', 'Hàng năm', 'Một năm', 1, '2018-09-07 07:46:37', '2018-09-07 07:46:37'),
('1536306411', 'Hằng quý', 'Một quý', 1, '2018-09-07 07:46:51', '2018-09-07 07:46:51'),
('1544149129', 'Khóa Mỹ Thuật ĐPT', 'Toàn khóa học', 1, '2018-12-07 02:18:49', '2018-12-07 02:21:39'),
('1544149167', 'Khóa An toàn ANTT', 'Toàn khóa học', 1, '2018-12-07 02:19:27', '2018-12-07 02:21:53'),
('1544149190', 'Toàn khóa PTUD Android', 'Toàn khóa học', 1, '2018-12-07 02:19:50', '2018-12-07 02:19:50'),
('1544149214', 'Khóa CĐ TK Đồ họa', 'Toàn khóa học', 1, '2018-12-07 02:20:14', '2018-12-07 02:21:18'),
('1544149229', 'Khóa CNTT Anh Quốc', 'Toàn khóa học', 1, '2018-12-07 02:20:29', '2018-12-07 02:21:47'),
('1544149246', 'Khóa QTM doanh nghiệp', 'Toàn khóa học', 1, '2018-12-07 02:20:46', '2018-12-07 02:21:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cycle_select`
--

CREATE TABLE `cycle_select` (
  `cs_id` varchar(80) NOT NULL,
  `cy_id` varchar(80) NOT NULL,
  `cs_name` text NOT NULL,
  `cs_begin` text NOT NULL,
  `cs_end` text NOT NULL,
  `cs_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cycle_select`
--

INSERT INTO `cycle_select` (`cs_id`, `cy_id`, `cs_name`, `cs_begin`, `cs_end`, `cs_active`, `created_at`, `updated_at`) VALUES
('1544081410', '1536305998', 'Học kỳ I', 'Tháng 9 hằng năm', 'Tháng 12 hằng năm', 1, '2018-12-06 07:30:10', '2018-12-06 07:30:10'),
('1544081466', '1536305998', 'Học kỳ II', 'Tháng 1 hằng năm', 'Tháng 5 hằng năm', 1, '2018-12-06 07:31:06', '2018-12-06 07:31:06'),
('1544081507', '1536305998', 'Học kỳ hè', 'Tháng 5 hằng năm', 'Tháng 8 hằng năm', 1, '2018-12-06 07:31:47', '2018-12-06 07:32:06'),
('1544109479', '1536306397', 'Hằng năm học', '01-01-2017', '12-12-2017', 1, '2018-12-06 15:17:59', '2018-12-07 02:34:59'),
('1544147075', '1536306411', 'Quý 1', '01-01 Hằng năm', '31-03 Hằng năm', 1, '2018-12-07 01:44:35', '2018-12-07 01:44:35'),
('1544147144', '1536306411', 'Quý 2', '1-4 Hằng năm', '30-6 Hằng năm', 1, '2018-12-07 01:45:44', '2018-12-07 01:45:44'),
('1544147215', '1536306411', 'Quý 3', '1-7 Hằng năm', '30-9 Hằng năm', 1, '2018-12-07 01:46:55', '2018-12-07 01:46:55'),
('1544147266', '1536306411', 'Quý 4', '1-10 Hằng năm', '31-12 Hằng năm', 1, '2018-12-07 01:47:46', '2018-12-07 01:47:46'),
('1544147527', '1544149214', 'CĐ Thiết kế Đồ họa', 'Khai giảng hằng năm', 'Bế giảng', 1, '2018-12-07 01:52:07', '2018-12-07 02:28:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `default_entity`
--

CREATE TABLE `default_entity` (
  `d_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `cy_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `default_entity`
--

INSERT INTO `default_entity` (`d_id`, `ec_id`, `cy_id`, `created_at`, `updated_at`) VALUES
('1536305998', '1544147977', '1536305998', '2018-12-07 02:30:20', '2018-12-07 02:30:20'),
('1544148728', '1544148728', '1544149214', '2018-12-07 02:33:54', '2018-12-07 02:33:54'),
('1544150155', '1544150155', '1536306397', '2018-12-07 02:36:59', '2018-12-09 18:50:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `entity_cycle`
--

CREATE TABLE `entity_cycle` (
  `ec_id` varchar(80) NOT NULL,
  `cs_id` varchar(80) NOT NULL,
  `cy_id` varchar(80) NOT NULL,
  `ec_name` text NOT NULL,
  `ec_begin` date NOT NULL,
  `ec_end` date NOT NULL,
  `ec_commit` varchar(2) DEFAULT NULL,
  `ec_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `entity_cycle`
--

INSERT INTO `entity_cycle` (`ec_id`, `cs_id`, `cy_id`, `ec_name`, `ec_begin`, `ec_end`, `ec_commit`, `ec_active`, `created_at`, `updated_at`) VALUES
('1544147977', '1544081410', '1536305998', 'Học kỳ I K1', '2018-09-01', '2018-12-31', NULL, 1, '2018-12-07 01:59:37', '2018-12-07 01:59:37'),
('1544148080', '1544081466', '1536305998', 'Học kỳ II K1', '2019-01-01', '2019-05-30', NULL, 1, '2018-12-07 02:01:20', '2018-12-07 02:30:56'),
('1544148154', '1544081507', '1536305998', 'Học kỳ hè K1', '2019-06-01', '2019-08-30', NULL, 1, '2018-12-07 02:02:34', '2018-12-07 02:03:02'),
('1544148258', '1544081410', '1536305998', 'Học kỳ I K2', '2019-09-01', '2019-12-31', NULL, 1, '2018-12-07 02:04:18', '2018-12-07 02:04:18'),
('1544148384', '1544081466', '1536305998', 'Học kỳ II K2', '2020-01-01', '2020-05-30', NULL, 1, '2018-12-07 02:06:24', '2018-12-07 02:32:20'),
('1544148429', '1544081507', '1536305998', 'Học kỳ hè K2', '2020-06-01', '2020-08-30', NULL, 1, '2018-12-07 02:07:09', '2018-12-07 02:07:09'),
('1544148728', '1544147527', '1544149214', 'CĐ Thiết kế Đồ họa K1', '2018-08-01', '2020-05-30', NULL, 1, '2018-12-07 02:12:08', '2018-12-07 02:33:00'),
('1544148761', '1544147527', '1544149214', 'CĐ Thiết kế Đồ họa K2', '2019-08-01', '2021-05-30', NULL, 1, '2018-12-07 02:12:41', '2018-12-07 02:33:12'),
('1544150155', '1544109479', '1536306397', 'Năm 2018', '2018-01-01', '2018-12-31', NULL, 1, '2018-12-07 02:35:55', '2018-12-09 18:49:04'),
('1544150184', '1544109479', '1536306397', 'Năm 2019', '2019-01-01', '2019-12-31', NULL, 1, '2018-12-07 02:36:24', '2018-12-07 02:36:24'),
('1544150292', '1544147075', '1536306411', 'Quý 1 2018', '2018-01-01', '2018-03-31', NULL, 1, '2018-12-07 02:38:12', '2018-12-07 02:38:12'),
('1544150346', '1544147144', '1536306411', 'Quý 2 2018', '2018-04-01', '2018-06-30', NULL, 1, '2018-12-07 02:39:06', '2018-12-07 02:39:06'),
('1544150392', '1544147215', '1536306411', 'Quý 3 2018', '2018-07-01', '2018-09-30', NULL, 1, '2018-12-07 02:39:52', '2018-12-07 02:39:52'),
('1544150424', '1544147266', '1536306411', 'Quý 4 2018', '2018-09-01', '2018-12-31', NULL, 1, '2018-12-07 02:40:24', '2018-12-07 02:40:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `majors`
--

CREATE TABLE `majors` (
  `m_id` varchar(80) NOT NULL,
  `m_code` varchar(16) NOT NULL,
  `m_name` text NOT NULL,
  `m_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `majors`
--

INSERT INTO `majors` (`m_id`, `m_code`, `m_name`, `m_active`, `created_at`, `updated_at`) VALUES
('1536300555', 'CUSCMJ001', 'Lập trình viên Quốc tế', 1, '2018-09-07 06:09:15', '2018-11-10 13:44:32'),
('1536301079', 'CUSCMJ002', 'Mỹ thuật đa phương tiện', 1, '2018-09-07 06:17:59', '2018-11-10 13:44:38'),
('1536301128', 'CUSCMJ003', 'An toàn an ninh thông tin', 1, '2018-09-07 06:18:48', '2018-11-10 13:44:42'),
('1536301140', 'CUSCMJ004', 'Phát triển ứng dụng Android', 1, '2018-09-07 06:19:00', '2018-11-10 13:44:45'),
('1536301151', 'CUSCMJ005', 'Cao đẳng Thiết kế đồ họa', 1, '2018-09-07 06:19:11', '2018-11-10 13:44:48'),
('1536301160', 'CUSCMJ006', 'CNTT Anh Quốc', 1, '2018-09-07 06:19:20', '2018-12-07 01:52:39'),
('1536301180', 'CUSCMJ005', 'Quản trị mạng doanh nghiệp', 1, '2018-09-07 06:19:40', '2018-11-10 06:50:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2fcdc3f21635bcf97440414826ed4590d568b15ba25f61f328b22bf3c07a7271a685ef5607f79ae9', 12345, 1, 'Personal Access Token', '[]', 0, '2018-08-23 23:44:18', '2018-08-23 23:44:18', '2019-08-24 06:44:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'WXUglzlYEDCE0x4rrtQCo5EoAZSarxI2k3Vu0a9q', 'http://localhost', 1, 0, 0, '2018-08-23 01:22:00', '2018-08-23 01:22:00'),
(2, NULL, 'Laravel Password Grant Client', 'BsPIOccFNo9dfGak41Wx2QeOP90M38M2sx9j4ToO', 'http://localhost', 0, 1, 0, '2018-08-23 01:22:00', '2018-08-23 01:22:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-08-23 01:22:00', '2018-08-23 01:22:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `pm_id` varchar(80) NOT NULL,
  `item` text NOT NULL,
  `pm_route` text NOT NULL,
  `r_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`pm_id`, `item`, `pm_route`, `r_id`, `created_at`, `updated_at`) VALUES
('1541262579', '', 'year', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 03:29:49', '2018-11-04 13:17:39'),
('1541335252', '114234', 'api/user', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:40:52', '2018-11-04 12:40:52'),
('1541335253', '114234', 'api/roles/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:40:52', '2018-11-04 12:40:52'),
('1541335254', '114234', 'api/roles/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:40:52', '2018-11-04 12:40:52'),
('1541335628', '114234', 'api/roles/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:08', '2018-11-04 12:47:08'),
('1541335629', '114234', 'api/roles/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:08', '2018-11-04 12:47:08'),
('1541335630', '114234', 'api/user/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:08', '2018-11-04 12:47:08'),
('1541335631', '114234', 'api/user/profile', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:08', '2018-11-04 12:47:08'),
('1541335644', '114234', 'api/roles/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:24', '2018-11-04 12:47:24'),
('1541335645', '114234', 'api/user/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:24', '2018-11-04 12:47:24'),
('1541335646', '114234', 'api/user/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:24', '2018-11-04 12:47:24'),
('1541335647', '114234', 'api/user/rerole', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:24', '2018-11-04 12:47:24'),
('1541335648', '114234', 'api/user/block', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:24', '2018-11-04 12:47:24'),
('1541335649', '114234', 'api/user/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:24', '2018-11-04 12:47:24'),
('1541335662', '114234', 'api/user/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:42', '2018-11-04 12:47:42'),
('1541335663', '114234', 'api/user/count', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:42', '2018-11-04 12:47:42'),
('1541335665', '114234', 'api/year/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:42', '2018-11-04 12:47:42'),
('1541335666', '114234', 'api/year/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:42', '2018-11-04 12:47:42'),
('1541335667', '114234', 'api/year/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:47:42', '2018-11-04 12:47:42'),
('1541335959', '114234', 'api/year/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:39', '2018-11-04 12:52:39'),
('1541335960', '114234', 'api/class/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:39', '2018-11-04 12:52:39'),
('1541335961', '114234', 'api/class/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:39', '2018-11-04 12:52:39'),
('1541335972', '114234', 'api/class/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:52', '2018-11-04 12:52:52'),
('1541335973', '114234', 'api/class/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:52', '2018-11-04 12:52:52'),
('1541335974', '114234', 'api/class/member', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:52', '2018-11-04 12:52:52'),
('1541335975', '114234', 'api/class/outside', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:52', '2018-11-04 12:52:52'),
('1541335976', '114234', 'api/class/add/student', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:52:52', '2018-11-04 12:52:52'),
('1541335989', '114234', 'api/class/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541335990', '114234', 'api/class/remove/student', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541335991', '114234', 'api/category/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541335992', '114234', 'api/category/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541335993', '114234', 'api/category/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541335994', '114234', 'api/category/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541335995', '114234', 'api/category/full', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:09', '2018-11-04 12:53:09'),
('1541336018', '114234', 'api/category/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336019', '114234', 'api/child/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336020', '114234', 'api/child/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336021', '114234', 'api/child/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336022', '114234', 'api/cycle/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336023', '114234', 'api/cycle/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336024', '114234', 'api/cycle/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336025', '114234', 'api/cycle/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:53:38', '2018-11-04 12:53:38'),
('1541336058', '114234', 'api/child/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336059', '114234', 'api/cycle/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336060', '114234', 'api/select/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336061', '114234', 'api/select/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336062', '114234', 'api/select/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336063', '114234', 'api/select/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336064', '114234', 'api/entity/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336065', '114234', 'api/entity/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336066', '114234', 'api/entity/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336067', '114234', 'api/entity/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:18', '2018-11-04 12:54:18'),
('1541336073', '114234', 'api/point/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:33', '2018-11-04 12:54:33'),
('1541336074', '114234', 'api/point/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:33', '2018-11-04 12:54:33'),
('1541336075', '114234', 'api/point/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:33', '2018-11-04 12:54:33'),
('1541336076', '114234', 'api/point/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:33', '2018-11-04 12:54:33'),
('1541336077', '114234', 'api/active/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:33', '2018-11-04 12:54:33'),
('1541336079', '114234', 'api/active/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:34', '2018-11-04 12:54:34'),
('1541336093', '114234', 'api/active/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:53', '2018-11-04 12:54:53'),
('1541336094', '114234', 'api/active/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:53', '2018-11-04 12:54:53'),
('1541336095', '114234', 'api/active/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:53', '2018-11-04 12:54:53'),
('1541336096', '114234', 'api/achievement/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:53', '2018-11-04 12:54:53'),
('1541336098', '114234', 'api/achievement/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:54', '2018-11-04 12:54:54'),
('1541336099', '114234', 'api/achievement/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:54', '2018-11-04 12:54:54'),
('1541336100', '114234', 'api/achievement/hide', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:54', '2018-11-04 12:54:54'),
('1541336101', '114234', '/', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:54:54', '2018-11-04 12:54:54'),
('1541336310', '114234', 'api/achievement/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:58:30', '2018-11-04 12:58:30'),
('1541336311', '114234', 'home', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:58:30', '2018-11-04 12:58:30'),
('1541336312', '114234', 'error', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:58:30', '2018-11-04 12:58:30'),
('1541336313', '114234', 'year/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:58:30', '2018-11-04 12:58:30'),
('1541336314', '114234', 'year/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:58:30', '2018-11-04 12:58:30'),
('1541336362', '114234', 'year/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336363', '114234', 'year/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336364', '114234', 'year/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336365', '114234', 'year/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336366', '114234', 'majors/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 14:02:58'),
('1541336367', '114234', 'majors/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336368', '114234', 'majors/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 13:40:32'),
('1541336369', '114234', 'majors/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 14:06:06'),
('1541336370', '114234', 'majors/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336371', '114234', 'majors/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 12:59:22'),
('1541336372', '114234', 'cycle', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:22', '2018-11-04 16:19:21'),
('1541336374', '114234', 'cycle/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 16:20:20'),
('1541336375', '114234', 'cycle/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 12:59:23'),
('1541336376', '114234', 'cycle/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 12:59:23'),
('1541336377', '114234', 'cycle/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 12:59:23'),
('1541336378', '114234', 'cycle/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 12:59:23'),
('1541336379', '114234', 'cycle/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 12:59:23'),
('1541336380', '114234', 'select/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 12:59:23', '2018-11-04 12:59:23'),
('1541336401', '114234', 'select', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336402', '114234', 'select/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336403', '114234', 'select/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336404', '114234', 'select/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336405', '114234', 'select/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336406', '114234', 'select/api/search_cy/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336407', '114234', 'entity', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336408', '114234', 'entity/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336409', '114234', 'entity/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336410', '114234', 'entity/set_default/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336411', '114234', 'entity/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336412', '114234', 'entity/success', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336413', '114234', 'entity/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336414', '114234', 'entity/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:01', '2018-11-04 13:00:01'),
('1541336446', '114234', 'entity/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336447', '114234', 'entity/select/get/{id}/{child}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336448', '114234', 'class', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336449', '114234', 'class/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336450', '114234', 'class/add_student', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336451', '114234', 'class/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336452', '114234', 'class/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336453', '114234', 'class/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336454', '114234', 'class/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336455', '114234', 'class/remove_one/{id_user}/{id_class}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336456', '114234', 'class/remove_all/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336457', '114234', 'class/student/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336458', '114234', 'class/exclude/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336459', '114234', 'class/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336460', '114234', 'category', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336461', '114234', 'category/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336462', '114234', 'category/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:00:46', '2018-11-04 13:00:46'),
('1541336478', '114234', 'category/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336479', '114234', 'category/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336480', '114234', 'category/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336481', '114234', 'category/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336482', '114234', 'category/api/list', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336483', '114234', 'category/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336484', '114234', 'category/api/search_full/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336485', '114234', 'child', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336486', '114234', 'child/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336487', '114234', 'child/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336488', '114234', 'child/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336489', '114234', 'child/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336490', '114234', 'child/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:18', '2018-11-04 13:01:18'),
('1541336492', '114234', 'child/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:19', '2018-11-04 13:01:19'),
('1541336506', '114234', 'child/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:46', '2018-11-04 13:01:46'),
('1541336507', '114234', 'users/{role}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:46', '2018-11-04 13:01:46'),
('1541336509', '114234', 'users/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336510', '114234', 'users/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336511', '114234', 'users/hide/{id}/{role}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336512', '114234', 'users/remove/{id}/{role}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336513', '114234', 'users/assignment/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336514', '114234', 'users/api/assignment/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336515', '114234', 'users/api/nonassignment/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336516', '114234', 'users/api/assignment/add/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336517', '114234', 'users/api/assignment/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:01:47', '2018-11-04 13:01:47'),
('1541336544', '114234', 'users/import', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:24', '2018-11-04 13:02:24'),
('1541336546', '114234', 'users/api/{role}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336547', '114234', 'users/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336548', '114234', 'users/api/get/roles/list', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336549', '114234', 'roles', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336550', '114234', 'roles/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336551', '114234', 'roles/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336552', '114234', 'roles/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336553', '114234', 'roles/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336555', '114234', 'roles/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336556', '114234', 'active', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336557', '114234', 'active/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
('1541336567', '114234', 'active/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:47', '2018-11-04 13:02:47'),
('1541336568', '114234', 'active/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:47', '2018-11-04 13:02:47'),
('1541336569', '114234', 'active/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:47', '2018-11-04 13:02:47'),
('1541336570', '114234', 'active/approved/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:47', '2018-11-04 13:02:47'),
('1541336571', '114234', 'active/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:47', '2018-11-04 13:02:47'),
('1541336573', '114234', 'achievement/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:48', '2018-11-04 13:02:48'),
('1541336574', '114234', 'achievement/users/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:48', '2018-11-04 13:02:48'),
('1541336609', '114234', 'active/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336610', '114234', 'active/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336611', '114234', 'achievement/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336612', '114234', 'achievement/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336613', '114234', 'achievement/api/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336614', '114234', 'achievement/api/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336615', '114234', 'achievement/api/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336616', '114234', 'achievement/api', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336617', '114234', 'achievement/api/search/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336618', '114234', 'achievement/api/list_member/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336619', '114234', 'achievement/api/non_member/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336620', '114234', 'achievement/api/add_member/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336621', '114234', 'achievement/api/remove_member/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336622', '114234', 'point', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:29', '2018-11-04 13:03:29'),
('1541336624', '114234', 'point/class/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:03:30', '2018-11-04 13:03:30'),
('1541336645', '114234', 'point/registration/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336646', '114234', 'point/result/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336647', '114234', 'point/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336648', '114234', 'result/api/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336649', '114234', 'result/api/info/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336650', '114234', 'result/api/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336651', '114234', 'result/api/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336652', '114234', 'assignment/list_class', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336653', '114234', 'assignment/result/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336654', '114234', 'assignment/api/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336655', '114234', 'assignment/api/info/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336656', '114234', 'assignment/api/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336657', '114234', 'assignment/api/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:05', '2018-11-04 13:04:05'),
('1541336676', '114234', 'teacher/list_class', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336677', '114234', 'teacher/result/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336678', '114234', 'teacher/api/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336679', '114234', 'teacher/api/info/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336680', '114234', 'teacher/api/change', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336681', '114234', 'teacher/api/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336682', '114234', 'permission/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336683', '114234', 'permission/api/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336684', '114234', 'permission/create', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336685', '114234', 'permission/api/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541336686', '114234', 'api/route/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36'),
('1541692476', '114234', 'api/year/index', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-08 15:54:36', '2018-11-08 15:54:36'),
('1543330595', '114234', 'entity/api/get/next', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-27 14:56:35', '2018-11-27 14:56:35'),
('1544030744', '114234', 'users/reset/role', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-05 17:25:44', '2018-12-05 17:25:44'),
('1544073968', '114234', 'active/{key}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-06 05:26:08', '2018-12-06 05:26:08'),
('1544073969', '114234', 'active/api/count/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-06 05:26:08', '2018-12-06 05:26:08'),
('1544167907', '114234', 'users/hide/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167908', '114234', 'users/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167909', '114234', 'point/registration/api/full', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167910', '114234', 'result/api/child/detail', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167911', '114234', 'result/api/remove', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167912', '114234', 'result/api/get/point', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167913', '114234', 'result/api/get/log', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167914', '114234', 'result/api/get/suggest', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167915', '114234', 'result/api/get/point/sum', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167916', '114234', 'result/api/get/log/sum', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544167917', '114234', 'phantrang', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:31:47', '2018-12-07 07:31:47'),
('1544168382', '114234', 'users/undo/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 07:39:42', '2018-12-07 07:39:42'),
('1544192879', '114234', 'class/student/{id}/{id_manager}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 14:27:59', '2018-12-07 14:27:59'),
('1544197904', '114234', 'class/exclude/{id}/{id_manager}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-07 15:51:44', '2018-12-07 15:51:44'),
('1544241299', '114234', 'active/{key}/{keyword}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-08 03:54:59', '2018-12-08 03:54:59'),
('1544416236', '114234', 'majors', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-10 04:30:36', '2018-12-10 04:30:36'),
('1544418028', '114234', 'roles/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-10 05:00:28', '2018-12-10 05:00:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
--

CREATE TABLE `profile` (
  `id` varchar(80) NOT NULL,
  `name` text NOT NULL,
  `birthday` date NOT NULL,
  `address` text NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `profile`
--

INSERT INTO `profile` (`id`, `name`, `birthday`, `address`, `gender`, `created_at`, `updated_at`) VALUES
('114234', 'Lý Long Tường', '1990-01-01', 'ADMIN SERVER', 1, '2018-11-25 07:10:55', '2018-12-05 12:16:12'),
('1544005542', 'Tống Thành Vinh', '2018-01-01', 'Cần Thơ', 1, '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005543', 'Nguyễn Vũ Trinh Nhân', '2018-01-02', 'Cần Thơ', 0, '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005544', 'Tăng Vĩnh Tài ', '2018-01-03', 'Cần Thơ', 1, '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005545', 'Trần Lê Ngọc Lợi', '2018-01-04', 'Cần Thơ', 1, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005547', 'Lê Thị Cẩm Tiên', '2018-01-05', 'Cần Thơ', 0, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005548', 'Nguyên Thành Nhân', '2018-01-06', 'Cần Thơ', 1, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005549', 'Nguyễn Huỳnh Trung Nam', '2018-01-07', 'Cần Thơ', 1, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005550', 'Nguyễn My Ny', '2018-01-08', 'Cần Thơ', 0, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005551', 'Trần Thị Kim Thi', '2018-01-09', 'Cần Thơ', 0, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005552', 'Nguyễn Thị Hồng Gấm', '2018-01-10', 'Cần Thơ', 0, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005554', 'Phạm Thanh Tân', '2018-01-11', 'Cần Thơ', 1, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005555', 'Đỗ Thiên Giang', '2018-01-12', 'Cần Thơ', 1, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005556', 'Lê Nguyễn Thái Dương', '2018-01-13', 'Cần Thơ', 1, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005557', 'Đặng Ngọc Thạch', '2018-01-14', 'Cần Thơ', 1, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005558', 'Phan Thanh Ngoan', '2018-01-15', 'Cần Thơ', 0, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005560', 'La Tố Quyên', '2018-01-16', 'Cần Thơ', 0, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005561', 'Nguyễn Thị Diễm', '2018-01-17', 'Cần Thơ', 0, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005562', 'Lưu Quốc Thái', '2018-01-18', 'Cần Thơ', 1, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005563', 'Đỗ Thị Hồng Loan', '2018-01-19', 'Cần Thơ', 0, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005565', 'Tạ Đức Tường', '2018-01-20', 'Cần Thơ', 1, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005566', 'Nguyễn Ngọc Thúy', '2018-01-21', 'Cần Thơ', 0, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005567', 'Nguyễn Vũ Sơn', '2018-01-22', 'Cần Thơ', 1, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005568', 'Nguyễn Ngọc Thúy', '2018-01-23', 'Cần Thơ', 0, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005569', 'Nguyễn Ngọc Ánh', '2018-01-24', 'Cần Thơ', 0, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005571', 'Huỳnh Nhật Huy', '2018-01-25', 'Cần Thơ', 1, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005572', 'Đinh Tấn Thông', '2018-01-26', 'Cần Thơ', 1, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005573', 'Nguyễn Minh Hưng', '2018-01-27', 'Cần Thơ', 1, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005574', 'Nguyễn Huỳnh Thành Tánh', '2018-01-28', 'Cần Thơ', 1, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005575', 'Huỳnh Văn Chung', '2018-01-29', 'Cần Thơ', 1, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005576', 'Dương Lữ Điện', '2018-01-30', 'Cần Thơ', 1, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005578', 'Nguyen Thi Phuong Trinh', '2018-01-31', 'Cần Thơ', 0, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005579', 'Lê Trọng Phương', '2018-02-01', 'Cần Thơ', 1, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005580', 'Phạm Ngọc Quang', '2018-02-02', 'Cần Thơ', 1, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005581', 'Nguyễn Trần Ái Trinh', '2018-02-03', 'Cần Thơ', 0, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005582', 'Thái Anh Huy', '2018-02-04', 'Cần Thơ', 1, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005584', 'Trần Văn Vũ Linh', '2018-02-05', 'Cần Thơ', 1, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005585', 'Huỳnh Nguyễn Minh Nguyệt ', '2018-02-06', 'Cần Thơ', 0, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005586', 'Lê Duy Thanh', '2018-02-07', 'Cần Thơ', 1, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005587', 'Phạm Đình Anh Khoa', '2018-02-08', 'Cần Thơ', 1, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005588', 'Nguyễn Thị Anh Thư', '2018-02-09', 'Cần Thơ', 0, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005589', 'Nguyễn Huy Hoàng', '2018-02-10', 'Cần Thơ', 1, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005591', 'Võ Nguyễn Đăng', '2018-02-11', 'Cần Thơ', 1, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005592', 'Châu Thị Thúy Huỳnh', '2018-02-12', 'Cần Thơ', 1, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005593', 'Lê Thị Mỹ Hạnh', '2018-02-13', 'Cần Thơ', 0, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005594', 'Nguyễn Hoàng Minh', '2018-02-14', 'Cần Thơ', 1, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005595', 'Huỳnh Gia Kỳ', '2018-02-15', 'Cần Thơ', 1, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005597', 'Thạch Chanh Tra', '2018-02-16', 'Cần Thơ', 1, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005598', 'Trác Mẫn Tiệp', '2018-02-17', 'Cần Thơ', 1, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005599', 'Nguyen Thi Thuy Trang', '2018-02-18', 'Cần Thơ', 0, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005600', 'Võ Hoàng Gia', '2018-02-19', 'Cần Thơ', 1, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005601', 'Hà Văn Quí', '2018-02-20', 'Cần Thơ', 1, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005602', 'Lê Tuấn Anh', '2018-02-21', 'Cần Thơ', 1, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005604', 'Đường Khánh Lâm', '2018-02-22', 'Cần Thơ', 1, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005605', 'Võ Lê Duy Anh', '2018-02-23', 'Cần Thơ', 1, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005606', 'Nguyễn Văn Quốc', '2018-02-24', 'Cần Thơ', 1, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005607', 'Đặng Thị Hồng Nhung', '2018-02-25', 'Cần Thơ', 0, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005608', 'Phạm Nguyễn Hải Âu', '2018-02-26', 'Cần Thơ', 1, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005609', 'Huynh Ngoc Thai Anh', '2018-02-27', 'Cần Thơ', 1, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005612', 'Trần Thị Cẩm Tú', '2018-03-01', 'Cần Thơ', 0, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005613', 'Đỗ Hà Quốc Thái', '2018-03-02', 'Cần Thơ', 1, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005614', 'Trương Dủ Thành', '2018-03-03', 'Cần Thơ', 1, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005615', 'Trương Trung Hiếu', '2018-03-04', 'Cần Thơ', 1, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005617', 'Trần Văn Kiệt', '2018-03-05', 'Cần Thơ', 1, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005618', 'Danh Lợi', '2018-03-06', 'Cần Thơ', 1, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005619', 'Lê Thị Mến', '2018-03-07', 'Cần Thơ', 0, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005620', 'Biện Thị Thùy Trang', '2018-03-08', 'Cần Thơ', 0, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005621', 'Nguyễn Thành Thịnh', '2018-03-09', 'Cần Thơ', 1, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005622', 'Nguyễn Khánh Vũ', '2018-03-10', 'Cần Thơ', 1, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005625', 'Lê Minh Hưng', '2018-03-12', 'Cần Thơ', 1, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005626', 'Hồ Thị Thanh Thảo', '2018-03-13', 'Cần Thơ', 0, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005627', 'Lê Thị Nhật An', '2018-03-14', 'Cần Thơ', 1, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005628', 'Ngô Hoài Diễm Hương', '2018-03-15', 'Cần Thơ', 0, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005629', 'Hồ Kim Trúc', '2018-03-16', 'Cần Thơ', 0, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005631', 'Lâm Quang Vĩ', '2018-03-17', 'Cần Thơ', 1, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005632', 'Trần Nguyễn Chí Trường', '2018-03-18', 'Cần Thơ', 1, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005633', 'Nguyễn Kim Lới', '2018-03-19', 'Cần Thơ', 1, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005634', 'Lê Duy Chương', '2018-03-20', 'Cần Thơ', 1, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005635', 'Hồ Hữu Nhân', '2018-03-21', 'Cần Thơ', 1, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005637', 'Võ Hoài Danh', '2018-03-22', 'Cần Thơ', 1, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005638', 'Lê Công Chánh', '2018-03-23', 'Cần Thơ', 1, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005640', 'Võ thanh vinh', '2018-03-25', 'Cần Thơ', 1, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005641', 'Nguyễn Thị Phương Trinh', '2018-03-27', 'Cần Thơ', 0, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005642', 'Nguyễn Minh Khôi', '2018-03-28', 'Cần Thơ', 1, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005644', 'Huỳnh Tấn Phát', '2018-03-29', 'Cần Thơ', 1, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005645', 'Huỳnh Minh Thư', '2018-03-30', 'Cần Thơ', 0, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005646', 'Ngô Hoàng Thái An', '2018-03-31', 'Cần Thơ', 1, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005647', 'Dương Huỳnh Ngân', '2018-04-01', 'Cần Thơ', 0, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005648', 'Lê Văn Phi', '2018-04-02', 'Cần Thơ', 0, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005651', 'Mai Thanh Mến', '2018-04-04', 'Cần Thơ', 1, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005653', 'Nguyễn Hoàng Tính', '2018-04-06', 'Cần Thơ', 1, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005654', 'Nguyễn Ngọc Phi', '2018-04-07', 'Cần Thơ', 1, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005655', 'Trần Xuân Mai', '2018-04-08', 'Cần Thơ', 0, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005657', 'Lâm Thảo Nguyên', '2018-04-09', 'Cần Thơ', 0, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005658', 'Lê Thị Hảo', '2018-04-10', 'Cần Thơ', 0, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005659', 'Thái Thám ', '2018-04-11', 'Cần Thơ', 1, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005660', 'Cao Vĩnh Phát', '2018-04-12', 'Cần Thơ', 1, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005661', 'Nguyễn Văn Thức', '2018-04-13', 'Cần Thơ', 1, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005663', 'Trần Tấn Tài', '2018-04-14', 'Cần Thơ', 1, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005664', 'Tran Ngoc Bich', '2018-04-15', 'Cần Thơ', 0, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005665', 'Nguyên Thi Dung', '2018-04-16', 'Cần Thơ', 1, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005666', 'Nguyen Ngoc Huyen Tran', '2018-04-17', 'Cần Thơ', 0, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005667', 'Trần Thị Hạnh Nguyên', '2018-04-18', 'Cần Thơ', 0, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005669', 'Trần Trung Kiên', '2018-04-19', 'Cần Thơ', 1, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005670', 'Nguyễn Đức Mỹ', '2018-04-20', 'Cần Thơ', 1, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005671', 'Nguyễn Tùng Minh Khá', '2018-04-21', 'Cần Thơ', 1, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005672', 'Bùi Minh Tâm', '2018-04-22', 'Cần Thơ', 1, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005673', 'Võ Thị Mai Thi', '2018-04-23', 'Cần Thơ', 0, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005675', 'Lê Tuấn Cường', '2018-04-24', 'Cần Thơ', 1, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005676', 'Trương HoàiI Bảo', '2018-04-25', 'Cần Thơ', 1, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005677', 'Nguyễn Văn Thức', '2018-04-26', 'Cần Thơ', 1, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005678', 'Le Tan Thanh', '2018-04-27', 'Cần Thơ', 1, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005679', 'Nguyễn Thị Mỹ Á', '2018-04-28', 'Cần Thơ', 0, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005681', 'Nguyễn Duy Khang', '2018-04-29', 'Cần Thơ', 1, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005682', 'Nguyễn Phước Toàn', '2018-04-30', 'Cần Thơ', 1, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005683', 'Nguyễn Ngọc Nhịn', '2018-05-01', 'Cần Thơ', 1, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005684', 'Trần Khắc Quý', '2018-05-02', 'Cần Thơ', 1, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005685', 'Trịnh Tuấn Anh', '2018-05-03', 'Cần Thơ', 1, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005686', 'Lê Hải Bằng', '2018-05-04', 'Cần Thơ', 1, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005688', 'Châu Ngọc Long Giang', '2018-05-05', 'Cần Thơ', 1, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005689', 'Chau Kim Sêng', '2018-05-06', 'Cần Thơ', 1, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005690', 'Mai Phan Nhật Bình  ', '2018-05-07', 'Cần Thơ', 1, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005691', 'Phan Triều Vỹ', '2018-05-08', 'Cần Thơ', 1, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005692', 'Lê Hoàng Thắng', '2018-05-09', 'Cần Thơ', 1, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005694', 'Phan Huỳnh Phúc Thịnh', '2018-05-10', 'Cần Thơ', 1, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005695', 'Lâm Quang Cường', '2018-05-12', 'Cần Thơ', 1, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005696', 'Trần Yên Nhiên', '2018-05-13', 'Cần Thơ', 1, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005697', 'Dương Thị Thanh Nhàn', '2018-05-14', 'Cần Thơ', 0, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005698', 'Trần Ái Nghi', '2018-05-15', 'Cần Thơ', 0, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005699', 'Nguyễn Huỳnh Long', '2018-05-16', 'Cần Thơ', 1, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005701', 'Nguyễn Thị Phương Trinh', '2018-05-17', 'Cần Thơ', 1, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005702', 'Đỗ Thành Hậu', '2018-05-18', 'Cần Thơ', 1, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005703', 'Lê Vủ Tiệp', '2018-05-19', 'Cần Thơ', 1, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005704', 'Trương Hồng Sương', '1990-05-02', 'Cần Thơ', 0, '2018-12-05 10:26:07', '2018-12-07 04:05:55'),
('1544005705', 'Lữ Thanh Quy', '2018-05-21', 'Cần Thơ', 1, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005706', 'Nguyễn Chí Linh', '2018-05-22', 'Cần Thơ', 1, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005708', 'Nguyễn Thị Huỳnh Như', '2018-05-23', 'Cần Thơ', 1, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005709', 'Bùi Đức Học', '2018-05-24', 'Cần Thơ', 1, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005710', 'Võ Thúy An', '2018-05-25', 'Cần Thơ', 0, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005711', 'Đỗ Ngọc Minh', '2018-05-26', 'Cần Thơ', 1, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005712', 'Phạm Hoài An', '2018-05-27', 'Cần Thơ', 1, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005713', 'Lê Bảo Anh', '2018-05-28', 'Cần Thơ', 1, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005715', 'Nguyễn Phước Âu', '2018-05-29', 'Cần Thơ', 1, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005716', 'Nguyễn Tấn Cường', '2018-05-30', 'Cần Thơ', 1, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005717', 'Phan Tiến Đạt', '2018-05-31', 'Cần Thơ', 1, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005718', 'Hứa Xướng Điền', '2018-06-01', 'Cần Thơ', 1, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005719', 'Trần Tân Định', '2018-06-02', 'Cần Thơ', 1, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005721', 'Lý Trường Giang', '2018-06-03', 'Cần Thơ', 1, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005722', 'Nguyễn Quang Huy Hải', '2018-06-04', 'Cần Thơ', 1, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005723', 'Nguyễn Minh Hiếu', '2018-06-05', 'Cần Thơ', 1, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005724', 'Trương Công Hiển', '2018-06-06', 'Cần Thơ', 1, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005725', 'Nguyễn Việt Huấn', '2018-06-07', 'Cần Thơ', 1, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005726', 'Từ Quốc Huy', '2018-06-08', 'Cần Thơ', 1, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005728', 'Nguyễn Quốc Khánh', '2018-06-09', 'Cần Thơ', 1, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005729', 'Dương Văn Lăng', '2018-06-10', 'Cần Thơ', 1, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005730', 'Phan Thanh Liêm', '2018-06-11', 'Cần Thơ', 1, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005731', 'Trịnh Văn Linh', '2018-06-12', 'Cần Thơ', 1, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005732', 'Nguyễn Văn Lộc', '2018-06-13', 'Cần Thơ', 1, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005733', 'Lê Minh Luân', '2018-06-14', 'Cần Thơ', 1, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005735', 'Dương Văn Lý', '2018-06-15', 'Cần Thơ', 1, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005736', 'Nguyễn Thiện Minh', '2018-06-16', 'Cần Thơ', 1, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005737', 'Lê Văn Ngà', '2018-06-17', 'Cần Thơ', 1, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005738', 'Trần Trọng Nghĩa', '2018-06-18', 'Cần Thơ', 1, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005739', 'Trần Thị Nguyễn Nhật', '2018-06-19', 'Cần Thơ', 1, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005741', 'Phan Thanh Nhi', '2018-06-20', 'Cần Thơ', 0, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005742', 'Đoàn Minh Nhựt', '2018-06-21', 'Cần Thơ', 1, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005743', 'Trương Tú Oanh', '2018-06-22', 'Cần Thơ', 0, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005744', 'Nguyễn Tấn Phát', '2018-06-23', 'Cần Thơ', 1, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005745', 'Nguyễn Đình Phi', '2018-06-24', 'Cần Thơ', 1, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005746', 'Nguyễn Quang Phong', '2018-06-25', 'Cần Thơ', 1, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005747', 'Đặng Lê Vĩnh Phúc', '2018-06-26', 'Cần Thơ', 1, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005749', 'Trịnh Hoàng Phúc', '2018-06-27', 'Cần Thơ', 1, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005750', 'Trần Hữu Phước', '2018-06-28', 'Cần Thơ', 1, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005751', 'Nguyễn Văn Tài', '2018-06-29', 'Cần Thơ', 1, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005752', 'Trần Quốc Thanh', '2018-06-30', 'Cần Thơ', 1, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005753', 'Huỳnh Trọng Thành', '2018-07-01', 'Cần Thơ', 1, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005755', 'Nguyễn Phú Thiệt', '2018-07-02', 'Cần Thơ', 1, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005756', 'Huỳnh Hoàng Thơ', '2018-07-03', 'Cần Thơ', 1, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005757', 'Hồ Lê Anh Thư', '2018-07-04', 'Cần Thơ', 0, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005758', 'Lê Nguyên Thức', '2018-07-05', 'Cần Thơ', 1, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005759', 'Trần Đăng Tiến', '2018-07-06', 'Cần Thơ', 1, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005760', 'Phan Vũ Tình', '2018-07-07', 'Cần Thơ', 1, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005762', 'Huỳnh Bảo Toàn', '2018-07-08', 'Cần Thơ', 1, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005763', 'Nguyễn Nhật Triết', '2018-07-09', 'Cần Thơ', 1, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005764', 'Nguyễn Đình Trọng', '2018-07-10', 'Cần Thơ', 1, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005765', 'Võ Thành Trung', '2018-07-11', 'Cần Thơ', 1, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005766', 'Trương Vũ Trường', '2018-07-12', 'Cần Thơ', 1, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005768', 'Nguyễn Hữu Uý', '2018-07-13', 'Cần Thơ', 1, '2018-12-05 10:26:17', '2018-12-05 10:26:17'),
('1544005769', 'Từ Tuấn Vũ', '2018-07-14', 'Cần Thơ', 1, '2018-12-05 10:26:17', '2018-12-05 10:26:17'),
('1544006432', 'Lê Diệu Ái', '1980-01-01', 'Cần Thơ', 1, '2018-12-05 10:40:32', '2018-12-05 10:40:32'),
('1544006491', 'Nguyễn Minh Anh', '1980-01-01', 'Cần Thơ', 1, '2018-12-05 10:41:31', '2018-12-05 10:41:31'),
('1544006529', 'Trương Mỹ Anh', '1980-02-02', 'Cần Thơ', 0, '2018-12-05 10:42:09', '2018-12-05 10:42:09'),
('1544006570', 'Cao Trọng Tú', '1978-01-01', 'Cần Thơ', 1, '2018-12-05 10:42:51', '2018-12-05 10:42:51'),
('1544006754', 'Châu Cẩm Yến', '1970-01-01', 'Cần Thơ', 0, '2018-12-05 10:45:55', '2018-12-05 10:45:55'),
('1544011489', 'Cao Cát Linh', '1980-11-01', 'Cần Thơ', 0, '2018-12-05 12:04:49', '2018-12-05 12:04:49'),
('1544011559', 'Trần Ðông Trà', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:05:59', '2018-12-05 12:05:59'),
('1544011582', 'Trần Ðông Trà', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:06:22', '2018-12-05 12:06:22'),
('1544011624', 'Trần Tú An', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:07:04', '2018-12-05 12:07:04'),
('1544011697', 'Châu Quỳnh Ngân', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:08:18', '2018-12-05 12:08:18'),
('1544011762', 'Lê Bình Như', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:09:22', '2018-12-05 12:09:22'),
('1544011812', 'Nguyễn Đức Anh', '1980-01-01', 'Cần Thơ', 1, '2018-12-05 12:10:13', '2018-12-05 12:10:13'),
('1544011858', 'Lý Chúc Nhân', '1980-01-01', 'Cần Thơ', 1, '2018-12-05 12:10:59', '2018-12-05 12:10:59'),
('1544011904', 'Trịnh Sang Sang', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:11:44', '2018-12-05 12:11:44'),
('1544011919', 'Trịnh Sang Sang', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:11:59', '2018-12-05 12:11:59'),
('1544011963', 'Trần Thị Băng Tâm', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:12:43', '2018-12-05 12:12:43'),
('1544012015', 'Trương Thị Nhã Trang', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:13:36', '2018-12-05 12:13:36'),
('1544012023', 'Trương Thị Nhã Trang', '1980-01-01', 'Cần Thơ', 0, '2018-12-05 12:13:43', '2018-12-05 12:13:43'),
('1544012271', 'Trương Hồng Oanh', '1990-01-01', 'ADMIN SERVER', 1, '2018-12-05 12:17:51', '2018-12-06 02:54:27'),
('1544186899', '111', '1996-01-01', 'ACB', 1, '2018-12-07 12:48:20', '2018-12-07 12:48:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `registration`
--

CREATE TABLE `registration` (
  `re_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `re_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `registration`
--

INSERT INTO `registration` (`re_id`, `u_id`, `c_id`, `cc_id`, `re_active`, `created_at`, `updated_at`) VALUES
('1544389737', '1544005585', '1536650607', '1537694308', 1, '2018-12-09 16:49:18', '2018-12-09 16:49:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result_history`
--

CREATE TABLE `result_history` (
  `rh_id` varchar(80) NOT NULL,
  `rp_id` varchar(80) NOT NULL,
  `rp_scores_old` int(11) NOT NULL,
  `rp_scores_new` int(11) NOT NULL,
  `rp_note_old` text NOT NULL,
  `rp_note_new` text NOT NULL,
  `u_make` varchar(80) NOT NULL,
  `u_change` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `rh_action` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `result_history`
--

INSERT INTO `result_history` (`rh_id`, `rp_id`, `rp_scores_old`, `rp_scores_new`, `rp_note_old`, `rp_note_new`, `u_make`, `u_change`, `u_id`, `c_id`, `cc_id`, `ec_id`, `rh_action`, `created_at`, `updated_at`) VALUES
('1543257769', '1543081388', 14, 0, '1', '', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'delete', '2018-11-26 18:42:49', '2018-11-26 18:42:49'),
('1543325751', '1543325751', 0, 1, '', '1', '114234', '114234', '1542637668', '', '1536650574', '1536418838', 'insert', '2018-11-27 13:35:51', '2018-11-27 13:35:51'),
('1543343773', '1543343773', 0, 11, '', '11', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536418838', 'insert', '2018-11-27 18:36:13', '2018-11-27 18:36:13'),
('1543504856', '1543343773', 11, 1, '11', '11', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536418838', 'update', '2018-11-29 15:20:56', '2018-11-29 15:20:56'),
('1543504861', '1543256459', 20, 1, '111111', '111111', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-29 15:21:01', '2018-11-29 15:21:01'),
('1543504864', '1543256494', 20, 1, 'how', 'how', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-29 15:21:04', '2018-11-29 15:21:04'),
('1543504867', '1543343773', 1, 1, '11', '11', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536418838', 'update', '2018-11-29 15:21:07', '2018-11-29 15:21:07'),
('1543504881', '1543166136', 20, 1, '12', '12', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-29 15:21:21', '2018-11-29 15:21:21'),
('1543505042', '1543166136', 1, 1, '12', '12', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-29 15:24:02', '2018-11-29 15:24:02'),
('1543507372', '1543166136', 1, 1, '12', 'ta', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-29 16:02:52', '2018-11-29 16:02:52'),
('1543507377', '1543256494', 1, 2, 'how', 'ta', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-29 16:02:57', '2018-11-29 16:02:57'),
('1543507383', '1543343773', 1, 3, '11', 'ta', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536418838', 'update', '2018-11-29 16:03:03', '2018-11-29 16:03:03'),
('1543507388', '1543343773', 3, 4, 'ta', 'ta', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536418838', 'update', '2018-11-29 16:03:08', '2018-11-29 16:03:08'),
('1543935779', '1543935779', 0, 10, '', 'Cộng điểm bằng anh văn', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536559025', 'insert', '2018-12-04 15:02:59', '2018-12-04 15:02:59'),
('1544155941', '1544155941', 0, 1, '', '1', '114234', '114234', '1544005704', '1536650607', '1536650574', '1544147977', 'insert', '2018-12-07 04:12:21', '2018-12-07 04:12:21'),
('1544155950', '1544155950', 0, 18, '', '1', '114234', '114234', '1544005704', '1536650607', '1536650574', '1544147977', 'insert', '2018-12-07 04:12:30', '2018-12-07 04:12:30'),
('1544155957', '1544155957', 0, 2, '', '1', '114234', '114234', '1544005704', '1536650607', '1536650574', '1544147977', 'insert', '2018-12-07 04:12:37', '2018-12-07 04:12:37'),
('1544156003', '1544155950', 18, 15, '1', '1', '114234', '114234', '1544005704', '1536650607', '1536650574', '1544147977', 'update', '2018-12-07 04:13:23', '2018-12-07 04:13:23'),
('1544156033', '1544156033', 0, 5, '', '1', '114234', '114234', '1544005704', '1536650607', '1536650574', '1544147977', 'insert', '2018-12-07 04:13:53', '2018-12-07 04:13:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result_log`
--

CREATE TABLE `result_log` (
  `rl_id` varchar(80) NOT NULL,
  `rl_scores` int(11) DEFAULT NULL,
  `rl_note` text,
  `u_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result_point`
--

CREATE TABLE `result_point` (
  `rp_id` varchar(80) NOT NULL,
  `rp_scores` int(11) DEFAULT NULL,
  `rp_note` text,
  `u_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `rp_make` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `result_point`
--

INSERT INTO `result_point` (`rp_id`, `rp_scores`, `rp_note`, `u_id`, `c_id`, `cc_id`, `ec_id`, `rp_make`, `created_at`, `updated_at`) VALUES
('1544155941', 1, '1', '1544005704', '1536650607', '1536650574', '1544147977', '114234', '2018-12-07 04:12:21', '2018-12-07 04:12:21'),
('1544155950', 15, '1', '1544005704', '1536650607', '1536650574', '1544147977', '114234', '2018-12-07 04:12:30', '2018-12-07 04:13:23'),
('1544155957', 2, '1', '1544005704', '1536650607', '1536650574', '1544147977', '114234', '2018-12-07 04:12:37', '2018-12-07 04:12:37'),
('1544156033', 5, '1', '1544005704', '1536650607', '1536650574', '1544147977', '114234', '2018-12-07 04:13:53', '2018-12-07 04:13:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `r_id` varchar(80) NOT NULL,
  `r_name` varchar(64) NOT NULL,
  `r_note` text NOT NULL,
  `r_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`r_id`, `r_name`, `r_note`, `r_active`, `created_at`, `updated_at`) VALUES
('0826eaf8086b01749bf7ff65742a200c', 'Giáo viên cố vấn', 'Cố vấn một lớp trong hệ thống', 1, '2018-08-25 06:00:15', '2018-11-03 17:16:36'),
('08cd66cb6b012217ed32cb8662a2a1d9', 'Quản trị viên', 'Chịu toàn trách nhiệm cho sự vận hàng hệ thống', 1, '2018-08-22 20:35:46', '2018-11-04 06:12:57'),
('1536238582', 'Giáo vụ', 'Chịu trách nhiệm tư vấn công tác dạy và học', 1, '2018-09-06 12:56:22', '2018-09-11 01:09:10'),
('1536238635', 'Tư vấn', 'Tư vấn công tác dạy và học cho cán bộ sinh viên', 1, '2018-09-06 12:57:15', '2018-09-11 01:12:26'),
('1536286076', 'Quan hệ sinh viên', 'Tổ chức hoạt động phong trào sinh viên', 1, '2018-09-07 02:07:56', '2018-09-11 01:12:46'),
('1536653649', 'Trưởng nhóm chuyên ngành', 'Trưởng nhóm một chuyên ngành trong trung tâm', 1, '2018-09-11 08:14:09', '2018-09-11 08:14:09'),
('1536653712', 'Tiếp thị', 'Quản lý công việc tiếp thi quản bá sản phẩm dạy và học', 1, '2018-09-11 08:15:12', '2018-09-11 08:15:12'),
('1b83df7a91f51b3d32cf6bda5b0fd23f', 'Học viên', 'Học viên tham gia các khóa tại CUSC', 1, '2018-08-22 20:35:46', '2018-11-03 17:16:44'),
('b2cba2a7a5499bd67320ba3d4046dc2e', 'Chờ cấp', 'Các tài khoản bị xóa phân quyền sẽ xuất hiện ở đây', 1, '2018-09-11 13:27:02', '2018-09-11 13:27:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `route`
--

CREATE TABLE `route` (
  `ro_id` varchar(80) NOT NULL,
  `ro_value` text NOT NULL,
  `ro_name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `route`
--

INSERT INTO `route` (`ro_id`, `ro_value`, `ro_name`, `created_at`, `updated_at`) VALUES
('1544412427', 'oauth/authorize', '', '2018-12-10 03:27:07', '2018-12-10 03:27:07'),
('1544412428', 'oauth/authorize', '', '2018-12-10 03:27:07', '2018-12-10 03:27:07'),
('1544412429', 'oauth/authorize', '', '2018-12-10 03:27:07', '2018-12-10 03:27:07'),
('1544412430', 'oauth/token', '', '2018-12-10 03:27:07', '2018-12-10 03:27:07'),
('1544412431', 'oauth/tokens', '', '2018-12-10 03:27:07', '2018-12-10 03:27:07'),
('1544412432', 'oauth/tokens/{token_id}', '', '2018-12-10 03:27:07', '2018-12-10 03:27:07'),
('1544412434', 'oauth/token/refresh', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412435', 'oauth/clients', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412436', 'oauth/clients', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412437', 'oauth/clients/{client_id}', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412438', 'oauth/clients/{client_id}', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412439', 'oauth/scopes', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412440', 'oauth/personal-access-tokens', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412441', 'oauth/personal-access-tokens', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412442', 'oauth/personal-access-tokens/{token_id}', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412443', 'api/user', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412444', 'api/auth/login', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412445', 'api/auth/logout', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412446', 'api/roles/index', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412447', 'api/roles/create', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412448', 'api/roles/change', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412449', 'api/roles/hide', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412450', 'api/roles/remove', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412451', 'api/user/index', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412452', 'api/user/profile', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412453', 'api/user/create', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412454', 'api/user/change', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412455', 'api/user/rerole', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412456', 'api/user/block', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412457', 'api/user/hide', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412458', 'api/user/remove', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412459', 'api/user/count', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412460', 'api/year/index', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412461', 'api/year/create', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412462', 'api/year/change', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412463', 'api/year/hide', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412464', 'api/year/remove', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412465', 'api/class/index', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412466', 'api/class/create', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412467', 'api/class/change', '', '2018-12-10 03:27:08', '2018-12-10 03:27:08'),
('1544412469', 'api/class/hide', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412470', 'api/class/remove', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412471', 'api/class/member', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412472', 'api/class/outside', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412473', 'api/class/add/student', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412474', 'api/class/remove/student', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412475', 'api/category/index', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412476', 'api/category/create', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412477', 'api/category/change', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412478', 'api/category/hide', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412479', 'api/category/remove', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412480', 'api/category/full', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412481', 'api/child/create', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412482', 'api/child/change', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412483', 'api/child/hide', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412484', 'api/child/remove', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412485', 'api/cycle/index', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412486', 'api/cycle/create', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412487', 'api/cycle/change', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412488', 'api/cycle/hide', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412489', 'api/cycle/remove', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412490', 'api/select/index', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412491', 'api/select/create', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412492', 'api/select/change', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412493', 'api/select/hide', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412494', 'api/entity/index', '', '2018-12-10 03:27:09', '2018-12-10 03:27:09'),
('1544412496', 'api/entity/create', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412497', 'api/entity/change', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412498', 'api/entity/hide', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412499', 'api/point/index', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412500', 'api/point/create', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412501', 'api/point/change', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412502', 'api/point/hide', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412503', 'api/active/index', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412504', 'api/active/create', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412505', 'api/active/change', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412506', 'api/active/hide', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412507', 'api/active/remove', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412508', 'api/achievement/index', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412509', 'api/achievement/create', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412510', 'api/achievement/change', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412511', 'api/achievement/hide', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412512', 'api/achievement/remove', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412513', '/', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412514', 'login', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412515', 'login', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412516', 'logout', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412517', 'register', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412518', 'register', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412519', 'password/reset', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412520', 'password/email', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412521', 'password/reset/{token}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412522', 'password/reset', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412523', 'home', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412524', 'error', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412525', 'users/{role}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412526', 'users/create', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412527', 'users/change', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412528', 'users/hide/{id}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412529', 'users/undo/{id}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412530', 'users/remove/{id}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412531', 'users/reset/role', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412532', 'users/import', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412533', 'users/assignment/{id}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412534', 'users/api/{role}', '', '2018-12-10 03:27:10', '2018-12-10 03:27:10'),
('1544412536', 'users/api/get/roles/list', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412537', 'users/api/search/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412538', 'users/api/assignment/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412539', 'users/api/nonassignment/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412540', 'users/api/assignment/add/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412541', 'users/api/assignment/remove/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412542', 'class', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412543', 'class/student/{id}/{id_manager}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412544', 'class/exclude/{id}/{id_manager}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412545', 'class/create', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412546', 'class/add_student', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412547', 'class/change', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412548', 'class/hide/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412549', 'class/undo/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412550', 'class/remove/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412551', 'class/remove_one/{id_user}/{id_class}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412552', 'class/remove_all/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412553', 'class/api/search/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412554', 'active/create', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412555', 'active/change', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412556', 'active/hide/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412557', 'active/undo/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412558', 'active/remove/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412559', 'active/approved/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412560', 'active/{key}/{keyword}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412561', 'active/api', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412562', 'active/api/search/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412563', 'active/api/count/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412564', 'achievement/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412565', 'achievement/create', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412566', 'achievement/change', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412567', 'achievement/users/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412568', 'achievement/api/hide/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412569', 'achievement/api/undo/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412570', 'achievement/api/remove/{id}', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412571', 'achievement/api', '', '2018-12-10 03:27:11', '2018-12-10 03:27:11'),
('1544412573', 'achievement/api/search/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412574', 'achievement/api/list_member/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412575', 'achievement/api/non_member/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412576', 'achievement/api/add_member/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412577', 'achievement/api/remove_member/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412578', 'cycle', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412579', 'cycle/create', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412580', 'cycle/change', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412581', 'cycle/hide/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412582', 'cycle/undo/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412583', 'cycle/remove/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412584', 'cycle/api', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412585', 'select', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412586', 'select/create', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412587', 'select/change', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412588', 'select/hide/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412589', 'select/undo/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412590', 'select/remove/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412591', 'select/api/search_cy/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412592', 'entity', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412593', 'entity/create', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412594', 'entity/change', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412595', 'entity/set_default/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412596', 'entity/success', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412597', 'entity/hide/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412598', 'entity/undo/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412599', 'entity/remove/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412600', 'entity/api/search/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412601', 'entity/select/get/{id}/{child}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412602', 'entity/api/get/next', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412603', 'year', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412604', 'year/create', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412605', 'year/change', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412606', 'year/hide/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412607', 'year/undo/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412608', 'year/remove/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412609', 'year/api', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412610', 'majors', 'Xem danh sách chuyên ngành', '2018-12-10 03:27:12', '2018-12-10 04:10:25'),
('1544412611', 'majors/create', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412612', 'majors/change', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412613', 'majors/hide/{id}', '', '2018-12-10 03:27:12', '2018-12-10 03:27:12'),
('1544412615', 'majors/undo/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412616', 'majors/remove/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412617', 'majors/api', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412618', 'category', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412619', 'category/create', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412620', 'category/change', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412621', 'category/hide/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412622', 'category/undo/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412623', 'category/remove/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412624', 'category/api', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412625', 'category/api/list', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412626', 'category/api/search/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412627', 'category/api/search_full/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412628', 'child', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412629', 'child/create', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412630', 'child/change', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412631', 'child/hide/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412632', 'child/undo/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412633', 'child/remove/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412634', 'child/api', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412635', 'child/api/search/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412636', 'roles', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412637', 'roles/create', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412638', 'roles/change', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412639', 'roles/hide/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412640', 'roles/undo/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412641', 'roles/remove/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412642', 'roles/api', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412643', 'point/registration/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412644', 'point/result/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412645', 'point/change', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412646', 'point/registration/api/full', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412647', 'point', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412648', 'point/class/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412649', 'result/api/create', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412650', 'result/api/info/{id}', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412651', 'result/api/child/detail', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412652', 'result/api/change', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412653', 'result/api/remove', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412654', 'result/api/get/point', '', '2018-12-10 03:27:13', '2018-12-10 03:27:13'),
('1544412656', 'result/api/get/log', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412657', 'result/api/get/suggest', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412658', 'result/api/get/point/sum', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412659', 'result/api/get/log/sum', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412660', 'assignment/list_class', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412661', 'assignment/result/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412662', 'assignment/api/create', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412663', 'assignment/api/info/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412664', 'assignment/api/change', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412665', 'assignment/api/remove/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412666', 'permission/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412667', 'permission/api/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412668', 'permission/create', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412669', 'permission/api/remove/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412670', 'api/route/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412671', 'teacher/list_class', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412672', 'teacher/result/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412673', 'teacher/api/create', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412674', 'teacher/api/info/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412675', 'teacher/api/change', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14'),
('1544412676', 'teacher/api/remove/{id}', '', '2018-12-10 03:27:14', '2018-12-10 03:27:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `school_year`
--

CREATE TABLE `school_year` (
  `sy_id` varchar(80) NOT NULL,
  `sy_name` text,
  `sy_active` tinyint(4) NOT NULL,
  `sy_begin` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `school_year`
--

INSERT INTO `school_year` (`sy_id`, `sy_name`, `sy_active`, `sy_begin`, `created_at`, `updated_at`) VALUES
('1536250498', '2014-2015', 1, '2014-09-12', '2018-09-06 09:15:42', '2018-09-06 15:17:43'),
('1536284435', '2015-2016', 1, '2015-09-07', '2018-09-06 18:40:35', '2018-11-04 06:28:56'),
('1536284507', '2016-2017', 1, '2016-09-07', '2018-09-06 18:41:47', '2018-09-06 14:31:58'),
('1536290446', '2017-2018', 1, '2017-09-07', '2018-09-06 20:20:46', '2018-09-06 14:32:24'),
('1536293003', '2018-2019', 1, '2018-09-08', '2018-09-06 21:03:23', '2018-09-06 14:05:59'),
('1536294796', '2019-2020', 1, '2019-09-07', '2018-09-06 21:33:16', '2018-09-06 21:33:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sum_scores_log`
--

CREATE TABLE `sum_scores_log` (
  `ss_id` varchar(80) NOT NULL,
  `c_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `ss_scores` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(80) NOT NULL,
  `cusc_id` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `scores` int(11) DEFAULT NULL,
  `token` text,
  `device_token` text,
  `remember_token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `cusc_id`, `password`, `phone`, `email`, `active`, `scores`, `token`, `device_token`, `remember_token`, `created_at`, `updated_at`) VALUES
('114234', 'ADMIN_CUSC1', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456789', 'admin1@gmail.com', 1, 0, NULL, NULL, 'S9L4asSddjL7xWacUiJ5HxA4ncB7NlgOcu9VsKlizwyWiGT6qyEvlzuTAhel', '2018-08-24 04:59:01', '2018-12-09 19:25:53'),
('1544005542', 'CUSC_1204098', '$2y$10$5oFxT84aSNiVmIzLEUkA8eP7aQLp7oa48AK6sTHjq7wsFrI.odTvK', '907464841', 'vjnhgom@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:42', '2018-12-05 15:40:10'),
('1544005543', 'CUSC_1101774', '$2y$10$jQghQVonWMCarRZDahcKFO66NPTXewRbfgdgCJ065XGloVTioHm9a', '121101774', 'nhan101774@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005544', 'CUSC_1400662', '$2y$10$e3Q3qSBZ8WyA/p.YCSiw0ed9u6.zcw27k3/XuJEIN6AmdfBJr7.lO', '907340960', 'taib1400662@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005545', 'CUSC_1412974', '$2y$10$8tSXuQkhu5.zFufZ9dZoWeft.5T0RFX4p2qRZlN2W4TUIlYWIAalK', '1262942341', 'loib1412974@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005547', 'CUSC_1208736', '$2y$10$PHDMWG66P6nLXyeS.YURn.VRCGtAp79.B0eclKGps76RJ54eE.Gqi', '976387859', 'tienb1208736@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005548', 'CUSC_1203889', '$2y$10$TkZqZ94QiVyEeFQvEIUnnOThT2LHLFyy76MAvx3jLzb52b3Rfpz4a', '1656580460', 'nhanb1203889@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005549', 'CUSC_1411415', '$2y$10$GCdusLoubE1Mnkd6V/sNgeWLtOEDJFOJmD4XUNxgqjYlwBNvAfA9S', '907254188', 'namb1411415@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005550', 'CUSC_1400841', '$2y$10$9s8bJ6MUCUcrEF.Mz3dP8Oz.MuqZfHCYLR0lVRalIZPkcQ6PctzsG', '1684961934', 'nyb1400841@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005551', 'CUSC_1305032', '$2y$10$/pG0auX0rEosIGf3gVg1oeVTm0pHofl46FyRLe1734hfI6ryW/.j.', '1672151121', 'thib1305032@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005552', 'CUSC_1111520', '$2y$10$oCRsln3SAyxYg27pe9FuKOGXnHNnSdKdmIeEIULruzR9rtOlFq4LO', '1684311398', 'gam111520@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005554', 'CUSC_1111338', '$2y$10$2X2oFNBAYa3vjfn..dk1ROv5se74edHemtAnmdFC0FL1EAArsi33q', '1234474555', 'tan111338@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005555', 'CUSC_1400946', '$2y$10$CTkOjHTaBwTQY16IcOCHYe9q3zDpE3hqbL2Ca/ZGLwF38UTEOudym', '945146261', 'giangb1400946@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005556', 'CUSC_1401035', '$2y$10$FGSVAtCi1Fz8xHcecrC0uem0KK35iENyUKthOGAe0gLOJH8XrgQCa', '1868410260', 'duongb1401035@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005557', 'CUSC_1204211', '$2y$10$69lW9UW8wvvyzaPcVyYLkeBlzSeIuY87f5TzNfQ1kEgH/EYzerTFi', '1687315276', 'thachb1204211@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005558', 'CUSC_1203952', '$2y$10$HuRpEuhpSvA0iphGw3OEEezDWfN97sgL4wOXv6ComUWxygGxob49i', '1279003730', 'ngoanb1203952@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005560', 'CUSC_1400659', '$2y$10$Vv.ARc8udpkPOGBO.3nPvO./0zH1y6gyZ7Xy.2Yu.N.2ABPgPkuOW', '1684718295', 'quyenb1400659@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005561', 'CUSC_1208604', '$2y$10$bi3Q0yDZ3rEMmZx3dCWewOH0n6x6g1oEXbiyUXV4l62a0ABY1Lcr6', '1658406949', 'diemb1208604@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005562', 'CUSC_1111452', '$2y$10$3Y66x5.h9ruolNh7I.cw/eK3A3T2tq5Lf/B170dWvHkABvX.jTEHa', '986239023', 'thai111452@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005563', 'CUSC_1208636', '$2y$10$5CKJdqWYoZDAmnos6V0x4uRFrIKHXLCMpZbOacTK1g4eqInwSypKK', '1285641377', 'loanb1208636@student.ctu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005565', 'CUSC_1207870', '$2y$10$l2XpHbOTUfxHmJMirJDDPehivKIZ4JH1UB62XpjyacoX5nDuVRmG.', '1669515020', 'tuongb1207870@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005566', 'CUSC_1400794', '$2y$10$tEGaZzwAHbOyWPVVhCF8/uDV1lLDixhe.Gbik4L8DTepCebSB0aN.', '1235791570', 'thuyb1400794@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005567', 'CUSC_1411352', '$2y$10$TF65w9JCP.al.Wt76bb0wuJx5k2iL1kGBScrFeHEs1UoeT980SeSa', '1882773195', 'sonb1411352@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005568', 'CUSC_1400794', '$2y$10$Y6TndbmAbaMI8VEBJn5m0OR3/El67r7McvknB0bDafp.nL3GQhCdK', '1235791570', 'thuyb1400794@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005569', 'CUSC_1400867', '$2y$10$8C9D7Zo9R4z5PJDnNKD6Te1LM6l1IBvsflR99CjOXQNbmA6v.xXrO', '944899432', 'anhb1400867@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005571', 'CUSC_1401142', '$2y$10$6.1cRtx5FH781zNmSAZg4.CDmiDEtOPfGvbrN9Hq0oWIUezIdHEIy', '1292985756', 'huyb1401142@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005572', 'CUSC_1305035', '$2y$10$83hpc/TRBzYYzzshazwQy.jBOgS/Y1.JVueUqa2A5LuoUwBhKycSK', '982058000', 'thongb1305035@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005573', 'CUSC_1304686', '$2y$10$Xky6E8UGSpAjkfgtQQShiO8dxPrKX2qlrQvvYYGNfamFTCU/0n2uW', '1635994024', 'minh.hung.20.10.95@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005574', 'CUSC_1401087', '$2y$10$yEXxTXl.mZGqriC88DF/M.H4Ld5rNbJSL8JJ0wFloo7YAVzVdj7Tm', '1654921195', 'tanhb1401087@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005575', 'CUSC_1304024', '$2y$10$DYvgkj1yDzwNl.hxREAkYuv6X1jT5t3B55LmEZ8RaIggvNQ675lPS', '963087493', 'chungb1304024@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005576', 'CUSC_1401133', '$2y$10$l1AVknJQxvbM6d1yrdgMB.QzQ8ZeVA8m0OVkvDKZKXFCUcAoKVupa', '1253120426', 'dienb1401133@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005578', 'CUSC_1401105', '$2y$10$O6EpcE1tSu3x6tEVvXRKI.k2pP3N/nAR6T8Y.xrfEKd8pWkxDke1W', '973969843', 'trinhb1401105@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005579', 'CUSC_1411423', '$2y$10$VYt.rC66taoMtshYVHpYX.lXZNad5RTRB2tvz.CCxY9ita4RMhQf6', '966087321', 'phuongb1411423@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005580', 'CUSC_1305012', '$2y$10$zDTs4yzaM7h7uSyGyYQgQOQQoNypIeHLybwO7w7Cuasp9QMoDhY6u', '969823965', 'quangb1305012@student.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005581', 'CUSC_1208688', '$2y$10$3.xarZpYOmLCBZV5bKTlH.2XyGu4CrWqd6q1P4UavDHxGZUOYLauq', '978194451', 'trinhb1208688@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005582', 'CUSC_1208621', '$2y$10$LZVDeUvudPf4fwlaUBZEZOqbpuQlmWPWdNHsRaGY764jnRetuEYsG', '1665434483', 'huyb1208621@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005584', 'CUSC_1111411', '$2y$10$Bdz.zHgt9yHRdjXEhX8juuOJOoOTb0wmpEutwQ97imiYI97QkGkm.', '1687750895', 'linh111411@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005585', 'CUSC_3118102', '$2y$10$z7.DRpOCBjVeAJgR0SH8s.goQtSr40Au7FPvJacoq13LFRCO/Wlwi', '939150806', 'nguyet118102@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-09 16:06:52'),
('1544005586', 'CUSC_1310453', '$2y$10$LW.YurHUfefRl2N412.38efeGlxcBd07nA9I4qeovuraYhLbVqp0K', '932835170', 'thanhb1310453@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005587', 'CUSC_1401159', '$2y$10$1HRAjiaSUul57dN4fU4pIOnu8DSBMdacaJh3/M5x3rSGW.xOZ43fS', '1206899509', 'khoab1410215@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005588', 'CUSC_1400529', '$2y$10$MJwFMQGFGT2NYH/YGiRqu.Q0UWIKNmwTlkLmzVSFnja0yJLLXPhE6', '907354382', 'thub14005292@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005589', 'CUSC_1101745', '$2y$10$8IBgExl1D7I8EnjvhLd8wuR3WA8R8Bz8tWT2F0XiUih72h46haZz2', '975193219', 'hoang101745@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-06 05:18:05'),
('1544005591', 'CUSC_1401038', '$2y$10$4w79mboBGKLR8dYEARyPtOrwRlj27U.i.GHUH4h.kpwKt2rUbxY.2', '944353323', 'dangb1401038@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005592', 'CUSC_1200419', '$2y$10$ySZ4SZBRpN5nu/NzeQi/w.cxMPk3U23cxQgycZ2P8mTUE/gjurVeq', '1666249479', 'huynhc1200419@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005593', 'CUSC_1111287', '$2y$10$1cr8.uztHjQFhTQlT/bkb./tqKStV.bwjZIGLy1f3q4DS1MaQDE8m', '988990301', 'hanh111287@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005594', 'CUSC_1111313', '$2y$10$rme7BLnu2LRByfi92IboZuwP5l6L0FlX8zf767DWnwm5RiLXDJ5/m', '925054497', 'minh111313@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005595', 'CUSC_1304564', '$2y$10$osne/KZR/Zd0we0eUYRgz.1KevzcFe/0e6UkD6icCXr4cVfGScP0O', '1627224424', 'kyb1304564@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005597', 'CUSC_1401197', '$2y$10$QJNx9M7/mkQCoGRuXmNQ2uS80WyC88ERQCn2gFKefjUYEwdBa3ibS', '1647202365', 'trab1401197@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005598', 'CUSC_1400797', '$2y$10$1ElqLpx8Bv/hLjq57ZXMfuaeukHzAe8pTr3ph.qulJ9.Sh3Ybz2ku', '977246261', 'tiepb1400797@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005599', 'CUSC_1203977', '$2y$10$p0BrxniWkvof8vjw0a2fbOpiNBAJxje7VsJrD5xFVzvZVnTv8YVz6', '963880813', 'trangb1203977@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005600', 'CUSC_1401135', '$2y$10$3YPTn2.f5/rNnIXid3v38ueLpex2SAAZm63KZw2REYPj9FBC9E76a', '1224018740', 'giab1401135@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005601', 'CUSC_1204060', '$2y$10$rSNwRTj2mbhtfFRFlOp6WOb7IN8aTcRhSxYRdlgZOW.93Ws1DAO3m', '1882398829', 'quiB1204060@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005602', 'CUSC_1203897', '$2y$10$Lr/L/fqRqgE3437CMPlqU.x6QH/xnair5FMoSB6IIPt7nV/XAsftW', '1642955286', 'anhb1203897@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005604', 'CUSC_1111405', '$2y$10$If6AZ671xehk2XOpWKarwevhNxSCtV0qg5Cv/teky9kPSk7jtRI7e', '946657647', 'lam111405@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005605', 'CUSC_1304645', '$2y$10$X8OWHJU1ryE2sSqq4CwfKePZEjiLpcL3CFk3E/.PprdXwJH6po4Zy', '1638252808', 'voleduyanh1995@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005606', 'CUSC_1203891', '$2y$10$Qtl6GE3Cwfrb3OCkSoowD.REx/v5AAodQQTazqVaq3eNmX7fyTq.e', '1699344664', 'quocb1203891@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005607', 'CUSC_1400651', '$2y$10$H5WWUOzbFGKfeR94qTsfWOgnPdV.ftb0AoKn.2Lpa6bg8uJuIu1hK', '1222853349', 'nhungb1400651@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005608', 'CUSC_1304528', '$2y$10$yJbNxjxeaHTrXOYjm94H5ezp.V98OtqFSxTGNosKeZ/9sIsT18tcG', '989108862', 'aub1304528@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005609', 'CUSC_1107501', '$2y$10$4rUG2JnA2uzTgbGyp.k6euLqYhX4Q7oRcRZq1xzuoM.UmLIJEISvm', '1689426941', 'anh107501@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005612', 'CUSC_1200451', '$2y$10$vmOVatMPFdA/qAI0UBq1N.fUf3uyQvOPASJedjpTJCGOxXrlmedLi', '939095705', 'camtu0910@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005613', 'CUSC_1203964', '$2y$10$H5KWtj7Ls.HqpWsIBVDa8.w4OLx8APC5428fn.jJ6wpf4Mvk9OOTu', '362368522', 'thaib1203964@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005614', 'CUSC_1305029', '$2y$10$nX5CALUgfouf2feCDo5ho.b9vsQx9OpxFtv7/8hX7PnuewOYaJ1zS', '933552872', 'thanhb1305029@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005615', 'CUSC_1208715', '$2y$10$hoQt4fsAdYjQodfR36iL0.z8ZuO/TRxNXAAT/Nwxfa969ByQ3p1he', '934347570', 'choancuchuhu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005617', 'CUSC_1203937', '$2y$10$wn7gGLJCiGtlsv7Om1nweu3QjA0pNiLU9KdtK0RSK3h1HkGkt38wm', '936333228', 'kietb1203937@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005618', 'CUSC_1203887', '$2y$10$sNpgWiajlcvzDrerAY1VKej6RGeOcHt7YJrAd07NckQoJFMLyblqi', '939700743', 'loib1203887@student.ctu.edu..vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005619', 'CUSC_1304411', '$2y$10$DrPuW/vh/Nkzd8bCTigmQOjcFoKubzqCQjWhfjXkitTQbLuYTFDWK', '919882394', 'menb1304411@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005620', 'CUSC_1401008', '$2y$10$hDBP6ly5w141jnd.HRXk2.BJIHTlby9nkR149iuefLDqovO5GO5G6', '1655832950', 'trangb1401008@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-06 03:39:12'),
('1544005621', 'CUSC_1311431', '$2y$10$eTXArDcXlMl3ubab7TS0DOw0pwFyjFBXSeNXFn7Uhh/6yAwwWCeNe', '965899230', 'thinhb1311431@stdudent.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005622', 'CUSC_1400677', '$2y$10$q5ywRixmNK4mDPejmURpPODNiYi5CZ0ROpuB4wvWQeHGd1fVXUyw.', '1632011040', 'vub1400677@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005625', 'CUSC_1304489', '$2y$10$Bu2.AwB6kTWICEMLdJC96uyF90RU108TQpcvmOILPHoj9lw2r2GPq', '1869463205', 'hungB1304489@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005626', 'CUSC_1117815', '$2y$10$yFQjWkes81A4.DQN9ldspegsP11yzakbfHyoITv.BovxrvP/o/g9i', '1692064737', 'thao117815@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005627', 'CUSC_1304521', '$2y$10$dNjlYI.FYzQaY52ktDzutOboMkiYn3P/ru1KlpzAmGc844UjsbqCG', '1652994334', 'anb1304521@student.ctu.edu.vn', 1, 0, NULL, NULL, 'IwbvUoyAi38fP0DND5AJi50uV9dy5Oi5MQMVwyIxWLi2huWGBFpKy4KKssbA', '2018-12-05 10:25:55', '2018-12-09 19:26:56'),
('1544005628', 'CUSC_1204020', '$2y$10$RPsNkn6huLOWUtlrOrWpeeTVi5mwzwzrcyNS6D2lzlw9afx0bdXHS', '1664202215', 'huongB1204020@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005629', 'CUSC_1302514', '$2y$10$4jG21QboqRl8O03U12paQuxmEmHKWu/lJhktVS3XiTJBFQSRPPCKq', '924605029', 'trucb1302514@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005631', 'CUSC_1207785', '$2y$10$h7VBGXiD91a4MHnLiX6akeQsRv853dIu9dayANNDcbiFFpxXH/Pna', '939151586', 'vib1207785@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005632', 'CUSC_1304924', '$2y$10$3iLIOQ8h/WkyHUCY8T8zz.zITfhfqPh7BiQfVIK2ZrHHJV4GvtTom', '975987782', 'truongb1304924@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005633', 'CUSC_1201755', '$2y$10$NVkB/xUWRpdCYUXbZTuj3OrO0ZTfTgxXCkg7CKbq2oi7EvJe4183u', '963844501', 'loib1201755@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005634', 'CUSC_1200409', '$2y$10$76OyZACklNAYPF8YSV9xXeE6coLzlv/bIcrvV5Hsb5GnAGQb2i2TC', '1674609387', 'chuongc1200409@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005635', 'CUSC_1111321', '$2y$10$aj9bDxDvlNUX/aC9GVJcv.s1UkDOtOaUcVOyVYLtHnzOi5aAsHxjK', '986732457', 'nhan111321@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005637', 'CUSC_1208754', '$2y$10$XbLwmxyiNaSAJgqfDgJ.3OIVGzVlgChZ10edy9TJX5jaZJenBvBMu', '939633995', 'danhB1208754@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005638', 'CUSC_1209993', '$2y$10$kiCnKurKCXHl.lX0.14pSeZZ0x111GP7vSwT5I4.a9VxySwh9feBK', '937140949', 'chanhb1209993@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005640', 'CUSC_1208701', '$2y$10$u8/ZbyZ2D7o8fC53JpRMk.WxQ13Cqpc28CO/gBaWvii/uVW7fAxq2', '1685225085', 'vinhb1208701@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005641', 'CUSC_1401105', '$2y$10$X8X0JCQ5zYl0ab8i2.wUMupYZFZ78bRyrSYwJOW2DbARGUr4yEc6u', '973969843', 'trinhb1401105@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005642', 'CUSC_1119017', '$2y$10$j0lvnBLtuzetZ0iWpvwWUeXumFm3Gk1jzpsTXRJHudLUuE/a0t/Je', '939838684', 'nmkhoi@hotmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005644', 'CUSC_1311420', '$2y$10$iU0f/B3bdhpoOQr.Kf.KruuvlChb53oMsKIJFXSH6PIJKhBnvQmZ2', '964441575', 'phatb1311420@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005645', 'CUSC_1311435', '$2y$10$KviWQiCKiHUIrkg1FyCtOO6iYbVQPB9As3OSfB5Pa2PGQTSRX7Imi', '968999587', 'thub1311435@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005646', 'CUSC_1309517', '$2y$10$TiFwx3PnhZujrmYBb/HNJ.Jn/GTDfwyphpp6O8uXwYq9YyWaDRrMe', '973946102', 'anb1309517@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005647', 'CUSC_1311403', '$2y$10$o08/aJ1x4Q4pPRD6bZfNJut4gfBm4gTEOz6kxZe846Aq15ETAlLVm', '962463229', 'nganb1311403@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005648', 'CUSC_1311422', '$2y$10$nt4kVLn/XS.hKeknIaT1Q.11FefSIz7KYSboEiwET5GqJ/tTQ7RPi', '944477332', 'phiB1311522@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005651', 'CUSC_1311395', '$2y$10$FP0iiEWw/DC.F3QmHnoS.OFG81.TdeUAuYVJF7sCGXLh0iPsPlSN.', '1249938424', 'menb1311395@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005653', 'CUSC_1210034', '$2y$10$/.v0BHR3WhTY4mdDsFd..uQWxvEttYRnFO9xo112ObrSZQb7JSZ8G', '1886644322', 'tinhb1210034@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005654', 'CUSC_2092150', '$2y$10$yEo8A82Yf8kwFPYn5zHmiuFHOdGj6JDjKqTGFWIkrS9zm.WHa16J.', '939741912', 'nnphi150@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005655', 'CUSC_1206460', '$2y$10$eutfPS0MxlWcouofM83zr.rKnuaEb1/EXeJOfPzXgwqo0ExOnfZOC', '939475470', 'maib1206460@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005657', 'CUSC_1208362', '$2y$10$fgnBiwOlrpgDhFD.Bpk4W.LUz8Xa/lo2Jndfmn.GoUZ2iDDJE6Z5W', '1232688329', 'nguyenB1208362@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005658', 'CUSC_1208615', '$2y$10$mN.UzrekRKxlp0TsElT6R.VQ7rOhS/dGsQwNTDEBy3sLk33Zg7jFq', '907002231', 'haob1208615@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005659', 'CUSC_1203892', '$2y$10$.hCArlsh2URNaHJXBTiuZOprJ.pWsLl.PkY1Z0En3DoSMVTsfXoYe', '1629682246', 'thamb1203892@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005660', 'CUSC_1400981', '$2y$10$OCYJuNqI5So2NVYRWtFCF.eZLaGpqKyp7q3fWPgFIuXCE2WxlBCMK', '1649942880', 'phatb1400981@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005661', 'CUSC_1208678', '$2y$10$39Q3tYxBhCL27/WGuWdqru1wDfokWffmi8cOvbPPOg7Uv87WpetI6', '1225852347', 'thucb1208678@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005663', 'CUSC_1210029', '$2y$10$6l81LntOLtaot5zqZjEeCeIqmOZPbCqBrVP1WgrHf3uAoZNKSgU/m', '1683355904', 'taib1210029@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005664', 'CUSC_1311351', '$2y$10$GWUoMhFcgRiiBZQtDZSW/egqJoUN810B6cnW9YQ/3zWOtYZaxKmIm', '937165342', 'bichb1311351@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005665', 'CUSC_1404612', '$2y$10$ymcnKE33mZEpNozw.bVvsuTXtt4qRUlhOL5y1HCaPBUPxRMLORRxi', '1237088023', 'dungb1404612@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005666', 'CUSC_1407389', '$2y$10$3CTmbO8VqWdPxKEyXS5f7eYDIjmzpEfBQn3XY/j0T6P4QR0AfNBc.', '679376561', 'tranb1407389@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005667', 'CUSC_1202084', '$2y$10$B9BP1.Wz7RG3W8AgxVgZW.xbNmaifNm1kyWVL/omFOp8IOeVLr.5e', '1244126931', 'hnguyen2703@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005669', 'CUSC_1117981', '$2y$10$sKrdFTgtEXy8MzgK5UVra.l10omZED2FBmN/VZ6FyMr7MnoRzVuTm', '947142478', 'kien117981@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005670', 'CUSC_1117986', '$2y$10$jiD7YZnAX9rtOrd.qjfvOOEE.Eqdu9h46jZ7q3fYwo9LQMDUPtfk6', '1645012538', 'my117986@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005671', 'CUSC_1304975', '$2y$10$4IfbWpBeAwh4374Qq8ffMuifu5agGLLKSWSxD9puafp7UIH214xuW', '1266824824', 'khab1304975@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005672', 'CUSC_1401088', '$2y$10$b7YXC0QDDF3zigqQK5M/aewZtW/jEcrfGFxxk6r.L8kGqG6tEN0BC', '968183101', 'buiminhtamweb@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005673', 'CUSC_1118018', '$2y$10$UB.c4Z1PXglt9OGA4PqVJexQx6.nw1myhI8n8zMJUARvw1OPXYdZW', '939661399', 'thi118018@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005675', 'CUSC_1401947', '$2y$10$PX/54q1mOO6Po4ZZhh2tdulV45VoN4DO6c8H.8G/F.1y/b3N7a5pm', '966286605', 'cuongb1401947@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005676', 'CUSC_1117957', '$2y$10$0diFsL80S9/ad8ZAs01OE.baE70XpOI8d3tsT/tlvPQUVhzA6rlFu', '962920852', 'bao117957@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005677', 'CUSC_1208678', '$2y$10$JHH4qJjrV0uZvWFviOxOJ.KpzUzGN/P24qiii88ySHoN.MVjH8Gwu', '1225852347', 'thucb1208678@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005678', 'CUSC_1301411', '$2y$10$WtoRftY5../DKAXI1l2ptOSIN6cXRDUzI5iFtd3ybNhEeR4RRFx6O', '994336395', 'ltthanh13014@cusc.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005679', 'CUSC_1311346', '$2y$10$Esg/J9Taa6v3WGiE7/09zuEeS13M1sDDT5jNEB.L.ityazJpm9b0a', '966064122', 'ab1311346@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005681', 'CUSC_1309525', '$2y$10$Ox6pqn2ph2tXf/8Iv2Iy7eSLgwdrpiB6CtknOLuuqwvgygHhRl5LK', '1652269679', 'khangb1309525@sudent.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005682', 'CUSC_1408972', '$2y$10$7Zh03Gy7cEbyJg7Wwfc8XulCFwWmojz2CAzS7qeR8fEfX2E0Yuil6', '969355346', 'toanb1408972@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005683', 'CUSC_1305002', '$2y$10$NGywhBSESbZYRQaEfxfFreLizX0o1yx1kE0gxjOh/HYcU4LGezoVq', '1644666656', 'nhinB1305002@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005684', 'CUSC_1402391', '$2y$10$e/1mLRYPOb9mXdjP/klJDeXIcDDZXFs8vMD/7zkhPKyog4YZoSwpK', '1692024285', 'quyb1402391@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005685', 'CUSC_1302462', '$2y$10$Sc82tLFKLKF06cnbuqD2dOhbCSuIhcZCIjHpqsyOH9SoHKG0N8F8m', '1695661384', 'anhb1302462@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005686', 'CUSC_1400611', '$2y$10$EofWaR2zNpITLVgz7BCx0.0GGR8iuKt8zSXMDBN6.9mkwFtiM7thW', '983951721', 'bangb1400611@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005688', 'CUSC_1304544', '$2y$10$UnsjTe9noT6vZgPYwpLQy.frsu0RZ1kJwZ5LwkgV4FvRUDCmTGe.2', '1239332554', 'giangb1304544@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005689', 'CUSC_1304597', '$2y$10$7zlkL5ShbLS7pYBaBgV1bOqBY/ARuRXmQNaxlZqeC.vOMtfkN85Oi', '1662098660', 'sengb1304597@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005690', 'CUSC_1117867', '$2y$10$WYamL6mTN6BQWMs2HFLX9u8qTjxFucjS8XXBndaj8hprM/uKwg82y', '1239441421', 'binh117867@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005691', 'CUSC_1210042', '$2y$10$b580XndktZMEjYxwcj5qDeT7pwCBaWsJpfMg6z3E6Ysv61gIdaqcG', '944565749', 'vyb1210042@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005692', 'CUSC_1203966', '$2y$10$E/H4wSo61CF2qb7GKQBRRu2aY.ROkcHGj5Evbap3fUoEXYQkYhmw.', '941714815', 'thangb1203966@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005694', 'CUSC_1401002', '$2y$10$Y4zau.qydLnTCtayzIqMhOlDQ9EUYRi8yc3XdSYIJgCFILHDbv8lq', '790796890', 'Thinhb1401002@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005695', 'CUSC_1412981', '$2y$10$ABVgv8.NwUWtesRoH57fQuma2i7AwWOMU0FRbHlj95BhxCGTfrkTm', '913454603', 'cuongb1412981@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005696', 'CUSC_1303008', '$2y$10$4wBx9Xn.zEjbhJaAT7/OSe1KEzIQdMmT5GmGIG/dPdU7.mofSEXlq', '1639748873', 'nhienb1303008@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005697', 'CUSC_1404732', '$2y$10$WR0ERnclMqGhC0cxhHA1f..aCS1pHtfLCKwrjN0z.p60fq5ukVwi.', '1666843399', 'nhab1404732@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005698', 'CUSC_1404727', '$2y$10$rbnWPBkybAW1RGa.inDurel6sF9yLRTS1unjURNeVXRnfBeGYwqkO', '907380814', 'nghib1404727@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005699', 'CUSC_1404719', '$2y$10$eC8S1lJqHakerJE.hHbYdu2jVPgo8LU9Qq4NEzqUMPRCb7x9R15B6', '964398575', 'longb1404719@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005701', 'CUSC_1401105', '$2y$10$BzUdCmtre.rOWo1alnSY7utpTQQGKvRWiqj4N/oHZT7lEPDnbr33C', '973969843', 'trinhb1401105@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005702', 'CUSC_1400948', '$2y$10$UGIY.fvfmqO7YP/X7BkS7ugRuQcz2YqDci3RA9WhrKKj8gBHtGAQq', '964128200', 'haub1400948@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005703', 'CUSC_1210033', '$2y$10$osJHXyvnrw7ACwjw7w77h.FYmVu.OLNDbjadsDY7uqiSt91HvSm0W', '939654847', 'tiepb1210033@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005704', 'CUSC_4114709', '$2y$10$/YZXzKqtBv3utToUzFybeOQHpl9DsjxCojWkye/sFYyWqIKZsjp0K', '1648803127', 'truonghongsuong91@gmail.com', 1, 0, NULL, NULL, 'c1PCAGjj4ubpYULILuilHnvSFF2xzODWjBdZAcBkS5ImQTsmm25elTpuBgpw', '2018-12-05 10:26:07', '2018-12-09 19:01:11'),
('1544005705', 'CUSC_2513033', '$2y$10$hsraaJ8qJQl1KLQu0cMn3.fuHeo6RX0Q1StF./mJD1FrZbD1.RBt2', '1696635658', 'luthanhquy@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005706', 'CUSC_1204177', '$2y$10$cRxwM5CuV3I3DFIRWGizEOA5UVWXEED.r18D4ZxieO1ODY.ecr3Ae', '1225869301', 'linhb1204177@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005708', 'CUSC_1111503', '$2y$10$BOUs.xwZk2v73gTDcALLieOGUwv4j1J6M36LFCWr70yIWsoQozKdu', '988635229', 'nhu111503@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005709', 'CUSC_1101746', '$2y$10$GPttvLFRTKmFrzkVpcYnbuP.g39EsZoUgpALsglQIIRHIDh2cXS5.', '1649989540', 'buiduchocst1992@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005710', 'CUSC_1400743', '$2y$10$/4MfNwoax0Hd/CJrnY/KruBPFOWZbcAm3Q9k8ry/KL660FYV5pCCu', '1645183409', 'anb1400743@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005711', 'CUSC_1310527', '$2y$10$42OYRyBebzHnc/MkRRdTbuUY.UpQlYNYdF9r0EvwXk8S9SAVTRN0u', '907121478', 'dongocminh925@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005712', 'CUSC_1400678', '$2y$10$IfxEX33MOJDuqyTURIUNUOnbEICvE9iEqFgxFXO3tGJjCmS.aHhhG', '1639997154', 'AnB1400678@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005713', 'CUSC_1400679', '$2y$10$6RVAmsFmsqhBeXmsYeBxu.yrpfpeWLf1bzKTKBhZ4cj4i.YB0sNre', '1216812459', 'AnhB1400679@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005715', 'CUSC_1400680', '$2y$10$wkBBerEr.qt4wU9JWK.7tO5gv1nv3IgncXKIOrdCyREWkbs2x80pq', '1685388992', 'auB1400680@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005716', 'CUSC_1400682', '$2y$10$R/XwWpPw7BloRop0UQp2au/qGdp2Jq8/nSns8Md2y54xzoD1Ar9G2', '907651858', 'cuongB1400682@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005717', 'CUSC_1400685', '$2y$10$zlEee4qatQZic.oeEhTgIuRSu8aLR06mcwVfBEq3yo/qB.8aKgLaG', '1867226905', 'datB1400685@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005718', 'CUSC_1400686', '$2y$10$PUt/q7PICVpk3iQxqW2DquK8dT73iQxmkpN9G/TqcXexigm6sv8Jm', '1279482397', 'dienB1400686@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005719', 'CUSC_1400688', '$2y$10$79hWdfrIaNG9gp60orOHTuQm6Jyficxj8OqOP.CRj9BLgVUxK5pvC', '923482928', 'dinhB1400688@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005721', 'CUSC_1400689', '$2y$10$Kuyfe./fEdQ2iHqwadHWNOJvQ3oV9.I9F7ipCxYJRceVS6NnfrkeS', '1883734818', 'GiangB1400689@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005722', 'CUSC_1400690', '$2y$10$B/1FmRsmSFifDL/.aWKxweFJsKpoTb/Y/0P4DE7JeKb/xCX.cUktu', '1644288521', 'HaiB1400690@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005723', 'CUSC_1400691', '$2y$10$pD7/r.Uwkc.E0ZMk4M7O..yi2EeULzMfHqtctMZXZ3YQpmZHnblo2', '941613123', 'HieuB1400691@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005724', 'CUSC_1400692', '$2y$10$z1k9Zf9yfYIIfqIUbusmR.EsW/KUgeqxvO/KW9zULNPVEYJ/EPOdG', '982156671', 'HienB1400692@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005725', 'CUSC_1400694', '$2y$10$BLVtzJwXvqRY/nBU6hhzRedlxxLocqsKzivPgAY9brsRnt8hAG44.', '869143133', 'HuanB1400694@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005726', 'CUSC_1400695', '$2y$10$UlkEcfbQy6g3WBHxkrv1K.MJcwuX675i00.tniRdPozxV30tniN4.', '86914313', 'HuyB1400695@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005728', 'CUSC_1400696', '$2y$10$7KDqUwnkfMPjqjlZUdUp6uMb/t5YYd9Sv5xoyKTPeGz1ZXVWUTzG6', '972705703', 'KhanhB1400696@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005729', 'CUSC_1400700', '$2y$10$L9H0vOVQV0x8pHFtPaAgeOd/e1M5XfRe/x7LdTImnkBbIrq2IbMnC', '968208064', 'LangB1400700@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005730', 'CUSC_1400701', '$2y$10$zKCeMTPwJO0x2gOcTJw.qufNVzR13vfNHAGTQ6v5BLAPuZ//E1TNC', '1222186120', 'LiemB1400701@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005731', 'CUSC_1400702', '$2y$10$gkC32H0QKNY8xZXfoRPVKOWUWOH1VeradF2A8BuK21ANA3yHI.2q.', '965928981', 'LinhB1400702@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005732', 'CUSC_1400703', '$2y$10$tdwJ/zVcSEOwYhVdnV8gNO3UswidLCvp/.tXOabKJ3KL6KpS3vtAi', '1636090892', 'locB1400703@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005733', 'CUSC_1400704', '$2y$10$p.C9xxGnSiybnHxS2viC4ebHVSbI2BnjO8a28WuvgK7ywItYHeENW', '964054244', 'LuanB1400704@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005735', 'CUSC_1400705', '$2y$10$vul0Bk/xmtK8p0Lf58i/9eAhRX8JkbJkbFPSfrTJ56ABdCFkJquA2', '974898072', 'lyB1400705@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005736', 'CUSC_1400706', '$2y$10$iyho/kMLvPxZamzbGIEJ7.tdIv3zmeSZ9V4bjE1iKo0rR5tw92rja', '1642387350', 'MinhB1400706@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005737', 'CUSC_1400707', '$2y$10$Ca7eyT1OcI.T0sMqhyV5XeSxUC9tV6WFVTJEIj1ivCWVKBjVp01vG', '1652823179', 'ngaB1400707@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005738', 'CUSC_1400708', '$2y$10$FnICc.GBmGcfjnC0DWD0FO1G2oxk8zSzZWh.gDtXUTrdun8XPSMR.', '1658498829', 'nghiaB1400708@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005739', 'CUSC_1400710', '$2y$10$GyPzXmt5SfkiELoMZk1imOwzj55Qrd6C6YAz0CPrg/buMOm4Ruvfa', '1222125015', 'NhatB1400710@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005741', 'CUSC_1400711', '$2y$10$iO6K73t/eycDANMxCA4NQOCRPzKTKI8.UFBKT6C9C19i/AEq5/Gca', '1884257498', 'NhiB1400711@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005742', 'CUSC_1400713', '$2y$10$.2yaMBOCzEKSSNzYdLOdhu6X9hJHh4y2AntzFbkQC5PavxrQto6CO', '944164304', 'NhutB1400713@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005743', 'CUSC_1400714', '$2y$10$4mLAyZCFLYrj4WWxaYnJkeXquQprVhh7LPacOTf4N5/8jj2TZKcvS', '1672554887', 'OanhB1400714@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005744', 'CUSC_1400715', '$2y$10$iymYRMqsarq9flpYOCQIBepoJz7esz53l4f8yiVQFsjghBe.G9KV6', '969968142', 'PhatB1400715@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005745', 'CUSC_1400716', '$2y$10$UcCaFwJTeY4DLvax.u6mQOgAiuMg8qc651WCjm.NzQPOhWvaxUdR2', '1667290151', 'PhiB1400716@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005746', 'CUSC_1400717', '$2y$10$PDp8zpkOb7Wd.siOSmNY7O8jL5w6KPsjFmfoQGyg9Kl9UtTR0SZHS', '1686411464', 'PhongB1400717@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005747', 'CUSC_1400718', '$2y$10$NnLDMVIOV2m8BwI.WaaJuOkrlawMGdmFIiCzN7hPn3o/IHezDhsNy', '923167564', 'PhucB1400718@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005749', 'CUSC_1400719', '$2y$10$kvsRjNOP7o/c4E/Cw/O1LOd4aJ7SLXlPt488LpA7MESOfyDamrXGW', '1668060988', 'PhucB1400719@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005750', 'CUSC_1400720', '$2y$10$hYsUrAWV41mvGtxx0J5l8uV3xXSePYNvNBTBsuheZhj3FnsaXgjdy', '987729642', 'PhuocB1400720@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005751', 'CUSC_1400722', '$2y$10$kpiKMjV2B76rc/NAb242De.02kmfBtcCohPxq1AHzlv3N08A.S1gK', '1666988779', 'TaiB1400722@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005752', 'CUSC_1400726', '$2y$10$XMHqSjbBlvd08SJ3desmCuOtcNczoP9sjC5XD6QATt/2tnn/DXJxm', '1885455296', 'ThanhB1400726@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005753', 'CUSC_1400727', '$2y$10$9zgAOu8aIyFvDYnrdHNaYeMh7xhtXKu7BslH64AyhRVzc5TD40Flu', '1697102259', 'thanhb1400727@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005755', 'CUSC_1400728', '$2y$10$QSoWveqVpwjTmqsxmTYX/eV7qPQCQmhqBTtp0Gew4ePb9VpTLt/F6', '1697102260', 'ThietB1400728@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005756', 'CUSC_1400729', '$2y$10$Ft3r7e0D6gkQAEJMG9dbreCLIp.Fw1h7ju6sjBrchYwIQSn/ZbVqe', '936420439', 'ThoB1400729@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005757', 'CUSC_1400730', '$2y$10$3.6Lrj5tAaD2auoyKW4ybOzbhR2.opyoLnH6ttG.vgkTs0kvP9pHO', '989770923', 'ThuB1400730@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005758', 'CUSC_1400731', '$2y$10$/VvWnWtsxCEY368rRHHiV.7BO3hH.kjtIVoNc..o2YQrT/8DJX346', '1678911202', 'ThucB1400731@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005759', 'CUSC_1400732', '$2y$10$4XXz4GtjWZQ9DdoM5VrdIeGO8HGXJl7SEvUUoNuw7Vw7uuAL0F7Xi', '986865729', 'TienB1400732@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005760', 'CUSC_1400733', '$2y$10$mi571q/oxztGoaiH/FtfmujLac1S0dBaBMa.J2XrkekvICnFzlpOu', '1288799369', 'TinhB1400733@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005762', 'CUSC_1400734', '$2y$10$IqFMiPMODZoRDcvYJrKQaOhZQTErPdB91h5ZqBN6Rrp3PV4qy.Wq6', '1682987402', 'ToanB1400734@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005763', 'CUSC_1400735', '$2y$10$j2TlO1yoMhqn5S6lp33JdOdFhiRBX3HPCBMU1K9.ikcyixUC.tXem', '939900627', 'TrietB1400735@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005764', 'CUSC_1400736', '$2y$10$VSxARIvoJDaeWPuwKdb6Aut5ffsWoKxZ83HBtKIsfEuNEReOt4rZ.', '1639883047', 'TrongB1400736@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005765', 'CUSC_1400737', '$2y$10$A3pcZPj.zPmqyEx/DP1nJeeQXJrxdjfmDVgDI5aG1WkgSclTNf9p.', '1884460996', 'TrungB1400737@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005766', 'CUSC_1400738', '$2y$10$L.8p7LtLszGLRXPV1AMIPeBJ8dF1TcyWybDQ0xv2c77HpeYIfgDPO', '965991351', 'TruongB1400738@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005768', 'CUSC_1400739', '$2y$10$M316xOX8KVKYsijEekcUt.5DyworSTCs3AEAjs33uz7SKtRjpLQD.', '1216853105', 'UyB1400739@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:17', '2018-12-07 16:01:07'),
('1544005769', 'CUSC_1400742', '$2y$10$VRL0IxTMYkC89/.Y7PCRW./UkyCNYFZnCEhWwh0IMmGkvZ6CKI0PW', '1234213442', 'VuB1400742@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:17', '2018-12-08 04:05:09'),
('1544006432', 'CV_CUSC_0001', '$2y$10$HcP8VzEBXBsXYO2unMoUneey0.o9hDlyBKtUdV.BJ0i/OOiCkt5Za', '0123456001', 'ldai@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:40:32', '2018-12-05 15:35:17'),
('1544006491', 'CV_CUSC_0002', '$2y$10$GJVPxbSXcw.plmRLRBjlMOjoyjA4o7ixibHLxZyIrs2VDVnYIfCki', '0123456002', 'nmanh@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:41:31', '2018-12-05 10:41:31'),
('1544006529', 'CV_CUSC_0003', '$2y$10$6hgGRQcwP6Jsu3/Jj/MUNuhIBQ10UhB1H0cGnY61pWXBApP5..4Ua', '0123456003', 'tmanh@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:42:09', '2018-12-05 10:42:09'),
('1544006570', 'CV_CUSC_0004', '$2y$10$crw02ZwLwYiLtfq3YbVWIuLm7J6t5c1AKhFp/ATarQ/MeQoMbi0ra', '0123456004', 'cttu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:42:51', '2018-12-07 07:41:14'),
('1544006754', 'CB_CUSC_001', '$2y$10$9PI1EwGJsUfWXd4uyFr0MOV/Esaz95Q.GHoUN4qDRZN7XT/eMss9O', '097654001', 'ccyen@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:45:54', '2018-12-05 10:45:54'),
('1544011489', 'CB_CUSC_GV1', '$2y$10$Pmw/b8p8X5VB.NtkQZ7fsuN6gkZdj73RGsOSOb9FnitnPvnd61wbC', '0987654001', 'cclinh@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:04:49', '2018-12-05 12:04:49'),
('1544011559', 'CB__CUSC_GV2', '$2y$10$YjvhK.2rSJvgK.ZNgBNkF.Vc4v941ZLB00ZrosPgoLJ8wqyTl7DZ6', '0987654002', 'tdtra@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:05:59', '2018-12-05 12:05:59'),
('1544011582', 'CB__CUSC_GV2', '$2y$10$e12sT8iO0QVOuHUazbSql.5Wc/NIIUw6sd1QoxO7M3Hn.XQTGaDTu', '0987654002', 'tdtra@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:06:22', '2018-12-05 12:06:22'),
('1544011624', 'CB_CUSC_TV1', '$2y$10$TbsWg99Gw4/90hYOyyTQUusjfMULAfx1nq5uSs/1g1c0a66Ls18y2', '0987654003', 'ttan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:07:04', '2018-12-05 12:07:04'),
('1544011697', 'CB_CUSC_TV2', '$2y$10$8wj.5jcS1WRWRc7TONVRqeLT5cLMUoKG2QnpzO5/QQixwARt13o82', '0987654004', 'cqngan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:08:18', '2018-12-05 12:08:18'),
('1544011762', 'CB_CUSC_QHSV1', '$2y$10$u3Um0A0ZyJ4eWnIIlgxr7uB6ZSq1tPJMzyzI.l5PXPxRBSK4.PGvO', '0987654005', 'lbnhu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:09:22', '2018-12-05 12:09:22'),
('1544011812', 'CB_CUSC_QHSV2', '$2y$10$7mat7bwwBbxyLz8MglrV9uMLhosQ0GOwCQHAxKWMQiSZLbwJQ2Nh2', '0987654006', 'ndanh@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:10:12', '2018-12-05 12:10:12'),
('1544011858', 'CB_CUSC_TNCN1', '$2y$10$6gvTSRBpfGY09N16fsnsmOaU5tWO2/kysy2eAYYSOlwoe8nOCc98W', '0987654007', 'ltnhan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:10:59', '2018-12-05 12:10:59'),
('1544011904', 'CB_CUSC_TNCN2', '$2y$10$HKfY8bPa57wYj0YEeleOR.cGa1rYAPjlmGbgJ3s/kCIWwLe4RtKtO', '0987654008', 'tssang@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:11:44', '2018-12-05 12:11:44'),
('1544011919', 'CB_CUSC_TNCN2', '$2y$10$aNgT10i2FLRnAnqAhThmW.U7WPCr0e8nCo8V3aPBJgxUft2XHmEAe', '0987654008', 'tssang@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:11:59', '2018-12-05 12:11:59'),
('1544011963', 'CB_CUSC_TT1', '$2y$10$UWP9c8s8sVhcp/oaBSPF4.pQ93w69ajEHFCR50bGLLdmUKp7axEj2', '0987654009', 'ttbtam@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:12:43', '2018-12-05 12:12:43'),
('1544012015', 'CB_CUSC_TT2', '$2y$10$v4mcChd29XU1R0f73anTq.cWkX33mybpsmHzQvagti8mfsIgVBG7m', '0987654010', 'ttntrang@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:13:35', '2018-12-05 12:13:35'),
('1544012023', 'CB_CUSC_TT2', '$2y$10$4CfHxk.EQHYwNq/Jo3NYN.7eFMmwfL/DJ8q/2trHtvCPi5v3mogw6', '0987654010', 'ttntrang@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:13:43', '2018-12-05 12:13:43'),
('1544012271', 'ADMIN_CUSC2', '$2y$10$2G8cs9h3KX5Yq3XT5m.73e7PGiuznUmT7Nme6zO9ezZ8TvHyK6AEu', '0123456788', 'admin2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:17:51', '2018-12-05 12:17:51'),
('1544186899', '999999', '$2y$10$GHNJ81waA87J2uOU4HHDruCC8etAS1bUrTo8vOw5qMFFE8qZ5NGtK', '0964054244', 'a1dmin@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-07 12:48:20', '2018-12-07 12:48:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_has_active_achievement`
--

CREATE TABLE `users_has_active_achievement` (
  `uaa_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `aa_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users_has_active_achievement`
--

INSERT INTO `users_has_active_achievement` (`uaa_id`, `u_id`, `aa_id`, `created_at`, `updated_at`) VALUES
('1544154321', '1544005542', '1544153876', '2018-12-07 03:45:21', '2018-12-07 03:45:21'),
('1544154322', '1544005543', '1544153876', '2018-12-07 03:45:21', '2018-12-07 03:45:21'),
('1544154323', '1544005544', '1544153876', '2018-12-07 03:45:21', '2018-12-07 03:45:21'),
('1544154324', '1544005545', '1544153876', '2018-12-07 03:45:21', '2018-12-07 03:45:21'),
('1544154325', '1544005547', '1544153876', '2018-12-07 03:45:21', '2018-12-07 03:45:21'),
('1544156208', '1544005704', '1544153876', '2018-12-07 04:16:48', '2018-12-07 04:16:48'),
('1544204424', '1544005621', '1544153876', '2018-12-07 17:40:24', '2018-12-07 17:40:24'),
('1544204425', '1544005622', '1544153876', '2018-12-07 17:40:24', '2018-12-07 17:40:24'),
('1544204427', '1544005625', '1544153876', '2018-12-07 17:40:24', '2018-12-07 17:40:24'),
('1544204428', '1544005626', '1544153876', '2018-12-07 17:40:24', '2018-12-07 17:40:24'),
('1544204429', '1544005627', '1544153876', '2018-12-07 17:40:24', '2018-12-07 17:40:24'),
('1544204430', '1544005628', '1544153876', '2018-12-07 17:40:24', '2018-12-07 17:40:24'),
('1544318030', '1544005589', '1544153855', '2018-12-09 01:13:50', '2018-12-09 01:13:50'),
('1544318031', '1544005709', '1544153855', '2018-12-09 01:13:50', '2018-12-09 01:13:50'),
('1544318032', '1544005543', '1544153855', '2018-12-09 01:13:50', '2018-12-09 01:13:50'),
('1544318033', '1544005609', '1544153855', '2018-12-09 01:13:50', '2018-12-09 01:13:50'),
('1544318034', '1544005593', '1544153855', '2018-12-09 01:13:50', '2018-12-09 01:13:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_has_class`
--

CREATE TABLE `users_has_class` (
  `uc_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `cl_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users_has_class`
--

INSERT INTO `users_has_class` (`uc_id`, `u_id`, `cl_id`, `created_at`, `updated_at`) VALUES
('1544109048', '1544005733', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109049', '1544005732', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109050', '1544005731', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109051', '1544005730', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109052', '1544005729', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109053', '1544005728', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109054', '1544005726', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109055', '1544005725', '1544106633', '2018-12-06 15:10:48', '2018-12-06 15:10:48'),
('1544109057', '1544005724', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109058', '1544005723', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109059', '1544005722', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109060', '1544005721', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109061', '1544005719', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109062', '1544005718', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109063', '1544005717', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109064', '1544005716', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109065', '1544005715', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109066', '1544005713', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109067', '1544005712', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109068', '1544005711', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109069', '1544005710', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109070', '1544005709', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109071', '1544005708', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109072', '1544005706', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109073', '1544005705', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109074', '1544005704', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109075', '1544005703', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109076', '1544005702', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109077', '1544005701', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544109078', '1544005699', '1544106633', '2018-12-06 15:10:49', '2018-12-06 15:10:49'),
('1544198300', '1544005769', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198301', '1544005768', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198302', '1544005766', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198303', '1544005765', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198304', '1544005764', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198305', '1544005763', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198306', '1544005762', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198307', '1544005760', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198308', '1544005759', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198309', '1544005758', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198310', '1544005757', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198311', '1544005756', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198312', '1544005755', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198313', '1544005753', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198314', '1544005752', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198315', '1544005751', '1544106688', '2018-12-07 15:58:20', '2018-12-07 15:58:20'),
('1544198317', '1544005750', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198318', '1544005749', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198319', '1544005747', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198320', '1544005746', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198321', '1544005745', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198322', '1544005744', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198323', '1544005743', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198324', '1544005742', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198325', '1544005741', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198326', '1544005739', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198327', '1544005738', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198328', '1544005737', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198329', '1544005736', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544198330', '1544005735', '1544106688', '2018-12-07 15:58:21', '2018-12-07 15:58:21'),
('1544202832', '1544005733', '1544106688', '2018-12-07 17:13:52', '2018-12-07 17:13:52'),
('1544202833', '1544005732', '1544106688', '2018-12-07 17:13:52', '2018-12-07 17:13:52'),
('1544319288', '1544005731', '1544106688', '2018-12-09 01:34:47', '2018-12-09 01:34:47'),
('1544319304', '1544005730', '1544106688', '2018-12-09 01:35:04', '2018-12-09 01:35:04'),
('1544319305', '1544005729', '1544106688', '2018-12-09 01:35:04', '2018-12-09 01:35:04'),
('1544319306', '1544005728', '1544106688', '2018-12-09 01:35:04', '2018-12-09 01:35:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_has_roles`
--

CREATE TABLE `users_has_roles` (
  `ur_id` varchar(80) NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `r_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users_has_roles`
--

INSERT INTO `users_has_roles` (`ur_id`, `u_id`, `r_id`, `created_at`, `updated_at`) VALUES
('114234', '114234', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-10-11 18:27:13', '2018-12-07 14:46:28'),
('1544005542', '1544005542', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005543', '1544005543', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005544', '1544005544', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:42', '2018-12-05 10:25:42'),
('1544005546', '1544005545', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005547', '1544005547', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005548', '1544005548', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005549', '1544005549', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005550', '1544005550', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005551', '1544005551', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:43', '2018-12-05 10:25:43'),
('1544005553', '1544005552', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005554', '1544005554', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005555', '1544005555', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005556', '1544005556', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005557', '1544005557', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:44', '2018-12-05 10:25:44'),
('1544005559', '1544005558', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005560', '1544005560', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005561', '1544005561', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005562', '1544005562', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:45', '2018-12-05 10:25:45'),
('1544005563', '1544005563', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005565', '1544005565', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005566', '1544005566', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005567', '1544005567', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005568', '1544005568', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005569', '1544005569', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:46', '2018-12-05 10:25:46'),
('1544005571', '1544005571', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005572', '1544005572', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005573', '1544005573', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005574', '1544005574', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005575', '1544005575', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:47', '2018-12-05 10:25:47'),
('1544005577', '1544005576', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005578', '1544005578', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005579', '1544005579', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005580', '1544005580', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005581', '1544005581', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005582', '1544005582', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:48', '2018-12-05 10:25:48'),
('1544005584', '1544005584', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005585', '1544005585', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005586', '1544005586', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005587', '1544005587', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005588', '1544005588', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005589', '1544005589', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005591', '1544005591', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005592', '1544005592', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005593', '1544005593', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005594', '1544005594', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005595', '1544005595', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:50', '2018-12-05 10:25:50'),
('1544005597', '1544005597', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005598', '1544005598', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005599', '1544005599', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005600', '1544005600', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005601', '1544005601', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005602', '1544005602', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:51', '2018-12-05 10:25:51'),
('1544005604', '1544005604', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005605', '1544005605', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005606', '1544005606', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005607', '1544005607', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005608', '1544005608', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:52', '2018-12-05 10:25:52'),
('1544005610', '1544005609', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005612', '1544005612', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005613', '1544005613', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005614', '1544005614', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005615', '1544005615', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005617', '1544005617', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005618', '1544005618', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005619', '1544005619', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005620', '1544005620', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005621', '1544005621', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005623', '1544005622', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005625', '1544005625', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005626', '1544005626', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005627', '1544005627', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005628', '1544005628', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005630', '1544005629', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005631', '1544005631', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005632', '1544005632', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005633', '1544005633', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005634', '1544005634', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005636', '1544005635', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005637', '1544005637', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005638', '1544005638', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005640', '1544005640', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005641', '1544005641', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005643', '1544005642', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005644', '1544005644', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005645', '1544005645', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005646', '1544005646', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005647', '1544005647', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005648', '1544005648', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005651', '1544005651', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005653', '1544005653', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005654', '1544005654', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005656', '1544005655', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005657', '1544005657', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005658', '1544005658', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005659', '1544005659', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005660', '1544005660', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:00', '2018-12-05 10:26:00'),
('1544005662', '1544005661', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005663', '1544005663', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005664', '1544005664', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005665', '1544005665', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005666', '1544005666', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:01', '2018-12-05 10:26:01'),
('1544005668', '1544005667', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005669', '1544005669', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005670', '1544005670', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005671', '1544005671', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005672', '1544005672', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:02', '2018-12-05 10:26:02'),
('1544005674', '1544005673', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005675', '1544005675', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005676', '1544005676', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005677', '1544005677', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005678', '1544005678', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:03', '2018-12-05 10:26:03'),
('1544005680', '1544005679', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005681', '1544005681', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005682', '1544005682', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005683', '1544005683', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005684', '1544005684', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005685', '1544005685', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:04', '2018-12-05 10:26:04'),
('1544005687', '1544005686', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005688', '1544005688', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005689', '1544005689', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005690', '1544005690', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005691', '1544005691', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:05', '2018-12-05 10:26:05'),
('1544005692', '1544005692', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005694', '1544005694', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005695', '1544005695', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005696', '1544005696', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005697', '1544005697', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005698', '1544005698', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:06', '2018-12-05 10:26:06'),
('1544005699', '1544005699', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005701', '1544005701', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005702', '1544005702', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005703', '1544005703', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005704', '1544005704', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-07 04:05:55'),
('1544005705', '1544005705', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
('1544005707', '1544005706', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005708', '1544005708', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005709', '1544005709', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005710', '1544005710', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005711', '1544005711', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005712', '1544005712', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:08', '2018-12-05 10:26:08'),
('1544005714', '1544005713', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005715', '1544005715', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005716', '1544005716', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005717', '1544005717', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005718', '1544005718', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:09', '2018-12-05 10:26:09'),
('1544005719', '1544005719', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005721', '1544005721', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005722', '1544005722', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005723', '1544005723', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005724', '1544005724', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005725', '1544005725', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:10', '2018-12-05 10:26:10'),
('1544005727', '1544005726', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005728', '1544005728', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005729', '1544005729', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005730', '1544005730', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005731', '1544005731', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005732', '1544005732', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11'),
('1544005734', '1544005733', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005735', '1544005735', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005736', '1544005736', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005737', '1544005737', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005738', '1544005738', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:12', '2018-12-05 10:26:12'),
('1544005739', '1544005739', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005741', '1544005741', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005742', '1544005742', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005743', '1544005743', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005744', '1544005744', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005745', '1544005745', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005746', '1544005746', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:13', '2018-12-05 10:26:13'),
('1544005748', '1544005747', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005749', '1544005749', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005750', '1544005750', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005751', '1544005751', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005752', '1544005752', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005753', '1544005753', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:14', '2018-12-05 10:26:14'),
('1544005755', '1544005755', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005756', '1544005756', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005757', '1544005757', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005758', '1544005758', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005759', '1544005759', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:15', '2018-12-05 10:26:15'),
('1544005761', '1544005760', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005762', '1544005762', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005763', '1544005763', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005764', '1544005764', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005765', '1544005765', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005766', '1544005766', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:16', '2018-12-05 10:26:16'),
('1544005768', '1544005768', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:17', '2018-12-05 10:26:17'),
('1544005769', '1544005769', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:17', '2018-12-05 10:26:17'),
('1544006432', '1544006432', '0826eaf8086b01749bf7ff65742a200c', '2018-12-05 10:40:32', '2018-12-05 10:40:32'),
('1544006491', '1544006491', '0826eaf8086b01749bf7ff65742a200c', '2018-12-05 10:41:31', '2018-12-05 10:41:31'),
('1544006529', '1544006529', '0826eaf8086b01749bf7ff65742a200c', '2018-12-05 10:42:09', '2018-12-05 10:42:09'),
('1544006571', '1544006570', '0826eaf8086b01749bf7ff65742a200c', '2018-12-05 10:42:51', '2018-12-05 10:42:51'),
('1544011489', '1544011489', '1536238582', '2018-12-05 12:04:49', '2018-12-05 12:04:49'),
('1544011582', '1544011582', '1536238582', '2018-12-05 12:06:22', '2018-12-05 12:06:22'),
('1544011624', '1544011624', '1536238635', '2018-12-05 12:07:04', '2018-12-05 12:07:04'),
('1544011698', '1544011697', '1536238635', '2018-12-05 12:08:18', '2018-12-05 12:08:18'),
('1544011762', '1544011762', '1536286076', '2018-12-05 12:09:22', '2018-12-05 12:09:22'),
('1544011813', '1544011812', '1536286076', '2018-12-05 12:10:13', '2018-12-05 12:10:13'),
('1544011859', '1544011858', '1536653649', '2018-12-05 12:10:59', '2018-12-05 12:10:59'),
('1544011919', '1544011919', '1536653649', '2018-12-05 12:11:59', '2018-12-05 12:11:59'),
('1544011963', '1544011963', '1536653712', '2018-12-05 12:12:43', '2018-12-05 12:12:43'),
('1544012023', '1544012023', '1536653712', '2018-12-05 12:13:43', '2018-12-05 12:13:43'),
('1544012271', '1544012271', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-05 12:17:51', '2018-12-06 02:54:27'),
('1544186900', '1544186899', 'b2cba2a7a5499bd67320ba3d4046dc2e', '2018-12-07 12:48:20', '2018-12-07 12:50:16');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `active`
--
ALTER TABLE `active`
  ADD PRIMARY KEY (`a_id`);

--
-- Chỉ mục cho bảng `active_achievement`
--
ALTER TABLE `active_achievement`
  ADD PRIMARY KEY (`aa_id`);

--
-- Chỉ mục cho bảng `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`as_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`c_id`);

--
-- Chỉ mục cho bảng `category_child`
--
ALTER TABLE `category_child`
  ADD PRIMARY KEY (`cc_id`,`c_id`);

--
-- Chỉ mục cho bảng `category_child_has_cycle`
--
ALTER TABLE `category_child_has_cycle`
  ADD PRIMARY KEY (`ccc_id`);

--
-- Chỉ mục cho bảng `category_child_has_roles`
--
ALTER TABLE `category_child_has_roles`
  ADD PRIMARY KEY (`ccr_id`);

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cl_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cm_id`);

--
-- Chỉ mục cho bảng `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`cy_id`);

--
-- Chỉ mục cho bảng `cycle_select`
--
ALTER TABLE `cycle_select`
  ADD PRIMARY KEY (`cs_id`);

--
-- Chỉ mục cho bảng `default_entity`
--
ALTER TABLE `default_entity`
  ADD PRIMARY KEY (`d_id`);

--
-- Chỉ mục cho bảng `entity_cycle`
--
ALTER TABLE `entity_cycle`
  ADD PRIMARY KEY (`ec_id`);

--
-- Chỉ mục cho bảng `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`m_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`pm_id`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`re_id`);

--
-- Chỉ mục cho bảng `result_history`
--
ALTER TABLE `result_history`
  ADD PRIMARY KEY (`rh_id`);

--
-- Chỉ mục cho bảng `result_log`
--
ALTER TABLE `result_log`
  ADD PRIMARY KEY (`rl_id`);

--
-- Chỉ mục cho bảng `result_point`
--
ALTER TABLE `result_point`
  ADD PRIMARY KEY (`rp_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`r_id`);

--
-- Chỉ mục cho bảng `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`ro_id`);

--
-- Chỉ mục cho bảng `school_year`
--
ALTER TABLE `school_year`
  ADD PRIMARY KEY (`sy_id`);

--
-- Chỉ mục cho bảng `sum_scores_log`
--
ALTER TABLE `sum_scores_log`
  ADD PRIMARY KEY (`ss_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_has_active_achievement`
--
ALTER TABLE `users_has_active_achievement`
  ADD PRIMARY KEY (`uaa_id`);

--
-- Chỉ mục cho bảng `users_has_class`
--
ALTER TABLE `users_has_class`
  ADD PRIMARY KEY (`uc_id`);

--
-- Chỉ mục cho bảng `users_has_roles`
--
ALTER TABLE `users_has_roles`
  ADD PRIMARY KEY (`ur_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
