SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- Database: `unitycar_airsbfrj`
--
CREATE DATABASE IF NOT EXISTS `unitycar_airsbfrj` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `unitycar_airsbfrj`;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `store_id`, `user`, `qty`, `price`, `created_at`, `updated_at`, `cart_id`) VALUES
(1, 3, 11, '9142943077190', 1, 5000.00, '2021-12-11 23:16:15', '2021-12-11 23:16:15', 'oAWSKdETbjXUmr60Q2NBYwuezJZCPv'),
(2, 3, 11, '9185070624228', 1, 5000.00, '2021-12-11 23:39:48', '2021-12-11 23:39:48', 'eAiExQ9m3VL6qpGUvIZBhFg8tu04Tc'),
(3, 3, 11, '3672540845111', 1, 5000.00, '2021-12-11 23:40:32', '2021-12-11 23:40:32', 'QirnpGxUCh1gDT2tFqfb3oWzYXmyu6'),
(4, 3, 11, '1461896605282', 1, 5000.00, '2021-12-11 23:40:49', '2021-12-11 23:40:49', 'PEMq0cxZKzyBNTfeklsWhQnIdSXobm'),
(5, 3, 11, '7556914465994', 1, 5000.00, '2021-12-11 23:42:25', '2021-12-11 23:42:25', 'qg2naRZrY4m9jfCTMbSuEytcX0IHP1'),
(6, 3, 11, '2759516477992', 1, 5000.00, '2021-12-11 23:42:32', '2021-12-11 23:42:32', '78yKsM20D65qxPIhzeNcXgUZnLtmlW'),
(7, 3, 11, '3927225933167', 1, 5000.00, '2021-12-11 23:42:46', '2021-12-11 23:42:46', 'zQhZW8fmx3se704iqyKdBawU21blGR'),
(8, 3, 11, '509215812863', 1, 5000.00, '2021-12-11 23:43:35', '2021-12-11 23:43:35', 'gtRid8JjfbQoV09ABGc54UHTyP6YxW'),
(12, 3, 11, '703551394073', 2, 10000.00, '2021-12-12 00:40:57', '2021-12-13 07:03:22', 'fnpl75NaZtRHG9Y8TImBwu3zqDEvgx'),
(17, 11, 25, '98299449792', 1, 35000.00, '2021-12-17 00:59:41', '2021-12-17 00:59:41', 'pK0g6aLJ2nTER5zUVNPlFemsSjbHxo'),
(24, 5, 20, '9250681486853', 1, 7000.00, '2021-12-20 18:59:26', '2021-12-20 18:59:26', '85xaMy4J1RVoklXjsdHCLNhQU2p97W'),
(25, 6, 20, '9250681486853', 1, 15000.00, '2021-12-20 18:59:29', '2021-12-20 18:59:29', 'sjd2JPawyzvc7FtS5UXDRqk3mhW9r0'),
(26, 7, 20, '9250681486853', 1, 20000.00, '2021-12-20 18:59:32', '2021-12-20 18:59:32', 'BXyVQr8zsH9TpLdI7JRaum2h3Ccb6g'),
(27, 5, 20, '9552892598014', 1, 7000.00, '2021-12-22 21:51:57', '2021-12-22 21:51:57', '3nrRWj2d6vGJF4x09eqsTbMYzwX5HN'),
(28, 6, 20, '9552892598014', 1, 15000.00, '2021-12-22 21:52:02', '2021-12-22 21:52:02', 'deTMImqQcFD7VCisJHxfWNEvtGjyan'),
(33, 19, 40, '1655399753589', 1, 3.00, '2022-06-21 21:53:43', '2022-06-21 21:53:43', 'mzd8btFDPYk4lKio3EfpqcyNVgAWjG'),
(34, 13, 26, '2913669790939', 1, -12.00, '2022-06-22 13:09:27', '2022-06-22 13:09:27', 'vGP37j061gBKHiuWrSVNcFYnAb4QoL');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mails`
--

INSERT INTO `mails` (`id`, `sender`, `to`, `mail_id`, `created_at`, `updated_at`, `subject`) VALUES
(3, 'admin@airshop247.com', 'horphy1@gmail.com', 't52iBw7pTa', '2022-02-11 19:30:28', '2022-02-11 19:30:28', 'Hello world'),
(4, 'admin@airshop247.com', 'horphy1@gmail.com', 'a4yKHmpUGS', '2022-02-16 21:40:21', '2022-02-16 21:40:21', 'Hello'),
(5, 'admin@airshop247.com', 'horphy11@gmail.com', 'XauzQBS3IA', '2022-02-16 21:40:22', '2022-02-16 21:40:22', 'Hello'),
(6, 'admin@airshop247.com', 'horphy1@gmail.com', 'dZ3hIGxRD2', '2022-02-16 21:40:23', '2022-02-16 21:40:23', 'Hello'),
(7, 'admin@airshop247.com', 'horphy11@gmail.com', 'jX4wMRtybu', '2022-02-16 21:40:24', '2022-02-16 21:40:24', 'Hey, I noticed you created a contact form with WPForms - that’s awesome! Could you please do me a BIG favor and give it a 5-star rating ');

-- --------------------------------------------------------

--
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `Shop_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneExt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FacebookName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacebookLink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WhatsappNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WhatsppNoExt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WhatsappLink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InstagramLink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InstagramName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `markets`
--

