-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2018 lúc 05:21 PM
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
('1544024917', '114234', 'abc', '2016-10-10', '2019-10-10', '<p>dfasdfasdfasdfasd</p>', 'not img', 10, -1, '2018-12-05 15:48:37', '2018-12-05 15:48:37'),
('1544024930', '114234', 'abc', '2016-10-10', '2019-10-10', '<p>dfasdfasdfasdfasd</p>', 'not img', 10, -1, '2018-12-05 15:48:50', '2018-12-05 15:48:50');

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
  `aa_scores` int(11) NOT NULL,
  `aa_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('1542441965', '1542441965', '1536306397', '2018-11-17 08:06:05', '2018-11-17 01:06:22');

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
('1543505141', '1536650574', '1536238582', '2018-11-29 15:25:40', '2018-11-29 15:25:40');

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
('1544014847', 'An toàn an ninh thông tin K2', 'CL0006', 1, '1544006529', '1536293003', '1536301128', '2018-12-05 13:00:47', '2018-12-05 13:00:47');

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
('1536306362', 'Toàn khóa', 'Toàn khóa học', 1, '2018-09-07 07:46:02', '2018-09-07 00:57:28'),
('1536306397', 'Hàng năm', 'Một năm', 1, '2018-09-07 07:46:37', '2018-09-07 07:46:37'),
('1536306411', 'Hằng quý', 'Một quý', 1, '2018-09-07 07:46:51', '2018-09-07 07:46:51');

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
('1536301160', 'CUSCMJ006', 'Bằng CNTT Anh Quốc', 1, '2018-09-07 06:19:20', '2018-11-10 13:44:53'),
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
('1541262578', '', 'majors', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-03 16:38:33', '2018-11-30 02:52:53'),
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
('1541336554', '114234', 'roles/remove/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:02:25', '2018-11-04 13:02:25'),
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
('1543330595', '114234', 'entity/api/get/next', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-27 14:56:35', '2018-11-27 14:56:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phantrang`
--

