-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 09, 2023 at 02:28 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `practical`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `created_at`, `updated_at`) VALUES
(2, 5, 53, 'This is a content comment priya.', '2023-10-09 03:29:17', '2023-10-09 03:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likeables`
--

CREATE TABLE `likeables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `like_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likeables`
--

INSERT INTO `likeables` (`id`, `like_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 49, 'App\\Models\\Post', NULL, NULL),
(2, 2, 49, 'App\\Models\\Post', NULL, NULL),
(3, 3, 49, 'App\\Models\\Post', NULL, NULL),
(4, 4, 2, 'App\\Models\\Comment', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
(3, 5, 50, 'posts', '2023-10-09 06:04:48', '2023-10-09 06:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_07_064624_create_posts_table', 1),
(7, '2023_10_07_064625_create_comments_table', 1),
(8, '2023_10_07_064626_create_likes_table', 1),
(9, '2023_10_07_071701_create_likeables_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'API TOKEN', '97083395504db873b3b18ae77e1e9adfd9896a691158c1f8bd498022b024778c', '[\"*\"]', NULL, NULL, '2023-10-09 03:27:35', '2023-10-09 03:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `image`, `created_at`, `updated_at`) VALUES
(4, 15, 'Quasi in et incidunt quis voluptatem. Est ea quaerat quo ut magnam velit quibusdam. Ut quis error sunt qui.', 'https://via.placeholder.com/640x480.png/002266?text=veritatis', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(5, 16, 'Dolores ad a possimus officiis. Eius et quia libero molestiae. Velit aliquid esse expedita dolores corporis.', 'https://via.placeholder.com/640x480.png/0033bb?text=odit', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(6, 17, 'Ipsa accusamus quia qui. Sunt excepturi voluptas cupiditate animi quo. Et aut doloremque nobis velit dolor.', 'https://via.placeholder.com/640x480.png/001188?text=quidem', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(7, 18, 'Praesentium quis aliquid consequatur illo dolor saepe. Id aut dolorum labore omnis. Aut officia hic qui odio sint porro quaerat. Aut aliquid eius est est voluptatem ut.', 'https://via.placeholder.com/640x480.png/000077?text=pariatur', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(8, 19, 'Occaecati quam ea fugiat est doloremque. Facilis magnam rerum quam et. Nihil itaque nihil suscipit distinctio recusandae aut. Temporibus ex quam maiores qui sit vitae.', 'https://via.placeholder.com/640x480.png/00bb44?text=iste', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(9, 20, 'Et quod illo repellendus quasi assumenda. Explicabo voluptate quia non consequatur eligendi itaque nemo quam. Nemo quos nostrum quasi qui. Aut voluptas ipsa nihil quis veniam deleniti dignissimos.', 'https://via.placeholder.com/640x480.png/000077?text=placeat', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(10, 21, 'Dolor voluptatem aut amet ullam. Impedit facilis iusto nesciunt earum sit fuga ducimus. Non et sunt qui. Modi veniam et sapiente sed aliquam magnam ad praesentium.', 'https://via.placeholder.com/640x480.png/005544?text=voluptas', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(11, 22, 'Est quis voluptas rerum quod. Fugit illo incidunt voluptatem. Esse iure quo cupiditate consequatur eum perspiciatis culpa.', 'https://via.placeholder.com/640x480.png/008888?text=non', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(12, 23, 'In labore id amet deleniti totam. Sed quibusdam et rerum qui. Ipsum deleniti quia vero temporibus nobis.', 'https://via.placeholder.com/640x480.png/00cc44?text=tempora', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(13, 24, 'Labore eveniet consectetur rerum quo soluta. Aspernatur doloribus ipsam distinctio magni voluptatem minima. Aliquam commodi ea id blanditiis et. Dicta iure corrupti nam voluptatibus dignissimos.', 'https://via.placeholder.com/640x480.png/00ff77?text=alias', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(14, 25, 'Corrupti et dolorem sit non. Voluptas vitae sint minus non omnis velit. Mollitia voluptas sed praesentium quae deserunt et consectetur. Est sint modi ducimus minus cumque.', 'https://via.placeholder.com/640x480.png/0044aa?text=ullam', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(15, 26, 'Itaque rerum labore pariatur vero doloremque tenetur. Aut voluptatem et saepe atque ipsum.', 'https://via.placeholder.com/640x480.png/0000aa?text=quia', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(16, 27, 'Nemo et optio suscipit a sed placeat eius. Dicta reprehenderit dolorem soluta odit corrupti quia. Corporis accusamus accusamus repellendus libero placeat molestiae perspiciatis aut. Placeat beatae repudiandae aut.', 'https://via.placeholder.com/640x480.png/0055ee?text=eius', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(17, 28, 'Dignissimos et sit laborum nisi. Doloribus accusamus laudantium est aliquam omnis occaecati et. Amet corporis est doloribus est debitis est.', 'https://via.placeholder.com/640x480.png/00aabb?text=et', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(18, 29, 'Impedit expedita et minima ut nulla error aliquam. Nihil quos animi ea voluptate quia. Dolorum quia in atque provident. Sint earum nisi reiciendis iste omnis aliquid.', 'https://via.placeholder.com/640x480.png/00bbbb?text=error', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(19, 30, 'Nesciunt nam numquam beatae. Necessitatibus consequatur quis nam enim facere sit quod.', 'https://via.placeholder.com/640x480.png/00ff55?text=amet', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(20, 31, 'Laborum sapiente excepturi magnam officia odio molestiae aliquid ut. Dignissimos id eos amet ea laudantium. Ut ipsam neque quam distinctio eveniet sed odit saepe. Provident saepe ullam libero. Laboriosam tempora quaerat accusamus corporis.', 'https://via.placeholder.com/640x480.png/0022aa?text=deleniti', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(21, 32, 'Odio sed sunt repellendus dolorem molestias. Officia doloribus sunt animi. Autem aut voluptatem quisquam nesciunt.', 'https://via.placeholder.com/640x480.png/006699?text=aut', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(22, 33, 'Sequi neque deserunt enim ipsa dolorum qui ut. Sit non consequuntur sed qui qui ad. Ipsam ea rerum pariatur odit animi sit. Illo ipsam blanditiis iure.', 'https://via.placeholder.com/640x480.png/005599?text=saepe', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(23, 34, 'Eos non sed quia porro est perspiciatis. Sapiente culpa consequatur delectus delectus. Non ab perferendis voluptatibus rerum recusandae. Adipisci quis deserunt alias aut.', 'https://via.placeholder.com/640x480.png/0099ff?text=repellendus', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(24, 35, 'Voluptas officiis unde omnis voluptatum et reiciendis ipsam. Repudiandae ad omnis dolore beatae illum. Ipsum laboriosam dolores ratione non. Blanditiis necessitatibus doloribus deleniti voluptatem dignissimos.', 'https://via.placeholder.com/640x480.png/004411?text=omnis', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(25, 36, 'Beatae molestiae hic ea cumque velit. Et eum eius non soluta iure ipsam ipsa. Esse accusantium et ad hic et ut earum.', 'https://via.placeholder.com/640x480.png/00ff22?text=enim', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(26, 37, 'Nisi illum quia eos. Error possimus facilis odio dolor totam eos quaerat.', 'https://via.placeholder.com/640x480.png/0077bb?text=labore', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(27, 38, 'Rem omnis et esse voluptatem saepe distinctio ab. Repellendus fugiat sed ex rerum sequi officia praesentium. Exercitationem qui qui saepe alias consequatur dignissimos. Rerum similique aut quo et rerum magni illo.', 'https://via.placeholder.com/640x480.png/0000dd?text=maiores', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(28, 39, 'Ex numquam voluptas qui asperiores rerum vel sunt. Sunt exercitationem in veniam culpa quisquam dicta inventore est. Magni enim nam harum repellat et et ducimus optio. Fugit sed debitis occaecati ea. Cupiditate consectetur reprehenderit quos consequuntur.', 'https://via.placeholder.com/640x480.png/003311?text=iste', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(29, 40, 'Consequatur et corporis aut quia eveniet suscipit nesciunt. Eum hic iure doloribus. Rerum doloremque ex delectus cumque delectus cum.', 'https://via.placeholder.com/640x480.png/006688?text=corrupti', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(30, 41, 'Non nemo libero velit commodi optio pariatur. Nesciunt nostrum autem nesciunt quia. Non sed harum quis ad rerum. Aut quos dolor provident eum. Mollitia enim et et accusantium voluptas provident.', 'https://via.placeholder.com/640x480.png/00eeaa?text=aperiam', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(31, 42, 'Facilis ab veniam dolores. Consequatur odio unde aut. Quasi cum sunt velit perferendis maxime cupiditate.', 'https://via.placeholder.com/640x480.png/00cc33?text=libero', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(32, 43, 'Aut velit adipisci hic fuga sunt ut. Rerum voluptatibus quas et et non. Sint quae debitis non animi cupiditate laudantium.', 'https://via.placeholder.com/640x480.png/004455?text=quasi', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(33, 44, 'Mollitia quia quam reprehenderit unde non cumque ea. Asperiores et vero quo aspernatur sit numquam. Et eligendi aperiam harum omnis sed consequatur aut voluptatem.', 'https://via.placeholder.com/640x480.png/001155?text=aspernatur', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(34, 45, 'Dolorem assumenda aperiam alias ea nihil ex impedit. Quasi nihil qui et. Unde eveniet harum repudiandae.', 'https://via.placeholder.com/640x480.png/0044cc?text=et', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(35, 46, 'Dolor sed minima sed vel corporis. Suscipit fugit itaque ipsam accusamus quidem. Consectetur eum vero atque tenetur in cumque facilis. Omnis eos repellat molestiae iste.', 'https://via.placeholder.com/640x480.png/009988?text=eum', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(36, 47, 'Nesciunt numquam placeat quibusdam veritatis distinctio. Sint velit aut deleniti totam. Et sequi nihil consectetur provident et cum aut dolorem.', 'https://via.placeholder.com/640x480.png/004466?text=ut', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(37, 48, 'Nulla placeat rerum impedit sit pariatur. Placeat maxime voluptatum maxime unde. Blanditiis qui quidem ad officiis itaque occaecati vel. Necessitatibus ipsa quasi veniam qui minus sit ut tenetur.', 'https://via.placeholder.com/640x480.png/001144?text=omnis', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(38, 49, 'Voluptatibus quae neque nihil quia consectetur nesciunt. Rerum consectetur ipsam aspernatur corporis tenetur sunt pariatur consequatur. Qui ab dolores unde dolor est. Ipsam dignissimos aut omnis odit ab in maxime. Necessitatibus recusandae et consequatur et reprehenderit qui.', 'https://via.placeholder.com/640x480.png/009966?text=doloribus', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(39, 50, 'In dolorum quia quia. Nisi iusto aperiam ut. Voluptas laudantium inventore quia ducimus. Autem voluptatem eos rerum architecto velit sit.', 'https://via.placeholder.com/640x480.png/007722?text=quidem', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(40, 51, 'Illum est molestiae eius dicta et. Voluptatibus sed et assumenda iste quas.', 'https://via.placeholder.com/640x480.png/0044ff?text=omnis', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(41, 52, 'Fugiat ad ea ut. Consequatur temporibus est maiores amet debitis. Quisquam sed ut non.', 'https://via.placeholder.com/640x480.png/009988?text=ipsum', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(42, 53, 'Optio qui quis aut ex error. Et aut deserunt veniam iure et sequi. Nam pariatur quis quisquam ut ut quae. Qui dolorem non cum velit ducimus.', 'https://via.placeholder.com/640x480.png/007722?text=dolorem', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(43, 54, 'Numquam quas ut reprehenderit amet numquam culpa voluptas. Hic nobis dolorem tempora quam vel. Nisi soluta ea nobis sunt corporis dicta cumque.', 'https://via.placeholder.com/640x480.png/005577?text=ipsum', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(44, 55, 'Repellat explicabo suscipit omnis molestias. Et tempore dolor alias nulla voluptatem sunt nemo. Earum a repudiandae quo voluptatum vero enim ex sit.', 'https://via.placeholder.com/640x480.png/0011cc?text=adipisci', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(45, 56, 'Aut qui quam nemo magnam assumenda. Vitae eos tempore sit nesciunt. Quis molestias quod voluptatem voluptatem qui occaecati reprehenderit. Libero exercitationem qui non ipsum.', 'https://via.placeholder.com/640x480.png/00dd22?text=ea', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(46, 57, 'Alias nisi qui quos occaecati. Ipsam nihil quas exercitationem tempore qui dolorem et. Tempore repellendus nesciunt recusandae. Reiciendis et debitis earum a dolor totam doloribus.', 'https://via.placeholder.com/640x480.png/00aaaa?text=ut', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(47, 58, 'Qui et voluptas nulla qui enim. Impedit dolorem cum debitis autem unde aliquid. Cumque itaque occaecati est sed nemo similique. Dolorum quia quia nulla aliquam.', 'https://via.placeholder.com/640x480.png/00aa11?text=consequatur', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(48, 59, 'Non assumenda velit tenetur voluptatibus. Deleniti reprehenderit necessitatibus iusto aut hic ut temporibus. Similique quasi accusantium id perferendis. Perferendis eum et quia harum.', 'https://via.placeholder.com/640x480.png/0033aa?text=officiis', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(49, 60, 'Autem sit veniam omnis incidunt dolore ab odio. Quia tempore porro deserunt dolorem inventore. Nobis aspernatur magnam accusantium rerum.', 'https://via.placeholder.com/640x480.png/0066cc?text=enim', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(50, 61, 'Nostrum corporis eum et placeat. Eligendi totam aut accusantium illo rerum sequi voluptatem. Iusto nihil omnis consequatur exercitationem iste magni natus. Optio tempora praesentium aut.', 'https://via.placeholder.com/640x480.png/00aaff?text=nihil', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(51, 62, 'Quam quo optio quaerat ut repellendus libero enim assumenda. Ut voluptatum eos deserunt et neque ex. Vitae expedita est est sint. Soluta cum autem facilis beatae.', 'https://via.placeholder.com/640x480.png/00cc77?text=et', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(52, 63, 'Consequuntur ab omnis dolorum accusamus provident. Rem voluptatem omnis reiciendis praesentium et temporibus. Non ipsum nobis porro voluptatem commodi. Commodi natus sed occaecati ut. Quisquam veniam quod soluta hic.', 'https://via.placeholder.com/640x480.png/00ccaa?text=consectetur', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(53, 64, 'Et recusandae quas repellendus amet quod. Dolores rerum laboriosam odio architecto dolorem sed. Hic optio illo animi iure deleniti voluptas. Est qui quis amet quibusdam beatae consequatur qui et.', 'https://via.placeholder.com/640x480.png/0066dd?text=distinctio', '2023-10-09 03:20:51', '2023-10-09 03:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Dr. Delaney Lakin', 'priya@gmail.com', '2023-10-09 03:20:50', '$2a$12$0OQ4.INyWPbwEXcCut9C4ebDtJvkqMajJp7oWNUeajte5Ub5rgStm', 'OvRRCYHWtM', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(6, 'Ms. Kellie Steuber', 'rippin.noemie@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MMnzcRItcK', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(7, 'Prof. Ferne McKenzie Jr.', 'marks.aiyana@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wvCIg6OjFr', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(8, 'Rafael Harris I', 'jacobson.rowan@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ciOxOhUg3o', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(9, 'Fanny Skiles', 'marquardt.ellen@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vNadvpm7RO', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(10, 'Gerard Abshire', 'cole.aufderhar@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'unDDz6ofsb', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(11, 'Mrs. Daija Abbott I', 'jarred.feeney@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UrMG7GaR6f', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(12, 'Dallin Koss MD', 'corkery.anya@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HCNpo8lOvt', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(13, 'Savannah Armstrong', 'burnice31@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 't9oSeOSxgw', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(14, 'Dewayne D\'Amore', 'sydni28@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RX3UE8zsUM', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(15, 'Daren Dare', 'roob.dameon@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0wDdpfgv9i', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(16, 'Jamie Huel', 'kory.bosco@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Pr0RBRjBQi', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(17, 'Dr. Clifford Stroman', 'amya.hand@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TVQ8MqmiHL', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(18, 'Dr. Esteban Feil IV', 'evalyn.sipes@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tC1iNYL3qk', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(19, 'Vinnie Ortiz', 'shaina.bradtke@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'slakl9th5M', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(20, 'Emmanuel Marks', 'ksenger@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SqEVdCjhcS', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(21, 'Rosalinda Terry', 'faye76@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OokFMTcDSI', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(22, 'Dr. Marlee McCullough', 'margarete33@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8EHY6NMoOi', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(23, 'Fabian Metz', 'edach@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4p6KfO4OBV', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(24, 'Cierra Wisoky', 'lea.gerlach@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1FbJUxgQtj', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(25, 'Curtis Waters', 'nflatley@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'J0FTRkX0QG', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(26, 'Mason Mayert', 'ovonrueden@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dxgZqlZj87', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(27, 'Mikel Grady DVM', 'felipa.cummings@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'whAlbNfQIQ', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(28, 'Terrance Aufderhar', 'emely.gutmann@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kQsUrJQ9bM', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(29, 'Prof. Kaycee Lehner', 'marina.schmitt@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RT9oZhehhy', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(30, 'Jessica Block IV', 'dillon59@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iBQdBgkBNG', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(31, 'Damaris McDermott', 'verna.senger@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xCeEAmVwXG', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(32, 'Uriah Fay', 'lspinka@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lfAey2kqyq', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(33, 'Kevon Ledner', 'samanta53@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lUEafl1Rlk', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(34, 'Prof. Alfonzo Kohler MD', 'virginia80@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TdJVww8MYU', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(35, 'Valentine Cronin', 'sfranecki@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vbaCn1a6xq', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(36, 'Jairo Kihn', 'lance02@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'clqynHSqDR', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(37, 'Dr. Tommie Morissette III', 'crooks.elinor@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6zARRWbnQl', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(38, 'Garnet Jakubowski', 'nstanton@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'i12q1gdR8w', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(39, 'Domenico Schoen', 'mariana51@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zZenZtIgcg', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(40, 'Dr. Myah Gutkowski', 'addison80@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Y2exQzV15v', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(41, 'Tomas Crooks', 'albin.dickinson@example.org', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Dj1Deaj9Im', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(42, 'Linwood Wilderman', 'mledner@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Y6ADqTdVMr', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(43, 'Carmella Cassin', 'leda.jacobson@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'd6i8pjnziM', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(44, 'Wellington Wunsch', 'quigley.earl@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BBlfRy94Mr', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(45, 'Jamey Franecki', 'renee63@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '06gBkfo879', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(46, 'Annette Stanton', 'dwight52@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GeM5i401uq', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(47, 'Ms. Zula Thompson DVM', 'jaquelin.halvorson@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2IRr34nIg0', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(48, 'Miss Icie Hamill III', 'hagenes.beaulah@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CuX0RBjzxx', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(49, 'Zoey Funk', 'hirthe.florian@example.com', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3RotOY4r0S', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(50, 'Jaunita Grimes', 'morar.jerad@example.net', '2023-10-09 03:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9wIuqbtHWJ', '2023-10-09 03:20:50', '2023-10-09 03:20:50'),
(51, 'Kirk Schmidt', 'feil.bianka@example.org', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5a9DKXWAIF', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(52, 'Ms. Asa Kovacek', 'gveum@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JC7ODPE2mP', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(53, 'Caden Osinski', 'qleffler@example.org', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VEq3ac0LW6', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(54, 'Odessa McDermott', 'elmore55@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bbHDIkvLNm', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(55, 'Miss Raphaelle Sipes', 'pjacobson@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3wDHQRASKf', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(56, 'Lucie Rosenbaum Jr.', 'eve91@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uC4fGkSpXz', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(57, 'Mrs. Destini Leannon', 'emma14@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uZDTlJFNUh', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(58, 'Rebecca Considine', 'rreichel@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fBrICJwGWR', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(59, 'Glenda Wehner DDS', 'ptorphy@example.com', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Cvgf70zjbT', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(60, 'Hester Roberts', 'oreilly.genevieve@example.org', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OzNGpeEhHq', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(61, 'Dayna Mayert', 'flatley.vivian@example.net', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tnTEOodZay', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(62, 'Willis Ritchie', 'yschneider@example.net', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qiU42AOz0t', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(63, 'Prof. Niko Okuneva', 'dax09@example.org', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iEg77IqXqe', '2023-10-09 03:20:51', '2023-10-09 03:20:51'),
(64, 'Frederik Lind', 'sister.cronin@example.net', '2023-10-09 03:20:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mfQqK0BrCm', '2023-10-09 03:20:51', '2023-10-09 03:20:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likeables`
--
ALTER TABLE `likeables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_likeable_id_likeable_type_index` (`likeable_id`,`likeable_type`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likeables`
--
ALTER TABLE `likeables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