INSERT INTO `markets` (`id`, `user_id`, `Shop_id`, `Name`, `Description`, `Phone`, `PhoneExt`, `FacebookName`, `FacebookLink`, `WhatsappNo`, `WhatsppNoExt`, `WhatsappLink`, `InstagramLink`, `InstagramName`, `Banner`, `Logo`, `Address`, `Slug`, `created_at`, `updated_at`, `country`, `currency`, `type`) VALUES
(12, 2, 'xTqHNDprFI4tuC9AUaoJ', 'Links Edu', 'Hello', '8154520217', '996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/IyVudqQCQUaxD87IHGj0jN9rSkzVEJKtikGJOPts.png', 'logos/ZNWfkFGDRIRoRWuC9BcexjkK8Z3DF56rQqqLpU9O.jpg', NULL, 'links-edu', '2021-11-30 03:47:59', '2021-11-30 03:50:59', '', '', ''),
(13, 3, 'Q9RxYfkjy4tT3g2N7lMu', 'Babs Store', 'Footwear\'s, Gadgets', '08062945226', '234', 'Classyfooty', 'https://facebook.com/classyfooty', '08058675123', '234', NULL, 'https://Instagram.com/classyfooty', 'Classyfooty', 'banners/9RZUmYjO8t3DYJtSpZrzlyhGbBoauAQ3sKJIFIdg.jpg', 'logos/IXXnZvvGUbRUIuwm06rpFhcY0Ka3Ak6QunF9hDCU.jpg', 'Ibadan', 'babs-store', '2021-11-30 18:55:04', '2022-06-22 15:39:01', '', '', 'Full Store'),
(14, 4, 'mgax6SFXs9H0qIEMDnub', 'Temiyemex Concept', 'Get all shade of gadget', '7066002190', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'logos/Mm2yJICiOD1qz4SlRPAkHNW5BFgCiVKt1zCRUotV.png', NULL, 'temiyemex-concept', '2021-11-30 19:24:41', '2021-11-30 19:26:57', '', '', ''),
(19, 1, 'iAp4d3h16kTN20axeCVu', 'Demo Shop 200', 'final shop', '8183747', '234', 'Hello World', 'https://facebook.com/helloworld', '8373367', '234', NULL, 'https://facebook.com/helloworld', 'Helloworld', 'banners/fdsCxv6F7FXvc1yGucq87pSXxCdGSMERtsfoxPq7.png', 'logos/WyruJ2yntX9v77jKgPq48qeXENIaoh4ikzGylvjC.jpg', 'Hello wolrd, lagos', 'demo-shop-200', '2021-12-09 00:36:23', '2022-04-27 20:30:25', '', '', 'Full Store'),
(20, 7, 'vSQ0FbK8o29eI4VJNwtg', 'Sneakers Store', 'Sales of classic footwears', '08012345678', '234', 'sneakers store', 'https://facebook.com/sneakers-store', '08062945226', '234', NULL, 'https://instagram.com/sneakers-store', 'sneakers store', 'banners/G1SgR4xcYvXvhH9gHJS0lPbr1KeWPxxgO4P68B1a.jpg', 'logos/dU2ke38hV3rK1sOT9v5avhdDmenURSCVX0OLCw3Q.jpg', 'demo str. ibadan', 'sneakers-store', '2021-12-10 20:13:39', '2021-12-20 18:49:36', '', '', ''),
(21, 9, 'RPzJkshoXeIpUyTqxd5H', 'test', 'testing', '6779900000', '1264', 'test', 'https://facebook.com/test', '56789999', '994', NULL, 'https://facebook.com/test', 'test', 'banners/Clm2c7Oy6tDU70GjuYkOs5w20cq4KHEtSPzFmDam.jpg', 'logos/77sSShlLOI8ow6OtLZq2hSovQn6I22aSQZUGgIOx.jpg', 'test', 'test', '2021-12-13 22:40:30', '2021-12-13 22:42:48', '', '', ''),
(22, 12, 'Cc1vINWRMsA479p0iByQ', 'Ridex Wears', 'dealers in all kinds of wears', '08038464454', '234', 'Ridex', 'https://facebook.com/ridex', '08038463454', '234', NULL, 'https://instagram.con/ridex', 'Ridex', 'banners/LgZxWZ8lU7nG4aZM0SybgkMoNqLJVx7l6BG1L8wj.jpg', 'logos/KRIUJI6cbkcRycTfOcv0OgYMZCzE8G0ZKBXT7GYA.png', '6 shoveral av, ibadan', 'ridex-wears', '2021-12-13 22:58:22', '2021-12-13 23:01:29', '', '', ''),
(23, 13, 'ShXPtg5sYk9vmJEfeqcK', 'M$M Laundry and dry cleaning  service', 'No 147 Baale Animashaun Rd.Dalemo Alakuko Lagos', '08138398557', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/oWmylX8KXTUdJ5bG17oHeWMmbxkRwZQHZ2VPech8.jpg', 'logos/Z9K3jqx0Xc4sjKWEwDZ03zmHJZlw32cgBBaTZcIL.jpg', NULL, 'mm-laundry-and-dry-cleaning-service', '2021-12-15 15:55:20', '2022-01-05 19:12:39', '', '', ''),
(24, 14, 'M1cx0NeU8sbyR2K7EkTV', 'My Store Name', 'My store', '8474636', '234', 'https:facebook.com', 'https://facebook.com', '8154520217', '234', NULL, 'https://facebook.com', 'NGMarketer', 'banners/N7j4yH0vJGzvHvpTbTtqjFhzsPrccDw6erPPHfXk.jpg', 'logos/mz5jkpBWBvCqeK6qcN2oH0obsgOPwZtcJjdW4pzI.png', 'Address one and address two', 'my-store-name', '2021-12-15 16:36:07', '2021-12-15 16:45:29', '', '', ''),
(25, 19, 'Tu12hxrBb7SglmVHLAo4', 'Bella_Signatory', 'Once you get to mushin bus stop just take a bike to Akodu no 17', '09048438652', '234', 'Isabella Enyili', 'https://www.instagram.com/p/CWTLDXwMq8N/?utm_medium=copy_link', '08123636146', '234', NULL, 'https://www.instagram.com/p/CWTLDXwMq8N/?utm_medium=copy_link', 'Bella_signatory', 'banners/1D2y6WeOv8PpyDiOBXYhqFkML828ymmcQgsq4taZ.png', 'logos/QAqKZPB1uk3dL2k8pJXBd0EYcPBS5RY5N23R0ZTo.jpg', 'Akodu off Luth road', 'bella-signatory', '2021-12-16 21:40:43', '2021-12-16 23:29:01', '', '', ''),
(26, 21, 'STAlb4j1pzdycqZLN6B0', 'MIMI men\'0\'clock Fashion Hub', 'MIMI men\'0\'clock Fashion Hub is a home for fashion,we cut and sew to fit...we specialized in styling Men..oh yes as the brand name implies..We deliver STYLE, LUXURY AND CLASS..Do well to patronize and enjoy our services at MIMI men\'0\'clock Fashion Hub..The services we render are as follow:Bespoke Tailoring,Native Attires,Suits,Pants and every other men accessories...We look forward to your patronage,thank you and God bless you all....', '07045694747', '234', 'Mimi Morenikeji', 'https://www.facebook.com/arewa.morenikeji.3', '7045694747', '234', NULL, 'https://instagram.com/mimimenoclockfashion?igshid=YmMyMTA2M2Y=', 'Mimi Morenikeji', 'banners/cXowQnbUbBeBriKsWj2DQu5Xo7IMuqy2FMSrrgBw.jpg', 'logos/2mQwHNj55GlO7PP0MfkZhMpEBk86kxRfg97Doza8.jpg', 'Ire akari estate,oluyole Ibadan,Oyo state.', 'mimi-men0clock-fashion-hub', '2022-01-10 21:14:28', '2022-06-22 18:50:51', '', '', 'Showroom'),
(27, 27, 'Q6cUlXfWtA0zqIi19xTg', 'My Shop', 'hello', '8154520217', '234', 'camdp', 'https://airshop247.com/dashboard/contact-info/Q6cUlXfWtA0zqIi19xTg', '81545250217', '234', NULL, 'https://airshop247.com/dashboard/contact-info/Q6cUlXfWtA0zqIi19xTg', 'Instagram', 'banners/AG5K1eD5Q8bs779cibxisbPqVo1NGlsKBtEqWf34.png', 'logos/H79nCOEMOGrKO6qg1gGFlysyTvuAqNA20VqF0uaZ.png', 'klashdfkl', 'my-shop', '2022-01-28 20:12:27', '2022-01-28 20:59:03', 'NG', 'USD', 'Full Store'),
(28, 25, '1zaTfpvE9J3jQcCtrBmD', 'Cam Gadgets', 'Sales of Security Gadgets and Surveillance Systems.', '8062945226', '234', 'Cam gadgets', 'https://facebook.com/cam-gadgets', '08062945226', '234', NULL, 'https://Instagram.com/cam-gadgets', 'Cam gadgets', 'banners/uW9z2w09JT8IspkHgFM2utX46lba9qR1iS85hCYL.jpg', 'logos/qLntDTTHiI8HE4jUE85bFcHfgzGxDc688cBrSbZe.webp', 'Dugbe, Ibadan', 'cam-gadgets', '2022-01-28 20:16:19', '2022-01-28 20:58:24', 'NG', 'NGN', 'Full Store'),
(29, 26, 'UcfE7zJa9ZgQykdGBIPH', 'Gadgets on the go', 'electronic', '7462778088', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/pKcF57nqx9R3Jiuz6C73w445FEh0xqnnTYZDrIjT.jpg', 'logos/BPWzlaEoLscKE3B7dgIc1QGuXVsL0p0nf4Ao0yXt.png', NULL, 'gadgets-on-the-go', '2022-01-28 20:48:42', '2022-01-29 02:48:28', 'GB', 'GBP', 'Full Store'),
(30, 29, 'MgsWGu1cjCNy9d0LYHkh', 'Mooyie\'s general shop', 'Dealers in new and used general merchandise like TV sets, microwave oven,  fridge and freezers, electic kettles, pressing iron , clothes, bags and shoes, general bric brac.', '+447957135347', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mooyies-general-shop', '2022-03-15 22:42:30', '2022-03-15 22:42:30', 'NG', 'NGN', NULL),
(31, 30, '20wkeHUtrlqYGEhPVpi5', 'ELSIECAPTITAL', 'FINANCIAL INCLUSION SERVICES | NIN & BVN ENROLMENT | REAL ESTATE', '9123560086', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'logos/rmHXXtGIgyNqCDbXoCzBN52pLJ7Y8QIPKKCy9v5Q.jpg', NULL, 'elsiecaptital', '2022-03-16 14:02:06', '2022-03-16 19:12:21', 'NG', 'NGN', NULL),
(32, 32, 'ib5JyVnGEqPDL8Yl4u2M', 'Airsteem collections', 'Dealer of all kinds of children wears.\nQuality and affordable.\nBest price 💯', '08143125104', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/6FuPDTjaRBwqP0kk1DMkD5ZB9esUkwoMzhODgwGq.png', 'logos/ECv56lCC66BVm2XW3WR4f6vevzwmPWaBEmbb0NHq.jpg', NULL, 'airsteem-collections', '2022-04-08 16:05:06', '2022-04-08 16:25:07', 'NG', 'NGN', NULL),
(33, 33, '38il9fRwpJs74AcN0yv2', 'Homemate Furniture', 'Home of quality bespoke furniture in Abuja and environs', '08063411818', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'logos/OmK0S86ZB9EeLW5Bpx1rJPiLoXUNiNX6XxpFuheV.png', NULL, 'homemate-furniture', '2022-04-13 19:07:47', '2022-04-13 19:08:12', 'NG', 'NGN', NULL),
(34, 39, 'zpY4FjyWgMNruh7xIRcH', 'Eazi art nd print production', '* SCREEN PRINTING * AWARD PLAQUE * SOUVENIR * HEAT TRANSFER * WRISTBAND * FRAME *THROW PILLOW  * CUSTOMIZED MUG* CUSTOMIZED TOWEL* CUSTOMIZED PHONE POUCH* BRANDING OF CLOTHES & CAP*CUSTOMIZED KEYHOLDER* CUTTING SELLING OF FLOCK&FLEX* DEAL IN ALL KIND OF GIFT ITEM & PRINTING PRESS WORK...E.T.C', '08148356299', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eazi-art-nd-print-production', '2022-06-15 18:20:18', '2022-06-15 18:34:27', 'NG', 'NGN', 'Showroom'),
(35, 40, 'NqJ42HkAxX30fejgDCny', 'Zee Luxury Empire', 'Zee Luxury Empire is a fashion store that deals with all kind of high quality unisex wears, and offers a wide variety of fashionable bag & shoes, also deals with muslimah wears like Original Dubai Abaya, Original Egypt Abaya, Cairo jalamia, Emirate jalamia.', '08026214346', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/nPMnun9HJVtYqutfROuBF5WbJYJds7K5nEo98gr3.jpg', NULL, NULL, 'zee-luxury-empire', '2022-06-15 19:00:17', '2022-06-15 19:20:53', 'NG', 'NGN', 'Showroom'),
(36, 41, '0THI71uFi3J2SDqjaQUW', 'Traiz hub', 'Your one way store you can get your wrist watches, earrings, bracelets, necklace etc', '07069323058', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'logos/GlkJJQ0VKPdNiKs7z0f6NTPdvwrhYA4B2hE8bfJI.jpg', NULL, 'traiz-hub', '2022-06-15 23:52:52', '2022-06-15 23:57:46', 'NG', 'NGN', NULL),
(37, 42, 'Q1vElznV3xB4Mqe5CJAf', 'Ardern Prints', 'All forms of Printing at Ardern Printing House.\nWe focus more on cloth, cap, mug, plate Branding in Lagos, also is stickers, Banners, Roll up.\n\nAll forms of Printing of paper are also our work at Oyo State Branch', '9160778846', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'logos/fi0RYRk2yH9dvmPknO16JfvcsM7Rv5zs8RQiGOAx.jpg', NULL, 'ardern-prints', '2022-06-16 01:09:44', '2022-06-16 01:10:49', 'NG', 'NGN', NULL),
(38, 50, 'LH6w751G9hCmaFnU2QKt', 'Wiselink Gadgets', 'In Wiselink gadgets,we sell all king of gadgets,like laptops phone.', '07089034902', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wiselink-gadgets', '2022-06-21 13:45:58', '2022-06-22 14:20:18', 'NG', 'NGN', 'Full Store'),
(39, 51, 'ovgGLXZr4R3qidVp2FAD', 'Orichad tower', 'Printing of calendars, magazine ,all kind of printing work', '569751362', '971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/PFwW9WPTD6KOE0NvladVTa4PUQiHnUx9HiwoAaeu.jpg', 'logos/wrKcMc89u9YLSPux0goeMc4qZ6WQIkCGI0gAnQ0I.jpg', NULL, 'orichad-tower', '2022-06-21 13:49:38', '2022-06-21 14:01:38', 'AE', 'NGN', NULL),
(40, 49, 'IgAGulDiFbjoCs7aH2Td', 'NerNat Perfumery', 'Hi. It\'s NerNat Perfumery,we deal in good quality and affordable perfumes, undiluted perfume oil, body spray, body mist, and deodorant.we are just a call, DM or sms away.\nFor the best customer service we are No1.\nContact us https://wa.me/+2347039417862\nFacebook: NerNat perfumery\nIG @olabisi_sagacityabake', '07039417862', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'logos/P8J1H0Qi27iGNyGp3msWhlRusnHBuy3kmTMmnMrz.jpg', NULL, 'nernat-perfumery', '2022-06-21 14:58:23', '2022-06-21 16:38:39', 'NG', 'NGN', 'Full Store'),
(41, 53, '6x74SkJ5MDnyacubTe8F', 'Oladrea Exchange', 'WE BUY AND SELL ALL KIND OF \n          CRYPTO CURRENCY.\n                          BTC\n                          ETH.\n                     USDT ETC.\nBEST RATE AND FAST PAYMENT', '7039949429', '234', 'oluwadamilare Adisa', 'https://www.facebook.com/oluwadamilare.adisa.315', '7039949429', '234', NULL, 'https://www.instagram.com/invites/contact/?i=8ta7wbux0nq9&utm_content=ms710pg', 'oluwadamilare Adisa', 'banners/jvAGJju89PMrbXgNFIxZIvnLFQV0gFtWxZTEa5yB.png', 'logos/0mnnBvTeVN7RKrLJFWWPPlunEc7706LVggDCOszb.jpg', '11, Onadan Street Vespa Ojo Lagos', 'oladrea-exchange', '2022-06-21 15:59:51', '2022-06-21 16:24:54', 'NG', 'NGN', 'Showroom'),
(42, 55, 'CIuBqDfmzxl6A1gJiLtd', 'A’cubecollections', '24 Mafoluku street , Oshodi Lagos state.Nigeria', '08137645480', '234', 'A’cubecollections', 'https://www.facebook.com/acube__collection-105205551184299/', '08137645480', '234', NULL, 'https://www.instagram.com/p/Cd5H-L-jJvQ/?igshid=YmMyMTA2M2Y=', 'A’cubecollections', 'banners/w94QjZGRTgFpPZ8HMRBzgcsyjPmbLWpEoYH5Rusn.jpg', 'logos/k6ihHHA30S0WZ2Qxh4J4kCIX3N3i6pGDRuuwGNFR.jpg', '24, Mafoluku street Oshodi Lagos state , Nigeria', 'acubecollections', '2022-06-21 17:13:43', '2022-06-21 17:28:03', 'NG', 'NGN', 'Full Store'),
(43, 56, 'mK2vydhPZe3RV76X5aQM', 'Sunny Black Art And Music Gallery', 'African Art And Music', '+14694432642', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/9LA643y595LzdCfhjrVbnOOIGg93Ktu3VWgMHt5W.jpg', 'logos/X3kyP1q1xuoIgfbrqiSkOmOuQPS6EdOlZl4pt47j.jpg', NULL, 'sunny-black-art-and-music-gallery', '2022-06-21 20:52:06', '2022-06-21 20:53:43', 'US', 'USD', NULL),
(44, 61, '896XJ72MnhICw3Kzqmif', 'Foodengine int', 'We sell Food stuffs at wholesale price. For all varieties of food at affordable price', '07069656446', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/huqeGqI7SjGXhqYUok03MA0ExzjcsMfmwl41WbBw.png', 'logos/kajf0wlo0Yuo5OJKZi3VzxuxL02MA2eAaYgpdVe1.png', NULL, 'foodengine-int', '2022-06-26 23:05:27', '2022-06-26 23:13:15', 'NG', 'NGN', NULL),
(45, 63, 'uY2Wal0UMjsvtxLqKTNz', 'Awawa decor', 'Awawa Decor Behind Christ High School Akala Express New Garage Ayegun Oleyo Ibadan, Oyo State', '08138552323', '234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banners/cHxy6grvnGjibhG42s2Wtyu1YskLVTFVTVB2J4Ac.jpg', 'logos/QjwfIG4U40dMTw4sSlKy4SNnmpxauTc6DXaQZ7Qe.jpg', NULL, 'awawa-decor', '2022-06-27 00:42:42', '2022-06-27 10:53:33', 'NG', 'NGN', 'Showroom');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `mail_id`, `message_id`, `text`, `created_at`, `updated_at`, `status`, `sent_by`) VALUES
(1, 't52iBw7pTa', 'ghQjaGL7JkVvU1NcTn59', '1234567890 1234567890 12345678', '2022-02-11 19:30:29', '2022-02-11 19:30:29', 'unread', 'admin@airshop247.com'),
(2, 'a4yKHmpUGS', 'v4JxKeMs58gbynpqNzlL', '<p>This is what you came for type.</p>', '2022-02-16 21:40:21', '2022-03-20 08:08:37', 'read', 'admin@airshop247.com'),
(3, 'XauzQBS3IA', 'R7jDEdzTXhWVYnJ3CbPe', '<p>This is what you came for type.</p>', '2022-02-16 21:40:22', '2022-02-16 21:40:22', 'unread', 'admin@airshop247.com'),
(4, 'dZ3hIGxRD2', '1bHMyPK2gmBoDejdW0nA', '<p>This is what you came for type.</p>', '2022-02-16 21:40:23', '2022-03-20 08:08:58', 'read', 'admin@airshop247.com'),
(5, 'jX4wMRtybu', '2u5oUSx63bYGfJvLMDcR', '<p>This is what you came for type.</p>', '2022-02-16 21:40:24', '2022-02-16 21:40:24', 'unread', 'admin@airshop247.com'),
(6, 't52iBw7pTa', 'ghQjaGL7JkVvU1NcTn5d', 'Helloe eoltf', '2022-02-11 19:30:29', '2022-02-11 19:30:29', 'unread', 'admin@airshop247.com'),
(7, 't52iBw7pTa', 'aqUTo1CXlN6FzmfiG8ec', 'Hello thank you for yoour email.', '2022-03-18 18:11:38', '2022-03-18 18:11:38', 'unread', 'horphy1@gmail.com'),
(8, 't52iBw7pTa', '15zPsgWntqlivEYmhUD0', 'Hello thank you for yoour email.', '2022-03-18 18:14:31', '2022-03-18 18:14:31', 'unread', 'horphy1@gmail.com'),
(9, 't52iBw7pTa', 'WQE8u6BSjfml1JNPH4yg', 'Thank you seh, na u be boss', '2022-03-18 18:23:16', '2022-03-18 18:23:16', 'unread', 'horphy1@gmail.com'),
(10, 't52iBw7pTa', 'UM763rdV5xlWzwAhimZa', 'Okay message recieved. \r\nfind attached below.', '2022-03-18 18:23:56', '2022-03-18 18:23:56', 'unread', 'horphy1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `message_attachments`
--

CREATE TABLE `message_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_attachments`
--

INSERT INTO `message_attachments` (`id`, `message_id`, `file`, `created_at`, `updated_at`) VALUES
(3, 'ghQjaGL7JkVvU1NcTn59', 'attachments/LkPi5nRrlomBIEiF67zZEJSlg1COZqXoNZ9Bml7W.png', '2022-02-16 21:32:54', '2022-02-16 21:32:54'),
(4, 'ghQjaGL7JkVvU1NcTn59', 'attachments/REqXyW6j3y5IrvQfitswys4xKRdXejxmJfhxSZog.jpg', '2022-02-16 21:32:54', '2022-02-16 21:32:54'),
(5, 'v4JxKeMs58gbynpqNzlL', 'attachments/isTcf2ocF4GzKbXsTVTX1iLnlZQiu7WvxWwfkPJJ.jpg', '2022-02-16 21:40:22', '2022-02-16 21:40:22'),
(6, 'R7jDEdzTXhWVYnJ3CbPe', 'attachments/isTcf2ocF4GzKbXsTVTX1iLnlZQiu7WvxWwfkPJJ.jpg', '2022-02-16 21:40:22', '2022-02-16 21:40:22'),
(7, '1bHMyPK2gmBoDejdW0nA', 'attachments/hwf2fKi2u6vhQ6fmQZX6hrLWAYSPLmKO3EVGW0wX.jpg', '2022-02-16 21:40:24', '2022-02-16 21:40:24'),
(9, 'WQE8u6BSjfml1JNPH4yg', 'attachments/kApkBJuy2gSTXeTsjKUhxjypNBW4ehGYFQL2yoAx.jpg', '2022-03-18 18:23:17', '2022-03-18 18:23:17'),
(10, 'UM763rdV5xlWzwAhimZa', 'attachments/1ZO5yTbxfgtK8mc0ALVpGJ58v9eEqAGbOinmBfpC.jpg', '2022-03-18 18:23:56', '2022-03-18 18:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_22_060441_create_plans_table', 1),
(6, '2021_11_25_201712_adds_api_token_to_users_tablele', 1),
(7, '2021_11_26_003858_dropnameaddfnamelname', 1),
(8, '2021_11_26_004723_dropname', 1),
(9, '2021_11_27_065429_create_markets_table', 1),
(10, '2021_11_28_212054_create_products_table', 2),
(11, '2022_01_06_175055_addcountryoforigin', 3),
(12, '2022_01_06_180236_addcurrency', 4),
(13, '2022_01_06_181024_create_store_types_table', 5),
(14, '2022_01_06_181051_addstoretype', 5),
(15, '2022_01_19_130106_create_order_showrooms_table', 6),
(16, '2022_01_22_153028_create_verifications_table', 7),
(17, '2022_01_22_153328_addstatus', 7),
(18, '2022_01_22_154437_addtoken', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orderbreakdowns`
--

CREATE TABLE `orderbreakdowns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderbreakdowns`
--

INSERT INTO `orderbreakdowns` (`id`, `product_id`, `order_id`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 5000.00, 2, '2021-12-13 07:35:50', '2021-12-13 07:35:50'),
(2, 3, 4, 5000.00, 2, '2021-12-13 07:47:45', '2021-12-13 07:47:45'),
(3, 3, 5, 5000.00, 2, '2021-12-13 07:50:04', '2021-12-13 07:50:04'),
(4, 7, 6, 20000.00, 1, '2021-12-13 16:21:09', '2021-12-13 16:21:09'),
(5, 6, 6, 15000.00, 1, '2021-12-13 16:21:09', '2021-12-13 16:21:09'),
(6, 5, 6, 7000.00, 1, '2021-12-13 16:21:09', '2021-12-13 16:21:09'),
(7, 5, 7, 7000.00, 1, '2021-12-20 19:00:21', '2021-12-20 19:00:21'),
(8, 6, 7, 15000.00, 1, '2021-12-20 19:00:21', '2021-12-20 19:00:21'),
(9, 7, 7, 20000.00, 1, '2021-12-20 19:00:21', '2021-12-20 19:00:21'),
(10, 6, 8, 15000.00, 1, '2021-12-23 00:29:01', '2021-12-23 00:29:01'),
(11, 17, 9, 30000.00, 1, '2022-02-02 13:55:28', '2022-02-02 13:55:28'),
(12, 18, 9, 10000.00, 1, '2022-02-02 13:55:28', '2022-02-02 13:55:28'),
(13, 19, 10, 3.00, 1, '2022-06-21 21:56:48', '2022-06-21 21:56:48'),
(14, 2, 11, 20000.00, 2, '2022-06-22 15:41:41', '2022-06-22 15:41:41'),
(15, 3, 11, 7000.00, 1, '2022-06-22 15:41:41', '2022-06-22 15:41:41');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `market_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `totalamount` double(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user`, `market_id`, `fullname`, `email`, `phone`, `address`, `items`, `order_id`, `status`, `created_at`, `updated_at`, `totalamount`) VALUES
(3, '703551394073', 11, 'Muritala Toheeb', 'telematics2000@yahoo.com', '07042136987', '7, Yeye Street, Iwaya, Sabo, Yaba, Lagos, Nigeria', '1', 'DrTWufpJo31mXRjbcZLn', 'pending', '2021-12-13 07:35:50', '2021-12-13 07:35:50', 10000.00),
(4, '703551394073', 11, 'Muritala Toheeb', 'dynamytwebster@gmail.com', '07042136987', '7, Yeye Street, Iwaya, Sabo, Yaba, Lagos, Nigeria', '1', 'VcSPFbXtWQ5mKAGYuTk4', 'pending', '2021-12-13 07:47:45', '2021-12-13 07:47:45', 10000.00),
(5, '703551394073', 11, 'Muritala Toheeb', 'telematics2000@yahoo.com', '07042136987', '7, Yeye Street, Iwaya, Sabo, Yaba, Lagos, Nigeria', '1', '9sb8BiIhnm2GJExp1WzV', 'pending', '2021-12-13 07:50:04', '2021-12-13 07:50:04', 10000.00),
(6, '1357056825434', 20, 'olakunle', 'kunlexzy91@gmail.com', '08058675123', 'Ibadan', '3', '0sh3WS1a6weyuRCZpPKq', 'pending', '2021-12-13 16:21:09', '2021-12-13 16:21:09', 42000.00),
(7, '9250681486853', 20, 'Demo air', 'demoair@gmail.com', '+2348062945226', 'Demo str. Nigeria', '3', 'FH18Nw52atUkenRgMmAK', 'pending', '2021-12-20 19:00:21', '2021-12-20 19:00:21', 42000.00),
(8, '8819232437750', 20, 'Prince Kay', 'victoria9799@gmail.com', '09139093318', 'Yabatech', '1', 'eBqnaMz57XNWR68kxQg9', 'pending', '2021-12-23 00:29:01', '2021-12-23 00:29:01', 15000.00),
(9, '9931907395343', 28, 'Ola', 'kunleolaleye@maxedge.co.uk', '08062945226', 'Ibadan', '2', 'an5rG8B9YSUmDhZwLyig', 'pending', '2022-02-02 13:55:28', '2022-02-02 13:55:28', 40000.00),
(10, '1655399753589', 40, 'ola Ade', 'lekanadeoye2002@yahoo.com', '07055566652', '12 akala street oluyole extension', '1', 'ym25jUisvNfEF8ATM1Z9', 'pending', '2022-06-21 21:56:48', '2022-06-21 21:56:48', 3.00),
(11, '6401081850334', 13, 'Ola', 'kunlexzy91@gmail.com', '08062945226', 'Ibadan', '2', '5A9wL3lPgen7Harb2mcu', 'pending', '2022-06-22 15:41:41', '2022-06-22 15:41:41', 47000.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_showrooms`
--

CREATE TABLE `order_showrooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `market_id` bigint(20) UNSIGNED NOT NULL,
  `user_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_showrooms`
--

INSERT INTO `order_showrooms` (`id`, `market_id`, `user_fullname`, `user_email`, `user_tel`, `user_ext`, `user_address`, `created_at`, `updated_at`) VALUES
(1, 26, 'Muritala Toheeb Opeyemi', 'horphy11@gmail.com', '8474636', '234', 'dfadasd', '2022-01-20 20:15:34', '2022-01-20 20:15:34'),
(2, 26, 'Muritala Toheeb Opeyemi', 'horphy11@gmail.com', '81435757', '234', 'dfadasd', '2022-01-20 20:26:34', '2022-01-20 20:26:34'),
(3, 26, 'Muritala Toheeb Opeyemi', 'logiccmpl@gmail.com', '8474636', '269', 'dfadasd', '2022-01-20 20:30:47', '2022-01-20 20:30:47'),
(4, 26, 'Muritala Toheeb Opeyemi', 'horphy11@gmail.com', '81435757', '213', 'dfadasd', '2022-01-20 20:32:37', '2022-01-20 20:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_resetns`
--

CREATE TABLE `password_resetns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resetns`
--

INSERT INTO `password_resetns` (`id`, `user_id`, `token`, `status`, `created_at`, `updated_at`) VALUES
(12, 26, 'udtk3B9DHFZLKCczWaVfvRe4ny5J0S7TYmpGqhMoXb2lsUjPErIx8NA1Qi6g', 'Open', '2022-01-27 14:06:16', '2022-01-27 14:06:16'),
(13, 26, 'rvBMkFjD3Xt9TlqAoxsG6zaE4Wy50YI7JncwdZ1Lu8PVeUQhNpKbiRHfCg2m', 'Open', '2022-01-27 14:12:02', '2022-01-27 14:12:02'),
(14, 25, 'jQwNDXu6h8lkg3feK7qvPBYoMLR9zJ0WEUCbcG4HFxatpV2nSyrATim5sd1Z', 'Open', '2022-01-27 14:12:24', '2022-01-27 14:12:24'),
(15, 26, 'eFtR7lqQYHXPADzMSVJ0IpLvx5odUnk6EmTWNbcKjgyw2BrsZf1h34aiu89G', 'Close', '2022-01-27 15:04:23', '2022-01-27 15:05:22'),
(16, 21, '9LKcNn32doPsMZ5Vub0xGwaBYRiEkl7hIqpU4gWQemfFHC8D1rAJ6TXtjvyz', 'Open', '2022-06-21 20:56:29', '2022-06-21 20:56:29'),
(17, 21, 'PE8eSr531lwkdx4sIqN0bcDiJ6aMUCLjuyBnAYWmKzoQGR29FfHvTgtVhXp7', 'Close', '2022-06-22 01:45:17', '2022-06-22 01:47:18'),
(18, 21, 'yvE1tkxi5CXzWajNheJTKBImc3Hfnw0QoDGblus8LMgF6YRrZ2pAdPVqU7S4', 'Close', '2022-06-22 01:53:18', '2022-06-22 01:54:54'),
(19, 3, '3YrjUL2cF7bwnVT1IegaolRzfNu5xmQXCdESM6KpqJA4PvZD8HWk9yhitGsB', 'Close', '2022-06-22 15:10:43', '2022-06-22 15:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Plan_Features` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_Description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_id`, `Plan_name`, `Price`, `Plan_Features`, `Plan_Description`) VALUES
(1, '1212', 'Free', 0, 'Up to 20 Items Uploads, Social media marketing, Performance analytics, Customer Support', 'Try us for free'),
(2, '12112', 'Standard', 500, '75 Items Uploads, Unlimited Social media marketing, Sales funnel access, Performance analytics, Customer Support', 'Best for growing your businesses'),
(3, '121132', 'Premium', 1000, '1000 Items Uploads, Unlimited Social media marketing, Unlimited Sales funnel access, Performance , Customer Support', 'Best for scaling your business');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `market_id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Product_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` decimal(8,2) NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `market_id`, `Name`, `Product_id`, `Category`, `Description`, `Price`, `Image`, `created_at`, `updated_at`) VALUES
(1, 11, 'asd', 'q2dpk86SrXi1taxFwm73', 'adsfadfadsf', 'asd', '121.00', 'products/9ybY12ju34i2uLcw19dhqNkrClc96CB1jgn556VW.png', '2021-11-29 07:05:05', '2021-11-29 07:05:05'),
(2, 13, 'Half shoe', '6PnUNg2Q8GvJbcF9dMlk', 'Men\'s footwear', 'Footwear\'s', '20000.00', 'products/DdopWr1p2OdV0093jiqMGKRux5h1qinzQq2G7GfQ.jpg', '2021-11-30 19:03:12', '2022-06-22 15:24:19'),
(3, 13, 'Sneakers', 'vxTmtC3lLbNscJXBYV26', 'Men\'s footwear', 'Slides', '7000.00', 'products/lxyqDDejyhHMLdn9orOTGhGOWpzLB1KJ4aKorFrY.jpg', '2021-11-30 19:05:58', '2022-06-22 15:32:25'),
(4, 15, 'Test', 'Fv4ZzK0XP7wiN8LcGWyR', 'Kids', 'Test', '200.00', 'products/a9ZdxMyvTCIke2CRO1359uuphpJSoeoSR0KJb7U5.jpg', '2021-11-30 23:07:29', '2021-11-30 23:07:29'),
(5, 20, 'Sneaker 1', 'M80mlCtDukITi7cPjZvR', 'Ladies', 'High quality sneakers Size 39-45', '7000.00', 'products/TAWVIltTXUp5fN30gh2wnw7ac4hPeY8o1ByDtjd0.jpg', '2021-12-13 15:17:30', '2021-12-13 15:17:30'),
(6, 20, 'Sneaker 2', 'R7cQdSPnrf3owj6BHmTD', 'Unisex', 'Top Brand Sneakers with Roller \nsize 40-45', '15000.00', 'products/Z7h1zupXrTFTgqoGiqTwUcPcnPgEv3LGvBIZFjGn.jpg', '2021-12-13 15:22:13', '2021-12-13 15:22:13'),
(7, 20, 'cooperate boot', 'uc80EaQCigympD5n1Lzl', 'Men', '100% pure leather\nsize 41-45', '20000.00', 'products/TlvUjBnua42VyBMMiAb4bD7HsWWiXPsLmayGcSO1.jpg', '2021-12-13 15:27:46', '2021-12-13 15:27:46'),
(8, 21, 'test', 'fIsaiKDhSwzQpvb75Vkl', 'men', 'test', '18.00', 'products/7iRVqsDjfQFWHwp2YVjUKtnBkN2Kj6m9Zrh10yW0.jpg', '2021-12-13 22:46:16', '2021-12-13 22:46:16'),
(9, 22, 'Trouser', 'QJVbm1KTY6yvwkFWX85p', 'men\'s wears', 'Trousers for male', '4000.00', 'products/zLjYQTBPqKbNfr1R3gBmIMv9jLcJFVT5PBKPTfSS.jpg', '2021-12-13 23:03:04', '2021-12-13 23:03:04'),
(10, 25, 'Belle’s necklaces', 'Rab8PEFqJ3ZKdm9rVsYG', 'Necklaces', 'A heart shaped pendant and necklace', '4000.00', 'products/g5MKlgwVG4CLSMbggMHi93rHmmFDdNSjdMk9eWX2.jpg', '2021-12-16 22:03:10', '2021-12-16 22:03:10'),
(11, 25, 'Wristwatch', 'fKB0xoYpriQVLNX8927Z', 'Men wristwatch', 'Rolex wristwatch', '35000.00', 'products/1m5KKZhcq26yMBTgm00SOu6Mfzj7evFQgfLAsSiB.png', '2021-12-16 22:07:21', '2021-12-16 22:07:21'),
(12, 25, 'Nose rings', 'pHhZFiyBCXIg47eL8jDk', 'Nose rings', 'Nose rings available in three shades gold silver and rose gold', '1000.00', 'products/1LdXs71IbUnNHNXRkIzdc6zhb3lpELfEPToZLOgc.jpg', '2021-12-16 22:10:58', '2021-12-16 22:10:58'),
(13, 26, 'men trouser', 'EtPug7bi0AZSpmwosVvq', 'mens', 'sowing', '-12.00', 'products/rPdYlPwFV09rdAX5ZPvRf7iSnCS4Ztaoy2R9D5zk.jpg', '2022-01-10 23:13:13', '2022-01-10 23:13:13'),
(14, 29, 'Goji 18 wireless Bluetooth Ear- Hook Headphones', 'L4cxasCSTK6RpmeiGyHB', 'Ladies and men\'s blootooth hearphones', 'Wireless Bluetooth headphones Ear Hook for sport \r\n£10', '10.00', 'products/SfIVJY9xs2Hbz7Lkhg1LA9BuXgf6pOVYL2NnGYZr.jpg', '2022-01-28 21:12:20', '2022-01-28 21:12:20'),
(15, 29, 'Steel series Artist 3', 'B5u3HysDTUaGCxYMPpQL', 'Headphones', 'Steel Series Arctis 3 for Best headphones for gaming pick up for\r\n £35', '35.00', 'products/vfgj2m98faca0duNRigwabhcNs6KYcUwY5FQRMXm.jpg', '2022-01-28 21:18:34', '2022-01-28 21:18:34'),
(16, 29, 'Steel series Artist 3', 'pBQ2GeHSJabzWAqTXERi', 'undefined', 'Steelseries Arctis 3 is the best headphones because the sound is customizable through the steelseries Engine 3 software which works best on a PC . Pick one up for £35', '35.00', 'products/j9w3s7aqfxdB8lWkCsDlmmpL1bKikwZDbhpLPU7N.jpg', '2022-01-28 21:27:05', '2022-01-28 21:27:05'),
(17, 28, 'Cam 1', 'rWlfmZ9whDM3HT6pYbye', 'Gadgets', 'Solar light with camera', '30000.00', 'products/M4InGN4kMDY1CmtuwOaZFDcJNvx1NARA0EOOpziH.webp', '2022-02-02 13:41:17', '2022-02-02 13:41:17'),
(18, 28, 'Cam 2', 'sM7QghjpIUCrXzKVAqcD', 'Surveillance', 'Analog Cam', '10000.00', 'products/pfyGGGe4gSeDsovb4EbUanO5BCPadS3Vv3L2Kws8.jpg', '2022-02-02 13:45:27', '2022-02-02 13:45:27'),
(19, 40, 'perfumes', 'Yy0cLFWBIPfRoQgx52iJ', 'perfumes oil discount available with discounts', 'perfumes of different brands', '3.00', 'products/X4XokbRdzWDpL6EdnU4jHUW8piqfzq85RriLPH94.jpg', '2022-06-21 17:02:41', '2022-06-21 17:02:41'),
(20, 40, 'New Product', 'JYanik1dx9o2BMwv3mLC', 'Perfume', 'Hello', '1000.00', 'products/9nBdgWIA1su8z3PHplg7U0z9eBXgiobhLFnKkhm4.jpg', '2022-06-21 17:53:16', '2022-06-21 22:52:24'),
(21, 19, 'Hello', 'CLxmKpyvA62XGkcw3fha', 'Wear', 'Hello', '121.00', 'products/5KKH2PMVorW3J0eU6yE6SIgKXf5w26u5xlcmU1Dq.jpg', '2022-06-21 20:24:34', '2022-06-21 21:13:43'),
(22, 40, 'Perfume', '9MYmr7o8VJQs6xSLGkFu', 'Perfume', 'It a top notch fragrance,longetivity is super, announce your arrival with this.', '8000.00', 'products/gspJvIruq50fkNc8sCuqq6h3LvbnfXFZaGBzYneP.webp', '2022-06-21 23:00:10', '2022-06-21 23:00:10'),
(23, 40, 'Perfume', 'PyRW9HbEnvsj3fQV5qdp', 'Unisex Perfume', '25ml mosuf very handy  and sweet fragrance.smell nice joor', '2000.00', 'products/3WDL9FPHNbkCMoZLpvN7DkXGyh1kPNKwV7xzWu05.webp', '2022-06-21 23:07:01', '2022-06-21 23:07:01'),
(24, 40, '4in1 gift set', 'mkjgYFLwKseBAc4alrvx', 'Perfume', 'It\'s a gift set of four different fragrance in 25ml size,nice gift to give your love ones.', '6000.00', 'products/wOSzaAjehpiCDbXUOS4GkIAI10jkbiHfeaZSLlML.jpg', '2022-06-21 23:10:41', '2022-06-21 23:10:41'),
(25, 40, 'Body mist', 'tNIEl9SDVJ4CYWQjhiRz', 'Unisex body mist', 'Smells good just like Perfume\'s, wholesale deal is also available.', '1200.00', 'products/NI5DTgZeaWb2tlOwYX6M3iV7CJ8FnizXvnHesfj1.jpg', '2022-06-21 23:13:50', '2022-06-21 23:13:50'),
(26, 40, 'Deodorant', 'Hx7zUjW3pM2FNZ9I1EJi', 'Unisex deodorant', '48hrs long lasting', '1500.00', 'products/3ZwC40LSr1WF8wViwYZBBlkCFY8ixyfPVoB53DF4.webp', '2022-06-21 23:21:18', '2022-06-21 23:21:18'),
(27, 40, 'My dear body body mist', 'wtz7SKNr3BLaMyPnETfQ', 'Unisex body mist', 'A very unique and nice fragrance', '1500.00', 'products/MaFM4dbtHyq9vFl47ah2naOuXdEvEEetFGyD7Uxx.webp', '2022-06-21 23:27:31', '2022-06-21 23:27:31'),
(28, 40, 'Perfume', 'wbdLv7X0guJnT2a5xqkM', 'Feminine Perfume', 'Sweet fragrance for sweet lady.', '1500.00', 'products/Gzw5FCb04OaR3ibc8rjSXxZEfHzirHP5DsKp313s.webp', '2022-06-21 23:29:02', '2022-06-21 23:29:02'),
(29, 40, 'Perfume', 'Lz1pMyvuExcIWathH06J', 'Unisex Perfume', 'The small but mighty bakkarat', '2000.00', 'products/svDAxcNACxGNRKil9JMX757mcl499R8MNzEqNCim.webp', '2022-06-21 23:30:33', '2022-06-21 23:30:33'),
(30, 40, 'Perfume', 'KUtAWEsnplSzMLk8Zm6N', 'Perfume', 'This is super duper, very announcing,long lasting,make I no talk too much, buy it and thank me later.', '8500.00', 'products/0Gzud8bwWG2QucGFkY6I4G2j5ARXnOaCYCcU6y32.webp', '2022-06-21 23:33:28', '2022-06-21 23:33:28'),
(31, 13, 'Camera', 'Er8xSmzNG03tL7HvsIek', 'Gadgets', 'Surveillance camera', '10000.00', 'products/V19cX0AW1rLXxTBisINBwo6ofOE5JPM6PAjyJ8Bn.jpg', '2022-06-22 15:33:58', '2022-06-22 15:33:58'),
(32, 40, 'English blazers', 'rLaBMv2fs9gUD51d3yw0', 'Men deodorant', 'This is a 48hrs long lasting.', '1500.00', 'products/QKqLdAZebLwlnZ9tgYfnbWdVg9iEsywClvrP5Eh5.webp', '2022-06-25 18:30:35', '2022-06-25 18:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `store_types`
--

CREATE TABLE `store_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_types`
--

INSERT INTO `store_types` (`id`, `title`, `banner`, `created_at`, `updated_at`) VALUES
(1, 'Showroom', 'template', NULL, NULL),
(2, 'Full Store', 'shop', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `market_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `Due_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `market_id`, `plan_id`, `Due_date`, `created_at`, `updated_at`) VALUES
(2, 14, 1, '2022-01-05 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(3, 11, 1, '2022-01-05 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(4, 11, 2, '2022-01-06 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(5, 12, 1, '2022-01-05 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(6, 13, 1, '2022-01-05 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(7, 15, 2, '2022-01-06 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(8, 16, 1, '2022-01-05 13:07:47', '2021-12-05 21:07:47', '2021-12-05 21:07:47'),
(9, 17, 1, '2022-01-08 12:28:51', '2021-12-08 17:28:51', '2021-12-08 17:28:51'),
(10, 18, 1, '2022-01-08 18:16:52', '2021-12-08 23:16:52', '2021-12-08 23:16:52'),
(11, 19, 1, '2022-01-08 19:36:23', '2021-12-09 00:36:23', '2021-12-09 00:36:23'),
(12, 20, 1, '2022-01-10 15:13:39', '2021-12-10 20:13:39', '2021-12-10 20:13:39'),
(13, 21, 1, '2022-01-13 17:40:30', '2021-12-13 22:40:30', '2021-12-13 22:40:30'),
(14, 22, 1, '2022-01-13 17:58:22', '2021-12-13 22:58:22', '2021-12-13 22:58:22'),
(15, 23, 1, '2022-01-15 10:55:20', '2021-12-15 15:55:20', '2021-12-15 15:55:20'),
(16, 24, 1, '2022-01-15 11:36:07', '2021-12-15 16:36:07', '2021-12-15 16:36:07'),
(17, 25, 1, '2022-01-16 16:40:43', '2021-12-16 21:40:43', '2021-12-16 21:40:43'),
(18, 26, 1, '2022-02-10 16:14:28', '2022-01-10 21:14:28', '2022-01-10 21:14:28'),
(19, 27, 1, '2022-02-28 15:12:27', '2022-01-28 20:12:27', '2022-01-28 20:12:27'),
(20, 28, 1, '2022-02-28 15:16:19', '2022-01-28 20:16:19', '2022-01-28 20:16:19'),
(21, 29, 1, '2022-02-28 15:48:42', '2022-01-28 20:48:42', '2022-01-28 20:48:42'),
(22, 30, 1, '2022-04-15 18:42:30', '2022-03-15 22:42:30', '2022-03-15 22:42:30'),
(23, 31, 1, '2022-04-16 10:02:06', '2022-03-16 14:02:06', '2022-03-16 14:02:06'),
(24, 32, 1, '2022-05-08 12:05:06', '2022-04-08 16:05:06', '2022-04-08 16:05:06'),
(25, 33, 1, '2022-05-13 15:07:47', '2022-04-13 19:07:47', '2022-04-13 19:07:47'),
(26, 34, 1, '2022-07-15 14:20:18', '2022-06-15 18:20:18', '2022-06-15 18:20:18'),
(27, 35, 1, '2022-07-15 15:00:17', '2022-06-15 19:00:17', '2022-06-15 19:00:17'),
(28, 36, 1, '2022-07-15 19:52:52', '2022-06-15 23:52:52', '2022-06-15 23:52:52'),
(29, 37, 1, '2022-07-15 21:09:44', '2022-06-16 01:09:44', '2022-06-16 01:09:44'),
(30, 38, 1, '2022-07-21 09:45:58', '2022-06-21 13:45:58', '2022-06-21 13:45:58'),
(31, 39, 1, '2022-07-21 09:49:38', '2022-06-21 13:49:38', '2022-06-21 13:49:38'),
(32, 40, 1, '2022-07-21 10:58:23', '2022-06-21 14:58:23', '2022-06-21 14:58:23'),
(33, 41, 1, '2022-07-21 11:59:51', '2022-06-21 15:59:51', '2022-06-21 15:59:51'),
(34, 42, 1, '2022-07-21 13:13:43', '2022-06-21 17:13:43', '2022-06-21 17:13:43'),
(35, 43, 1, '2022-07-21 16:52:06', '2022-06-21 20:52:06', '2022-06-21 20:52:06'),
(36, 44, 1, '2022-07-26 19:05:27', '2022-06-26 23:05:27', '2022-06-26 23:05:27'),
(37, 45, 1, '2022-07-26 20:42:42', '2022-06-27 00:42:42', '2022-06-27 00:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referred_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `api_token`, `first_name`, `last_name`, `referred_by`) VALUES
(1, 'horphy1@gmail.com', NULL, '$2y$10$yyH43k5lwdAmMBmn2O3uxeNWRcwNj8TVjSqDCb24S8i1Qooo9Q.8.', NULL, '2021-11-28 13:30:16', '2022-06-21 20:23:06', 'JlZQmhr3jFo6EMYxLH4aWBdGN9fkIv1CDTzgubAVy8PiKe27tRnX5Sw0spcU', 'Ope', 'Yemi', '1234'),
(2, 'horphy11@gmail.com', NULL, '$2y$10$c/pm.vV6UG2YUQcT/XOWlOT6fz2d7PDd8JQMhejwSvjZa/wFXfypa', NULL, '2021-11-30 03:46:55', '2021-11-30 03:47:26', '1lHoBjJCbUudZK7mFcn5qTvVRr3yA02zWQPGhDkXw9L8xta6Spge4fENYiMI', 'Muritala', 'Toheeb', NULL),
(3, 'kunleolaleye@maxedge.co.uk', NULL, '$2y$10$zoztMDRO3ogOGvJfBLZjq.G4MqZ2UIg6boZHfpkqdjIM2B/a21CLW', NULL, '2021-11-30 18:53:07', '2022-06-26 18:09:21', 'shRNrcq1jgklYxo06IPnUDdwWCAXbZL3mTtyEQ2He45pB8VSF7GiKvz9aJMu', 'Ola', 'Kunle', NULL),
(4, 'temiyemex@gmail.com', NULL, '$2y$10$XhgQqnnlIF99ieuLs4wRSOBu3SfGyVmGcicKP0yRnZram.p1MutC2', NULL, '2021-11-30 19:20:07', '2021-11-30 19:23:37', 'LnRU6owKWDsAXbIkx0vyEQSVzPCMHaqNg9dTu5rmt4pZYjB87fl1e2hFicG3', 'Temiyemi', 'Bimbo-Wiwo', NULL),
(5, 'test@gmail.com', NULL, '$2y$10$N7BhVYRU7sqzTUihkPVUe.k8QE0Wkx43os/GWG1pYZ1mkPpM5jDKK', NULL, '2021-11-30 22:47:05', '2021-11-30 22:47:39', 'NueJtE70T1mCM5dAvsRQPlSo8hnfKLFB43YUqDVbGixHZgkw6zXrI9ca2Wpj', 'Test', 'Test', 'test'),
(6, 'simastranscripts@gmail.com', NULL, '$2y$10$5hUOUHsYPf9uKKNkv6CqeumFI103CPCawTWf5MXn.DsVAcQDBuYze', NULL, '2021-12-01 20:57:40', '2021-12-01 20:58:11', 'i8omYnfabA1kUj0xrhe3JtLMTH4udvRcsDpBSlg7WENwZ6V59FKyGIQz2XqC', 'Similoluwa', 'Osinubi', NULL),
(7, 'Demoair@gmail.com', NULL, '$2y$10$IsAMcrR1qldjdhWFZ6VxkerIXnE6mgHsFKtIqa8PyRE3LlGuJgXG2', NULL, '2021-12-05 16:08:50', '2021-12-20 18:37:35', 'kanC9XRmvKpLFqsxrQlZ2IAM4S8107EGJhH6zDjUbiNdWw3oVT5cyBYetufP', 'Demo', 'Air', NULL),
(8, 'kenneth@gmail.com', NULL, '$2y$10$HYpqraj6ktaeyqer1gM6AOjin2o5ibQlVA6GO6czLh92/rH2KgY8a', NULL, '2021-12-13 22:32:14', '2021-12-13 22:32:14', 'DUsj5Jzu3fx6NgSpnVaHBQEXk8Rh7b9c0iFvCrIZlety1WPAKmL2oTdqYGw4', 'kenneth', 'Afegbai', NULL),
(9, 'newsight@gmail.com', NULL, '$2y$10$P1VPU5qMoF34bhpKs5uP1esaoC859941Ar7bi5WERtRUC42BSPajG', NULL, '2021-12-13 22:37:50', '2021-12-13 22:38:22', 'H7icMLBDn43x5lhI6qaezpvJowfyX8Q2t0kSjbuCdWrsm1gZ9KPGAUTVFERN', 'kenneth', 'Kenory', NULL),
(10, 'kenofashion@gmail.com', NULL, '$2y$10$yEZSzQYQmWx.34MYVpNUu.60kPzw4NkERD8G9aZ1ISiQyVLQiqN0i', NULL, '2021-12-13 22:49:08', '2021-12-13 22:49:34', 'ux5S2Fwclzkih6pdfsEnWqyCYLoU3TmNHD1vg0Kbe7PJVjaQAtM8BX4GIR9Z', 'kenneth', 'Kennedy', NULL),
(11, 'tysonfashion@gmail.com', NULL, '$2y$10$CWJE7J6dtH3jc4rTEXlYOOiYWgxgXScA6fSMnVB57bxaUsYMgD6sG', NULL, '2021-12-13 22:52:04', '2021-12-13 22:52:30', 'TWMGktBKc51LiIRyH6U3mJefhAxqNZ4dvoSDrl0p8PYjCFb79Eu2wzXnsVQa', 'kenneth', 'Tyson', NULL),
(12, 'ridex@gmail.com', NULL, '$2y$10$owr64WUHrXDr88cR0ghwxeIr3EjVPo.zPE4fzz/oXMxndPBuTBEJK', NULL, '2021-12-13 22:56:57', '2021-12-13 22:57:20', 'UFDL9RXn74KvJHuaNAYjfqrP528sd0oCzthxckg3QSMmwVE1iylZTbWpBIe6', 'Mike', 'Ridex', NULL),
(13, 'faladeiyanu45@gmail.com', NULL, '$2y$10$ATci.GmcMVzLJRTIeg2TkuGUUK/zgUenA0eO8GfhUK9cMKb1jtLXu', NULL, '2021-12-15 15:51:10', '2022-01-05 19:10:55', 'uRQ1kgrUqxWHAnIJhD7NXVjiaGBp2fbow63S9ezyF4CML5mZ0sP8KcvdtElT', 'Iyanu', 'Falade', NULL),
(14, 'horphy1123@gmail.com', NULL, '$2y$10$kvEMN9ae.rKElrC5yH6TUeAqQ/NBRREwTlYtE4eE/WvwVPEV6UBfq', NULL, '2021-12-15 16:35:23', '2021-12-15 16:35:44', 'RTE2ytaCebldhQpZSoqX06Wv1JczKfkMi3BHU97uLjnVGsIPr5wY4F8DNmgA', 'Yemi', 'Demo', NULL),
(15, 'Lawalbarakatadewunmi@gmail.com', NULL, '$2y$10$yyH43k5lwdAmMBmn2O3uxeNWRcwNj8TVjSqDCb24S8i1Qooo9Q.8.', NULL, NULL, NULL, NULL, 'Lawal', 'Kunmi', NULL),
(16, 'crystalkitchenck@gmail.com', NULL, '$2y$10$yyH43k5lwdAmMBmn2O3uxeNWRcwNj8TVjSqDCb24S8i1Qooo9Q.8.', NULL, NULL, NULL, NULL, 'Crystal', 'Kitchen', NULL),
(17, 'mazeedatadeoye06@yahoo.com', NULL, '$2y$10$yyH43k5lwdAmMBmn2O3uxeNWRcwNj8TVjSqDCb24S8i1Qooo9Q.8.', NULL, NULL, NULL, NULL, 'Mazeedat', 'Adeoye', NULL),
(18, 'Ayomide14932@gmail.com', NULL, '$2y$10$R1thiZgv.Q.qay/bKcSzse8ObUUvWfonJfFtWIK8i0rvvXJd8v4ZK', NULL, '2021-12-16 21:19:41', '2021-12-16 21:20:19', 'YqjoIRsfeFAUizJp6gmc789BLWNEKwv4kHduyS01tZPVrX5nTDG3axlhCb2Q', 'Ayo', 'Mide', NULL),
(19, 'Isabellaenyili@gmail.com', NULL, '$2y$10$3aJund0u4e51BsezajhHtuqIiO3kk3Lp4/pi.FA2sewlSRrTtm6Vq', NULL, '2021-12-16 21:29:52', '2021-12-16 21:30:25', 'b3HcNsi5uta6RBKPUyepDI2r7fQFk8AjhJEV1ln0Sz4dXvxwgToqM9LZCYGW', 'Isabella', 'Enyili', 'Belladonna'),
(20, 'toplueholdings@gmail.com', NULL, '$2y$10$xPIASIAxlPebgPqMjBWVnu6FVY9B0lmc/1789jNza74ZvgK7y82Iq', NULL, '2022-01-06 23:06:03', '2022-01-06 23:06:23', '1JWXICmvaYG5EldoDc6ijtPqk7nMQF3hg4upyBxTU2bKsNwrzAR8LVSZe9H0', 'Amazing', 'Kom', NULL),
(21, 'menoclockfashion@gmail.com', NULL, '$2y$10$DViLIex4YOZWO2fu0zXdher3oSlM6dfJieFCc5rXcckWw12ch2/hi', NULL, '2022-01-10 21:02:32', '2022-07-04 02:08:00', 'e9YLjWMfbJZKhn74BI8QEdHpTzXFNC23VlU1wD5xRi0GScAg6qromasuytvk', 'Morenikeji', 'Mimi', NULL),
(22, 'lekanadeoye2002@yahoo.com', NULL, '$2y$10$89t2AbluysVQm6.Y0is1F.SOqhsBZTBjNn6tfCeSaslOs/Ux0W7w2', NULL, '2022-01-10 22:57:10', '2022-01-10 22:57:26', 'xe16Jl4C2rH3ASMqpvDwZXE0dfmQtNKz7P9gbioVUknayh5TsGuYBRcWjFI8', 'olalekan', 'Ada', NULL),
(23, 'mazilab3070@gmail', NULL, '$2y$10$gdcykQIni4zqlN/KPMULfOVFY5Dp2dLZkWmmKsrhYpbm5EyLzpSKq', NULL, '2022-01-12 01:53:37', '2022-01-12 01:54:29', 'dZi23Dfr9MhT1o7RH5SJa0gwWxtlnUA6VqsGvIEFLQBPmjCyp4bkuzXN8eKc', 'colings', 'yessy', NULL),
(24, 'review@gmail.com', NULL, '$2y$10$JtJ6evSh642rFmvBQBB0kOxljdb8U6h9MuEEsTmHEIMf0byMQetD2', NULL, '2022-01-25 15:51:51', '2022-01-25 15:56:35', 'ZzryhK3PfHRiJqDTGjXV2umS8nQ0NgtoIpB4abe6AL97xUCsvdEkMFcWlw51', 'Review', 'Account', NULL),
(25, 'kunlexzy91@gmail.com', NULL, '$2y$10$u0dnhDe9AtE8S5G/9HJPLuXlsjCcA6mCoSzQI/sd10fD86/F5B1YK', NULL, '2022-01-25 15:57:59', '2022-02-02 13:56:34', 'wI3rgT5L2MqlUWHDzGfcbEkhSZp4Jo8iCx6XdnKs90AyjY7RPQ1vameNtBVF', 'Olakunle', 'Olaleye', NULL),
(26, 'info@maxedge.co.uk', NULL, '$2y$10$SWIZBgWRO/4bICz9VZDsTOsbLmULfEYCGoqamhr6ElqDb2B.OKei.', NULL, '2022-01-25 21:41:22', '2022-01-29 19:53:19', 'f0FPAhTe7ZtjHmvJSgkwx3YzqVWR9bXaoBcCNlyDinsG4ruK8Q65IpE12dUM', 'Gadgets seller', 'ONE STOP Gadget', NULL),
(27, 'logiccmpl@gmail.com', NULL, '$2y$10$45dx2hh64xxhVcp40a9oi.JmmoUtYhpMrXLJ4AkEgkTfzODOgTXmu', NULL, '2022-01-28 19:59:31', '2022-01-28 20:08:23', 'TLrKYAyqQBp2b7e1Pou3V5J8C9xElDgSjGfzv4wkt0iWRmhUZNHInaXMcsF6', 'LOgic', 'Yemi', NULL),
(28, 'bolaflorence32@gmail.com', NULL, '$2y$10$Qh9bpUhYxJ8UtSfGn6/2R.23KfBXW1nAknFHtLffHURAy2Q4TbZie', NULL, '2022-02-16 11:22:13', '2022-02-16 11:22:13', 'JH1cWLIwVfdzAjvaY046neo8y3K5Q9GxiZpkDMmE2CPuqrbBgFhlNtRUTX7S', 'Florence', 'Akin', NULL),
(29, 'ipiletitun@gmail.com', NULL, '$2y$10$GuZQETLxuoOTaHWWIagId.96ec20OLrB.WRznQrSlcsG7HPAP8lkC', NULL, '2022-03-15 19:54:43', '2022-03-15 22:21:35', 'RdhETUSLYgkscjC5GBvraA7KoPZz4Jxq10eiDVXt62pFHW3M9NIQlnbw8uyf', 'Olumuyiwa', 'Soluade', NULL),
(30, 'elsiecapitalng@gmail.com', NULL, '$2y$10$NrCXIxYs6QnC4ifo3b32i.y6mQAYKQ.00lRehdp30hf.UQ5vYA6O6', NULL, '2022-03-16 12:37:57', '2022-03-16 12:51:10', 'Ga7YK3xnyUgjRpN6XeAVol4SbfwL5WrstE9vHhIqF8iJC2DTPzmZ1dcMuQk0', 'OLUSEGUN', 'SMITH', NULL),
(31, 'admin@airshop247.com', NULL, '$2y$10$yyH43k5lwdAmMBmn2O3uxeNWRcwNj8TVjSqDCb24S8i1Qooo9Q.8.', NULL, '2021-11-28 13:30:16', '2022-01-27 18:05:24', '7mlx4KUa1hLTY9WrFsR5MPwDkEBpvqJ8ZeoAVNQ20gIXcizfnjbyuC16td3S', 'Admin', 'Airshop', ''),
(32, 'esthertiti85@gmail.com', NULL, '$2y$10$Uda.crPz/90/co.cTKCqqe.IzttwyISKvAjM2x.oJe53EqSkn3f4i', NULL, '2022-04-08 15:51:01', '2022-04-08 16:00:56', 'gMoCcEVskRiZfTJmLFBbr0xGzAU9e7tWj4pHPhq6Ian2l3K5yDXvwu8S1YNQ', 'Kayode', 'Titilayo Esther', NULL),
(33, 'chosen2xl@gmail.com', NULL, '$2y$10$HZpv5PhgpCUDvhePjKpvGu7BzFvPkkB8bcPmBsf0yDA4DTmKoUiYi', NULL, '2022-04-13 11:27:39', '2022-04-13 19:06:23', 'Nr1pEI9WmP3zGbaqCQFhyDXwncKATVjlk40vd27gH8S5etLBsMZoRfUuJixY', 'Abubakar', 'Abdulkadir', NULL),
(34, 'olasamfarm2018@gmail.com', NULL, '$2y$10$Qr9qDgYWrzIihbcNsG6R7um1Pn355taQRKOHxYXxuFWL7XRvno2Ki', NULL, '2022-04-28 00:55:33', '2022-04-28 00:56:18', 'DL8ebz20nV5YJpHxw396tPyBsGcSAaXKQ4RMT7uigqkZvjEChfIN1UoFrlWm', 'Olalere', 'Olaide samsedeen', NULL),
(35, 'toksbambi34@yahoo.com', NULL, '$2y$10$IX4N8PeFR31iBkl7gJTNq.VtgtpcoGW3AUCbFBqenSjCj5jn2xmOm', NULL, '2022-06-03 20:33:26', '2022-06-03 20:33:26', 'Vaf3NbKFXUkZemyxRBoCQTG8M0q5h1JtP7wjuciAH4rEDzn2YLSW9v6lpsgI', 'Olatokunbo', 'Ogundipe', NULL),
(36, 'auduaishat03@gmail.com', NULL, '$2y$10$9BmUCzl2R9jMqldgLYdfQuaqy3PN1a0bkHO/2.FNIDtNrbgU9Znjy', NULL, '2022-06-04 10:15:25', '2022-06-04 17:23:46', 'PbUAm4ajdcwzoQfq7CRF68IeK5i0GY9H3vrVxBXThSsuyZEgn1NDWJtp2Mkl', 'Audu', 'Aishat', NULL),
(37, 'opeyemitoheeb122@yahoo.com', NULL, '$2y$10$9BH9vM3.ShCpFp4LRjLE3ugoE1I4kNo1io4JGmuTFcGQAs.T5ZK/6', NULL, '2022-06-04 20:27:47', '2022-06-04 20:28:19', 'wpkEPrAKzSmG51dBb6FnDX7832stuLTVolyxh9agcRWUf4I0CiNYJqQvjeZM', 'Opeyemi', 'Toheeb', NULL),
(38, 'golibe2020@gmail.com', NULL, '$2y$10$TMFc5hHKQTAAheiGL4n1iuayQkQ6dEoGQ.z/aB.SCfLxLigWa6RYW', NULL, '2022-06-10 18:24:45', '2022-06-10 18:25:02', '4oZC6i0NJKvRenGWpfzbqLXVmIYEUFMtABDhj7QPd2l8awSscxr19gk3T5yH', 'Georgina', 'Anabuike', 'Kunle'),
(39, 'easyboy09051@gmail.com', NULL, '$2y$10$HtdP2gRv2zAQHlec6QPMNOrQWWKut8un2GH52hLLFQrt97G72tLKe', NULL, '2022-06-15 18:05:32', '2022-06-15 18:33:59', 'C6cvYwLZD5mA4al80TjqGWikHxFygp23fEnr7Mh9sPuoJXVURbSQN1zeBdKt', 'Ajayi', 'Isreal', NULL),
(40, 'alaoadesewa309@gmail.com', NULL, '$2y$10$Q3X5LT1bCMpznlE1yKNW1udWZAljaXiTgdNIo2oykBmVIVPHJUH4W', NULL, '2022-06-15 18:38:31', '2022-06-15 18:56:36', 'tGNTd10cE5B7vRILyAjY62xq4XfHrmbl8PFw9oszCDinUpKWV3QZakhSMeJg', 'Alao', 'Zainab', NULL),
(41, 'tehingbolajohn@gmail.com', NULL, '$2y$10$zJKzvKw8h3Z/gNZON2wzZOeZT/IO5SsMsRlbVWDX0qHPvvipWJrYi', NULL, '2022-06-15 23:37:15', '2022-06-15 23:45:00', 'D5EvWzeVM8mZXyuao07chGQbdPpI1qAi4xHTnsRFN2gCU6wklJrYLKBfS39t', 'Tehingbola', 'Oluwatobi', NULL),
(42, 'ardernnigerialimited@gmail.com', NULL, '$2y$10$O7A12y4/t8eQ5SsdXu6BPOAsre/fcYXy6NVKqA2ZQijVO0AiSUzpS', NULL, '2022-06-16 01:00:48', '2022-06-16 01:06:38', 'NWsH0InZaYyVRufD21Mvi7QAF3Lpl4dg98btc5xrTXmkC6jPKhzweqGBJoES', 'Kolapo', 'Ajayi', NULL),
(43, 'seyijohnson32@gmail.com', NULL, '$2y$10$qRTJAl4DZ27HTceX0lLUHunrKMpeh2kNtn7W0OjYXPCMS4mo7VjDy', NULL, '2022-06-16 02:21:00', '2022-06-16 02:27:12', 'c3CPQsN9D576Ywrfk4KejMSR1GZXgxFBau08vzIdimnVolLHtAE2WTyqbJhp', 'Seyi', 'Hannah', NULL),
(44, 'ymercy452@gmail.com', NULL, '$2y$10$pTbMMxZaJFGANpi0eB5JneBQ0XAeBTKBaT.6zVfFwzGDRm05WsGnu', NULL, '2022-06-16 12:41:59', '2022-06-16 12:54:19', '5dxvGCsKEVjn9gJ7QhBembyurY8wHitk0ZpLRDaNoIc3T4S6zfPlUFAMWq21', 'yaya', 'mercy', '0'),
(45, 'agboolaayobami70@gmail.com', NULL, '$2y$10$/o/EeyTDcSYqhsZ1Tt/FYuP246wHZrjYpdFfDZ2o26ygjS76/F1u2', NULL, '2022-06-20 01:10:36', '2022-06-20 01:14:03', 'eVJYZt0PTodLnrAhEyplju6q9D2R8CKczHXGFNMwBW3iab7xkvfsQ4mSg5IU', 'Agboola', 'Ayobami', NULL),
(46, 'bespashchesy@gmail.com', NULL, '$2y$10$sYZa2orOHxKYQi1e1WbgUO44jHA0NZLlzWXqxBakhFWyu0MlsnFcy', NULL, '2022-06-21 11:44:07', '2022-06-21 11:50:28', 'vCZ14AJkodUHnlL0QWfTFaGyRwthDSg5jXM6pP93zKmicIE28brqVx7YuBeN', 'Aaredudu', 'Autos', NULL),
(47, 'Bobodeec@gmail.com', NULL, '$2y$10$ENekkCtHGoSvo.wi/ZEuEOpcwT52yak/4s9cfiwCu8XHVYSDl3Tz6', NULL, '2022-06-21 12:00:33', '2022-06-21 12:00:33', '9DofaAIyS6b4rj5TY1KgxiMknhes2RPuJqX0vdC8zHVlGWpENBw7t3FcQLZU', 'Ojolowo', 'Adeola', NULL),
(48, 'toheebhamzat75@gmail.com', NULL, '$2y$10$srM7S3eeeYLo2.NFnDTosOa0ZU80InEeoK33TdU/72DaAXFI2ytRa', NULL, '2022-06-21 12:01:10', '2022-06-23 18:39:09', '6njhwKGUIoV0LdQ1EtxFq8e5MXY9NkyZiA2glzrWbsHa4mBD3C7pJfuTcRvS', 'Toheeb', 'Hamzat', NULL),
(49, 'oodusolu12@gmail.com', NULL, '$2y$10$kTVmfgNHJ4AcEdkvXpWT.OMGsAZaGk4qapnsrjG5Fx3SaWA0GfdDS', NULL, '2022-06-21 13:30:38', '2022-06-25 18:27:53', 'ZWMkBShwGPEU0I9xlqt5Rj7panoLCX1YeK2Asr3g4TdHiDbVvmyzfQJu8cFN', 'ODUSOLU', 'OLUWATOSIN', NULL),
(50, 'Wasiuatoyegbe1@gmail.com', NULL, '$2y$10$U7PSL1uog7yeirBwbWyHK.O/ACYK2ioDy.qTQDFRbyQomb2YXA1aq', NULL, '2022-06-21 13:32:06', '2022-06-22 12:50:24', 'wpsP7qQNyjm2MlJe1DAc83dBYbIS9LrKRCkzFixWhtXu4HfGoVg0TEUva65Z', 'Atoyegbe', 'Wasiu', 'Amudaeko01'),
(51, 'Adeniyi_ayodeleoluwafemi@yahoo.com', NULL, '$2y$10$ttMtsXhMgzrz4kVNSfP9i.U83JJtmmCCqCdf/r9HBqRttcmYxQjpa', NULL, '2022-06-21 13:37:44', '2022-06-21 13:43:05', '1TpmPwHbtx7I48h0i69YFK2W3NcJyCXnzovjUfsZDLSlMekQGE5uRgaAqVBd', 'Adeniyi', 'Ayodele', NULL),
(52, 'akeemoluwabunmi@gmail.com', NULL, '$2y$10$9GFWjxmeUPP3DHnxjMfSSuuARbja5NoTxwXtVCDYXRAzQKUOltCwW', NULL, '2022-06-21 14:30:06', '2022-06-21 14:30:37', 'dEbL0XfjrWhAN85CescRyxlDakUz3nJQPgqmpoF4VBZuIiSY2H6M9GTv7w1t', 'Akeem', 'Oluwabunmi', NULL),
(53, 'oladrea@yahoo.com', NULL, '$2y$10$5kYN.uMk/uhKvgvMOdDpXuawsjVoXXdxfHwedUOaDiR0ohFiyf7au', NULL, '2022-06-21 15:49:59', '2022-06-21 15:51:54', 'SwqZPXzpBdWbHlivkgoVjxR1af8tychn5CQENsA6FeJIrDm20KY43TUL9MuG', 'oluwadamilare', 'Adisa', NULL),
(54, 'odusanyaayokunmi19@gmail.com', NULL, '$2y$10$8SNDdc7XiuRdAKPZ0qxRvuojcQOeuF/9lQ.5Dw1NO5E54jugSK00S', NULL, '2022-06-21 15:51:46', '2022-06-21 15:57:42', 'wc8kxpyB92Kd5Lt7M0CY3HlRDSIa46JnvhNArZQj1UmzsbfTWgVEeiuPqXoG', 'Kunmi', 'Klassic', NULL),
(55, 'abatanade@gmail.com', NULL, '$2y$10$Yup5kaFZ4H3bAsDkwuMic.S4w.SCN6jhWrVFAKNShnoyJEpnF6c5i', NULL, '2022-06-21 16:11:13', '2022-06-21 17:29:34', 'f1KFPbCYMulVj2LR9IcxvW43kdzp8gAZJEGS6inwQmheND7asXHqoytUT5rB', 'Abatan', 'Adesola', NULL),
(56, 'sunnyblacka1959@gmail.com', NULL, '$2y$10$ANqrVtNHzakWrLtIRfHuZuPmtcZdl9JAsM2rBeUt6WoKEfi7URXsS', NULL, '2022-06-21 20:38:56', '2022-06-21 20:46:12', 'hAZfwYUeiTVWnvC1JbadBK8rXmcu9SDHE4sg7lGMxINQpFR56ojy0Lt2P3zk', 'Sunny', 'Black', NULL),
(57, 'nnessa345@gmail.com', NULL, '$2y$10$O1CnanW5pPRZX2NGaMRTjOsKqIsTxyl5Ul8vrCC9rHL9cpz8uwIFa', NULL, '2022-06-21 20:50:22', '2022-06-21 20:50:22', 'QmbwAJyVq16fZ34NvlL7Ds8EghTHGXjup20n5tUIikM9arPFceYBoKxdzWRS', 'Morenikeji', 'Oluwatomisin', NULL),
(58, 'Olaitanolatunji1984@gmail.com', NULL, '$2y$10$h9aGKVhAMtleC/ijbkD4pu5bZjbZrYCUngRlYQQHbEeRrwRwcQNOm', NULL, '2022-06-22 02:09:12', '2022-06-22 02:09:22', 'Mr4bXzqYS7eo2UdnBcGECyRWKxfDiZ9gj5vLshV8Qw3NlaPAHTt0kuIp1m6J', 'Olaitan', 'Olatunji', NULL),
(59, 'rachidiadissa@gmail.com', NULL, '$2y$10$D5ElmBbafKnCqxkENf.G.eyIwHqhZV3b9fuOwhAuZyjSKvmTOIO8.', NULL, '2022-06-24 02:54:58', '2022-06-24 03:04:02', '1sDtoHkqzB7uCVAxpMdvWf63GlmR4EXgiwY2ZILeFnKPyajJQ5rU098TcSNb', 'Rachidi', 'Adissa', NULL),
(60, 'ayodelejelilat3@gmail.com', NULL, '$2y$10$hJ/OSmZZD6LO4kN/IydYfODNgBtD0SOOF6b/kH6hpZT.wM9XJ8Hmq', NULL, '2022-06-26 22:10:01', '2022-06-26 22:41:09', 'jMB9Hb0R38xvLeWwslnhUKYI1czuGNTVky5XfoCrpmQdtgZPE2aA67JSi4FD', 'Akintobi', 'Jelilat', NULL),
(61, 'dadasegunresearch2015@yahoo.com', NULL, '$2y$10$ePwYezGwjsdxizTfd0ias.1A0vGc0Rtn6HA8gxV/x95bmQGStqyVO', NULL, '2022-06-26 23:02:19', '2022-06-26 23:03:19', 'RQBkK57wbVMiAYumDyqEln06pf24dsJI1zX3Tt9vgZSWGoFhNHaPxUjL8ceC', 'Segun', 'Dada', NULL),
(62, 'agbolagadeolalekan5@gmail.com', NULL, '$2y$10$cg.lnOMPUO1GzoMtKWB4I.CMfr21Tzr45tYs9GpYlIK41MS8O8k.C', NULL, '2022-06-26 23:46:06', '2022-06-26 23:59:55', '0jJqSfCPknaD8y6xgwsKGiouzM9ZpErAIV1HR5v7UX3LB2c4tmQYlbThWdFN', 'Agbolagade', 'Olalekan', NULL),
(63, 'gbadamosisekinat87@gmail.com', NULL, '$2y$10$2qWdHWqOMVEvPXY7G7qk7eaGQpgTBlS7CmLeAehgMeJUPA3TkGqn2', NULL, '2022-06-27 00:29:54', '2022-06-27 15:18:24', '1mwYDqBzVjPK95Jt7UxLiQINXEZFAMh2vsRoprHc4ngu8bTGd0fC3S6aWylk', 'Sekinat', 'Gbadamosi', NULL),
(64, 'agbajeolufemiisaac@gmail.com', NULL, '$2y$10$EibWKW3z1ZvG1ILWlIVdA.3ZZzJ/NaCLzdEMsQTKlJL.LwWXZ19G2', NULL, '2022-06-27 01:01:46', '2022-06-27 01:02:30', 'C5AYNWQXGfnrxte763liKBUwvuDLqbMg9y41TdjhZJEH2oVSFmRa8ksP0zpc', 'Isacc', 'Olufemi Agbaje', '8955'),
(65, 'blessingbukky47@gmail.com', NULL, '$2y$10$0PLVgqzy4VvrFRxXQuigJu5qV/WGcCgvk0foq3IFINFChxMXy5lrO', NULL, '2022-06-27 02:13:04', '2022-06-29 18:58:19', 'EBdh12fKYMHougWawG3AtJIPU0b9vpyVxzCSe5Rl7NjmckXr4ZqiDT8FLnQs', 'Bukola', 'Blessings', NULL),
(66, 'bensammarketing@gmail.com', NULL, '$2y$10$uoeB5K4rKBqER1LdauF9Yet8v5VxiF98ztN.8c1RTqQJDMcsqTMV2', NULL, '2022-06-27 08:25:18', '2022-06-27 13:22:25', '9RFpeCN7KnTdqvEyIk5Ufr04P6tgDbisXl2G1j3HVMoABczwSaxZhYmWJQLu', 'benedict', 'samson', NULL),
(67, 'olatejubukola45@gmail.com', NULL, '$2y$10$dfrHMw5/obPX6po00NhQHeYxUIE8n0iirAv4CCJQd/INYarcdoZ..', NULL, '2022-06-27 09:20:42', '2022-06-27 09:28:47', 'mG7E5zlVUxBy4ijnghd6s9ACYcXfNFo1kqJep0rZIQ8bWTDMH2aKPRSLwvut', 'Isa', 'Raheem', NULL),
(68, 'enitanaderonke60@gmail.com', NULL, '$2y$10$tka4JedtfkHuzXSPlPk5w.VH1d85Q6Nm1e/7aTqf26YHB9Bq/gHSm', NULL, '2022-06-29 18:57:05', '2022-06-29 20:11:45', 'zJNPj23mDoVgnUI4l0y1MAsrhE8RbZ6KTLqXYdavwQBeFCixptWS7HcfkGu9', 'Esther', 'Aderonke', NULL),
(69, 'ojakovomary980@gmail.com', NULL, '$2y$10$0esnrWqPIX/n4BOs9u3aKeO0ykBgMHDlN8bACAiuMfgSkobCAWpgi', NULL, '2022-07-02 20:25:27', '2022-07-02 20:35:06', 'vmEkjZYsWXcweKqax6rndJuBDN2M79f8hpgytT1PlCGARbIo5iHLU034VzSQ', 'Ojakovo', 'Mary', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_email`, `created_at`, `updated_at`, `status`, `token`) VALUES
(3, 'horphy1@gmail.com', '2022-01-23 02:40:57', '2022-01-27 18:04:52', 'true', 'JZuankeMmb'),
(4, 'mazilab3070@gmail', '2022-01-23 23:19:28', '2022-02-17 23:27:27', 'false', 'z4HpXwnlGS'),
(5, 'review@gmail.com', '2022-01-25 15:53:16', '2022-01-25 15:56:36', 'false', 'UGo9C1t7Bp'),
(6, 'kunlexzy91@gmail.com', '2022-01-25 15:58:24', '2022-01-26 16:14:32', 'true', 'p1KYgekxjF'),
(7, 'info@maxedge.co.uk', '2022-01-25 21:41:48', '2022-01-26 13:34:07', 'true', 'fFgzXn2QxE'),
(8, 'horphy1123@gmail.com', '2022-01-28 19:53:06', '2022-01-28 19:53:27', 'false', 'XMs1T9Afx7'),
(9, 'logiccmpl@gmail.com', '2022-01-28 20:05:07', '2022-01-28 20:08:09', 'true', 'r2NB3kneLU'),
(10, 'ipiletitun@gmail.com', '2022-03-15 22:14:24', '2022-03-15 22:20:48', 'true', '4X0frjl6iJ'),
(11, 'elsiecapitalng@gmail.com', '2022-03-16 12:43:24', '2022-03-16 12:50:58', 'true', 'AQoXwG6pve'),
(12, 'esthertiti85@gmail.com', '2022-04-08 15:51:32', '2022-04-08 16:00:44', 'true', 'caDrBYmFJx'),
(13, 'chosen2xl@gmail.com', '2022-04-13 11:28:11', '2022-04-13 19:06:04', 'true', 'GaR7SuzCVq'),
(14, 'olasamfarm2018@gmail.com', '2022-04-28 00:56:20', '2022-04-28 01:14:00', 'false', 'rTKZc2DNLz'),
(15, 'auduaishat03@gmail.com', '2022-06-04 10:17:30', '2022-06-04 17:25:48', 'false', 'I29diYhMGH'),
(16, 'opeyemitoheeb122@yahoo.com', '2022-06-04 20:28:21', '2022-06-04 20:29:30', 'true', 'AiMW7IQx3l'),
(17, 'golibe2020@gmail.com', '2022-06-10 18:25:03', '2022-06-22 15:08:56', 'false', 'NS7dwDRfIc'),
(18, 'easyboy09051@gmail.com', '2022-06-15 18:05:51', '2022-06-15 18:14:00', 'true', 'hV1BA4lrNM'),
(19, 'alaoadesewa309@gmail.com', '2022-06-15 18:39:06', '2022-06-15 18:47:26', 'true', 'mNdMV7hWlA'),
(20, 'tehingbolajohn@gmail.com', '2022-06-15 23:37:46', '2022-06-15 23:46:56', 'true', 'qMrQBoE6IU'),
(21, 'ardernnigerialimited@gmail.com', '2022-06-16 01:01:04', '2022-06-16 01:06:06', 'true', 'ATHSexF0CZ'),
(22, 'seyijohnson32@gmail.com', '2022-06-16 02:22:05', '2022-06-16 02:27:13', 'false', 'qxfhwX5A13'),
(23, 'ymercy452@gmail.com', '2022-06-16 12:42:42', '2022-06-16 12:53:52', 'true', 'S3Mx9NDygF'),
(24, 'agboolaayobami70@gmail.com', '2022-06-20 01:11:16', '2022-06-20 01:16:35', 'false', '7RBeKnu8qS'),
(25, 'bespashchesy@gmail.com', '2022-06-21 11:44:18', '2022-06-21 11:50:37', 'false', 'xkp3vfi2Zw'),
(26, 'toheebhamzat75@gmail.com', '2022-06-21 12:01:45', '2022-06-27 17:30:55', 'false', 'IKeM6WygJR'),
(27, 'oodusolu12@gmail.com', '2022-06-21 13:30:53', '2022-06-21 14:48:42', 'true', 'I2V5tPDoxw'),
(28, 'Wasiuatoyegbe1@gmail.com', '2022-06-21 13:33:54', '2022-06-21 13:38:55', 'true', '9p51k4fmHN'),
(29, 'Adeniyi_ayodeleoluwafemi@yahoo.com', '2022-06-21 13:38:15', '2022-06-21 13:39:22', 'true', 'V4RqDbIscm'),
(30, 'akeemoluwabunmi@gmail.com', '2022-06-21 14:30:42', '2022-06-21 14:32:20', 'false', 'eB03q4yTzo'),
(31, 'oladrea@yahoo.com', '2022-06-21 15:51:15', '2022-06-21 15:51:42', 'true', 'sP93kmySCL'),
(32, 'odusanyaayokunmi19@gmail.com', '2022-06-21 15:52:25', '2022-06-21 15:58:07', 'false', 'JvePYqxpms'),
(33, 'abatanade@gmail.com', '2022-06-21 16:12:23', '2022-06-21 16:17:26', 'true', 'HqkKbAnN4l'),
(34, 'sunnyblacka1959@gmail.com', '2022-06-21 20:39:36', '2022-06-21 20:44:26', 'true', 'Vm4LYsZ1Br'),
(35, 'menoclockfashion@gmail.com', '2022-06-22 01:48:02', '2022-06-22 01:56:26', 'true', 'ZvxnhrDYKE'),
(36, 'Olaitanolatunji1984@gmail.com', '2022-06-22 02:09:24', '2022-06-22 02:12:31', 'false', 'z2B4rAm9y1'),
(37, 'kunleolaleye@maxedge.co.uk', '2022-06-22 15:13:11', '2022-06-22 15:16:02', 'true', 'F4BgLzanAQ'),
(38, 'rachidiadissa@gmail.com', '2022-06-24 02:56:02', '2022-06-24 03:06:18', 'false', 'Rr36Zdk9oD'),
(39, 'ayodelejelilat3@gmail.com', '2022-06-26 22:10:34', '2022-06-26 22:41:42', 'false', 'RGxYWikKnu'),
(40, 'dadasegunresearch2015@yahoo.com', '2022-06-26 23:02:45', '2022-06-26 23:03:14', 'true', 'LCAmvRJocy'),
(41, 'agbolagadeolalekan5@gmail.com', '2022-06-26 23:46:52', '2022-06-27 00:04:03', 'false', 'RwSqWCzIBb'),
(42, 'gbadamosisekinat87@gmail.com', '2022-06-27 00:30:07', '2022-06-27 00:38:44', 'true', 'Grzd9wFgmL'),
(43, 'agbajeolufemiisaac@gmail.com', '2022-06-27 01:02:37', '2022-06-27 01:04:26', 'false', 'gkKcsXY3Mz'),
(44, 'blessingbukky47@gmail.com', '2022-06-27 02:13:32', '2022-06-29 18:58:35', 'false', 'iPGb73YgHu'),
(45, 'bensammarketing@gmail.com', '2022-06-27 08:25:51', '2022-06-27 13:22:14', 'true', 'D3FwTnHV6k'),
(46, 'olatejubukola45@gmail.com', '2022-06-27 09:21:16', '2022-06-27 21:06:00', 'false', 'JUDNcrb91o'),
(47, 'enitanaderonke60@gmail.com', '2022-06-29 18:57:38', '2022-06-29 20:12:05', 'false', '03jgr9ez2D'),
(48, 'ojakovomary980@gmail.com', '2022-07-02 20:26:04', '2022-07-02 20:35:08', 'false', 'oDEvmVrYLz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_cart_id_unique` (`cart_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_store_id_foreign` (`store_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mails_mail_id_unique` (`mail_id`),
  ADD KEY `mails_sender_foreign` (`sender`),
  ADD KEY `mails_to_foreign` (`to`);

--
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `markets_shop_id_unique` (`Shop_id`),
  ADD UNIQUE KEY `markets_slug_unique` (`Slug`),
  ADD KEY `markets_user_id_index` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `messages_message_id_unique` (`message_id`),
  ADD KEY `messages_mail_id_foreign` (`mail_id`);

--
-- Indexes for table `message_attachments`
--
ALTER TABLE `message_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_attachments_message_id_foreign` (`message_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderbreakdowns`
--
ALTER TABLE `orderbreakdowns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderbreakdowns_product_id_index` (`product_id`),
  ADD KEY `orderbreakdowns_order_id_index` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`),
  ADD KEY `orders_market_id_index` (`market_id`);

--
-- Indexes for table `order_showrooms`
--
ALTER TABLE `order_showrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_showrooms_market_id_foreign` (`market_id`);

--
-- Indexes for table `password_resetns`
--
ALTER TABLE `password_resetns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password_resetns_token_unique` (`token`),
  ADD KEY `password_resetns_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_plan_id_unique` (`plan_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_id_unique` (`Product_id`),
  ADD KEY `products_market_id_index` (`market_id`);

--
-- Indexes for table `store_types`
--
ALTER TABLE `store_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_market_id_index` (`market_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `verifications_user_email_unique` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `message_attachments`
--
ALTER TABLE `message_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orderbreakdowns`
--
ALTER TABLE `orderbreakdowns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_showrooms`
--
ALTER TABLE `order_showrooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `password_resetns`
--
ALTER TABLE `password_resetns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `store_types`
--
ALTER TABLE `store_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message_attachments`
--
ALTER TABLE `message_attachments`
  ADD CONSTRAINT `message_attachments_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`);

--
-- Constraints for table `order_showrooms`
--
ALTER TABLE `order_showrooms`
  ADD CONSTRAINT `order_showrooms_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`);

--
-- Constraints for table `password_resetns`
--
ALTER TABLE `password_resetns`
  ADD CONSTRAINT `password_resetns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_user_email_foreign` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`);