CREATE TABLE `phantrang` (
  `id_pt` varchar(80) NOT NULL,
  `name_pt` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `phantrang`
--

INSERT INTO `phantrang` (`id_pt`, `name_pt`, `created_at`, `updated_at`) VALUES
('0', '00', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('1', '11', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('10', '1010', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('100', '100100', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('101', '101101', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('102', '102102', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('103', '103103', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('104', '104104', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('105', '105105', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('106', '106106', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('107', '107107', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('108', '108108', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('109', '109109', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('11', '1111', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('110', '110110', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('111', '111111', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('112', '112112', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('113', '113113', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('114', '114114', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('115', '115115', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('116', '116116', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('117', '117117', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('118', '118118', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('119', '119119', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('12', '1212', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('120', '120120', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('121', '121121', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('122', '122122', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('123', '123123', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('124', '124124', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('125', '125125', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('126', '126126', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('127', '127127', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('128', '128128', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('129', '129129', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('13', '1313', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('130', '130130', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('131', '131131', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('132', '132132', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('133', '133133', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('134', '134134', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('135', '135135', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('136', '136136', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('137', '137137', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('138', '138138', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('139', '139139', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('14', '1414', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('140', '140140', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('141', '141141', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('142', '142142', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('143', '143143', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('144', '144144', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('145', '145145', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('146', '146146', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('147', '147147', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('148', '148148', '2018-11-09 15:48:37', '2018-11-09 15:48:37'),
('149', '149149', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('15', '1515', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('150', '150150', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('151', '151151', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('152', '152152', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('153', '153153', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('154', '154154', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('155', '155155', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('156', '156156', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('157', '157157', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('158', '158158', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('159', '159159', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('16', '1616', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('160', '160160', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('161', '161161', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('162', '162162', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('163', '163163', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('164', '164164', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('165', '165165', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('166', '166166', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('167', '167167', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('168', '168168', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('169', '169169', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('17', '1717', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('170', '170170', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('171', '171171', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('172', '172172', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('173', '173173', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('174', '174174', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('175', '175175', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('176', '176176', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('177', '177177', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('178', '178178', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('179', '179179', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('18', '1818', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('180', '180180', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('181', '181181', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('182', '182182', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('183', '183183', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('184', '184184', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('185', '185185', '2018-11-09 15:48:38', '2018-11-09 15:48:38'),
('186', '186186', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('187', '187187', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('188', '188188', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('189', '189189', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('19', '1919', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('190', '190190', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('191', '191191', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('192', '192192', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('193', '193193', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('194', '194194', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('195', '195195', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('196', '196196', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('197', '197197', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('198', '198198', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('199', '199199', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('2', '22', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('20', '2020', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('200', '200200', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('201', '201201', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('202', '202202', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('203', '203203', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('204', '204204', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('205', '205205', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('206', '206206', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('207', '207207', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('208', '208208', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('209', '209209', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('21', '2121', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('210', '210210', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('211', '211211', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('212', '212212', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('213', '213213', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('214', '214214', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('215', '215215', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('216', '216216', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('217', '217217', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('218', '218218', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('219', '219219', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('22', '2222', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('220', '220220', '2018-11-09 15:48:39', '2018-11-09 15:48:39'),
('221', '221221', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('222', '222222', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('223', '223223', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('224', '224224', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('225', '225225', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('226', '226226', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('227', '227227', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('228', '228228', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('229', '229229', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('23', '2323', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('230', '230230', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('231', '231231', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('232', '232232', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('233', '233233', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('234', '234234', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('235', '235235', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('236', '236236', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('237', '237237', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('238', '238238', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('239', '239239', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('24', '2424', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('240', '240240', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('241', '241241', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('242', '242242', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('243', '243243', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('244', '244244', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('245', '245245', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('246', '246246', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('247', '247247', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('248', '248248', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('249', '249249', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('25', '2525', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('250', '250250', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('251', '251251', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('252', '252252', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('253', '253253', '2018-11-09 15:48:40', '2018-11-09 15:48:40'),
('254', '254254', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('255', '255255', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('256', '256256', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('257', '257257', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('258', '258258', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('259', '259259', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('26', '2626', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('260', '260260', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('261', '261261', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('262', '262262', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('263', '263263', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('264', '264264', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('265', '265265', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('266', '266266', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('267', '267267', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('268', '268268', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('269', '269269', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('27', '2727', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('270', '270270', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('271', '271271', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('272', '272272', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('273', '273273', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('274', '274274', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('275', '275275', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('276', '276276', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('277', '277277', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('278', '278278', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('279', '279279', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('28', '2828', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('280', '280280', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('281', '281281', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('282', '282282', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('283', '283283', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('284', '284284', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('285', '285285', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('286', '286286', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('287', '287287', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('288', '288288', '2018-11-09 15:48:41', '2018-11-09 15:48:41'),
('289', '289289', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('29', '2929', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('290', '290290', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('291', '291291', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('292', '292292', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('293', '293293', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('294', '294294', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('295', '295295', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('296', '296296', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('297', '297297', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('298', '298298', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('299', '299299', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('3', '33', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('30', '3030', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('300', '300300', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('301', '301301', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('302', '302302', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('303', '303303', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('304', '304304', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('305', '305305', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('306', '306306', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('307', '307307', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('308', '308308', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('309', '309309', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('31', '3131', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('310', '310310', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('311', '311311', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('312', '312312', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('313', '313313', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('314', '314314', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('315', '315315', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('316', '316316', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('317', '317317', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('318', '318318', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('319', '319319', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('32', '3232', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('320', '320320', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('321', '321321', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('322', '322322', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('323', '323323', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('324', '324324', '2018-11-09 15:48:42', '2018-11-09 15:48:42'),
('325', '325325', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('326', '326326', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('327', '327327', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('328', '328328', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('329', '329329', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('33', '3333', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('330', '330330', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('331', '331331', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('332', '332332', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('333', '333333', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('334', '334334', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('335', '335335', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('336', '336336', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('337', '337337', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('338', '338338', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('339', '339339', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('34', '3434', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('340', '340340', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('341', '341341', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('342', '342342', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('343', '343343', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('344', '344344', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('345', '345345', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('346', '346346', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('347', '347347', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('348', '348348', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('349', '349349', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('35', '3535', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('350', '350350', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('351', '351351', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('352', '352352', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('353', '353353', '2018-11-09 15:48:43', '2018-11-09 15:48:43'),
('354', '354354', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('355', '355355', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('356', '356356', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('357', '357357', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('358', '358358', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('359', '359359', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('36', '3636', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('360', '360360', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('361', '361361', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('362', '362362', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('363', '363363', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('364', '364364', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('365', '365365', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('366', '366366', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('367', '367367', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('368', '368368', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('369', '369369', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('37', '3737', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('370', '370370', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('371', '371371', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('372', '372372', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('373', '373373', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('374', '374374', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('375', '375375', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('376', '376376', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('377', '377377', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('378', '378378', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('379', '379379', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('38', '3838', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('380', '380380', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('381', '381381', '2018-11-09 15:48:44', '2018-11-09 15:48:44'),
('382', '382382', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('383', '383383', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('384', '384384', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('385', '385385', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('386', '386386', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('387', '387387', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('388', '388388', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('389', '389389', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('39', '3939', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('390', '390390', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('391', '391391', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('392', '392392', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('393', '393393', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('394', '394394', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('395', '395395', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('396', '396396', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('397', '397397', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('398', '398398', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('399', '399399', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('4', '44', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('40', '4040', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('400', '400400', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('401', '401401', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('402', '402402', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('403', '403403', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('404', '404404', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('405', '405405', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('406', '406406', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('407', '407407', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('408', '408408', '2018-11-09 15:48:45', '2018-11-09 15:48:45'),
('409', '409409', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('41', '4141', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('410', '410410', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('411', '411411', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('412', '412412', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('413', '413413', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('414', '414414', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('415', '415415', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('416', '416416', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('417', '417417', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('418', '418418', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('419', '419419', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('42', '4242', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('420', '420420', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('421', '421421', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('422', '422422', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('423', '423423', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('424', '424424', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('425', '425425', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('426', '426426', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('427', '427427', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('428', '428428', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('429', '429429', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('43', '4343', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('430', '430430', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('431', '431431', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('432', '432432', '2018-11-09 15:48:46', '2018-11-09 15:48:46'),
('433', '433433', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('434', '434434', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('435', '435435', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('436', '436436', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('437', '437437', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('438', '438438', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('439', '439439', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('44', '4444', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('440', '440440', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('441', '441441', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('442', '442442', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('443', '443443', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('444', '444444', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('445', '445445', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('446', '446446', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('447', '447447', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('448', '448448', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('449', '449449', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('45', '4545', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('450', '450450', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('451', '451451', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('452', '452452', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('453', '453453', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('454', '454454', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('455', '455455', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('456', '456456', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('457', '457457', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('458', '458458', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('459', '459459', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('46', '4646', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('460', '460460', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('461', '461461', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('462', '462462', '2018-11-09 15:48:47', '2018-11-09 15:48:47'),
('463', '463463', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('464', '464464', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('465', '465465', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('466', '466466', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('467', '467467', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('468', '468468', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('469', '469469', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('47', '4747', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('470', '470470', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('471', '471471', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('472', '472472', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('473', '473473', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('474', '474474', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('475', '475475', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('476', '476476', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('477', '477477', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('478', '478478', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('479', '479479', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('48', '4848', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('480', '480480', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('481', '481481', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('482', '482482', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('483', '483483', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('484', '484484', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('485', '485485', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('486', '486486', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('487', '487487', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('488', '488488', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('489', '489489', '2018-11-09 15:48:48', '2018-11-09 15:48:48'),
('49', '4949', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('490', '490490', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('491', '491491', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('492', '492492', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('493', '493493', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('494', '494494', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('495', '495495', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('496', '496496', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('497', '497497', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('498', '498498', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('499', '499499', '2018-11-09 15:48:49', '2018-11-09 15:48:49'),
('5', '55', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('50', '5050', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('51', '5151', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('52', '5252', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('53', '5353', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('54', '5454', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('55', '5555', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('56', '5656', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('57', '5757', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('58', '5858', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('59', '5959', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('6', '66', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('60', '6060', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('61', '6161', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('62', '6262', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('63', '6363', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('64', '6464', '2018-11-09 15:48:34', '2018-11-09 15:48:34'),
('65', '6565', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('66', '6666', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('67', '6767', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('68', '6868', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('69', '6969', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('7', '77', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('70', '7070', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('71', '7171', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('72', '7272', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('73', '7373', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('74', '7474', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('75', '7575', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('76', '7676', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('77', '7777', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('78', '7878', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('79', '7979', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('8', '88', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('80', '8080', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('81', '8181', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('82', '8282', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('83', '8383', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('84', '8484', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('85', '8585', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('86', '8686', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('87', '8787', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('88', '8888', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('89', '8989', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('9', '99', '2018-11-09 15:48:33', '2018-11-09 15:48:33'),
('90', '9090', '2018-11-09 15:48:35', '2018-11-09 15:48:35'),
('91', '9191', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('92', '9292', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('93', '9393', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('94', '9494', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('95', '9595', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('96', '9696', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('97', '9797', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('98', '9898', '2018-11-09 15:48:36', '2018-11-09 15:48:36'),
('99', '9999', '2018-11-09 15:48:36', '2018-11-09 15:48:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phantrang2`
--

CREATE TABLE `phantrang2` (
  `id` varchar(80) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `phantrang2`
--

INSERT INTO `phantrang2` (`id`, `name`, `created_at`, `updated_at`) VALUES
('95', '9595', '2018-11-27 19:22:08', '2018-11-27 19:22:08'),
('96', '9595', '2018-11-27 19:22:08', '2018-11-27 19:36:25'),
('97', '9595', '2018-11-27 19:22:08', '2018-11-27 19:36:29'),
('98', '9898', '2018-11-27 19:22:08', '2018-11-27 19:22:08'),
('99', '9999', '2018-11-27 19:22:08', '2018-11-27 19:22:08');

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
('1544005079', 'Nguyễn Vũ Trinh Nhân', '2018-01-02', 'Cần Thơ', 0, '2018-12-05 10:17:58', '2018-12-05 10:17:58'),
('1544005080', 'Tăng Vĩnh Tài ', '2018-01-03', 'Cần Thơ', 1, '2018-12-05 10:17:58', '2018-12-05 10:17:58'),
('1544005082', 'Trần Lê Ngọc Lợi', '2018-01-04', 'Cần Thơ', 1, '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005083', 'Lê Thị Cẩm Tiên', '2018-01-05', 'Cần Thơ', 0, '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005084', 'Nguyên Thành Nhân', '2018-01-06', 'Cần Thơ', 1, '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005085', 'Nguyễn Huỳnh Trung Nam', '2018-01-07', 'Cần Thơ', 1, '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005086', 'Nguyễn My Ny', '2018-01-08', 'Cần Thơ', 0, '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005087', 'Trần Thị Kim Thi', '2018-01-09', 'Cần Thơ', 0, '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005089', 'Nguyễn Thị Hồng Gấm', '2018-01-10', 'Cần Thơ', 0, '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005090', 'Phạm Thanh Tân', '2018-01-11', 'Cần Thơ', 1, '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005091', 'Đỗ Thiên Giang', '2018-01-12', 'Cần Thơ', 1, '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005092', 'Lê Nguyễn Thái Dương', '2018-01-13', 'Cần Thơ', 1, '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005094', 'Đặng Ngọc Thạch', '2018-01-14', 'Cần Thơ', 1, '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005095', 'Phan Thanh Ngoan', '2018-01-15', 'Cần Thơ', 0, '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005096', 'La Tố Quyên', '2018-01-16', 'Cần Thơ', 0, '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005097', 'Nguyễn Thị Diễm', '2018-01-17', 'Cần Thơ', 0, '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005098', 'Lưu Quốc Thái', '2018-01-18', 'Cần Thơ', 1, '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005099', 'Đỗ Thị Hồng Loan', '2018-01-19', 'Cần Thơ', 0, '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005101', 'Tạ Đức Tường', '2018-01-20', 'Cần Thơ', 1, '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005102', 'Nguyễn Ngọc Thúy', '2018-01-21', 'Cần Thơ', 0, '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005103', 'Nguyễn Vũ Sơn', '2018-01-22', 'Cần Thơ', 1, '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005104', 'Nguyễn Ngọc Thúy', '2018-01-23', 'Cần Thơ', 0, '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005105', 'Nguyễn Ngọc Ánh', '2018-01-24', 'Cần Thơ', 0, '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005107', 'Huỳnh Nhật Huy', '2018-01-25', 'Cần Thơ', 1, '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005108', 'Đinh Tấn Thông', '2018-01-26', 'Cần Thơ', 1, '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005109', 'Nguyễn Minh Hưng', '2018-01-27', 'Cần Thơ', 1, '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005110', 'Nguyễn Huỳnh Thành Tánh', '2018-01-28', 'Cần Thơ', 1, '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005111', 'Huỳnh Văn Chung', '2018-01-29', 'Cần Thơ', 1, '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005113', 'Dương Lữ Điện', '2018-01-30', 'Cần Thơ', 1, '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005114', 'Nguyen Thi Phuong Trinh', '2018-01-31', 'Cần Thơ', 0, '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005115', 'Lê Trọng Phương', '2018-02-01', 'Cần Thơ', 1, '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005116', 'Phạm Ngọc Quang', '2018-02-02', 'Cần Thơ', 1, '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005117', 'Nguyễn Trần Ái Trinh', '2018-02-03', 'Cần Thơ', 0, '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005118', 'Thái Anh Huy', '2018-02-04', 'Cần Thơ', 1, '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005120', 'Trần Văn Vũ Linh', '2018-02-05', 'Cần Thơ', 1, '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005121', 'Huỳnh Nguyễn Minh Nguyệt ', '2018-02-06', 'Cần Thơ', 0, '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005122', 'Lê Duy Thanh', '2018-02-07', 'Cần Thơ', 1, '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005123', 'Phạm Đình Anh Khoa', '2018-02-08', 'Cần Thơ', 1, '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005124', 'Nguyễn Thị Anh Thư', '2018-02-09', 'Cần Thơ', 0, '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005126', 'Nguyễn Huy Hoàng', '2018-02-10', 'Cần Thơ', 1, '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005127', 'Võ Nguyễn Đăng', '2018-02-11', 'Cần Thơ', 1, '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005128', 'Châu Thị Thúy Huỳnh', '2018-02-12', 'Cần Thơ', 1, '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005129', 'Lê Thị Mỹ Hạnh', '2018-02-13', 'Cần Thơ', 0, '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005131', 'Nguyễn Hoàng Minh', '2018-02-14', 'Cần Thơ', 1, '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005132', 'Huỳnh Gia Kỳ', '2018-02-15', 'Cần Thơ', 1, '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005133', 'Thạch Chanh Tra', '2018-02-16', 'Cần Thơ', 1, '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005134', 'Trác Mẫn Tiệp', '2018-02-17', 'Cần Thơ', 1, '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005135', 'Nguyen Thi Thuy Trang', '2018-02-18', 'Cần Thơ', 0, '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005137', 'Võ Hoàng Gia', '2018-02-19', 'Cần Thơ', 1, '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005138', 'Hà Văn Quí', '2018-02-20', 'Cần Thơ', 1, '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005139', 'Lê Tuấn Anh', '2018-02-21', 'Cần Thơ', 1, '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005140', 'Đường Khánh Lâm', '2018-02-22', 'Cần Thơ', 1, '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005141', 'Võ Lê Duy Anh', '2018-02-23', 'Cần Thơ', 1, '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005142', 'Nguyễn Văn Quốc', '2018-02-24', 'Cần Thơ', 1, '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005144', 'Đặng Thị Hồng Nhung', '2018-02-25', 'Cần Thơ', 0, '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005145', 'Phạm Nguyễn Hải Âu', '2018-02-26', 'Cần Thơ', 1, '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005146', 'Huynh Ngoc Thai Anh', '2018-02-27', 'Cần Thơ', 1, '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005147', 'Chau Kim Sêng', '2018-02-28', 'Cần Thơ', 1, '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005148', 'Trần Thị Cẩm Tú', '2018-03-01', 'Cần Thơ', 0, '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005149', 'Đỗ Hà Quốc Thái', '2018-03-02', 'Cần Thơ', 1, '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005151', 'Trương Dủ Thành', '2018-03-03', 'Cần Thơ', 1, '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005152', 'Trương Trung Hiếu', '2018-03-04', 'Cần Thơ', 1, '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005153', 'Trần Văn Kiệt', '2018-03-05', 'Cần Thơ', 1, '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005154', 'Danh Lợi', '2018-03-06', 'Cần Thơ', 1, '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005155', 'Lê Thị Mến', '2018-03-07', 'Cần Thơ', 0, '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005157', 'Biện Thị Thùy Trang', '2018-03-08', 'Cần Thơ', 0, '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005158', 'Nguyễn Thành Thịnh', '2018-03-09', 'Cần Thơ', 1, '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005159', 'Nguyễn Khánh Vũ', '2018-03-10', 'Cần Thơ', 1, '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005160', 'Lê Minh Hưng', '2018-03-11', 'Cần Thơ', 1, '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005161', 'Lê Minh Hưng', '2018-03-12', 'Cần Thơ', 1, '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005162', 'Hồ Thị Thanh Thảo', '2018-03-13', 'Cần Thơ', 0, '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005164', 'Lê Thị Nhật An', '2018-03-14', 'Cần Thơ', 1, '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005165', 'Ngô Hoài Diễm Hương', '2018-03-15', 'Cần Thơ', 0, '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005166', 'Hồ Kim Trúc', '2018-03-16', 'Cần Thơ', 0, '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005167', 'Lâm Quang Vĩ', '2018-03-17', 'Cần Thơ', 1, '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005168', 'Trần Nguyễn Chí Trường', '2018-03-18', 'Cần Thơ', 1, '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005170', 'Nguyễn Kim Lới', '2018-03-19', 'Cần Thơ', 1, '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005171', 'Lê Duy Chương', '2018-03-20', 'Cần Thơ', 1, '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005172', 'Hồ Hữu Nhân', '2018-03-21', 'Cần Thơ', 1, '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005173', 'Võ Hoài Danh', '2018-03-22', 'Cần Thơ', 1, '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005175', 'Lê Công Chánh', '2018-03-23', 'Cần Thơ', 1, '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005176', 'Bùi Đức Học', '2018-03-24', 'Cần Thơ', 1, '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005177', 'Võ thanh vinh', '2018-03-25', 'Cần Thơ', 1, '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005178', 'Nguyễn Thị Phương Trinh', '2018-03-27', 'Cần Thơ', 0, '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005179', 'Nguyễn Minh Khôi', '2018-03-28', 'Cần Thơ', 1, '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005180', 'Huỳnh Tấn Phát', '2018-03-29', 'Cần Thơ', 1, '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005182', 'Huỳnh Minh Thư', '2018-03-30', 'Cần Thơ', 0, '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005183', 'Ngô Hoàng Thái An', '2018-03-31', 'Cần Thơ', 1, '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005184', 'Dương Huỳnh Ngân', '2018-04-01', 'Cần Thơ', 0, '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005185', 'Lê Văn Phi', '2018-04-02', 'Cần Thơ', 0, '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005186', 'Lê Văn Phi', '2018-04-03', 'Cần Thơ', 1, '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005187', 'Mai Thanh Mến', '2018-04-04', 'Cần Thơ', 1, '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005189', 'Lê Văn Phi', '2018-04-05', 'Cần Thơ', 1, '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005190', 'Nguyễn Hoàng Tính', '2018-04-06', 'Cần Thơ', 1, '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005191', 'Nguyễn Ngọc Phi', '2018-04-07', 'Cần Thơ', 1, '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005192', 'Trần Xuân Mai', '2018-04-08', 'Cần Thơ', 0, '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005194', 'Lâm Thảo Nguyên', '2018-04-09', 'Cần Thơ', 0, '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005195', 'Lê Thị Hảo', '2018-04-10', 'Cần Thơ', 0, '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005196', 'Thái Thám ', '2018-04-11', 'Cần Thơ', 1, '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005197', 'Cao Vĩnh Phát', '2018-04-12', 'Cần Thơ', 1, '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005198', 'Nguyễn Văn Thức', '2018-04-13', 'Cần Thơ', 1, '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005200', 'Trần Tấn Tài', '2018-04-14', 'Cần Thơ', 1, '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005201', 'Tran Ngoc Bich', '2018-04-15', 'Cần Thơ', 0, '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005202', 'Nguyên Thi Dung', '2018-04-16', 'Cần Thơ', 1, '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005203', 'Nguyen Ngoc Huyen Tran', '2018-04-17', 'Cần Thơ', 0, '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005204', 'Trần Thị Hạnh Nguyên', '2018-04-18', 'Cần Thơ', 0, '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005205', 'Trần Trung Kiên', '2018-04-19', 'Cần Thơ', 1, '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005207', 'Nguyễn Đức Mỹ', '2018-04-20', 'Cần Thơ', 1, '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005208', 'Nguyễn Tùng Minh Khá', '2018-04-21', 'Cần Thơ', 1, '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005209', 'Bùi Minh Tâm', '2018-04-22', 'Cần Thơ', 1, '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005210', 'Võ Thị Mai Thi', '2018-04-23', 'Cần Thơ', 0, '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005211', 'Lê Tuấn Cường', '2018-04-24', 'Cần Thơ', 1, '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005213', 'Trương HoàiI Bảo', '2018-04-25', 'Cần Thơ', 1, '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005214', 'Nguyễn Văn Thức', '2018-04-26', 'Cần Thơ', 1, '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005215', 'Le Tan Thanh', '2018-04-27', 'Cần Thơ', 1, '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005216', 'Nguyễn Thị Mỹ Á', '2018-04-28', 'Cần Thơ', 0, '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005217', 'Nguyễn Duy Khang', '2018-04-29', 'Cần Thơ', 1, '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005219', 'Nguyễn Phước Toàn', '2018-04-30', 'Cần Thơ', 1, '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005220', 'Nguyễn Ngọc Nhịn', '2018-05-01', 'Cần Thơ', 1, '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005221', 'Trần Khắc Quý', '2018-05-02', 'Cần Thơ', 1, '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005222', 'Trịnh Tuấn Anh', '2018-05-03', 'Cần Thơ', 1, '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005224', 'Lê Hải Bằng', '2018-05-04', 'Cần Thơ', 1, '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005225', 'Châu Ngọc Long Giang', '2018-05-05', 'Cần Thơ', 1, '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005226', 'Chau Kim Sêng', '2018-05-06', 'Cần Thơ', 1, '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005227', 'Mai Phan Nhật Bình  ', '2018-05-07', 'Cần Thơ', 1, '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005228', 'Phan Triều Vỹ', '2018-05-08', 'Cần Thơ', 1, '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005229', 'Lê Hoàng Thắng', '2018-05-09', 'Cần Thơ', 1, '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005231', 'Phan Huỳnh Phúc Thịnh', '2018-05-10', 'Cần Thơ', 1, '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005232', 'Lâm Quang Cường', '2018-05-12', 'Cần Thơ', 1, '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005233', 'Trần Yên Nhiên', '2018-05-13', 'Cần Thơ', 1, '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005234', 'Dương Thị Thanh Nhàn', '2018-05-14', 'Cần Thơ', 0, '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005235', 'Trần Ái Nghi', '2018-05-15', 'Cần Thơ', 0, '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005237', 'Nguyễn Huỳnh Long', '2018-05-16', 'Cần Thơ', 1, '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005238', 'Nguyễn Thị Phương Trinh', '2018-05-17', 'Cần Thơ', 1, '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005239', 'Đỗ Thành Hậu', '2018-05-18', 'Cần Thơ', 1, '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005240', 'Lê Vủ Tiệp', '2018-05-19', 'Cần Thơ', 1, '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005242', 'TRƯƠNG HỒNG SƯƠNG', '2018-05-20', 'Cần Thơ', 1, '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005243', 'Lữ Thanh Quy', '2018-05-21', 'Cần Thơ', 1, '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005244', 'Nguyễn Chí Linh', '2018-05-22', 'Cần Thơ', 1, '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005245', 'Nguyễn Thị Huỳnh Như', '2018-05-23', 'Cần Thơ', 1, '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005246', 'Bùi Đức Học', '2018-05-24', 'Cần Thơ', 1, '2018-12-05 10:18:26', '2018-12-05 10:18:26'),
('1544005248', 'Võ Thúy An', '2018-05-25', 'Cần Thơ', 0, '2018-12-05 10:18:26', '2018-12-05 10:18:26'),
('1544005249', 'Đỗ Ngọc Minh', '2018-05-26', 'Cần Thơ', 1, '2018-12-05 10:18:26', '2018-12-05 10:18:26'),
('1544005354', 'Tống Thành Vinh', '2018-01-01', 'Cần Thơ', 1, '2018-12-05 10:22:34', '2018-12-05 10:22:34'),
('1544005355', 'Nguyễn Vũ Trinh Nhân', '2018-01-02', 'Cần Thơ', 0, '2018-12-05 10:22:34', '2018-12-05 10:22:34'),
('1544005357', 'Tăng Vĩnh Tài ', '2018-01-03', 'Cần Thơ', 1, '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005358', 'Trần Lê Ngọc Lợi', '2018-01-04', 'Cần Thơ', 1, '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005359', 'Lê Thị Cẩm Tiên', '2018-01-05', 'Cần Thơ', 0, '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005360', 'Nguyên Thành Nhân', '2018-01-06', 'Cần Thơ', 1, '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005361', 'Nguyễn Huỳnh Trung Nam', '2018-01-07', 'Cần Thơ', 1, '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005363', 'Nguyễn My Ny', '2018-01-08', 'Cần Thơ', 0, '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005364', 'Trần Thị Kim Thi', '2018-01-09', 'Cần Thơ', 0, '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005365', 'Nguyễn Thị Hồng Gấm', '2018-01-10', 'Cần Thơ', 0, '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005366', 'Phạm Thanh Tân', '2018-01-11', 'Cần Thơ', 1, '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005367', 'Đỗ Thiên Giang', '2018-01-12', 'Cần Thơ', 1, '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005368', 'Lê Nguyễn Thái Dương', '2018-01-13', 'Cần Thơ', 1, '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005370', 'Đặng Ngọc Thạch', '2018-01-14', 'Cần Thơ', 1, '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005371', 'Phan Thanh Ngoan', '2018-01-15', 'Cần Thơ', 0, '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005372', 'La Tố Quyên', '2018-01-16', 'Cần Thơ', 0, '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005373', 'Nguyễn Thị Diễm', '2018-01-17', 'Cần Thơ', 0, '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005374', 'Lưu Quốc Thái', '2018-01-18', 'Cần Thơ', 1, '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005376', 'Đỗ Thị Hồng Loan', '2018-01-19', 'Cần Thơ', 0, '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005377', 'Tạ Đức Tường', '2018-01-20', 'Cần Thơ', 1, '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005378', 'Nguyễn Ngọc Thúy', '2018-01-21', 'Cần Thơ', 0, '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005379', 'Nguyễn Vũ Sơn', '2018-01-22', 'Cần Thơ', 1, '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005380', 'Nguyễn Ngọc Thúy', '2018-01-23', 'Cần Thơ', 0, '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005381', 'Nguyễn Ngọc Ánh', '2018-01-24', 'Cần Thơ', 0, '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005383', 'Huỳnh Nhật Huy', '2018-01-25', 'Cần Thơ', 1, '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005384', 'Đinh Tấn Thông', '2018-01-26', 'Cần Thơ', 1, '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005385', 'Nguyễn Minh Hưng', '2018-01-27', 'Cần Thơ', 1, '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005386', 'Nguyễn Huỳnh Thành Tánh', '2018-01-28', 'Cần Thơ', 1, '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005387', 'Huỳnh Văn Chung', '2018-01-29', 'Cần Thơ', 1, '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005388', 'Dương Lữ Điện', '2018-01-30', 'Cần Thơ', 1, '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005390', 'Nguyen Thi Phuong Trinh', '2018-01-31', 'Cần Thơ', 0, '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005391', 'Lê Trọng Phương', '2018-02-01', 'Cần Thơ', 1, '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005392', 'Phạm Ngọc Quang', '2018-02-02', 'Cần Thơ', 1, '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005393', 'Nguyễn Trần Ái Trinh', '2018-02-03', 'Cần Thơ', 0, '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005394', 'Thái Anh Huy', '2018-02-04', 'Cần Thơ', 1, '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005396', 'Trần Văn Vũ Linh', '2018-02-05', 'Cần Thơ', 1, '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005397', 'Huỳnh Nguyễn Minh Nguyệt ', '2018-02-06', 'Cần Thơ', 0, '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005398', 'Lê Duy Thanh', '2018-02-07', 'Cần Thơ', 1, '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005399', 'Phạm Đình Anh Khoa', '2018-02-08', 'Cần Thơ', 1, '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005400', 'Nguyễn Thị Anh Thư', '2018-02-09', 'Cần Thơ', 0, '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005401', 'Nguyễn Huy Hoàng', '2018-02-10', 'Cần Thơ', 1, '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005403', 'Võ Nguyễn Đăng', '2018-02-11', 'Cần Thơ', 1, '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005404', 'Châu Thị Thúy Huỳnh', '2018-02-12', 'Cần Thơ', 1, '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005405', 'Lê Thị Mỹ Hạnh', '2018-02-13', 'Cần Thơ', 0, '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005406', 'Nguyễn Hoàng Minh', '2018-02-14', 'Cần Thơ', 1, '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005407', 'Huỳnh Gia Kỳ', '2018-02-15', 'Cần Thơ', 1, '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005408', 'Thạch Chanh Tra', '2018-02-16', 'Cần Thơ', 1, '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005410', 'Trác Mẫn Tiệp', '2018-02-17', 'Cần Thơ', 1, '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005411', 'Nguyen Thi Thuy Trang', '2018-02-18', 'Cần Thơ', 0, '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005412', 'Võ Hoàng Gia', '2018-02-19', 'Cần Thơ', 1, '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005413', 'Hà Văn Quí', '2018-02-20', 'Cần Thơ', 1, '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005414', 'Lê Tuấn Anh', '2018-02-21', 'Cần Thơ', 1, '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005415', 'Đường Khánh Lâm', '2018-02-22', 'Cần Thơ', 1, '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005417', 'Võ Lê Duy Anh', '2018-02-23', 'Cần Thơ', 1, '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005418', 'Nguyễn Văn Quốc', '2018-02-24', 'Cần Thơ', 1, '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005419', 'Đặng Thị Hồng Nhung', '2018-02-25', 'Cần Thơ', 0, '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005420', 'Phạm Nguyễn Hải Âu', '2018-02-26', 'Cần Thơ', 1, '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005421', 'Huynh Ngoc Thai Anh', '2018-02-27', 'Cần Thơ', 1, '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005423', 'Chau Kim Sêng', '2018-02-28', 'Cần Thơ', 1, '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005424', 'Trần Thị Cẩm Tú', '2018-03-01', 'Cần Thơ', 0, '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005425', 'Đỗ Hà Quốc Thái', '2018-03-02', 'Cần Thơ', 1, '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005426', 'Trương Dủ Thành', '2018-03-03', 'Cần Thơ', 1, '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005427', 'Trương Trung Hiếu', '2018-03-04', 'Cần Thơ', 1, '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005428', 'Trần Văn Kiệt', '2018-03-05', 'Cần Thơ', 1, '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005429', 'Danh Lợi', '2018-03-06', 'Cần Thơ', 1, '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005431', 'Lê Thị Mến', '2018-03-07', 'Cần Thơ', 0, '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005432', 'Biện Thị Thùy Trang', '2018-03-08', 'Cần Thơ', 0, '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005433', 'Nguyễn Thành Thịnh', '2018-03-09', 'Cần Thơ', 1, '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005434', 'Nguyễn Khánh Vũ', '2018-03-10', 'Cần Thơ', 1, '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005435', 'Lê Minh Hưng', '2018-03-11', 'Cần Thơ', 1, '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005436', 'Lê Minh Hưng', '2018-03-12', 'Cần Thơ', 1, '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005438', 'Hồ Thị Thanh Thảo', '2018-03-13', 'Cần Thơ', 0, '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005439', 'Lê Thị Nhật An', '2018-03-14', 'Cần Thơ', 1, '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005440', 'Ngô Hoài Diễm Hương', '2018-03-15', 'Cần Thơ', 0, '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005441', 'Hồ Kim Trúc', '2018-03-16', 'Cần Thơ', 0, '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005442', 'Lâm Quang Vĩ', '2018-03-17', 'Cần Thơ', 1, '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005443', 'Trần Nguyễn Chí Trường', '2018-03-18', 'Cần Thơ', 1, '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005445', 'Nguyễn Kim Lới', '2018-03-19', 'Cần Thơ', 1, '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005446', 'Lê Duy Chương', '2018-03-20', 'Cần Thơ', 1, '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005447', 'Hồ Hữu Nhân', '2018-03-21', 'Cần Thơ', 1, '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005448', 'Võ Hoài Danh', '2018-03-22', 'Cần Thơ', 1, '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005449', 'Lê Công Chánh', '2018-03-23', 'Cần Thơ', 1, '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005451', 'Bùi Đức Học', '2018-03-24', 'Cần Thơ', 1, '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005452', 'Võ thanh vinh', '2018-03-25', 'Cần Thơ', 1, '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005453', 'Nguyễn Thị Phương Trinh', '2018-03-27', 'Cần Thơ', 0, '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005454', 'Nguyễn Minh Khôi', '2018-03-28', 'Cần Thơ', 1, '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005455', 'Huỳnh Tấn Phát', '2018-03-29', 'Cần Thơ', 1, '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005456', 'Huỳnh Minh Thư', '2018-03-30', 'Cần Thơ', 0, '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005458', 'Ngô Hoàng Thái An', '2018-03-31', 'Cần Thơ', 1, '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005459', 'Dương Huỳnh Ngân', '2018-04-01', 'Cần Thơ', 0, '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005460', 'Lê Văn Phi', '2018-04-02', 'Cần Thơ', 0, '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005461', 'Lê Văn Phi', '2018-04-03', 'Cần Thơ', 1, '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005462', 'Mai Thanh Mến', '2018-04-04', 'Cần Thơ', 1, '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005464', 'Lê Văn Phi', '2018-04-05', 'Cần Thơ', 1, '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005465', 'Nguyễn Hoàng Tính', '2018-04-06', 'Cần Thơ', 1, '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005466', 'Nguyễn Ngọc Phi', '2018-04-07', 'Cần Thơ', 1, '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005467', 'Trần Xuân Mai', '2018-04-08', 'Cần Thơ', 0, '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005468', 'Lâm Thảo Nguyên', '2018-04-09', 'Cần Thơ', 0, '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005469', 'Lê Thị Hảo', '2018-04-10', 'Cần Thơ', 0, '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005471', 'Thái Thám ', '2018-04-11', 'Cần Thơ', 1, '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005472', 'Cao Vĩnh Phát', '2018-04-12', 'Cần Thơ', 1, '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005473', 'Nguyễn Văn Thức', '2018-04-13', 'Cần Thơ', 1, '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005474', 'Trần Tấn Tài', '2018-04-14', 'Cần Thơ', 1, '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005475', 'Tran Ngoc Bich', '2018-04-15', 'Cần Thơ', 0, '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005476', 'Nguyên Thi Dung', '2018-04-16', 'Cần Thơ', 1, '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005478', 'Nguyen Ngoc Huyen Tran', '2018-04-17', 'Cần Thơ', 0, '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005479', 'Trần Thị Hạnh Nguyên', '2018-04-18', 'Cần Thơ', 0, '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005480', 'Trần Trung Kiên', '2018-04-19', 'Cần Thơ', 1, '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005481', 'Nguyễn Đức Mỹ', '2018-04-20', 'Cần Thơ', 1, '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005482', 'Nguyễn Tùng Minh Khá', '2018-04-21', 'Cần Thơ', 1, '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005484', 'Bùi Minh Tâm', '2018-04-22', 'Cần Thơ', 1, '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005485', 'Võ Thị Mai Thi', '2018-04-23', 'Cần Thơ', 0, '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005486', 'Lê Tuấn Cường', '2018-04-24', 'Cần Thơ', 1, '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005487', 'Trương HoàiI Bảo', '2018-04-25', 'Cần Thơ', 1, '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005488', 'Nguyễn Văn Thức', '2018-04-26', 'Cần Thơ', 1, '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005489', 'Le Tan Thanh', '2018-04-27', 'Cần Thơ', 1, '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005491', 'Nguyễn Thị Mỹ Á', '2018-04-28', 'Cần Thơ', 0, '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005492', 'Nguyễn Duy Khang', '2018-04-29', 'Cần Thơ', 1, '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005493', 'Nguyễn Phước Toàn', '2018-04-30', 'Cần Thơ', 1, '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005494', 'Nguyễn Ngọc Nhịn', '2018-05-01', 'Cần Thơ', 1, '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005495', 'Trần Khắc Quý', '2018-05-02', 'Cần Thơ', 1, '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005497', 'Trịnh Tuấn Anh', '2018-05-03', 'Cần Thơ', 1, '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005498', 'Lê Hải Bằng', '2018-05-04', 'Cần Thơ', 1, '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005499', 'Châu Ngọc Long Giang', '2018-05-05', 'Cần Thơ', 1, '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005500', 'Chau Kim Sêng', '2018-05-06', 'Cần Thơ', 1, '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005501', 'Mai Phan Nhật Bình  ', '2018-05-07', 'Cần Thơ', 1, '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005503', 'Phan Triều Vỹ', '2018-05-08', 'Cần Thơ', 1, '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005504', 'Lê Hoàng Thắng', '2018-05-09', 'Cần Thơ', 1, '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005505', 'Phan Huỳnh Phúc Thịnh', '2018-05-10', 'Cần Thơ', 1, '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005506', 'Lâm Quang Cường', '2018-05-12', 'Cần Thơ', 1, '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005507', 'Trần Yên Nhiên', '2018-05-13', 'Cần Thơ', 1, '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005508', 'Dương Thị Thanh Nhàn', '2018-05-14', 'Cần Thơ', 0, '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005510', 'Trần Ái Nghi', '2018-05-15', 'Cần Thơ', 0, '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005511', 'Nguyễn Huỳnh Long', '2018-05-16', 'Cần Thơ', 1, '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005512', 'Nguyễn Thị Phương Trinh', '2018-05-17', 'Cần Thơ', 1, '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005513', 'Đỗ Thành Hậu', '2018-05-18', 'Cần Thơ', 1, '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005514', 'Lê Vủ Tiệp', '2018-05-19', 'Cần Thơ', 1, '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005515', 'TRƯƠNG HỒNG SƯƠNG', '2018-05-20', 'Cần Thơ', 1, '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005517', 'Lữ Thanh Quy', '2018-05-21', 'Cần Thơ', 1, '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005518', 'Nguyễn Chí Linh', '2018-05-22', 'Cần Thơ', 1, '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005519', 'Nguyễn Thị Huỳnh Như', '2018-05-23', 'Cần Thơ', 1, '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005520', 'Bùi Đức Học', '2018-05-24', 'Cần Thơ', 1, '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005521', 'Võ Thúy An', '2018-05-25', 'Cần Thơ', 0, '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005523', 'Đỗ Ngọc Minh', '2018-05-26', 'Cần Thơ', 1, '2018-12-05 10:23:00', '2018-12-05 10:23:00'),
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
('1544005611', 'Chau Kim Sêng', '2018-02-28', 'Cần Thơ', 1, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
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
('1544005624', 'Lê Minh Hưng', '2018-03-11', 'Cần Thơ', 1, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
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
('1544005639', 'Bùi Đức Học', '2018-03-24', 'Cần Thơ', 1, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005640', 'Võ thanh vinh', '2018-03-25', 'Cần Thơ', 1, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005641', 'Nguyễn Thị Phương Trinh', '2018-03-27', 'Cần Thơ', 0, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005642', 'Nguyễn Minh Khôi', '2018-03-28', 'Cần Thơ', 1, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005644', 'Huỳnh Tấn Phát', '2018-03-29', 'Cần Thơ', 1, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005645', 'Huỳnh Minh Thư', '2018-03-30', 'Cần Thơ', 0, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005646', 'Ngô Hoàng Thái An', '2018-03-31', 'Cần Thơ', 1, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005647', 'Dương Huỳnh Ngân', '2018-04-01', 'Cần Thơ', 0, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005648', 'Lê Văn Phi', '2018-04-02', 'Cần Thơ', 0, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005650', 'Lê Văn Phi', '2018-04-03', 'Cần Thơ', 1, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005651', 'Mai Thanh Mến', '2018-04-04', 'Cần Thơ', 1, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005652', 'Lê Văn Phi', '2018-04-05', 'Cần Thơ', 1, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
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
('1544005704', 'TRƯƠNG HỒNG SƯƠNG', '2018-05-20', 'Cần Thơ', 1, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
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
('1544005745', 'Nguyễn Đình Phi', '2018-06-24', 'Cần Thơ', 1, '2018-12-05 10:26:13', '2018-12-05 10:26:13');
INSERT INTO `profile` (`id`, `name`, `birthday`, `address`, `gender`, `created_at`, `updated_at`) VALUES
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
('1544006898', '1', '0001-01-01', 'Cần Thơ', 1, '2018-12-05 10:48:18', '2018-12-05 10:48:18'),
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
('1544012271', 'Trương Hồng Oanh,', '1990-01-01', 'ADMIN SERVER', 1, '2018-12-05 12:17:51', '2018-12-05 12:17:51');

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
('1543935779', '1543935779', 0, 10, '', 'Cộng điểm bằng anh văn', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536559025', 'insert', '2018-12-04 15:02:59', '2018-12-04 15:02:59');

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
('114234', 'ADMIN_CUSC1', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456789', 'admin1@gmail.com', 1, 0, NULL, NULL, 'oh7UHR9iHEsFUobgsvcfh1gFw5Oljv2SHCDg4tvTNOafzn0XLzVtXoOjAdp7', '2018-08-24 04:59:01', '2018-12-05 12:18:32'),
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
('1544005585', 'CUSC_3118102', '$2y$10$z7.DRpOCBjVeAJgR0SH8s.goQtSr40Au7FPvJacoq13LFRCO/Wlwi', '939150806', 'nguyet118102@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005586', 'CUSC_1310453', '$2y$10$LW.YurHUfefRl2N412.38efeGlxcBd07nA9I4qeovuraYhLbVqp0K', '932835170', 'thanhb1310453@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005587', 'CUSC_1401159', '$2y$10$1HRAjiaSUul57dN4fU4pIOnu8DSBMdacaJh3/M5x3rSGW.xOZ43fS', '1206899509', 'khoab1410215@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005588', 'CUSC_1400529', '$2y$10$MJwFMQGFGT2NYH/YGiRqu.Q0UWIKNmwTlkLmzVSFnja0yJLLXPhE6', '907354382', 'thub14005292@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
('1544005589', 'CUSC_1101745', '$2y$10$8IBgExl1D7I8EnjvhLd8wuR3WA8R8Bz8tWT2F0XiUih72h46haZz2', '975193219', 'hoang101745@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:49', '2018-12-05 10:25:49'),
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
('1544005611', 'CUSC_1304597', '$2y$10$P6j9Su76jRxPOq6yrobMa.0qVUXTZO1W9IDZhIMPZvaCi6Um7DBte', '1662098660', 'sengb1304597@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005612', 'CUSC_1200451', '$2y$10$vmOVatMPFdA/qAI0UBq1N.fUf3uyQvOPASJedjpTJCGOxXrlmedLi', '939095705', 'camtu0910@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005613', 'CUSC_1203964', '$2y$10$H5KWtj7Ls.HqpWsIBVDa8.w4OLx8APC5428fn.jJ6wpf4Mvk9OOTu', '362368522', 'thaib1203964@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005614', 'CUSC_1305029', '$2y$10$nX5CALUgfouf2feCDo5ho.b9vsQx9OpxFtv7/8hX7PnuewOYaJ1zS', '933552872', 'thanhb1305029@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005615', 'CUSC_1208715', '$2y$10$hoQt4fsAdYjQodfR36iL0.z8ZuO/TRxNXAAT/Nwxfa969ByQ3p1he', '934347570', 'choancuchuhu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
('1544005617', 'CUSC_1203937', '$2y$10$wn7gGLJCiGtlsv7Om1nweu3QjA0pNiLU9KdtK0RSK3h1HkGkt38wm', '936333228', 'kietb1203937@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005618', 'CUSC_1203887', '$2y$10$sNpgWiajlcvzDrerAY1VKej6RGeOcHt7YJrAd07NckQoJFMLyblqi', '939700743', 'loib1203887@student.ctu.edu..vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005619', 'CUSC_1304411', '$2y$10$DrPuW/vh/Nkzd8bCTigmQOjcFoKubzqCQjWhfjXkitTQbLuYTFDWK', '919882394', 'menb1304411@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005620', 'CUSC_1401008', '$2y$10$hDBP6ly5w141jnd.HRXk2.BJIHTlby9nkR149iuefLDqovO5GO5G6', '1655832950', 'trangb1401008@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005621', 'CUSC_1311431', '$2y$10$eTXArDcXlMl3ubab7TS0DOw0pwFyjFBXSeNXFn7Uhh/6yAwwWCeNe', '965899230', 'thinhb1311431@stdudent.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:54', '2018-12-05 10:25:54'),
('1544005622', 'CUSC_1400677', '$2y$10$q5ywRixmNK4mDPejmURpPODNiYi5CZ0ROpuB4wvWQeHGd1fVXUyw.', '1632011040', 'vub1400677@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005624', 'CUSC_1304489', '$2y$10$uO4DIhmMAYLSq9oW4W6xw.w2pjX5S6c9YFb8tHyDEqvPfVJ3sVtK6', '1869463205', 'hungB1304489@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005625', 'CUSC_1304489', '$2y$10$Bu2.AwB6kTWICEMLdJC96uyF90RU108TQpcvmOILPHoj9lw2r2GPq', '1869463205', 'hungB1304489@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005626', 'CUSC_1117815', '$2y$10$yFQjWkes81A4.DQN9ldspegsP11yzakbfHyoITv.BovxrvP/o/g9i', '1692064737', 'thao117815@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005627', 'CUSC_1304521', '$2y$10$dNjlYI.FYzQaY52ktDzutOboMkiYn3P/ru1KlpzAmGc844UjsbqCG', '1652994334', 'anb1304521@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005628', 'CUSC_1204020', '$2y$10$RPsNkn6huLOWUtlrOrWpeeTVi5mwzwzrcyNS6D2lzlw9afx0bdXHS', '1664202215', 'huongB1204020@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
('1544005629', 'CUSC_1302514', '$2y$10$4jG21QboqRl8O03U12paQuxmEmHKWu/lJhktVS3XiTJBFQSRPPCKq', '924605029', 'trucb1302514@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005631', 'CUSC_1207785', '$2y$10$h7VBGXiD91a4MHnLiX6akeQsRv853dIu9dayANNDcbiFFpxXH/Pna', '939151586', 'vib1207785@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005632', 'CUSC_1304924', '$2y$10$3iLIOQ8h/WkyHUCY8T8zz.zITfhfqPh7BiQfVIK2ZrHHJV4GvtTom', '975987782', 'truongb1304924@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005633', 'CUSC_1201755', '$2y$10$NVkB/xUWRpdCYUXbZTuj3OrO0ZTfTgxXCkg7CKbq2oi7EvJe4183u', '963844501', 'loib1201755@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005634', 'CUSC_1200409', '$2y$10$76OyZACklNAYPF8YSV9xXeE6coLzlv/bIcrvV5Hsb5GnAGQb2i2TC', '1674609387', 'chuongc1200409@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:56', '2018-12-05 10:25:56'),
('1544005635', 'CUSC_1111321', '$2y$10$aj9bDxDvlNUX/aC9GVJcv.s1UkDOtOaUcVOyVYLtHnzOi5aAsHxjK', '986732457', 'nhan111321@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005637', 'CUSC_1208754', '$2y$10$XbLwmxyiNaSAJgqfDgJ.3OIVGzVlgChZ10edy9TJX5jaZJenBvBMu', '939633995', 'danhB1208754@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005638', 'CUSC_1209993', '$2y$10$kiCnKurKCXHl.lX0.14pSeZZ0x111GP7vSwT5I4.a9VxySwh9feBK', '937140949', 'chanhb1209993@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005639', 'CUSC_1101746', '$2y$10$4eZe5/tg.czwJiEDV5wXo.zrpzIaeX.On/50NASejARiK40Bh5gVC', '1649989540', 'buiduchocst1992@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005640', 'CUSC_1208701', '$2y$10$u8/ZbyZ2D7o8fC53JpRMk.WxQ13Cqpc28CO/gBaWvii/uVW7fAxq2', '1685225085', 'vinhb1208701@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005641', 'CUSC_1401105', '$2y$10$X8X0JCQ5zYl0ab8i2.wUMupYZFZ78bRyrSYwJOW2DbARGUr4yEc6u', '973969843', 'trinhb1401105@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005642', 'CUSC_1119017', '$2y$10$j0lvnBLtuzetZ0iWpvwWUeXumFm3Gk1jzpsTXRJHudLUuE/a0t/Je', '939838684', 'nmkhoi@hotmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005644', 'CUSC_1311420', '$2y$10$iU0f/B3bdhpoOQr.Kf.KruuvlChb53oMsKIJFXSH6PIJKhBnvQmZ2', '964441575', 'phatb1311420@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005645', 'CUSC_1311435', '$2y$10$KviWQiCKiHUIrkg1FyCtOO6iYbVQPB9As3OSfB5Pa2PGQTSRX7Imi', '968999587', 'thub1311435@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005646', 'CUSC_1309517', '$2y$10$TiFwx3PnhZujrmYBb/HNJ.Jn/GTDfwyphpp6O8uXwYq9YyWaDRrMe', '973946102', 'anb1309517@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005647', 'CUSC_1311403', '$2y$10$o08/aJ1x4Q4pPRD6bZfNJut4gfBm4gTEOz6kxZe846Aq15ETAlLVm', '962463229', 'nganb1311403@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005648', 'CUSC_1311422', '$2y$10$nt4kVLn/XS.hKeknIaT1Q.11FefSIz7KYSboEiwET5GqJ/tTQ7RPi', '944477332', 'phiB1311522@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005650', 'CUSC_1311422', '$2y$10$T8XpV.q1ofEs3fUQ.hh5vOF.oOosX/1zns.nrzd4kACnJuJ36ISuy', '944477332', 'phiB1311522@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005651', 'CUSC_1311395', '$2y$10$FP0iiEWw/DC.F3QmHnoS.OFG81.TdeUAuYVJF7sCGXLh0iPsPlSN.', '1249938424', 'menb1311395@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005652', 'CUSC_1311422', '$2y$10$7gO1qqKXkLQV9Zi2xrTxYODtEp0hyVwHg4jVZjSPKW3li2vPXZx92', '944477332', 'phiB1311422@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
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
('1544005704', 'CUSC_4114709', '$2y$10$/YZXzKqtBv3utToUzFybeOQHpl9DsjxCojWkye/sFYyWqIKZsjp0K', '1648803127', 'truonghongsuong91@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
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
('1544005768', 'CUSC_1400739', '$2y$10$M316xOX8KVKYsijEekcUt.5DyworSTCs3AEAjs33uz7SKtRjpLQD.', '1216853105', 'UyB1400739@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:17', '2018-12-05 10:26:17'),
('1544005769', 'CUSC_1400742', '$2y$10$VRL0IxTMYkC89/.Y7PCRW./UkyCNYFZnCEhWwh0IMmGkvZ6CKI0PW', '1234213442', 'VuB1400742@student.ctu.edu.vn', 1, 0, NULL, NULL, NULL, '2018-12-05 10:26:17', '2018-12-05 10:26:17'),
('1544006432', 'CV_CUSC_0001', '$2y$10$HcP8VzEBXBsXYO2unMoUneey0.o9hDlyBKtUdV.BJ0i/OOiCkt5Za', '0123456001', 'ldai@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:40:32', '2018-12-05 15:35:17'),
('1544006491', 'CV_CUSC_0002', '$2y$10$GJVPxbSXcw.plmRLRBjlMOjoyjA4o7ixibHLxZyIrs2VDVnYIfCki', '0123456002', 'nmanh@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:41:31', '2018-12-05 10:41:31'),
('1544006529', 'CV_CUSC_0003', '$2y$10$6hgGRQcwP6Jsu3/Jj/MUNuhIBQ10UhB1H0cGnY61pWXBApP5..4Ua', '0123456003', 'tmanh@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:42:09', '2018-12-05 10:42:09'),
('1544006570', 'CV_CUSC_0004', '$2y$10$crw02ZwLwYiLtfq3YbVWIuLm7J6t5c1AKhFp/ATarQ/MeQoMbi0ra', '0123456004', 'cttu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 10:42:51', '2018-12-05 10:42:51'),
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
('1544012271', 'ADMIN_CUSC2', '$2y$10$2G8cs9h3KX5Yq3XT5m.73e7PGiuznUmT7Nme6zO9ezZ8TvHyK6AEu', '0123456788', 'admin2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-12-05 12:17:51', '2018-12-05 12:17:51');

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
('114234', '114234', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-10-11 18:27:13', '2018-12-05 12:16:12'),
('12341', '1542637576', 'b2cba2a7a5499bd67320ba3d4046dc2e', '2018-12-05 01:47:55', '2018-12-05 01:47:55'),
('12342', '1542637578', 'b2cba2a7a5499bd67320ba3d4046dc2e', '2018-12-05 01:47:55', '2018-12-05 01:47:55'),
('1544005078', '1544005078', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:58', '2018-12-05 10:17:58'),
('1544005079', '1544005079', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:58', '2018-12-05 10:17:58'),
('1544005080', '1544005080', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:58', '2018-12-05 10:17:58'),
('1544005082', '1544005082', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005083', '1544005083', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005084', '1544005084', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005085', '1544005085', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005086', '1544005086', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:17:59', '2018-12-05 10:17:59'),
('1544005087', '1544005087', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005089', '1544005089', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005090', '1544005090', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005091', '1544005091', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005092', '1544005092', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:00', '2018-12-05 10:18:00'),
('1544005094', '1544005094', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005095', '1544005095', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005096', '1544005096', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005097', '1544005097', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005098', '1544005098', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:01', '2018-12-05 10:18:01'),
('1544005099', '1544005099', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005101', '1544005101', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005102', '1544005102', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005103', '1544005103', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005104', '1544005104', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:02', '2018-12-05 10:18:02'),
('1544005105', '1544005105', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005107', '1544005107', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005108', '1544005108', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005109', '1544005109', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005110', '1544005110', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:03', '2018-12-05 10:18:03'),
('1544005111', '1544005111', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005113', '1544005113', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005114', '1544005114', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005115', '1544005115', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005116', '1544005116', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005117', '1544005117', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:04', '2018-12-05 10:18:04'),
('1544005119', '1544005118', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005120', '1544005120', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005121', '1544005121', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005122', '1544005122', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005123', '1544005123', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:05', '2018-12-05 10:18:05'),
('1544005125', '1544005124', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005126', '1544005126', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005127', '1544005127', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005128', '1544005128', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005129', '1544005129', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:06', '2018-12-05 10:18:06'),
('1544005131', '1544005131', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005132', '1544005132', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005133', '1544005133', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005134', '1544005134', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:07', '2018-12-05 10:18:07'),
('1544005135', '1544005135', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005137', '1544005137', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005138', '1544005138', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005139', '1544005139', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005140', '1544005140', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005141', '1544005141', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:08', '2018-12-05 10:18:08'),
('1544005143', '1544005142', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005144', '1544005144', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005145', '1544005145', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005146', '1544005146', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005147', '1544005147', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005148', '1544005148', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:09', '2018-12-05 10:18:09'),
('1544005150', '1544005149', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005151', '1544005151', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005152', '1544005152', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005153', '1544005153', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005154', '1544005154', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:10', '2018-12-05 10:18:10'),
('1544005155', '1544005155', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005157', '1544005157', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005158', '1544005158', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005159', '1544005159', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005160', '1544005160', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005161', '1544005161', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:11', '2018-12-05 10:18:11'),
('1544005163', '1544005162', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005164', '1544005164', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005165', '1544005165', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005166', '1544005166', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005167', '1544005167', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:12', '2018-12-05 10:18:12'),
('1544005168', '1544005168', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005170', '1544005170', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005171', '1544005171', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005172', '1544005172', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:13', '2018-12-05 10:18:13'),
('1544005174', '1544005173', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005175', '1544005175', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005176', '1544005176', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005177', '1544005177', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005178', '1544005178', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005179', '1544005179', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:14', '2018-12-05 10:18:14'),
('1544005181', '1544005180', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005182', '1544005182', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005183', '1544005183', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005184', '1544005184', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005185', '1544005185', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005186', '1544005186', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:15', '2018-12-05 10:18:15'),
('1544005188', '1544005187', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005189', '1544005189', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005190', '1544005190', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005191', '1544005191', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:16', '2018-12-05 10:18:16'),
('1544005193', '1544005192', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005194', '1544005194', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005195', '1544005195', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005196', '1544005196', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005197', '1544005197', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:17', '2018-12-05 10:18:17'),
('1544005198', '1544005198', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005200', '1544005200', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005201', '1544005201', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005202', '1544005202', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005203', '1544005203', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005204', '1544005204', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:18', '2018-12-05 10:18:18'),
('1544005206', '1544005205', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005207', '1544005207', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005208', '1544005208', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005209', '1544005209', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005210', '1544005210', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:19', '2018-12-05 10:18:19'),
('1544005212', '1544005211', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005213', '1544005213', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005214', '1544005214', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005215', '1544005215', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005216', '1544005216', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:20', '2018-12-05 10:18:20'),
('1544005218', '1544005217', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005219', '1544005219', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005220', '1544005220', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005221', '1544005221', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:21', '2018-12-05 10:18:21'),
('1544005223', '1544005222', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005224', '1544005224', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005225', '1544005225', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005226', '1544005226', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005227', '1544005227', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005228', '1544005228', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:22', '2018-12-05 10:18:22'),
('1544005230', '1544005229', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005231', '1544005231', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005232', '1544005232', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005233', '1544005233', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005234', '1544005234', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:23', '2018-12-05 10:18:23'),
('1544005236', '1544005235', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005237', '1544005237', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005238', '1544005238', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005239', '1544005239', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:24', '2018-12-05 10:18:24'),
('1544005240', '1544005240', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005242', '1544005242', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005243', '1544005243', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005244', '1544005244', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005245', '1544005245', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:25', '2018-12-05 10:18:25'),
('1544005246', '1544005246', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:26', '2018-12-05 10:18:26'),
('1544005248', '1544005248', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:26', '2018-12-05 10:18:26'),
('1544005249', '1544005249', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:18:26', '2018-12-05 10:18:26'),
('1544005354', '1544005354', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:34', '2018-12-05 10:22:34'),
('1544005355', '1544005355', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005357', '1544005357', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005358', '1544005358', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005359', '1544005359', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005360', '1544005360', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005361', '1544005361', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:35', '2018-12-05 10:22:35'),
('1544005363', '1544005363', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005364', '1544005364', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005365', '1544005365', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005366', '1544005366', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005367', '1544005367', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005368', '1544005368', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:36', '2018-12-05 10:22:36'),
('1544005370', '1544005370', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005371', '1544005371', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005372', '1544005372', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005373', '1544005373', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:37', '2018-12-05 10:22:37'),
('1544005374', '1544005374', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005376', '1544005376', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005377', '1544005377', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005378', '1544005378', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005379', '1544005379', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005380', '1544005380', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:38', '2018-12-05 10:22:38'),
('1544005382', '1544005381', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005383', '1544005383', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005384', '1544005384', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005385', '1544005385', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005386', '1544005386', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005387', '1544005387', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:39', '2018-12-05 10:22:39'),
('1544005389', '1544005388', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005390', '1544005390', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005391', '1544005391', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005392', '1544005392', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005393', '1544005393', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:40', '2018-12-05 10:22:40'),
('1544005394', '1544005394', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005396', '1544005396', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005397', '1544005397', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005398', '1544005398', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005399', '1544005399', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005400', '1544005400', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:41', '2018-12-05 10:22:41'),
('1544005401', '1544005401', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005403', '1544005403', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005404', '1544005404', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005405', '1544005405', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005406', '1544005406', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005407', '1544005407', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:42', '2018-12-05 10:22:42'),
('1544005409', '1544005408', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005410', '1544005410', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005411', '1544005411', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005412', '1544005412', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005413', '1544005413', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005414', '1544005414', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:43', '2018-12-05 10:22:43'),
('1544005416', '1544005415', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005417', '1544005417', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005418', '1544005418', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005419', '1544005419', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005420', '1544005420', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005421', '1544005421', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:44', '2018-12-05 10:22:44'),
('1544005423', '1544005423', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005424', '1544005424', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005425', '1544005425', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005426', '1544005426', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005427', '1544005427', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005428', '1544005428', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:45', '2018-12-05 10:22:45'),
('1544005430', '1544005429', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005431', '1544005431', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005432', '1544005432', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005433', '1544005433', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005434', '1544005434', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005435', '1544005435', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:46', '2018-12-05 10:22:46'),
('1544005437', '1544005436', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005438', '1544005438', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005439', '1544005439', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005440', '1544005440', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005441', '1544005441', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005442', '1544005442', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:47', '2018-12-05 10:22:47'),
('1544005444', '1544005443', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005445', '1544005445', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005446', '1544005446', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005447', '1544005447', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005448', '1544005448', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:48', '2018-12-05 10:22:48'),
('1544005450', '1544005449', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005451', '1544005451', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005452', '1544005452', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005453', '1544005453', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005454', '1544005454', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005455', '1544005455', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:49', '2018-12-05 10:22:49'),
('1544005457', '1544005456', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005458', '1544005458', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005459', '1544005459', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005460', '1544005460', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005461', '1544005461', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:50', '2018-12-05 10:22:50'),
('1544005463', '1544005462', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005464', '1544005464', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005465', '1544005465', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005466', '1544005466', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005467', '1544005467', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005468', '1544005468', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:51', '2018-12-05 10:22:51'),
('1544005470', '1544005469', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005471', '1544005471', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005472', '1544005472', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005473', '1544005473', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005474', '1544005474', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005475', '1544005475', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:52', '2018-12-05 10:22:52'),
('1544005477', '1544005476', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005478', '1544005478', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005479', '1544005479', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005480', '1544005480', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005481', '1544005481', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:53', '2018-12-05 10:22:53'),
('1544005482', '1544005482', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005484', '1544005484', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005485', '1544005485', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005486', '1544005486', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005487', '1544005487', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005488', '1544005488', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:54', '2018-12-05 10:22:54'),
('1544005489', '1544005489', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005491', '1544005491', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005492', '1544005492', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005493', '1544005493', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005494', '1544005494', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:55', '2018-12-05 10:22:55'),
('1544005495', '1544005495', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005497', '1544005497', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005498', '1544005498', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005499', '1544005499', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005500', '1544005500', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:56', '2018-12-05 10:22:56'),
('1544005501', '1544005501', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005503', '1544005503', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005504', '1544005504', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005505', '1544005505', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005506', '1544005506', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005507', '1544005507', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:57', '2018-12-05 10:22:57'),
('1544005508', '1544005508', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005510', '1544005510', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005511', '1544005511', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005512', '1544005512', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005513', '1544005513', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005514', '1544005514', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:58', '2018-12-05 10:22:58'),
('1544005516', '1544005515', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005517', '1544005517', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005518', '1544005518', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005519', '1544005519', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005520', '1544005520', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005521', '1544005521', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:22:59', '2018-12-05 10:22:59'),
('1544005523', '1544005523', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:23:00', '2018-12-05 10:23:00'),
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
('1544005611', '1544005611', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:53', '2018-12-05 10:25:53'),
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
('1544005624', '1544005624', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:55', '2018-12-05 10:25:55'),
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
('1544005639', '1544005639', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005640', '1544005640', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005641', '1544005641', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:57', '2018-12-05 10:25:57'),
('1544005643', '1544005642', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005644', '1544005644', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005645', '1544005645', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005646', '1544005646', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005647', '1544005647', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005648', '1544005648', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:58', '2018-12-05 10:25:58'),
('1544005650', '1544005650', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005651', '1544005651', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
('1544005652', '1544005652', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:25:59', '2018-12-05 10:25:59'),
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
('1544005704', '1544005704', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:07', '2018-12-05 10:26:07'),
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
('1544005732', '1544005732', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-12-05 10:26:11', '2018-12-05 10:26:11');
INSERT INTO `users_has_roles` (`ur_id`, `u_id`, `r_id`, `created_at`, `updated_at`) VALUES
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
('1544006898', '1544006898', '1536238582', '2018-12-05 10:48:18', '2018-12-05 10:48:18'),
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
('1544012271', '1544012271', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-12-05 12:17:51', '2018-12-05 12:17:51');

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
-- Chỉ mục cho bảng `phantrang`
--
ALTER TABLE `phantrang`
  ADD PRIMARY KEY (`id_pt`);

--
-- Chỉ mục cho bảng `phantrang2`
--
ALTER TABLE `phantrang2`
  ADD PRIMARY KEY (`id`);

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
