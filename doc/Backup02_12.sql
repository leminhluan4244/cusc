-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2018 lúc 03:34 PM
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
('1536717781', '114234', 'Đang diễn ra sau chưa duyệt', '2018-09-27', '2018-10-15', '<p>Hello</p>', 'not img', 50, 1, '2018-09-12 02:03:01', '2018-10-10 08:48:24'),
('1537887254', '114234', 'Đang diễn ra nửa trước chưa duyệt', '2018-09-15', '2018-09-27', '<p>Hello</p>', 'not img', 15, 1, '2018-09-25 14:54:14', '2018-10-10 08:52:42'),
('1537896694', '114234', 'Sắp đến chưa duyệt', '2018-12-29', '2018-12-30', '<p>Hello</p>', 'not img', 10, -1, '2018-09-25 17:31:34', '2018-11-20 17:48:00'),
('1537978055', '114234', 'Đã diễn ra chưa duyệt', '2018-09-01', '2018-09-25', '<p>Hello</p>', 'not img', 10, 1, '2018-09-26 16:07:35', '2018-10-10 08:47:48'),
('1537978359', '114234', 'Đang diễn ra hôm nay', '2018-09-27', '2018-09-27', '<p>Hello</p>', 'not img', 10, 1, '2018-09-26 16:12:39', '2018-10-10 08:47:50');

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

--
-- Đang đổ dữ liệu cho bảng `active_achievement`
--

