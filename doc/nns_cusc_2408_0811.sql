-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 08, 2018 lúc 04:15 PM
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
('1537896694', '114234', 'Sắp đến chưa duyệt', '2018-10-01', '2018-10-30', '<p>Hello</p>', 'not img', 10, 1, '2018-09-25 17:31:34', '2018-10-10 08:47:46'),
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
('1539626602', '1536661007', '1536577630', '2018-10-15 18:03:22', '2018-10-15 18:03:22'),
('1539626603', '1536661007', '1536577640', '2018-10-15 18:03:22', '2018-10-15 18:03:22');

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
('1536650574', '1536650607', '1', 'TOEIC – 255 đến 400', 20, 1, 20, 1, '2018-09-11 07:22:54', '2018-09-11 05:21:38'),
('1536737853', '1536627194', '1', 'Sinh viên các trường ĐH, CĐ đăng ký thành viên với CUSC', 2, 1, 2, 1, '2018-09-12 07:37:33', '2018-09-23 03:14:10'),
('1537694308', '1536650607', '2', 'TOEIC – 405 đến 600', 40, 1, 40, 1, '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694489', '1536650607', '3', 'TOEIC trên 600', 60, 1, 60, 1, '2018-09-23 09:21:29', '2018-09-23 09:21:29'),
('1537694550', '1536626095', '1', 'Tổ chức chuyên đề', 10, 3, 30, 1, '2018-09-23 09:22:30', '2018-09-23 09:22:30'),
('1537694589', '1536626095', '1', 'Báo cáo chuyên đề', 10, 3, 30, 1, '2018-09-23 09:23:09', '2018-09-23 09:23:09'),
('1537694620', '1536626095', '3', 'Tham dự chuyên đề', 2, 5, 10, 1, '2018-09-23 09:23:40', '2018-09-23 09:23:40'),
('1537694681', '1536626114', '1', 'Quản trị diễn đàn/ Chủ nhiệm câu lạc bộ, cập nhật mã nguồn cho dự án nguồn mở (hoạt động tích cực).', 10, 3, 10, 1, '2018-09-23 09:24:41', '2018-09-23 02:35:29'),
('1537695396', '1536626114', '2', 'Viết bài cho diễn đàn, câu lạc bộ, hỗ trợ các thành viên khác trong các dự án mã nguồn mở', 4, 4, 16, 1, '2018-09-23 09:36:36', '2018-09-23 09:36:36'),
('1537695526', '1536626114', '1', 'Tham gia mức thanh thành viên tích cực đăng nhập', 2, 5, 10, 1, '2018-09-23 09:38:46', '2018-09-23 09:38:46'),
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
('1536650574', '1536650574', '1536305998', '2018-09-11 07:22:54', '2018-09-11 05:21:38'),
('1536737853', '1536737853', '1536306362', '2018-09-12 07:37:33', '2018-09-23 03:14:10'),
('1537694308', '1537694308', '1536305998', '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694489', '1537694489', '1536305998', '2018-09-23 09:21:29', '2018-09-23 09:21:29'),
('1537694550', '1537694550', '1536305998', '2018-09-23 09:22:30', '2018-09-23 09:22:30'),
('1537694589', '1537694589', '1536305998', '2018-09-23 09:23:09', '2018-09-23 09:23:09'),
('1537694620', '1537694620', '1536305998', '2018-09-23 09:23:40', '2018-09-23 09:23:40'),
('1537694682', '1537694681', '1536305998', '2018-09-23 09:24:42', '2018-09-23 02:35:29'),
('1537695396', '1537695396', '1536305998', '2018-09-23 09:36:36', '2018-09-23 09:36:36'),
('1537695526', '1537695526', '1536305998', '2018-09-23 09:38:46', '2018-09-23 09:38:46'),
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
('1537697527', '1537697527', '1536306397', '2018-09-23 10:12:07', '2018-09-23 10:12:07');

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
('1536668498', '1536650574', '1536238582', '2018-09-11 12:21:38', '2018-09-11 12:21:38'),
('1537694308', '1537694308', '1536238582', '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694309', '1537694308', '1536238635', '2018-09-23 09:18:28', '2018-09-23 09:18:28'),
('1537694490', '1537694489', '1536238582', '2018-09-23 09:21:30', '2018-09-23 09:21:30'),
('1537694491', '1537694489', '1536238635', '2018-09-23 09:21:30', '2018-09-23 09:21:30'),
('1537694550', '1537694550', '1536286076', '2018-09-23 09:22:30', '2018-09-23 09:22:30'),
('1537694589', '1537694589', '1536286076', '2018-09-23 09:23:09', '2018-09-23 09:23:09'),
('1537694620', '1537694620', '1536286076', '2018-09-23 09:23:40', '2018-09-23 09:23:40'),
('1537695329', '1537694681', '0826eaf8086b01749bf7ff65742a200c', '2018-09-23 09:35:29', '2018-09-23 09:35:29'),
('1537695396', '1537695396', '0826eaf8086b01749bf7ff65742a200c', '2018-09-23 09:36:36', '2018-09-23 09:36:36'),
('1537695526', '1537695526', '0826eaf8086b01749bf7ff65742a200c', '2018-09-23 09:38:46', '2018-09-23 09:38:46'),
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
('1537697651', '1536737853', '1536653712', '2018-09-23 10:14:10', '2018-09-23 10:14:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `cl_id` varchar(80) NOT NULL,
  `cl_name` varchar(45) DEFAULT NULL,
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

INSERT INTO `class` (`cl_id`, `cl_name`, `cl_active`, `u_manager_id`, `sy_id`, `m_id`, `created_at`, `updated_at`) VALUES
('1536577630', 'Quản trị mạng doanh nghiệp Khóa 1', 1, '1536661007', '1536250498', '1536301180', '2018-09-10 11:07:10', '2018-10-19 09:34:16'),
('1536577640', 'Quản trị mạng doanh nghiệp Khóa 2', 1, '3412341241', '1536250498', '1536300555', '2018-09-10 11:07:20', '2018-09-10 06:49:08'),
('1536577672', 'Lập trình viên Quốc tế Khóa 1', 1, '1536661007', '1536250498', '1536300555', '2018-09-10 11:07:52', '2018-10-19 09:33:47'),
('1536578544', 'Cao đẳng Thiết kế đồ họa Khóa', 1, '1536661034', '1536250498', '1536300555', '2018-09-10 11:22:24', '2018-09-12 10:25:20');

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
('1539015390', '1536418838', '1536305998', '2018-10-08 16:16:30', '2018-10-08 16:16:30');

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
  `ec_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `entity_cycle`
--

INSERT INTO `entity_cycle` (`ec_id`, `cs_id`, `cy_id`, `ec_name`, `ec_begin`, `ec_end`, `ec_active`, `created_at`, `updated_at`) VALUES
('1536418838', '1536330242', '1536305998', 'Học kỳ 1 Khóa 1', '2018-09-07', '2018-12-06', 1, '2018-09-08 15:00:38', '2018-10-10 08:51:45'),
('1536559025', '1536330342', '1536305998', 'Học kỳ 1 Khóa 2', '2018-09-05', '2018-09-07', 1, '2018-09-10 05:57:05', '2018-09-09 22:57:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `majors`
--

CREATE TABLE `majors` (
  `m_id` varchar(80) NOT NULL,
  `m_name` text NOT NULL,
  `m_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `majors`
--

INSERT INTO `majors` (`m_id`, `m_name`, `m_active`, `created_at`, `updated_at`) VALUES
('1536300555', 'Lập trình viên Quốc tế', 1, '2018-09-07 06:09:15', '2018-09-06 23:30:31'),
('1536301079', 'Mỹ thuật đa phương tiện', 1, '2018-09-07 06:17:59', '2018-11-04 06:34:48'),
('1536301128', 'An toàn an ninh thông tin', 1, '2018-09-07 06:18:48', '2018-09-06 23:32:08'),
('1536301140', 'Phát triển ứng dụng Android', 1, '2018-09-07 06:19:00', '2018-09-06 23:29:56'),
('1536301151', 'Cao đẳng Thiết kế đồ họa', 1, '2018-09-07 06:19:11', '2018-09-07 06:19:11'),
('1536301160', 'Bằng CNTT Anh Quốc', 1, '2018-09-07 06:19:20', '2018-09-07 06:19:20'),
('1536301180', 'Quản trị mạng doanh nghiệp', 1, '2018-09-07 06:19:40', '2018-09-07 06:19:40');

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
('1541262578', '', 'majors', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-03 16:38:33', '2018-11-04 13:37:32'),
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
('1541336686', '114234', 'api/route/{id}', '08cd66cb6b012217ed32cb8662a2a1d9', '2018-11-04 13:04:36', '2018-11-04 13:04:36');

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
('1536660994', 'ádfasdfas', '2018-09-07', 'An Thoi - Binh Thuy', 1, '2018-09-11 10:16:34', '2018-09-11 10:16:34'),
('1536661007', 'Lý Quốc Bảo', '1990-09-07', 'An Thoi - Binh Thuy', 1, '2018-09-11 10:16:48', '2018-09-11 05:46:44'),
('1536661034', 'Cao Trùng Quang', '1980-09-07', '30/04 Ninh Kiều, Cần Thơ', 1, '2018-09-11 10:17:14', '2018-09-11 05:47:32'),
('1536661134', 'Lý Tuấn Tử', '1985-09-07', '370A - Trần Hưng Đạo - Ninh Kiều - Cần Thơ', 1, '2018-09-11 10:18:54', '2018-09-11 05:48:51'),
('1536661250', 'Chân Tử Đan', '1960-09-07', 'Hưng Lợi, Ninh Kiều, Cần Thơ', 1, '2018-09-11 10:20:50', '2018-09-11 05:49:59'),
('1536661366', 'ádfasdfas', '2018-09-07', 'An Thoi - Binh Thuy', 1, '2018-09-11 10:22:46', '2018-09-11 10:22:46'),
('1536673073', 'Cao Tùng Anh', '1997-01-01', 'An Thoi - Binh Thuy', 1, '2018-09-11 13:37:53', '2018-09-11 06:38:30'),
('1536797549', 'Lê Triều Vĩ', '1998-01-01', 'Cần Thơ', 1, '2018-09-13 00:12:29', '2018-09-13 00:12:29'),
('1536905877', 'Lê Minh Luân', '1996-01-16', 'Cần Thơ', 1, '2018-09-14 06:17:57', '2018-09-14 06:17:57'),
('1539102530', 'Tèo 1', '1996-01-01', 'Cần Thơ', 1, '2018-10-09 16:28:50', '2018-10-09 16:28:50'),
('1539102531', 'Tèo 2', '1996-01-02', 'Cần Thơ', 0, '2018-10-09 16:28:50', '2018-10-09 16:28:50'),
('1539102532', 'Tèo 3', '1996-01-03', 'Cần Thơ', 1, '2018-10-09 16:28:50', '2018-10-09 16:28:50'),
('1539102534', 'Tèo 4', '1996-01-04', 'Cần Thơ', 0, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102535', 'Tèo 5', '1996-01-05', 'Cần Thơ', 0, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102536', 'Tèo 6', '1996-01-06', 'Cần Thơ', 1, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102537', 'Tèo 7', '1996-01-07', 'Cần Thơ', 0, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102538', 'Tèo 8', '1996-01-08', 'Cần Thơ', 1, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102539', 'Tèo 9', '1996-01-09', 'Cần Thơ', 0, '2018-10-09 16:28:52', '2018-10-09 16:28:52'),
('1539102541', 'Tèo 10', '1996-01-10', 'Cần Thơ', 1, '2018-10-09 16:28:52', '2018-10-09 16:28:52'),
('1539103125', 'Tèo 1', '1996-01-01', 'Cần Thơ', 1, '2018-10-09 16:38:45', '2018-10-09 16:38:45'),
('1539103126', 'Tèo 2', '1996-01-02', 'Cần Thơ', 0, '2018-10-09 16:38:45', '2018-10-09 16:38:45'),
('1539103127', 'Tèo 3', '1996-01-03', 'Cần Thơ', 1, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103129', 'Tèo 4', '1996-01-04', 'Cần Thơ', 0, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103130', 'Tèo 5', '1996-01-05', 'Cần Thơ', 0, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103131', 'Tèo 6', '1996-01-06', 'Cần Thơ', 1, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103132', 'Tèo 7', '1996-01-07', 'Cần Thơ', 0, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103133', 'Tèo 8', '1996-01-08', 'Cần Thơ', 1, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103134', 'Tèo 9', '1996-01-09', 'Cần Thơ', 0, '2018-10-09 16:38:47', '2018-10-09 16:38:47'),
('1539103136', 'Tèo 10', '1996-01-10', 'Cần Thơ', 1, '2018-10-09 16:38:47', '2018-10-09 16:38:47'),
('1539968515', 'Tiểu Bảo Bảo', '2020-02-03', 'An Thoi - Binh Thuy', 1, '2018-10-19 17:01:55', '2018-10-19 17:01:55'),
('1540145713', '13', '2018-10-12', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:15:14', '2018-10-21 18:15:14'),
('1540146298', 'rqwerw', '2018-10-17', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:24:58', '2018-10-21 18:24:58'),
('1540146312', 'rqwerw', '2018-10-17', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:25:12', '2018-10-21 18:25:12'),
('1540146435', 'Tiểu Bảo Bảo', '2018-10-11', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:27:15', '2018-10-21 18:27:15'),
('1540146475', '4123412341234123', '2018-10-31', 'An Thoi - Binh Thuy', 1, '2018-10-21 18:27:55', '2018-10-21 18:27:55'),
('1540222271', 'rqwerqwerqwerqwe', '2018-10-18', 'An Thoi - Binh Thuy', 1, '2018-10-22 15:31:11', '2018-10-22 15:31:11'),
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
('1541625813', '1536673073', '1536626095', '1537694550', 1, '2018-11-07 16:55:32', '2018-11-07 16:55:32'),
('1541642408', '1536673073', '1536650607', '1536650574', 1, '2018-11-07 16:55:32', '2018-11-07 16:55:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result_history`
--

CREATE TABLE `result_history` (
  `rh_id` varchar(80) NOT NULL,
  `rl_scores` int(11) NOT NULL,
  `rp_id` varchar(80) NOT NULL,
  `rl_note` text NOT NULL,
  `u_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `u_make` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result_log`
--

CREATE TABLE `result_log` (
  `rl_id` varchar(80) NOT NULL,
  `rl_scores` int(11) DEFAULT NULL,
  `rl_note` text,
  `u_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `result_log`
--

INSERT INTO `result_log` (`rl_id`, `rl_scores`, `rl_note`, `u_id`, `cc_id`, `ec_id`, `created_at`, `updated_at`) VALUES
('1539015390', 1, 'Không', '1536673073', '1536650574', '1536559025', '2018-10-08 16:16:30', '2018-10-08 16:46:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result_point`
--

CREATE TABLE `result_point` (
  `rp_id` varchar(80) NOT NULL,
  `rp_scores` int(11) DEFAULT NULL,
  `rp_note` text,
  `u_id` varchar(80) NOT NULL,
  `cc_id` varchar(80) NOT NULL,
  `ec_id` varchar(80) NOT NULL,
  `rp_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `result_point`
--

INSERT INTO `result_point` (`rp_id`, `rp_scores`, `rp_note`, `u_id`, `cc_id`, `ec_id`, `rp_active`, `created_at`, `updated_at`) VALUES
('1539800397', 1, '1', '1536673073', '1537694489', '1536418838', 1, '2018-10-17 18:19:57', '2018-10-17 18:19:57'),
('1539800413', 1, '1', '1536673073', '1537694489', '1536418838', 1, '2018-10-17 18:20:13', '2018-10-17 18:20:13');

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
('114234', '12345e', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456002', 'admin@gmail.com', 1, 0, NULL, NULL, 'yNjc0xNXhU8supeKjYjoHEwBdYl6PcSeCHdObeyyIHZOVDPGVgPmUTdbWTFc', '2018-08-24 04:59:01', '2018-11-04 03:14:28'),
('12345', '12345', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456001', 'luanle@gmail.com', 1, 0, NULL, NULL, 'L3RpC3ZkS41hmjP9GrkAVM9grx4xs5PMjNKkScB76CULo6cEokxz8DKWohim', '2018-08-23 01:37:35', '2018-08-29 02:37:43'),
('1536660927', 'àds', '$2y$10$ko/LQThz/fp33YzzXJT2fOEyWRQEGoU/lge6CjN7e7fgQZOLn6tDW', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:15:27', '2018-09-11 10:15:27'),
('1536660957', 'àds', '$2y$10$px07IC7Q/JFgIkOVuqLhne3P5Vnjh.mg0TKRUYHLmT8wZe.0RoK8e', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:15:57', '2018-09-11 10:15:57'),
('1536660994', 'àds', '$2y$10$BJCmc9T1zsSD4dyw9Pz6ROZ2GQ.K4nMAkiixagEiduVlaxTNKM0Pq', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:16:34', '2018-09-11 10:16:34'),
('1536661007', '000002', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456002', 'lqbao@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:16:48', '2018-10-16 14:54:00'),
('1536661034', '000003', '$2y$10$MENj1p1XPL.oSHKv3Z/H7uVucuU50H6CyPKZTBXCLPblqZTV0.73G', '0123456003', 'ctquang@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:17:14', '2018-09-11 05:47:42'),
('1536661134', '000004', '$2y$10$h2ItjadtdJFLZ4mrw5kjeew96hFiNKrTcSDlbB5KZLyqsuLVjcs92', '0123456004', 'lttu@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:18:54', '2018-09-11 05:48:50'),
('1536661250', '000005', '$2y$10$zoiBKgoZG5dBIE2AjlEQcuZbTSVDWMsWWaZxSoe3uEHaR19t./dLe', '0123456006', 'ctdan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:20:50', '2018-09-11 05:49:59'),
('1536661366', 'àds', '$2y$10$EjzFEJjTQixfq7SDzo5ZrON2N5RqwjaqriMuPrE2i5xtpcMIvoVR.', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-09-11 10:22:46', '2018-09-11 13:04:34'),
('1536673073', 'SV_0001', '$2y$10$plzfXpJY2mgCLxrIxE25dOf1RhR/UpyFo8K2eb5y4AFsoQu/ghMRK', '0123456777', 'ctanh@gmail.com', 1, 1, NULL, NULL, NULL, '2018-09-11 13:37:53', '2018-10-23 09:28:02'),
('1536797549', 'SV_0002', '$2y$10$4vX.oyKDY2Y0ekYCVB/v4eKXctplGrBJVXxLVtX6BoI9hEnduTg8.', '0123456001', 'ltvi@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-13 00:12:29', '2018-10-15 11:07:30'),
('1536905877', 'SV_0003', '$2y$10$i9Xhi2RSs5SsCMeqi5yLHuAKphoUdecHMsgP31kT4AvQEyMGcpeIK', '0964054244', 'lmluan@gmail.com', 1, 0, NULL, NULL, NULL, '2018-09-14 06:17:57', '2018-09-13 23:18:12'),
('1539102530', '11111', '$2y$10$VHNsaRm5c.bAO/MHYVa2KeecCv6UR5YztqDwDCJ49Drdk0j/LRWWi', '1234561', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:50', '2018-10-09 16:28:50'),
('1539102531', '11112', '$2y$10$Rij0UlRNN96UpX8AdSNoaOl6htxktAGkuUHCVJsNIcLMq9/DPUY.S', '1234562', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:50', '2018-10-09 16:28:50'),
('1539102532', '11113', '$2y$10$zL6zkGK6S6pXcmUUQ9zWgO.f.qJnEK4aemMHYZvSy.eB.D91idDh.', '1234563', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:50', '2018-10-09 16:28:50'),
('1539102534', '11114', '$2y$10$eevgPUdu.r0FXOOB0jwjR.Mz0uxnIFhZrFV3fJtyBoELNaPMcVwju', '1234564', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102535', '11115', '$2y$10$G7.gkWY2zzMQ/uL41rsx4enlmj..88nfEfq5Tfxw1d6LsoJ7bKC8S', '1234565', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102536', '11116', '$2y$10$ij9oUZcJ3O6QX5wr5OXRO.b.O2hoIbomywhdE4I40goIFh1uX7QR6', '1234566', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102537', '11117', '$2y$10$jdFNNXjgv/UCnKFK88CeEeMeC9G98ymtm2pklRcH3iFJg9enDel/O', '1234567', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102538', '11118', '$2y$10$R192/KvXy/kwz6kH6rrgvuoxRh9Gj8diPEeoRiERnVh/pNmfRwGsm', '1234568', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102539', '11119', '$2y$10$JjvIJCwazoipvuBA6p.u4O25Wgz9RFsZry2KffsEToqXe/5ETFUcq', '1234569', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:51', '2018-10-09 16:28:51'),
('1539102541', '11120', '$2y$10$FuFWPZytJa4P/89gTV2RYOxQoxLGvnmmtq1tFpXJsLopO2UqTarR6', '1234570', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:28:52', '2018-10-09 16:28:52'),
('1539103125', '11111', '$2y$10$hlH623NCu8nxepCxNcfZhOazKa0ZguaHasMTxbxx/R1Jp5.bcttBW', '1234561', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:45', '2018-10-09 16:38:45'),
('1539103126', '11112', '$2y$10$bHYDyDP468a.PTY.vOz7Guu9jGUrF6eOUEP29kUEV/q13luK7XhfO', '1234562', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:45', '2018-10-09 16:38:45'),
('1539103127', '11113', '$2y$10$CeTpCF.HG/nYCdXI76C0GeDNuGTskddF7PkxA90HPa0UQRD9MPc/m', '1234563', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103129', '11114', '$2y$10$Tsj8Z0MkPUB.611LisQWd.Ftcc/Zh/89kP2QUjWej3NX0QVhaqgPu', '1234564', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103130', '11115', '$2y$10$zdKYA9csFVD8eGuBlVi.J.1vkFB8nkW7cJBXyrGmDMaGJP/3M/Wo2', '1234565', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103131', '11116', '$2y$10$wIICbmOZSxe547olIJ3myeBfyrWszysPtQtO/o7P6ggriv3KUE5Fi', '1234566', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103132', '11117', '$2y$10$o4NgMvjF1e8.06edfGpzqeSAJ81IVpCEgpPEMDYk0j8JaA1xKGtpa', '1234567', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103133', '11118', '$2y$10$7MNcEHN/tl2NeZ3qT80IVekJqaERKyBn.1zikKsxrVS3El5iMqkj.', '1234568', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:46', '2018-10-09 16:38:46'),
('1539103134', '11119', '$2y$10$5hlKBrfNnF/Bd/dEo2j5ZO/sKDKHTEf4fDTUkpzpjXuCzWjIpX3D2', '1234569', 'email1@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:47', '2018-10-09 16:38:47'),
('1539103136', '11120', '$2y$10$0aQjIOZudbGnlTP3faUo3umZYR8swiOV0W0XSKSnbn0iTye1JlB6u', '1234570', 'email2@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-09 16:38:47', '2018-10-09 16:38:47'),
('1539968515', 'B1400678', '$2y$10$9vEOm5cBhWuyaTY99tuGo.L9/e59BBYkv6wukCAgBUm0p0IY3RA6C', '0987654002', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-19 17:01:55', '2018-10-19 17:01:55'),
('1540024466', '341234sdfsdf', '$2y$10$.syTQA4vojsL.HF8hV6sG.Q4xwxipPO8mYfz3a09SyC4mfWjZtHtW', '1234123', 'eqrwe@gmail.com', 1, 0, NULL, NULL, NULL, '2018-10-20 08:34:26', '2018-10-20 08:34:26'),
('1540024519', 'đấ', '$2y$10$MHnqoZdM6WzpFEPkQYB.ouTHR3.hjmEXnIzC9NUs5VIfAgn3HHW1i', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-20 08:35:19', '2018-10-20 08:35:19'),
('1540145713', '13', '$2y$10$tVMUta03Jeh6eNYyDDDCteVj0QqVVeofLAoWZ38qWK7FMpWGEGQhC', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:15:14', '2018-10-21 18:15:14'),
('1540146298', 'ẻqwerw', '$2y$10$NIwXyWLva3uGXdF0JniJEOF74AZlfLLpKx/9hJWWTQvERDLMbvMny', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:24:58', '2018-10-21 18:24:58'),
('1540146312', 'ẻqwerw', '$2y$10$vm.AV4eJoBnzSfPL7pBWDe2WYaXYissrBnl9j5UymcT/W/UB.P3eO', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:25:12', '2018-10-21 18:25:12'),
('1540146435', 'B1400678', '$2y$10$G9VzS5FVGgykgJ3BFjqymeppH5xs73OLjmgIpTO.SHIPVR10kihiW', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:27:15', '2018-10-21 18:27:15'),
('1540146475', '4143123423', '$2y$10$C6lYazRadh5F5xFY.Bht1emmAbvnmM62SfTsUBDzzNb6AsxKAqAiK', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-21 18:27:55', '2018-10-21 18:27:55'),
('1540222271', 'eawrqwerqwerqewrqwer', '$2y$10$6die1ffsetvPtv1U0mxhIOnpUCSOsy.T96EPhYnvXD2llYUx2.Q8K', '0987654001', 'hoangkhangctu@gamil.com', 1, 0, NULL, NULL, NULL, '2018-10-22 15:31:11', '2018-10-22 15:31:11'),
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
('1537807558', '1536905877', '1536768267', '2018-09-24 16:45:57', '2018-09-24 16:45:57'),
('1537807962', '1536673073', '1536768275', '2018-09-24 16:52:42', '2018-09-24 16:52:42'),
('1537884828', '1536673073', '1536768286', '2018-09-25 14:13:48', '2018-09-25 14:13:48'),
('1537886328', '1536905877', '1536768275', '2018-09-25 14:38:48', '2018-09-25 14:38:48'),
('1537895039', '1536673073', '1536768294', '2018-09-25 17:03:59', '2018-09-25 17:03:59'),
('1538844107', '1536673073', '1536768267', '2018-10-06 16:41:47', '2018-10-06 16:41:47'),
('1539187123', '1536673073', '1539187076', '2018-10-10 15:58:43', '2018-10-10 15:58:43'),
('1539187124', '1536797549', '1539187076', '2018-10-10 15:58:43', '2018-10-10 15:58:43'),
('1539187125', '1536905877', '1539187076', '2018-10-10 15:58:43', '2018-10-10 15:58:43'),
('1539624294', '1536797549', '1536768275', '2018-10-15 17:24:54', '2018-10-15 17:24:54'),
('fasdfasdfasdfasdf', '1536797549', '1536768267', '2018-09-13 04:42:19', '2018-09-13 04:42:19');

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
('1536921055', '1536673073', '1536577630', '2018-09-14 10:30:55', '2018-09-14 10:30:55'),
('1536921056', '1536797549', '1536577630', '2018-09-14 10:30:55', '2018-09-14 10:30:55'),
('1536921057', '1536905877', '1536577630', '2018-09-14 10:30:55', '2018-09-14 10:30:55'),
('1536927510', '1536673073', '1536577640', '2018-09-14 12:18:30', '2018-09-14 12:18:30'),
('1536927511', '1536797549', '1536577640', '2018-09-14 12:18:30', '2018-09-14 12:18:30'),
('1536927512', '1536905877', '1536577640', '2018-09-14 12:18:30', '2018-09-14 12:18:30');

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
('1536673073', '1536673073', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-09-11 13:37:53', '2018-10-11 09:31:31'),
('1536797549', '1536797549', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-09-13 00:12:29', '2018-09-13 00:12:29'),
('1536905877', '1536905877', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-09-14 06:17:57', '2018-09-13 23:18:12'),
('1539968515', '1539968515', '1b83df7a91f51b3d32cf6bda5b0fd23f', '2018-10-19 17:01:55', '2018-10-19 17:01:55'),
('1540146435', '1540146435', '0826eaf8086b01749bf7ff65742a200c', '2018-10-21 18:27:15', '2018-10-21 18:27:15'),
('1540146475', '1540146475', '0826eaf8086b01749bf7ff65742a200c', '2018-10-21 18:27:55', '2018-10-21 18:27:55'),
('1540222271', '1540222271', '0826eaf8086b01749bf7ff65742a200c', '2018-10-22 15:31:11', '2018-10-22 15:31:11');

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
