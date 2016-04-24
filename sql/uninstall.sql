--
-- Uninstall Testomania plugin tables
--
-- Created 24.04.2016
--

--
-- Drop table `prefix_testomania_questions`
--

DROP TABLE IF EXISTS `prefix_testomania_questions`;

--
-- Drop table `prefix_testomania_results`
--

DROP TABLE IF EXISTS `prefix_testomania_results`;

--
-- Drop table `prefix_testomania_tests`
--

DROP TABLE IF EXISTS `prefix_testomania_tests`;

--
-- Drop table `prefix_testomania_variants`
--

CREATE TABLE IF EXISTS `prefix_testomania_variants`;