INSERT INTO `active_achievement` (`aa_id`, `a_id`, `cc_id`, `c_id`, `aa_name`, `aa_scores`, `aa_active`, `created_at`, `updated_at`) VALUES
('1536768267', '1536717781', '1537694550', '1536650607', 'Chủ nhiệm', 10, 1, '2018-09-12 16:04:27', '2018-09-25 07:37:46'),
('1536768275', '1536717781', '1536737853', '1536627194', 'Phó chủ nhiệm', 8, 1, '2018-09-12 16:04:35', '2018-09-23 16:22:24'),
('1536768286', '1536717781', '1536737853', '1536627194', 'Dự thảo', 5, 1, '2018-09-12 16:04:46', '2018-09-23 16:22:27'),
('1536768294', '1536717781', '1536737853', '1536627194', 'Ban hậu cần', 8, 1, '2018-09-12 16:04:54', '2018-09-23 16:22:29'),
('1539187076', '1537887254', '1536650574', '1536650607', 'Chủ nhiệm', 10, 1, '2018-10-10 15:57:56', '2018-10-10 15:57:56');

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
('1543325912', '1536661007', '1536577630', '2018-11-27 13:38:32', '2018-11-27 13:38:32'),
('1543325913', '1536661007', '1536577640', '2018-11-27 13:38:32', '2018-11-27 13:38:32'),
('1543325914', '1536661007', '1536577672', '2018-11-27 13:38:32', '2018-11-27 13:38:32'),
('1543325915', '1536661007', '1536578544', '2018-11-27 13:38:32', '2018-11-27 13:38:32'),
('1543325916', '1536661007', '1541858832', '2018-11-27 13:38:32', '2018-11-27 13:38:32');

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
('1536650607', 'A', 'ANH VĂN (Hoặc tương đương)', 60, 0, 1, '2018-09-11 07:23:27', '2018-09-11 00:24:29'),
('1542215949', 'z', 'z', 10000000, 0, 1, '2018-11-14 17:19:09', '2018-11-14 17:19:09');

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
('1536577630', 'Quản trị mạng doanh nghiệp Khóa 1', '', 1, '1536661134', '1536250498', '1536301180', '2018-09-10 11:07:10', '2018-11-11 08:20:26'),
('1536577640', 'Quản trị mạng doanh nghiệp Khóa 2', 'CUSCCL002', 1, '3412341241', '1536250498', '1536300555', '2018-09-10 11:07:20', '2018-11-10 13:38:42'),
('1536577672', 'Lập trình viên Quốc tế Khóa 1', 'CUSCCL003', 1, '1536661007', '1536250498', '1536300555', '2018-09-10 11:07:52', '2018-11-10 13:38:45'),
('1536578544', 'Cao đẳng Thiết kế đồ họa Khóa', 'CUSCCL004', 1, '1536661034', '1536250498', '1536300555', '2018-09-10 11:22:24', '2018-11-10 13:38:49'),
('1541858832', 'fasdf', 'fasdfa', 1, '3412341241', '1536250498', '1536300555', '2018-11-10 14:07:12', '2018-11-10 14:07:12');

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
('1536306411', 'Hằng quý', 'Một quý', 1, '2018-09-07 07:46:51', '2018-09-07 07:46:51'),
('1542427052', 'tao thích me', 'Toàn khóa học', 1, '2018-11-17 03:57:32', '2018-11-17 03:57:32');

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
('1536326833', '1536306411', 'Quý 1', '01-01', '30-03', 1, '2018-09-07 13:27:13', '2018-09-07 13:27:13'),
('1536330065', '1536306411', 'Quý 2', '01-04', '30-06', 1, '2018-09-07 14:21:05', '2018-09-07 14:21:05'),
('1536330102', '1536306411', 'Quý 3', '01-07', '30-09', 1, '2018-09-07 14:21:42', '2018-09-07 14:21:42'),
('1536330125', '1536306411', 'Quý 4', '01-10', '31-12', 1, '2018-09-07 14:22:05', '2018-09-07 14:22:05'),
('1536330242', '1536305998', 'Học kỳ 1', '30-08', '31-12', 1, '2018-09-07 14:24:02', '2018-11-05 10:15:03'),
('1536330342', '1536305998', 'Học kỳ 2', '01-01', '25-05', 1, '2018-09-07 14:25:42', '2018-09-07 08:10:38'),
('1536330393', '1536305998', 'Học kỳ hè', '26-05', '29-08', 1, '2018-09-07 14:26:33', '2018-09-07 08:10:56'),
('1536332368', '1536306362', 'Khóa học', 'Đầu khóa', 'Sau khi sinh viên tốt nghiệp', 1, '2018-09-07 14:59:28', '2018-09-07 14:59:28'),
('1536332403', '1536306397', 'Năm dương lịch', '01-01', '31-12', 1, '2018-09-07 15:00:03', '2018-09-07 15:00:03'),
('1541437430', '1536305998', 'dsfasdfas', 'dfsdf', 'dfasdf', 1, '2018-11-05 17:03:50', '2018-11-05 17:03:50');

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
('1541773983', '1536559025', '1536305998', '2018-11-09 14:33:03', '2018-12-01 00:42:36');

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
('1', '1', '1', '1', '0000-00-00', '0000-00-00', '1', 1, '2018-11-27 14:03:52', '2018-11-27 14:11:31'),
('1536418838', '1536330242', '1536305998', 'Học kỳ 1 Khóa 1', '2018-09-07', '2018-12-06', '1', 1, '2018-09-08 15:00:38', '2018-11-27 14:11:34'),
('1536559025', '1536330342', '1536305998', 'Học kỳ 2 Khóa 2', '2018-09-05', '2018-09-07', NULL, 1, '2018-09-10 05:57:05', '2018-11-29 15:37:03'),
('1543329630', '1536330242', '1536305998', 'Học kỳ 1 Khóa 2', '2018-11-08', '2018-11-08', NULL, 1, '2018-11-27 14:40:30', '2018-11-27 14:40:30'),
('1543329658', '1536330242', '1536305998', 'Học kỳ 1 Khóa 3', '2018-11-02', '2018-11-01', NULL, 1, '2018-11-27 14:40:58', '2018-11-27 14:40:58'),
('1543506013', '1536330242', '1536305998', 'Học kỳ 1 khóa 4', '2018-11-02', '2018-11-16', NULL, 1, '2018-11-29 15:40:13', '2018-11-29 15:40:13');

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
('114234', 'admin', '1990-01-01', 'admin address', 1, '2018-11-25 07:10:55', '2018-11-25 07:11:42'),
('1536660994', 'ádfasdfas', '2018-09-07', 'An Thoi - Binh Thuy', 1, '2018-09-11 10:16:34', '2018-09-11 10:16:34'),
('1536661007', 'Lý Quốc Bảo', '1990-09-07', 'An Thoi - Binh Thuy', 1, '2018-09-11 10:16:48', '2018-09-11 05:46:44'),
('1536661034', 'Cao Trùng Quang', '1980-09-07', '30/04 Ninh Kiều, Cần Thơ', 1, '2018-09-11 10:17:14', '2018-09-11 05:47:32'),
('1536661134', 'Lý Tuấn Tử', '1985-09-07', '370A - Trần Hưng Đạo - Ninh Kiều - Cần Thơ', 1, '2018-09-11 10:18:54', '2018-09-11 05:48:51'),
('1536661250', 'Chân Tử Đan', '1960-09-07', 'Hưng Lợi, Ninh Kiều, Cần Thơ', 1, '2018-09-11 10:20:50', '2018-09-11 05:49:59'),
('1536661366', 'ádfasdfas', '2018-09-07', 'An Thoi - Binh Thuy', 1, '2018-09-11 10:22:46', '2018-09-11 10:22:46'),
('1536673073', 'Cao Tùng Anh', '1997-01-01', 'An Thoi - Binh Thuy', 0, '2018-09-11 13:37:53', '2018-11-23 21:28:35'),
('1536797549', 'Lê Triều Vĩ', '1998-01-01', 'Cần Thơ', 1, '2018-09-13 00:12:29', '2018-09-13 00:12:29'),
('1536905877', 'Lê Minh Luân', '1996-01-16', 'Cần Thơ', 1, '2018-09-14 06:17:57', '2018-09-14 06:17:57'),
('1539968515', 'Tiểu Bảo Bảo', '2020-02-03', 'An Thoi - Binh Thuy', 1, '2018-10-19 17:01:55', '2018-10-19 17:01:55'),
('1540145713', '13', '2018-10-12', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:15:14', '2018-10-21 18:15:14'),
('1540146298', 'rqwerw', '2018-10-17', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:24:58', '2018-10-21 18:24:58'),
('1540146312', 'rqwerw', '2018-10-17', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:25:12', '2018-10-21 18:25:12'),
('1540146435', 'Tiểu Bảo Bảo', '2018-10-11', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:27:15', '2018-10-21 18:27:15'),
('1540146475', '4123412341234123', '2018-10-31', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:27:55', '2018-10-21 18:27:55'),
('1540222271', 'rqwerqwerqwerqwe', '2018-10-18', 'An Thoi - Binh Thuy', 1, '2018-10-22 15:31:11', '2018-10-22 15:31:11'),
('1542637250', 'Tèo 1', '1996-01-01', 'Cần Thơ', 1, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637252', 'Tèo 2', '1996-01-02', 'Cần Thơ', 0, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637253', 'Tèo 3', '1996-01-03', 'Cần Thơ', 1, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637254', 'Tèo 4', '1996-01-04', 'Cần Thơ', 0, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637255', 'Tèo 5', '1996-01-05', 'Cần Thơ', 0, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637257', 'Tèo 6', '1996-01-06', 'Cần Thơ', 1, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637258', 'Tèo 7', '1996-01-07', 'Cần Thơ', 0, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637259', 'Tèo 8', '1996-01-08', 'Cần Thơ', 1, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637260', 'Tèo 9', '1996-01-09', 'Cần Thơ', 0, '2018-11-19 14:20:53', '2018-11-19 14:20:53'),
('1542637262', 'Tèo 10', '1996-01-10', 'Cần Thơ', 1, '2018-11-19 14:20:53', '2018-11-19 14:20:53'),
('1542637495', 'Tèo 11', '1996-01-11', 'Cần Thơ', 1, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637496', 'Tèo 12', '1996-01-12', 'Cần Thơ', 0, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637497', 'Tèo 13', '1996-01-13', 'Cần Thơ', 1, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637498', 'Tèo 14', '1996-01-14', 'Cần Thơ', 0, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637500', 'Tèo 15', '1996-01-15', 'Cần Thơ', 0, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637501', 'Tèo 16', '1996-01-16', 'Cần Thơ', 1, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637502', 'Tèo 17', '1996-01-17', 'Cần Thơ', 0, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637503', 'Tèo 18', '1996-01-18', 'Cần Thơ', 1, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637504', 'Tèo 19', '1996-01-19', 'Cần Thơ', 0, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637506', 'Tèo 20', '1996-01-20', 'Cần Thơ', 1, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637507', 'Tèo 21', '1996-01-21', 'Cần Thơ', 1, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637508', 'Tèo 22', '1996-01-22', 'Cần Thơ', 0, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637509', 'Tèo 23', '1996-01-23', 'Cần Thơ', 1, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637511', 'Tèo 24', '1996-01-24', 'Cần Thơ', 0, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637512', 'Tèo 25', '1996-01-25', 'Cần Thơ', 0, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637513', 'Tèo 26', '1996-01-26', 'Cần Thơ', 1, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637514', 'Tèo 27', '1996-01-27', 'Cần Thơ', 0, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637515', 'Tèo 28', '1996-01-28', 'Cần Thơ', 1, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637517', 'Tèo 29', '1996-01-29', 'Cần Thơ', 0, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637518', 'Tèo 30', '1996-01-30', 'Cần Thơ', 1, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637519', 'Tèo 31', '1996-01-31', 'Cần Thơ', 1, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637520', 'Tèo 32', '1996-02-01', 'Cần Thơ', 0, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637521', 'Tèo 33', '1996-02-02', 'Cần Thơ', 1, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637523', 'Tèo 34', '1996-02-03', 'Cần Thơ', 0, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637524', 'Tèo 35', '1996-02-04', 'Cần Thơ', 0, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637525', 'Tèo 36', '1996-02-05', 'Cần Thơ', 1, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637526', 'Tèo 37', '1996-02-06', 'Cần Thơ', 0, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637527', 'Tèo 38', '1996-02-07', 'Cần Thơ', 1, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637528', 'Tèo 39', '1996-02-08', 'Cần Thơ', 0, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637530', 'Tèo 40', '1996-02-09', 'Cần Thơ', 1, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637531', 'Tèo 41', '1996-02-10', 'Cần Thơ', 1, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637532', 'Tèo 42', '1996-02-11', 'Cần Thơ', 0, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637533', 'Tèo 43', '1996-02-12', 'Cần Thơ', 1, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637534', 'Tèo 44', '1996-02-13', 'Cần Thơ', 0, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637536', 'Tèo 45', '1996-02-14', 'Cần Thơ', 0, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637537', 'Tèo 46', '1996-02-15', 'Cần Thơ', 1, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637538', 'Tèo 47', '1996-02-16', 'Cần Thơ', 0, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637539', 'Tèo 48', '1996-02-17', 'Cần Thơ', 1, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637540', 'Tèo 49', '1996-02-18', 'Cần Thơ', 0, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637542', 'Tèo 50', '1996-02-19', 'Cần Thơ', 1, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637543', 'Tèo 51', '1996-02-20', 'Cần Thơ', 1, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637544', 'Tèo 52', '1996-02-21', 'Cần Thơ', 0, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637545', 'Tèo 53', '1996-02-22', 'Cần Thơ', 1, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637546', 'Tèo 54', '1996-02-23', 'Cần Thơ', 0, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637547', 'Tèo 55', '1996-02-24', 'Cần Thơ', 0, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637549', 'Tèo 56', '1996-02-25', 'Cần Thơ', 1, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637550', 'Tèo 57', '1996-02-26', 'Cần Thơ', 0, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637551', 'Tèo 58', '1996-02-27', 'Cần Thơ', 1, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637552', 'Tèo 59', '1996-02-28', 'Cần Thơ', 0, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637553', 'Tèo 60', '1996-02-29', 'Cần Thơ', 1, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637555', 'Tèo 61', '1996-03-01', 'Cần Thơ', 1, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637556', 'Tèo 62', '1996-03-02', 'Cần Thơ', 0, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637557', 'Tèo 63', '1996-03-03', 'Cần Thơ', 1, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637558', 'Tèo 64', '1996-03-04', 'Cần Thơ', 0, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637559', 'Tèo 65', '1996-03-05', 'Cần Thơ', 0, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637560', 'Tèo 66', '1996-03-06', 'Cần Thơ', 1, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637562', 'Tèo 67', '1996-03-07', 'Cần Thơ', 0, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637563', 'Tèo 68', '1996-03-08', 'Cần Thơ', 1, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637564', 'Tèo 69', '1996-03-09', 'Cần Thơ', 0, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637565', 'Tèo 70', '1996-03-10', 'Cần Thơ', 1, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637566', 'Tèo 71', '1996-03-11', 'Cần Thơ', 1, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637567', 'Tèo 72', '1996-03-12', 'Cần Thơ', 0, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637569', 'Tèo 73', '1996-03-13', 'Cần Thơ', 1, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637570', 'Tèo 74', '1996-03-14', 'Cần Thơ', 0, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637571', 'Tèo 75', '1996-03-15', 'Cần Thơ', 0, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637572', 'Tèo 76', '1996-03-16', 'Cần Thơ', 1, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637573', 'Tèo 77', '1996-03-17', 'Cần Thơ', 0, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637574', 'Tèo 78', '1996-03-18', 'Cần Thơ', 1, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637576', 'Tèo 79', '1996-03-19', 'Cần Thơ', 0, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637577', 'Tèo 80', '1996-03-20', 'Cần Thơ', 1, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637578', 'Tèo 81', '1996-03-21', 'Cần Thơ', 1, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637579', 'Tèo 82', '1996-03-22', 'Cần Thơ', 0, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637580', 'Tèo 83', '1996-03-23', 'Cần Thơ', 1, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637581', 'Tèo 84', '1996-03-24', 'Cần Thơ', 0, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637583', 'Tèo 85', '1996-03-25', 'Cần Thơ', 0, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637584', 'Tèo 86', '1996-03-26', 'Cần Thơ', 1, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637585', 'Tèo 87', '1996-03-27', 'Cần Thơ', 0, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637586', 'Tèo 88', '1996-03-28', 'Cần Thơ', 1, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637587', 'Tèo 89', '1996-03-29', 'Cần Thơ', 0, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637589', 'Tèo 90', '1996-03-30', 'Cần Thơ', 1, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637590', 'Tèo 91', '1996-03-31', 'Cần Thơ', 1, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637591', 'Tèo 92', '1996-04-01', 'Cần Thơ', 0, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637592', 'Tèo 93', '1996-04-02', 'Cần Thơ', 1, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637593', 'Tèo 94', '1996-04-03', 'Cần Thơ', 0, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637595', 'Tèo 95', '1996-04-04', 'Cần Thơ', 0, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637596', 'Tèo 96', '1996-04-05', 'Cần Thơ', 1, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637597', 'Tèo 97', '1996-04-06', 'Cần Thơ', 0, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637598', 'Tèo 98', '1996-04-07', 'Cần Thơ', 1, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637599', 'Tèo 99', '1996-04-08', 'Cần Thơ', 0, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637601', 'Tèo 100', '1996-04-09', 'Cần Thơ', 1, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637602', 'Tèo 101', '1996-04-10', 'Cần Thơ', 1, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637603', 'Tèo 102', '1996-04-11', 'Cần Thơ', 0, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637604', 'Tèo 103', '1996-04-12', 'Cần Thơ', 1, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637605', 'Tèo 104', '1996-04-13', 'Cần Thơ', 0, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637607', 'Tèo 105', '1996-04-14', 'Cần Thơ', 0, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637608', 'Tèo 106', '1996-04-15', 'Cần Thơ', 1, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637609', 'Tèo 107', '1996-04-16', 'Cần Thơ', 0, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637610', 'Tèo 108', '1996-04-17', 'Cần Thơ', 1, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637611', 'Tèo 109', '1996-04-18', 'Cần Thơ', 0, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637612', 'Tèo 110', '1996-04-19', 'Cần Thơ', 1, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637614', 'Tèo 111', '1996-04-20', 'Cần Thơ', 1, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637615', 'Tèo 112', '1996-04-21', 'Cần Thơ', 0, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637616', 'Tèo 113', '1996-04-22', 'Cần Thơ', 1, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637617', 'Tèo 114', '1996-04-23', 'Cần Thơ', 0, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637618', 'Tèo 115', '1996-04-24', 'Cần Thơ', 0, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637619', 'Tèo 116', '1996-04-25', 'Cần Thơ', 1, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637621', 'Tèo 117', '1996-04-26', 'Cần Thơ', 0, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637622', 'Tèo 118', '1996-04-27', 'Cần Thơ', 1, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637623', 'Tèo 119', '1996-04-28', 'Cần Thơ', 0, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637624', 'Tèo 120', '1996-04-29', 'Cần Thơ', 1, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637625', 'Tèo 121', '1996-04-30', 'Cần Thơ', 1, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637626', 'Tèo 122', '1996-05-01', 'Cần Thơ', 0, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637628', 'Tèo 123', '1996-05-02', 'Cần Thơ', 1, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637629', 'Tèo 124', '1996-05-03', 'Cần Thơ', 0, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637630', 'Tèo 125', '1996-05-04', 'Cần Thơ', 0, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637631', 'Tèo 126', '1996-05-05', 'Cần Thơ', 1, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637632', 'Tèo 127', '1996-05-06', 'Cần Thơ', 0, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637634', 'Tèo 128', '1996-05-07', 'Cần Thơ', 1, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637635', 'Tèo 129', '1996-05-08', 'Cần Thơ', 0, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637636', 'Tèo 130', '1996-05-09', 'Cần Thơ', 1, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637637', 'Tèo 131', '1996-05-10', 'Cần Thơ', 1, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637638', 'Tèo 132', '1996-05-11', 'Cần Thơ', 0, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637640', 'Tèo 133', '1996-05-12', 'Cần Thơ', 1, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637641', 'Tèo 134', '1996-05-13', 'Cần Thơ', 0, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637642', 'Tèo 135', '1996-05-14', 'Cần Thơ', 0, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637643', 'Tèo 136', '1996-05-15', 'Cần Thơ', 1, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637644', 'Tèo 137', '1996-05-16', 'Cần Thơ', 0, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637646', 'Tèo 138', '1996-05-17', 'Cần Thơ', 1, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637647', 'Tèo 139', '1996-05-18', 'Cần Thơ', 0, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637648', 'Tèo 140', '1996-05-19', 'Cần Thơ', 1, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637649', 'Tèo 141', '1996-05-20', 'Cần Thơ', 1, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637650', 'Tèo 142', '1996-05-21', 'Cần Thơ', 0, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637651', 'Tèo 143', '1996-05-22', 'Cần Thơ', 1, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637653', 'Tèo 144', '1996-05-23', 'Cần Thơ', 0, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637654', 'Tèo 145', '1996-05-24', 'Cần Thơ', 0, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637655', 'Tèo 146', '1996-05-25', 'Cần Thơ', 1, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637656', 'Tèo 147', '1996-05-26', 'Cần Thơ', 0, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637657', 'Tèo 148', '1996-05-27', 'Cần Thơ', 1, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637658', 'Tèo 149', '1996-05-28', 'Cần Thơ', 0, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637660', 'Tèo 150', '1996-05-29', 'Cần Thơ', 1, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637661', 'Tèo 151', '1996-05-30', 'Cần Thơ', 1, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637662', 'Tèo 152', '1996-05-31', 'Cần Thơ', 0, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637663', 'Tèo 153', '1996-06-01', 'Cần Thơ', 1, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637664', 'Tèo 154', '1996-06-02', 'Cần Thơ', 0, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637665', 'Tèo 155', '1996-06-03', 'Cần Thơ', 0, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637667', 'Tèo 156', '1996-06-04', 'Cần Thơ', 1, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637668', 'Tèo 157', '1996-06-05', 'Cần Thơ', 0, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637669', 'Tèo 158', '1996-06-06', 'Cần Thơ', 1, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637670', 'Tèo 159', '1996-06-07', 'Cần Thơ', 0, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637671', 'Tèo 160', '1996-06-08', 'Cần Thơ', 1, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637673', 'Tèo 161', '1996-06-09', 'Cần Thơ', 1, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637674', 'Tèo 162', '1996-06-10', 'Cần Thơ', 0, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637675', 'Tèo 163', '1996-06-11', 'Cần Thơ', 1, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637676', 'Tèo 164', '1996-06-12', 'Cần Thơ', 0, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637677', 'Tèo 165', '1996-06-13', 'Cần Thơ', 0, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637678', 'Tèo 166', '1996-06-14', 'Cần Thơ', 1, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637680', 'Tèo 167', '1996-06-15', 'Cần Thơ', 0, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637681', 'Tèo 168', '1996-06-16', 'Cần Thơ', 1, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637682', 'Tèo 169', '1996-06-17', 'Cần Thơ', 0, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('3412341241', 'Phan Vũ Kỳ', '1992-09-08', '3/2 Ninh Kiều, Cần Thơ', 1, '2018-09-10 11:05:26', '2018-09-11 05:46:53');

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
('1543370822', '1542637668', '1536626095', '1537694589', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543375112', '1542637668', '1536650607', '1537694308', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543378619', '1542637668', '1536626141', '1537695885', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543385243', '1542637668', '1536626141', '1537695961', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543386503', '1542637668', '1536627156', '1537697143', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543387310', '1542637668', '1536627156', '1537697195', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543388766', '1542637668', '1536626141', '1537695854', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543392176', '1542637668', '1536626129', '1537695611', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543392388', '1542637668', '1536627156', '1537697113', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543395204', '1542637668', '1536626159', '1537696054', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543397336', '1542637668', '1536626159', '1537696109', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543398632', '1542637668', '1536626159', '1537696134', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543400179', '1542637668', '1536626141', '1537695937', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543400394', '1542637668', '1536626129', '1537695568', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543401380', '1542637668', '1536626129', '1537695743', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543401405', '1542637668', '1536626159', '1537696160', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543401503', '1542637668', '1536626141', '1537695797', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543402948', '1542637668', '1536626159', '1537696216', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543410570', '1542637668', '1536626141', '1537695915', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59'),
('1543416371', '1542637668', '1536626129', '1537695699', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543420046', '1542637668', '1536626129', '1537695639', 1, '2018-11-27 13:37:58', '2018-11-27 13:37:58'),
('1543420709', '1542637668', '1536626159', '1537696027', 1, '2018-11-27 13:37:59', '2018-11-27 13:37:59');

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
('1543255545', '1543081388', 1, 1, '1', '1', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:05:45', '2018-11-26 18:05:45'),
('1543255652', '1543081388', 1, 1, '1', '1', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:07:32', '2018-11-26 18:07:32'),
('1543255659', '1543081388', 1, 1, '1', '1', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:07:39', '2018-11-26 18:07:39'),
('1543255666', '1543081388', 1, 14, '1', '1', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:07:46', '2018-11-26 18:07:46'),
('1543255794', '1543167348', 5, 13, '12', '12', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:09:54', '2018-11-26 18:09:54'),
('1543255950', '1543165800', 12, 12, '15', '15', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:12:30', '2018-11-26 18:12:30'),
('1543255965', '1543165800', 12, 12, '15', '15', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:12:45', '2018-11-26 18:12:45'),
('1543256001', '1543165800', 12, 12, '15', 'sfasdfasdf', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:13:21', '2018-11-26 18:13:21'),
('1543256104', '1543165800', 12, 12, 'sfasdfasdf', 'y', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:15:04', '2018-11-26 18:15:04'),
('1543256211', '1543165800', 12, 12, 'y', '1', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:16:51', '2018-11-26 18:16:51'),
('1543256215', '1543166136', 20, 20, '12', '12', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:16:55', '2018-11-26 18:16:55'),
('1543256219', '1543081388', 14, 14, '1', '1', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:16:59', '2018-11-26 18:16:59'),
('1543256224', '1543167348', 13, 13, '12', '12', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:17:04', '2018-11-26 18:17:04'),
('1543256248', '1543167348', 13, 13, '12', 'ahihi', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:17:28', '2018-11-26 18:17:28'),
('1543256459', '1543256459', 0, 20, '', '111111', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'insert', '2018-11-26 18:20:59', '2018-11-26 18:20:59'),
('1543256494', '1543256494', 0, 20, '', '111111', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'insert', '2018-11-26 18:21:34', '2018-11-26 18:21:34'),
('1543256528', '1543256494', 20, 20, '111111', '111111', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:22:08', '2018-11-26 18:22:08'),
('1543256543', '1543256494', 20, 20, '111111', 'how', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:22:24', '2018-11-26 18:22:24'),
('1543256634', '1543256494', 20, 20, 'how', 'how123', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:23:54', '2018-11-26 18:23:54'),
('1543256655', '1543256494', 20, 20, 'how123', 'how', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:24:15', '2018-11-26 18:24:15'),
('1543257062', '1543257062', 0, 12, '', 'kkkk', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'insert', '2018-11-26 18:31:02', '2018-11-26 18:31:02'),
('1543257091', '1543165800', 12, 1, '1', 'hihi', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'update', '2018-11-26 18:31:31', '2018-11-26 18:31:31'),
('1543257234', '1543165800', 1, 0, 'hihi', '', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'delete', '2018-11-26 18:33:54', '2018-11-26 18:33:54'),
('1543257680', '1543257062', 12, 0, 'kkkk', '', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'delete', '2018-11-26 18:41:20', '2018-11-26 18:41:20'),
('1543257689', '1543167348', 13, 0, 'ahihi', '', '114234', '114234', '1536673073', '', '1536650574', '1536418838', 'delete', '2018-11-26 18:41:29', '2018-11-26 18:41:29'),
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
('1543507388', '1543343773', 3, 4, 'ta', 'ta', '114234', '114234', '1536673073', '1536650607', '1536650574', '1536418838', 'update', '2018-11-29 16:03:08', '2018-11-29 16:03:08');

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

--
-- Đang đổ dữ liệu cho bảng `sum_scores_log`
--

INSERT INTO `sum_scores_log` (`ss_id`, `c_id`, `u_id`, `ss_scores`, `created_at`, `updated_at`) VALUES
('15436231880', '', '1536673073', 0, '2018-12-01 00:13:08', '2018-12-01 00:13:08'),
('154362339910', '', '1542637668', 0, '2018-12-01 00:16:39', '2018-12-01 00:16:39'),
('15436233993', '', '1536905877', 0, '2018-12-01 00:16:39', '2018-12-01 00:16:39');

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
('114234', '999999', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456789', 'admin@gmail.com', 1, 0, NULL, NULL, 'k2acrKwtb9vFxCczYcO8rFPb1Att56wUUvYuGtoVkqCmUAGyfpEXj2iUvvAG', '2018-08-24 04:59:01', '2018-11-29 15:41:37'),
('12345', '12345', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456001', 'luanle@gmail.com', 1, 0, NULL, NULL, 'L3RpC3ZkS41hmjP9GrkAVM9grx4xs5PMjNKkScB76CULo6cEokxz8DKWohim', '2018-08-23 01:37:35', '2018-08-29 02:37:43'),
('1536660927', 'àds', '$2y$10$ko/LQThz/fp33YzzXJT2fOEyWRQEGoU/lge6CjN7e7fgQZOLn6tDW', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:15:27', '2018-09-11 10:15:27'),
('1536660957', 'àds', '$2y$10$px07IC7Q/JFgIkOVuqLhne3P5Vnjh.mg0TKRUYHLmT8wZe.0RoK8e', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:15:57', '2018-09-11 10:15:57'),
('1536660994', 'àds', '$2y$10$BJCmc9T1zsSD4dyw9Pz6ROZ2GQ.K4nMAkiixagEiduVlaxTNKM0Pq', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:16:34', '2018-09-11 10:16:34'),
('1536661007', '000002', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456002', 'lqbao@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:16:48', '2018-10-16 14:54:00'),
('1536661034', '000003', '$2y$10$MENj1p1XPL.oSHKv3Z/H7uVucuU50H6CyPKZTBXCLPblqZTV0.73G', '0123456003', 'ctquang@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:17:14', '2018-09-11 05:47:42'),
('1536661134', '000004', '$2y$10$h2ItjadtdJFLZ4mrw5kjeew96hFiNKrTcSDlbB5KZLyqsuLVjcs92', '0123456004', 'lttu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:18:54', '2018-09-11 05:48:50'),
('1536661250', '000005', '$2y$10$zoiBKgoZG5dBIE2AjlEQcuZbTSVDWMsWWaZxSoe3uEHaR19t./dLe', '0123456006', 'ctdan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:20:50', '2018-09-11 05:49:59'),
('1536661366', 'àds', '$2y$10$EjzFEJjTQixfq7SDzo5ZrON2N5RqwjaqriMuPrE2i5xtpcMIvoVR.', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:22:46', '2018-09-11 13:04:34'),
('1536673073', 'SV_0001', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456777', 'ctanh@gmail.com', 1, 1, NULL, NULL, NULL, '2018-09-11 13:37:53', '2018-11-30 22:19:37'),
('1536797549', 'SV_0002', '$2y$10$4vX.oyKDY2Y0ekYCVB/v4eKXctplGrBJVXxLVtX6BoI9hEnduTg8.', '0123456001', 'ltvi@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-13 00:12:29', '2018-11-23 23:54:48'),
('1536905877', 'SV_0003', '$2y$10$i9Xhi2RSs5SsCMeqi5yLHuAKphoUdecHMsgP31kT4AvQEyMGcpeIK', '0964054244', 'lmluan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-14 06:17:57', '2018-11-09 20:29:39'),
('1539968515', 'B1400678', '$2y$10$9vEOm5cBhWuyaTY99tuGo.L9/e59BBYkv6wukCAgBUm0p0IY3RA6C', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-19 17:01:55', '2018-11-20 10:51:13'),
('1540024466', '341234sdfsdf', '$2y$10$.syTQA4vojsL.HF8hV6sG.Q4xwxipPO8mYfz3a09SyC4mfWjZtHtW', '1234123', 'eqrwe@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-20 08:34:26', '2018-10-20 08:34:26'),
('1540024519', 'đấ', '$2y$10$MHnqoZdM6WzpFEPkQYB.ouTHR3.hjmEXnIzC9NUs5VIfAgn3HHW1i', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-20 08:35:19', '2018-10-20 08:35:19'),
('1540145713', '13', '$2y$10$tVMUta03Jeh6eNYyDDDCteVj0QqVVeofLAoWZ38qWK7FMpWGEGQhC', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:15:14', '2018-10-21 18:15:14'),
('1540146298', 'ẻqwerw', '$2y$10$NIwXyWLva3uGXdF0JniJEOF74AZlfLLpKx/9hJWWTQvERDLMbvMny', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:24:58', '2018-10-21 18:24:58'),
('1540146312', 'ẻqwerw', '$2y$10$vm.AV4eJoBnzSfPL7pBWDe2WYaXYissrBnl9j5UymcT/W/UB.P3eO', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:25:12', '2018-10-21 18:25:12'),
('1540146435', 'B1400678', '$2y$10$G9VzS5FVGgykgJ3BFjqymeppH5xs73OLjmgIpTO.SHIPVR10kihiW', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:27:15', '2018-10-21 18:27:15'),
('1540146475', '4143123423', '$2y$10$C6lYazRadh5F5xFY.Bht1emmAbvnmM62SfTsUBDzzNb6AsxKAqAiK', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:27:55', '2018-10-21 18:27:55'),
('1540222271', 'eawrqwerqwerqewrqwer', '$2y$10$6die1ffsetvPtv1U0mxhIOnpUCSOsy.T96EPhYnvXD2llYUx2.Q8K', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-22 15:31:11', '2018-10-22 15:31:11'),
('1542637250', '11111', '$2y$10$DpRfozwh4j.771PLbPGUQOZXqFdUmDza1PRr53oF7ASc0Q42uGcz6', '1234561', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:50', '2018-11-19 14:20:50'),
('1542637252', '11112', '$2y$10$wYfCkCO2lq7df/fJ0aaEKOFyOOWqyW/f2w.LS2Moy0mE85meGVTzC', '1234562', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637253', '11113', '$2y$10$8ns1zoGTptXCqq5Qd3ox0OL6pBpYsvtCYlw0c.G9Yaod7gY9jwNXC', '1234563', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637254', '11114', '$2y$10$eNUkahqaED1Nqd7BHFDEq.M4haHpznL90lAURN/QfhAwvDujSRlCC', '1234564', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637255', '11115', '$2y$10$IsMdW3TPBlPKnWIBzKeK0ulxrTL7ZA17danndtMRRfTJ1p83GVp7q', '1234565', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637257', '11116', '$2y$10$xdrlkBxLos7pMzmuopKP2OB1y3jw5rJFw41uBzWt2JcL8fp28ezRG', '1234566', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637258', '11117', '$2y$10$HHm3dwiftu0ik5rxLwducuPhwmCl/PLT1.QH1dTEHTwbkm0BIClsG', '1234567', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637259', '11118', '$2y$10$5XTmywK1c0AdBLBZWf/iJeFwLfPsOmnkPbRc5sDm6FxrFSVwUSFwi', '1234568', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637260', '11119', '$2y$10$Dlkc6h/x6wsU1vMM3r.SFOkG0LsKmra.rDCbBg89IowZs994pZc6S', '1234569', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637262', '11120', '$2y$10$wcUUmIkH5kAioYNEGvv9XemD/ERM5ewUl611YaUUk.84vH93M/LDy', '1234570', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:20:53', '2018-11-19 14:20:53'),
('1542637495', '11121', '$2y$10$3xQ9eEZXa5g5/9BjdpaecuNgSr2/RBd9iEWq6AICZO5e4bGCtkV0a', '1234571', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637496', '11122', '$2y$10$JqBtBS9JrSV7EXa.ap5xJ.KW3LMtlbAIiB5bL9vYM0U6fX9yVYUaK', '1234572', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637497', '11123', '$2y$10$ajG3lLDw0eSa2PFt/SUfFeIpuDg9xW.k675cx8YSp02aSg2FtffvG', '1234573', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637498', '11124', '$2y$10$3bUfIEuIUQ2/cgwl1LdKneGy.B4nSmhYI.OTxGG.GVlRLVYz64LWu', '1234574', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637500', '11125', '$2y$10$0B3WoxRXiImngzry4XMBNewR1C4uR4hMcJIn93AGzUF8vIKyEoLBu', '1234575', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637501', '11126', '$2y$10$41ZnytOU2ymkYIAHQIC5/./X3W/lQjf/hnWLu9ZZ3NNX7HjG7/rOC', '1234576', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637502', '11127', '$2y$10$0FxBpuFbXyPh9RXLT2vTx.3ctghRB0uOS1JFZ1oiSH8pvnDtJPFLK', '1234577', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637503', '11128', '$2y$10$5YbVu7jrlHh3E9VF1W5R5u5c9iy3Qh4pKcZgNYaMNPidWo.qb/H6S', '1234578', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637504', '11129', '$2y$10$bSn2IENs9nJdUMJyf/BtcO5/qOPvc0yNC6JedZ2EZUFh/OV4BWpV6', '1234579', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637506', '11130', '$2y$10$ho.rn78cWyIYA1VZaTVJXuyPUi5H0H95hUDxnWWLPpSFfmzXkJiOq', '1234580', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637507', '11131', '$2y$10$7vXLb3Zb1WJlRfWabfyq4eVl1dc3xjNcRk4JtkwdiOa9bkEOb8P6.', '1234581', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637508', '11132', '$2y$10$R5xuq.X0xxNc/ynkYikiZO3cLo9YIRFLsYWLTR4nkc8MH/7kaRdk6', '1234582', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637509', '11133', '$2y$10$GjvXbWWckpDuNTbpKuIGb.qSZerzbD9YjsQn0uGgENJvP0B1dXCc.', '1234583', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637511', '11134', '$2y$10$bnpQ2yI3XIHnVdQKYI2C5.9IWzBEjM3OckHZs/DqRrqdpxaQjDIHG', '1234584', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637512', '11135', '$2y$10$4H5xTdzyRSRqym.ar/104.VybeX6seaYzfcyef8TlKiP250jRv0qS', '1234585', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637513', '11136', '$2y$10$En6lxzIcjd5Rn8TDWm7Ei.sL2whsmds4NDVyrN8Vow5mi8t38La..', '1234586', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637514', '11137', '$2y$10$55demGnbbpDEXCMQj0GTauyX394FBEWzeTgCM0RBxQ7nb4huqMaQC', '1234587', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637515', '11138', '$2y$10$ias3nHHppKCg1YyfclZAT.gD5aCAskgZn8oWj5K1Bx8wS19ePD2k6', '1234588', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637517', '11139', '$2y$10$oPwXSXr227vzUv6bV5cLcO3oZJ9nT2Qa6oWQMyb6iHGctecEewQrG', '1234589', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637518', '11140', '$2y$10$KHbZG..bHa4Xh8/fa9dL9.Mtle6diOXDjn.co8QpX1t2zzDD1dQbG', '1234590', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637519', '11141', '$2y$10$w6gu5YSQvzikLqDTTFU7pe0nRAcFX31lf2rs18wFaTOhDiSJHaq.W', '1234591', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637520', '11142', '$2y$10$jYXyoRwOc7z/q3FURAnCJuTtjaRw.3pVar98U1xMO8ItYCAwqMo7K', '1234592', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637521', '11143', '$2y$10$nOyj2DARurQgzOKhMGt0/es0YmQq/l6oK7Hd368mGNRH8s6ZEhf0W', '1234593', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637523', '11144', '$2y$10$i5IuRUTseEMR3DU8/roFDOPA1WGh6DZjGHcXnG.nFPEYLEhbeW9F6', '1234594', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637524', '11145', '$2y$10$kCStudGx7GIaL/MB51hGAeUdMUSsNvrAqWYJtJ7ZklstSRBLxVZyu', '1234595', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637525', '11146', '$2y$10$EzBPTnT/DR3t/4ugLA/JL.PY.4uj5Do56EuyM0NfRlLVhUdrIMcnu', '1234596', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637526', '11147', '$2y$10$X9Uv2QYVR7iydRcctj7TDu9Pw.Ml.cZp3vx0Lfulzb0TZp/IJKX5O', '1234597', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637527', '11148', '$2y$10$1rqTPenGxgcqRh13g1q7g.cPBL9HQfB1rgzWdMpdlVMYZNi4r5poC', '1234598', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637528', '11149', '$2y$10$tkf1s0mJ.VR9B5xBhnr9buX7VbyCxqdqfiJkFujFJME0JuDq18F16', '1234599', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637530', '11150', '$2y$10$p7k97x.RAXkmJ64lekNTEON525Ieq6lt8sQis5BB0w5O6NuRtysPO', '1234600', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637531', '11151', '$2y$10$Ge7sq1WrnHsc1P1KgZ1RzOtveJD5vVKGeaKowIWyn5AD64TmiHuI2', '1234601', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637532', '11152', '$2y$10$/PzEHvhPkz3n.T/OR7i56O0FSRkYw/3MOZAfmj/xiMLgPuLkMwLK2', '1234602', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637533', '11153', '$2y$10$Oa5BBnh.K9THM7vy6pIFbe9Qvn61buOmDxfOmOOULqe5Tbwg7dE46', '1234603', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637534', '11154', '$2y$10$X8TNIugpNnYjXRJdYNnw/e.XxZ1J8B/u70cbF0hXdj1XPG0eLvX.2', '1234604', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637536', '11155', '$2y$10$HErDJnTku9.x7/WKKgZUJ.cOO/CQ1rCjK1GXljida0Qiw7zoeFtXq', '1234605', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637537', '11156', '$2y$10$Je6yz3xguIhK07MvNSmgV.814d4psHW9Sc4oA3.WK9KUzpkiSCsC2', '1234606', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637538', '11157', '$2y$10$U9CKbNz65TLpeUMz4JRyIefBjsMc/vMLPD5VIQLRzMfNVvB0Ko83.', '1234607', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637539', '11158', '$2y$10$k91/hDz6dvDTjNrBsJf5MeZRU1MEj20P9MLCk1FRkW7eJZHUdx.dW', '1234608', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637540', '11159', '$2y$10$fIhOkBa06JUTuMW4vo7BauGR8EpWFoB6XoHEbKDBczz9G0oAKODUu', '1234609', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637542', '11160', '$2y$10$Qo7BaenRwZvA0MAErzgiqOgdHInUMjGrT2RsEcStfKk8mYDvMM20y', '1234610', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637543', '11161', '$2y$10$X2IZSaNsciwFuVf7I6oAJ.X.yqYhd5QmJ7tjiHRQIffFHd1N5TwMi', '1234611', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637544', '11162', '$2y$10$gXCa3qDwQ/A/LEYqMcM0mO8fWtOhrFjuBcBS7k/l7sLn/CNhPHXvu', '1234612', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637545', '11163', '$2y$10$87QYCrOJrQ1jMqbowBIbS.i0lAQwLpEGrpI9R8aTYgLasCQw/zOcW', '1234613', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637546', '11164', '$2y$10$Z5dCo1K9cE0z1Y/p1v.kO.nv5Sxq21ZqQQZM1CtJMrOaK.82o4Y16', '1234614', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637547', '11165', '$2y$10$1crjVO4EKQilPXWamPQ13.AuEsEREI55nWVfRTgV/ZGA2hyzLqfkq', '1234615', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637549', '11166', '$2y$10$Sl6RhmOzE5n1RKkrVI13EesJSgi3Y4lsP1xnMbvI9taebFJjoVNkC', '1234616', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637550', '11167', '$2y$10$0Q9YFVEV/HwQxK.y5LPAp.ev9NmzF9cUzyBqIwlek4d9yXtLnL0H6', '1234617', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637551', '11168', '$2y$10$dl4eIAfcoRBA.w7gXvNaNOWZ1q3TKettwrPzJ9FdAHEdu28g/fStC', '1234618', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637552', '11169', '$2y$10$E5Jt.yt8boWYP46VneKcvObO0k7d3tuBQ1js3acy.uetZXH0w4dlO', '1234619', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637553', '11170', '$2y$10$hMSFObM5CEVg1M9pEnRDxurFHNuUs1tjV.sEN/BNrnTdTBNjqPExe', '1234620', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637555', '11171', '$2y$10$vWkGNU5CJBdNQzZOQf1.m.Nuk2qiyDHyssx7CgoLSZAziydvmUSnW', '1234621', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637556', '11172', '$2y$10$d9iftVcD0lMzWL40u4ZMd.Fa0T6DQ2RCfiF.7r19USDI5xR0lPU5W', '1234622', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637557', '11173', '$2y$10$qB4r1N7OolkyEbzU3/49E.VFJLzQlZbIDTMcv1iJEDNpuJUkBpvde', '1234623', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637558', '11174', '$2y$10$fC6BYUnELxjfwmdElXWcFuWZg.RhCBcOmpmlTjpLg2b1J/Kc7radS', '1234624', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637559', '11175', '$2y$10$1wO97MwvO8GbmKKmqbK/Vu21U9g6a8ErFVksaIkdy7Pp91n0AIpy2', '1234625', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637560', '11176', '$2y$10$FyBEtmffraSgCoTkQ4ZKr.JR8UhUy3XSHID3YdreCjC/N4ESia0si', '1234626', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637562', '11177', '$2y$10$GSzBIMU6fJSsdE3.wLdKQO9no.VWxDfaWXa/Ft9AQb8.7.9bcsh5S', '1234627', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637563', '11178', '$2y$10$PHXEINLdpH5jQRYpa0BCO.8KSWjKOuLRizanHbEUJT1A9htCDQiTi', '1234628', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637564', '11179', '$2y$10$360/0qwtTFDPp2UaFBvVbO0ep3pMX6yDvB9SfVC39ppK1a.O06yEi', '1234629', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637565', '11180', '$2y$10$1aRXqYE8jikopjPY7tk6W.sevHi5Vqv5lhVoxTCwjzzQEEdrhDMOS', '1234630', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637566', '11181', '$2y$10$mpbfE2EGoGFIn7G5WNhng.JepX9XbHjAYr6x4fGmbz/e5VYb.H9q.', '1234631', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637567', '11182', '$2y$10$EtyLWEZZLvT.UJXvrv0do.jyR3KUdxfIZiNdEFSBpxq61bhOOa/ja', '1234632', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637569', '11183', '$2y$10$f2R3LUNt1k7X1QTnSO4nIOo64pVDbOsSjsubSGNwq.l1BDG.5HFRy', '1234633', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637570', '11184', '$2y$10$pFVtztdbygJXobWPUu463.qfetzkuoh49YYdNuoioV6QqYKYuUkbu', '1234634', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637571', '11185', '$2y$10$qh1PRNYdujA5kRYskvT74ORHie2mwTIsz2I41RP4PBS3Vm7Az6KHW', '1234635', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637572', '11186', '$2y$10$OYNo8ZQm7./OlBJYV.YjeeSZYewjdGegyhUyMXIx.pMxUmv6HIeca', '1234636', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637573', '11187', '$2y$10$CkAPCbV9R.IFVARjVCas9.jRP2EdqlEAZg/h.jFFKbjRa6EQiPiNu', '1234637', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637574', '11188', '$2y$10$3kOIJaeTkjGMKXISY.7qmOKaz2E70OR/.192yzpwY00KQqNCWiXdS', '1234638', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637576', '11189', '$2y$10$KIvwQ4ree0R2YIyP2zxZ/e9CABKBJlhRH0hh7b4XBMLNrP4Emo3Zy', '1234639', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637577', '11190', '$2y$10$H7R0bTK8etPoK1xTeukXVeUjvTRc9igwogXeGOJxNpLJxvWY3qdDe', '1234640', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637578', '11191', '$2y$10$BKo188JVp8JYG6Lx4Og0qOq5ENviM7E1bqIdSOmvXFEr6BJql0p7m', '1234641', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637579', '11192', '$2y$10$FleIjJTuO0vLL04LFT3LNO8L35hfVXvmVVYIp8CkkUOJj/F08bJkO', '1234642', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637580', '11193', '$2y$10$yaQTc9IjY9xV0xH9EUSRsuWWGePG5jDL.1eGYjDcu3KMAbyYXmkCm', '1234643', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637581', '11194', '$2y$10$B1ruocjnQYiRBF7HBNXWsuqV3qdg/NguHiCahRfzQbk1a0YOr7ugK', '1234644', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637583', '11195', '$2y$10$nbJfTeLtp5zxYuhk3m3Wmeemd3e38vmGhko1Qh7qAUm1Prd4XUYBS', '1234645', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637584', '11196', '$2y$10$79Sas./hCcNsVzIrzRlWNOS.u5MPlT.Qc73mB1/c8SWRRcOX/Rvnu', '1234646', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637585', '11197', '$2y$10$AYdyw3SIrCG1wZjbjLncVuVdUNyXEMcump8jEuZ61WatATwrQNmgC', '1234647', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637586', '11198', '$2y$10$iXnGrV30DAafwJqo27M88uV/O8xdnQQfZAfPAsjJLCuQLgl.tCaB2', '1234648', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637587', '11199', '$2y$10$DMPM4mH1UeBifl8fkMpNmek1w1wPgHrS66CLqDTChnU6Z1y7qHF6C', '1234649', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637589', '11200', '$2y$10$glXjf6l6b3QHbrOiG2du7u7/qn.8/j4AfSIxNJhVGAJz3I5/T3YUS', '1234650', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637590', '11201', '$2y$10$W5G9k7ZZs4ob8gZlFcAS5uhFWn5bSEWtt/TP0QUSo63We5l536.Ha', '1234651', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637591', '11202', '$2y$10$A3bulPvliRYGlrTlUMvp9OSrMovc7Hz/m6bPOpi53Lnpuc5zDFMai', '1234652', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637592', '11203', '$2y$10$HBlmOGE2SN8kXEwGgMfScOt.07ojscRR0ac3Ti5rH9tZYUDdzg/Ha', '1234653', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637593', '11204', '$2y$10$vxAN4HmTtHwWXXZ2fZ1FKORBRMD3kUChrsU807C6FDic/fZgkVNZe', '1234654', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637595', '11205', '$2y$10$V1l3EsI02H413lKxmOhcF.oY3EQKcj0nwr1fDlbGXdB1WsDG4Tl4i', '1234655', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637596', '11206', '$2y$10$L2BTZjWVmvqkpvHx3dg4sOgJ0joap1MtpvKzCDEh2G/mMEEnsNfOC', '1234656', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637597', '11207', '$2y$10$l4eG0DoRcN3EOcqZQk2IL.AIEOg5jpbcXpELwe0AprR0Qje4gWhWu', '1234657', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637598', '11208', '$2y$10$f7Zsh8aAGcpwmO.Bvfmc..xGz5TrmU.LOHKww/JLEYOVabF5EmNV2', '1234658', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637599', '11209', '$2y$10$klyAeBT1gioOIB2L1uoAbe05KGK7ilvBXlKsLG7YDHbBtUxkBn2Ji', '1234659', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637601', '11210', '$2y$10$x0btGx.MsSNAXProBEs1F.Oy5ww/9EdIycf6dKlsefa2TA/9yLZOi', '1234660', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637602', '11211', '$2y$10$PLslJQ8fRUCNbB5l0cn2Du.4jHHT1CENe0Q4BvGdiOqKc/T5CduzC', '1234661', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637603', '11212', '$2y$10$TH9Fo7OQ1IyJNaPkWqBz7.AJNlNrOa2wyv7RPiMxUw0Lb5Kw9PSeW', '1234662', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637604', '11213', '$2y$10$3l9f3p2kBivoNeW7mjXCUefdY7XX/9VmM9YdTgSofDFL8tfVppWvy', '1234663', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637605', '11214', '$2y$10$hQsl./FU4tHoI9/KuUzjTOQwHavTde.8z3Z7YXlJ/UgR6IYzHVysS', '1234664', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637607', '11215', '$2y$10$bHnyHJ3UmqxdjhP4F3Mf.O9D8HKe6BzMQeXaL6JcAdNUbcN1F0EP.', '1234665', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637608', '11216', '$2y$10$0BPRXObF9YUqePbw4f174uAdylEBUiYFWmwg8DZDdvC1ccXY2rZU.', '1234666', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637609', '11217', '$2y$10$k89GoRoZhERr7ZkIGnS1/er.NT/aHfBqUKXwDQ/BXW40oIr0/xoLO', '1234667', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637610', '11218', '$2y$10$oUhq0QJiCJVahoWVRIBE3e0wjX.OtQeczIWkWZmi/B4Vx0TuNmKTe', '1234668', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637611', '11219', '$2y$10$nw7ewAjCM2wh1x6NhkIENe6DHVQjU.sCvSc.QvfZ1x7gfpuM/cG.m', '1234669', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637612', '11220', '$2y$10$dzUDkV/X20EZqwDFkzeGd./yJxD.gwXJLUQ0CWRBVu.9JwSOs0XV6', '1234670', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637614', '11221', '$2y$10$HlZjYgElwM9xcGklDU1U0.vVYRlUPc6pYv/Wtu1mQTzyVIKqyEoPa', '1234671', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637615', '11222', '$2y$10$MiJtXWb4rEibhMHzZ01TN.n9GWavJMgD3k8oW7lftXEzBxg1ryC5C', '1234672', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637616', '11223', '$2y$10$mKQsW/pxz7j6SFgIrUMJyOVzGFXxQInqz8EPFVfYIUxx0L2JxyiCK', '1234673', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637617', '11224', '$2y$10$YSKYBB.5H0l5IMOpZTDmLuS5vszhqs9ETsm5v6.uKXD19hyP78RUG', '1234674', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637618', '11225', '$2y$10$f015ztgV2wsm6KoVME.PmuEaM6GvjV5Edm7xL3J5pph8slb1kWQ/y', '1234675', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637619', '11226', '$2y$10$LGI6nfabrmUfPm5o5Jqj8eBd8.u.tlQGTWI0YGe4UiCQlQFqoCOiu', '1234676', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637621', '11227', '$2y$10$9Sht6T2xhewjnhCnGpPKge3EGU8WCIStljaCzn0b9KqAaITkFC8ca', '1234677', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637622', '11228', '$2y$10$pn9t.4EkGdwfAFjzXyzsvunas1XKuTXQbcqJ2da9gZObb7wBe1WdO', '1234678', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637623', '11229', '$2y$10$DPlscrIxTy13ZtRAERLfvutCbq8jpUduqhaVy4gZoFmi8ywn1wE7a', '1234679', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637624', '11230', '$2y$10$3J2jhlnrnx6Xm52WFH57UegjQGdBGLKCm/z6Skp/NliaKnYI6xibK', '1234680', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637625', '11231', '$2y$10$EmexiSnq2P86pmFacaQpxOpp7HSzqZEzE0.33UWmaxG.Fpx400wH.', '1234681', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637626', '11232', '$2y$10$I3KV1QFipjgrc1F1GLOToer/Y8zPjhfHXfnW/EQ0jy0TD6/XQqMrK', '1234682', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637628', '11233', '$2y$10$NT19YHI.cKsZNvDgP5xQ0enh3ednCv7cXyw.P7ygM9CFsLXcSom2e', '1234683', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637629', '11234', '$2y$10$s1PNFwg410cD1MlCVc91Eee7tdvwtam6bwPIoEVeXXaaBV8gKuKFW', '1234684', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637630', '11235', '$2y$10$KffKp71fErdn5o0igoFhOeR10uDExNOH0lS1vyH94Gyt4vv50HjNO', '1234685', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637631', '11236', '$2y$10$hv/Cpx./CKBq.EYoFE/Rhuyz95nuFrmRR2cW53CI8MQcC25Sl8o5y', '1234686', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637632', '11237', '$2y$10$WXxQUTIt9KL4IB5M/31V7.XsoFI1W9mslaozwAtdIaQOx3h/tv0K2', '1234687', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637634', '11238', '$2y$10$7NmsJIDdTV66H41.in0mdeqKx02YE25BvEfe/1dGADF1hooEEcTRa', '1234688', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637635', '11239', '$2y$10$ik0G9kYcOzz6H.tj5DANc.a6E92p4fAzWgtSDEpC4L0cjaEEeax5e', '1234689', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637636', '11240', '$2y$10$QpzELtaSNluja2PI2MEdZukVIPj61ch5eI1Wh9QPeAFfpAbrYt3zy', '1234690', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637637', '11241', '$2y$10$OWnyjrK19Ei2AMBi9snAW.IBNsHGSgc2KDXHfjMJPcmbnzJk.7cRK', '1234691', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637638', '11242', '$2y$10$r2IIaCUAcHoU6gcyzqyWX.fIX6sCtA2kfUWi7xGXb5dy0LmxqrsrW', '1234692', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637640', '11243', '$2y$10$VUS9szo6qhvZ4pa7A0c/B.zJNKa7DMP0RpaMw6VCvIKxz0yv6WyXS', '1234693', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637641', '11244', '$2y$10$7rWqEJ47nDF.gfI1yrYKLeGaV1jcfzbZU.tf/WvMp2m8w1.If.tJK', '1234694', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637642', '11245', '$2y$10$jgg9IPzGujprg/AiDBKUsOwyzpNCYo9ElEr8nPNhRd3U1IXauD0Ti', '1234695', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637643', '11246', '$2y$10$208y6Bg1.dmrGazlvmzcU.bNeCRTqpyzTG7/9MV4IssKRyO4S9Gby', '1234696', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637644', '11247', '$2y$10$w4Qj4OK7TmANMfPZxwU/Sul./pW9.SD0gxPwKv7jVIlSXO7Fei9x2', '1234697', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637646', '11248', '$2y$10$meH8978.kaPdO/QybVuuAe2pBK.wRLG5PJp4WAd2U6xundCJVO2re', '1234698', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637647', '11249', '$2y$10$q1q5coHbfJTXOp7.2JrmGOSnvpcA9GRwVw5thIFvi6K8f2G2NFDH.', '1234699', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637648', '11250', '$2y$10$PP7ppmf7nhu27NWzMlSthOTFRRi3bznRljcFz9J5aIM/G0leQv3Oa', '1234700', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637649', '11251', '$2y$10$bkecRC2mDN730y/nMdfZk.H6YKnnclQEIF78.CXC0HnZpAr0KXu6W', '1234701', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637650', '11252', '$2y$10$uYT.cjmvt7H.QG4c31yMh.ye03kdJUIIOIjt5ZuIPazd2H4FdXHua', '1234702', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637651', '11253', '$2y$10$JB4pdqhxIlPzyZ.9eDH3m.YHkLhwMPqY50Cb5KXmBgUAjxKLY4Sua', '1234703', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637653', '11254', '$2y$10$cajVNuy9oIpTP8gZPIcaJeRhsnn8h4e9t6/92nwj6QYoVS.sasOBy', '1234704', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637654', '11255', '$2y$10$5WSJDMgXWs8VrEISF/Sf.OfgmEUZ.qFET85.3O4JsAYispW5omhtq', '1234705', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637655', '11256', '$2y$10$GmU0lQwtk2HuWUHDCbHH8eb9KHcHlwuyqhjoAPLQXO8a4M8Y2iIeq', '1234706', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637656', '11257', '$2y$10$XsOnbJF0Wl.rvPxwTEqu8eS2WtOSxmxAliPWjIxNU/W5Jdx4g015O', '1234707', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637657', '11258', '$2y$10$6HFw4YSrF3nvfImb/LJS8eQtBzCxbZREOuaSea.wnbZSa8Vqbshku', '1234708', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637658', '11259', '$2y$10$rMdFsNaq8yc4pSv0hcgxqurfxdrb2Qd95H6BohE8Q6YwJKf3C9FPy', '1234709', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637660', '11260', '$2y$10$mhDBvbaGbnZIniZ3giwoaOU5zxuMGD2U6gZ3nRVKpySA06vvbfgRO', '1234710', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637661', '11261', '$2y$10$R9UwRVRpP.8Pu3uejLT49uVK4FdNrJzCKov3XCfgcdZsRYI6Pykgq', '1234711', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637662', '11262', '$2y$10$pLhN.GFIeEoq0WBoVvEMVOY5MryJdRjt0PH/Y2zyksFcN21b8sW8q', '1234712', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637663', '11263', '$2y$10$k/MFKyyNV5IkJB9tfsh.B.jfNJobCq/faU4plrUAOiPUyRf8CsVVa', '1234713', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637664', '11264', '$2y$10$vTDIPcsW9WU8v8.XZGCpxuHvfUQZtIV.DoVk5mfPVG67H08g8z2pK', '1234714', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637665', '11265', '$2y$10$RC8C2Xd9vakmpJw5HW84DuBx52NDE9umCDV/nJPT5iq9pwdkIGGRO', '1234715', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637667', '11266', '$2y$10$xv8ahZkCivkZ90FvoneMIODhI.C./Kkd00lA7arIlZiHTtSiFxWra', '1234716', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637668', '11267', '$2y$10$z1UUBAEbYobhX9kTzLYZ8epKDAFV3W8jPGVrGXczPPLoF0DZLChRK', '1234717', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:22', '2018-11-27 13:35:08'),
('1542637669', '11268', '$2y$10$.1urMXfEtNS7bo4tssafn.gf8nC.RFGjEsT40EsaVimQNLYribSCy', '1234718', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637670', '11269', '$2y$10$XQTqRPiO8Xn2PqiOkQ68duZvCqNUa.BJjIRCPlXQfwRJqMKuQiCj2', '1234719', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637671', '11270', '$2y$10$Ogjqj49cCi9sjCdDBUR87uYdNpS1k/iftDs6P840fLeWAtfYtGyZq', '1234720', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637673', '11271', '$2y$10$7jQfo5ueLAYy7EyZLR/b/OtS4XtPs6yHYtjklP9QpwZ3pMeJtRVLa', '1234721', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637674', '11272', '$2y$10$xnK.9l.4RxYs0I2EJWXyleHuI.7ky14E3/HMcC52sT/Y4L1IS68Xm', '1234722', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637675', '11273', '$2y$10$Dcducey0KGY0td32/hXLGOK7pdeClaauSV10VAneGDm22DMpZN17i', '1234723', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637676', '11274', '$2y$10$W2mrFc3OOIUgBurJp.tcLuSzJW5CLtyw8whUKhPl5BnVbRXdiG8qS', '1234724', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637677', '11275', '$2y$10$FTdDz/nOrLke/mbzSTU0EO7i/NGqsNPtbOOSAfsDOfgH55KlVMwUq', '1234725', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637678', '11276', '$2y$10$jDDiDanHaVZdBUF/EH42s.7cgXbJEhBl1Cg6CUa8K9nMRjzO5h6DW', '1234726', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637680', '11277', '$2y$10$wY1k.zELoklCcwFpPSXIheTz8rT/toWp9zovdqqsDqe9oJUqYr.dG', '1234727', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637681', '11278', '$2y$10$TSClP6flJu6o1RjB7psZLeF08eGb56gyoxoWNrMnVQcRXbXRvHPvO', '1234728', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637682', '11279', '$2y$10$ajoBrfiC9.aC3j6YbtCh9O7ngR.v9tb/jFIhX8GIeP7B9/Guv4k/y', '1234729', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('3412341241', '000001', '12341234234', '0123456001', 'fadsfasdf', 1, 0, NULL, NULL, NULL, '2018-09-10 11:04:42', '2018-10-23 09:22:20');

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
('1537807962', '1536673073', '1536768275', '2018-09-24 16:52:42', '2018-09-24 16:52:42'),
('1537884828', '1536673073', '1536768286', '2018-09-25 14:13:48', '2018-09-25 14:13:48'),
('1537886328', '1536905877', '1536768275', '2018-09-25 14:38:48', '2018-09-25 14:38:48'),
('1537895039', '1536673073', '1536768294', '2018-09-25 17:03:59', '2018-09-25 17:03:59'),
('1539187123', '1536673073', '1539187076', '2018-10-10 15:58:43', '2018-10-10 15:58:43'),
('1539187124', '1536797549', '1539187076', '2018-10-10 15:58:43', '2018-10-10 15:58:43'),
('1539187125', '1536905877', '1539187076', '2018-10-10 15:58:43', '2018-10-10 15:58:43'),
('1539624294', '1536797549', '1536768275', '2018-10-15 17:24:54', '2018-10-15 17:24:54'),
('1543038214', '1536673073', '1536768267', '2018-11-24 05:43:34', '2018-11-24 05:43:34'),
('1543038215', '1536797549', '1536768267', '2018-11-24 05:43:34', '2018-11-24 05:43:34'),
('1543038216', '1536905877', '1536768267', '2018-11-24 05:43:34', '2018-11-24 05:43:34'),
('1543038217', '1539968515', '1536768267', '2018-11-24 05:43:34', '2018-11-24 05:43:34'),
('1543038218', '1542637250', '1536768267', '2018-11-24 05:43:34', '2018-11-24 05:43:34'),
('1543038219', '1542637252', '1536768267', '2018-11-24 05:43:34', '2018-11-24 05:43:34');

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
('1536927510', '1536673073', '1536577640', '2018-09-14 12:18:30', '2018-09-14 12:18:30'),
('1536927511', '1536797549', '1536577640', '2018-09-14 12:18:30', '2018-09-14 12:18:30'),
('1536927512', '1536905877', '1536577640', '2018-09-14 12:18:30', '2018-09-14 12:18:30'),
('1541773436', '1539968515', '1541773419', '2018-11-09 14:23:56', '2018-11-09 14:23:56'),
('1541773437', '1536673073', '1541773419', '2018-11-09 14:23:56', '2018-11-09 14:23:56'),
('1541773439', '1536797549', '1541773419', '2018-11-09 14:23:56', '2018-11-09 14:23:56'),
('1541773441', '1536905877', '1541773419', '2018-11-09 14:23:56', '2018-11-09 14:23:56'),
('1542564291', '1539968515', '1536577630', '2018-11-18 18:04:51', '2018-11-18 18:04:51'),
('1542564292', '1536673073', '1536577630', '2018-11-18 18:04:51', '2018-11-18 18:04:51');

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
('114234', '114234', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-10-11 18:27:13', '2018-10-11 18:27:13'),
('1324123412341234', '3412341241', '0826eaf8086b01749bf7ff65742a200c', '2018-09-10 11:06:30', '2018-10-23 09:22:20'),
('1536661008', '1536661007', '1536238635', '2018-09-11 10:16:48', '2018-10-14 13:44:54'),
('1536661034', '1536661034', '0826eaf8086b01749bf7ff65742a200c', '2018-09-11 10:17:14', '2018-09-11 05:47:42'),
('1536661134', '1536661134', '0826eaf8086b01749bf7ff65742a200c', '2018-09-11 10:18:54', '2018-09-11 05:48:51'),
('1536661250', '1536661250', '0826eaf8086b01749bf7ff65742a200c', '2018-09-11 10:20:50', '2018-09-11 05:49:59'),
('1536661366', '1536661366', '0826eaf8086b01749bf7ff65742a200c', '2018-09-11 10:22:46', '2018-09-11 10:22:46'),
('1536673073', '1536673073', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-09-11 13:37:53', '2018-11-23 21:28:35'),
('1536797549', '1536797549', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-09-13 00:12:29', '2018-09-13 00:12:29'),
('1536905877', '1536905877', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-09-14 06:17:57', '2018-09-13 23:18:12'),
('1539968515', '1539968515', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-10-19 17:01:55', '2018-10-19 17:01:55'),
('1540146435', '1540146435', '0826eaf8086b01749bf7ff65742a200c', '2018-10-21 18:27:15', '2018-10-21 18:27:15'),
('1540146475', '1540146475', '0826eaf8086b01749bf7ff65742a200c', '2018-10-21 18:27:55', '2018-10-21 18:27:55'),
('1540222271', '1540222271', '0826eaf8086b01749bf7ff65742a200c', '2018-10-22 15:31:11', '2018-10-22 15:31:11'),
('1542637250', '1542637250', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637252', '1542637252', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637253', '1542637253', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637254', '1542637254', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:51', '2018-11-19 14:20:51'),
('1542637256', '1542637255', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637257', '1542637257', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637258', '1542637258', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637259', '1542637259', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:52', '2018-11-19 14:20:52'),
('1542637260', '1542637260', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:53', '2018-11-19 14:20:53'),
('1542637262', '1542637262', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:20:53', '2018-11-19 14:20:53'),
('1542637495', '1542637495', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637496', '1542637496', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637497', '1542637497', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:55', '2018-11-19 14:24:55'),
('1542637498', '1542637498', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637500', '1542637500', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637501', '1542637501', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637502', '1542637502', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637503', '1542637503', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:56', '2018-11-19 14:24:56'),
('1542637505', '1542637504', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637506', '1542637506', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637507', '1542637507', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637508', '1542637508', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637509', '1542637509', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:57', '2018-11-19 14:24:57'),
('1542637511', '1542637511', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637512', '1542637512', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637513', '1542637513', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637514', '1542637514', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:58', '2018-11-19 14:24:58'),
('1542637515', '1542637515', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637517', '1542637517', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637518', '1542637518', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637519', '1542637519', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637520', '1542637520', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637521', '1542637521', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:24:59', '2018-11-19 14:24:59'),
('1542637523', '1542637523', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637524', '1542637524', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637525', '1542637525', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637526', '1542637526', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637527', '1542637527', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:00', '2018-11-19 14:25:00'),
('1542637529', '1542637528', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637530', '1542637530', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637531', '1542637531', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637532', '1542637532', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637533', '1542637533', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:01', '2018-11-19 14:25:01'),
('1542637535', '1542637534', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637536', '1542637536', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637537', '1542637537', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637538', '1542637538', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637539', '1542637539', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637540', '1542637540', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:02', '2018-11-19 14:25:02'),
('1542637542', '1542637542', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637543', '1542637543', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637544', '1542637544', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637545', '1542637545', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637546', '1542637546', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:03', '2018-11-19 14:25:03'),
('1542637548', '1542637547', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637549', '1542637549', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637550', '1542637550', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637551', '1542637551', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637552', '1542637552', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:04', '2018-11-19 14:25:04'),
('1542637553', '1542637553', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637555', '1542637555', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637556', '1542637556', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637557', '1542637557', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637558', '1542637558', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637559', '1542637559', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:05', '2018-11-19 14:25:05'),
('1542637561', '1542637560', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637562', '1542637562', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637563', '1542637563', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637564', '1542637564', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637565', '1542637565', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637566', '1542637566', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:06', '2018-11-19 14:25:06'),
('1542637568', '1542637567', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637569', '1542637569', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637570', '1542637570', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637571', '1542637571', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637572', '1542637572', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637573', '1542637573', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:07', '2018-11-19 14:25:07'),
('1542637575', '1542637574', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637576', '1542637576', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637577', '1542637577', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637578', '1542637578', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637579', '1542637579', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637580', '1542637580', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:08', '2018-11-19 14:25:08'),
('1542637582', '1542637581', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637583', '1542637583', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637584', '1542637584', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637585', '1542637585', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637586', '1542637586', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:09', '2018-11-19 14:25:09'),
('1542637588', '1542637587', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637589', '1542637589', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637590', '1542637590', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637591', '1542637591', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637592', '1542637592', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637593', '1542637593', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:10', '2018-11-19 14:25:10'),
('1542637595', '1542637595', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637596', '1542637596', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637597', '1542637597', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637598', '1542637598', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:11', '2018-11-19 14:25:11'),
('1542637600', '1542637599', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637601', '1542637601', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637602', '1542637602', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637603', '1542637603', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637604', '1542637604', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:12', '2018-11-19 14:25:12'),
('1542637605', '1542637605', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637607', '1542637607', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637608', '1542637608', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637609', '1542637609', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637610', '1542637610', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637611', '1542637611', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:13', '2018-11-19 14:25:13'),
('1542637613', '1542637612', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637614', '1542637614', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637615', '1542637615', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637616', '1542637616', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637617', '1542637617', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637618', '1542637618', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:14', '2018-11-19 14:25:14'),
('1542637620', '1542637619', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637621', '1542637621', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637622', '1542637622', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637623', '1542637623', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637624', '1542637624', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637625', '1542637625', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:15', '2018-11-19 14:25:15'),
('1542637627', '1542637626', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637628', '1542637628', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637629', '1542637629', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637630', '1542637630', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637631', '1542637631', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:16', '2018-11-19 14:25:16'),
('1542637633', '1542637632', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637634', '1542637634', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637635', '1542637635', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637636', '1542637636', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637637', '1542637637', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:17', '2018-11-19 14:25:17'),
('1542637639', '1542637638', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637640', '1542637640', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637641', '1542637641', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637642', '1542637642', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637643', '1542637643', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:18', '2018-11-19 14:25:18'),
('1542637645', '1542637644', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637646', '1542637646', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637647', '1542637647', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637648', '1542637648', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637649', '1542637649', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637650', '1542637650', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:19', '2018-11-19 14:25:19'),
('1542637652', '1542637651', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637653', '1542637653', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637654', '1542637654', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637655', '1542637655', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637656', '1542637656', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637657', '1542637657', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:20', '2018-11-19 14:25:20'),
('1542637659', '1542637658', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637660', '1542637660', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637661', '1542637661', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637662', '1542637662', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637663', '1542637663', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637664', '1542637664', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:21', '2018-11-19 14:25:21'),
('1542637666', '1542637665', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637667', '1542637667', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637668', '1542637668', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637669', '1542637669', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637670', '1542637670', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:22', '2018-11-19 14:25:22'),
('1542637671', '1542637671', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637673', '1542637673', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637674', '1542637674', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637675', '1542637675', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637676', '1542637676', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637677', '1542637677', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:23', '2018-11-19 14:25:23'),
('1542637679', '1542637678', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637680', '1542637680', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637681', '1542637681', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:24', '2018-11-19 14:25:24'),
('1542637682', '1542637682', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-11-19 14:25:24', '2018-11-19 14:25:24');

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
