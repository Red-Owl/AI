-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Creato il: Mar 13, 2025 alle 23:50
-- Versione del server: 9.0.1
-- Versione PHP: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `ai_emoji`
--
CREATE DATABASE IF NOT EXISTS `ai_emoji` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ai_emoji`;

-- --------------------------------------------------------

--
-- Struttura della tabella `generated_data`
--

CREATE TABLE `generated_data` (
  `HJ` bigint UNSIGNED NOT NULL,
  `hj_blob` mediumblob NOT NULL,
  `hj_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hj_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='immagini con trasparenza';

-- --------------------------------------------------------

--
-- Struttura della tabella `generated_data_background`
--

CREATE TABLE `generated_data_background` (
  `HF` bigint UNSIGNED NOT NULL,
  `hf_blob` mediumblob NOT NULL COMMENT 'immagine con background',
  `hf_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hf_id` bigint UNSIGNED NOT NULL COMMENT ' relazione generated_images.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='che hanno lo sfondo';

-- --------------------------------------------------------

--
-- Struttura della tabella `generated_images`
--

CREATE TABLE `generated_images` (
  `id` bigint UNSIGNED NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `negative_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `seed` bigint DEFAULT NULL,
  `num_steps` int DEFAULT NULL,
  `guidance_scale` float DEFAULT NULL,
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rembg` tinyint(1) DEFAULT '0',
  `ai_ut` bigint UNSIGNED DEFAULT NULL,
  `rembg_params` json DEFAULT NULL,
  `lora_scale` float NOT NULL DEFAULT '0.8',
  `id_mode` char(1) DEFAULT 'T',
  `ai_model` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `generated_input`
--

CREATE TABLE `generated_input` (
  `EF` bigint UNSIGNED NOT NULL,
  `ef_blob` mediumblob NOT NULL,
  `ef_time` datetime NOT NULL,
  `ef_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='user input image';

-- --------------------------------------------------------

--
-- Struttura della tabella `generated_prompt`
--

CREATE TABLE `generated_prompt` (
  `XV` bigint UNSIGNED NOT NULL,
  `xv_xf` bigint UNSIGNED NOT NULL COMMENT 'modello',
  `xv_before` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xv_post` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xv_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `xv_negative` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `xv_step` tinyint UNSIGNED NOT NULL,
  `xv_guidance` decimal(4,2) UNSIGNED NOT NULL,
  `xv_height` smallint UNSIGNED NOT NULL,
  `xv_width` smallint UNSIGNED NOT NULL,
  `xv_rembg` int NOT NULL,
  `xv_lorascale` decimal(4,2) NOT NULL,
  `xv_info` text,
  `xv_url` text,
  `xv_placeholder` tinytext,
  `xv_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='setting enable correct model lora';

-- --------------------------------------------------------

--
-- Struttura della tabella `generated_script`
--

CREATE TABLE `generated_script` (
  `XF` bigint UNSIGNED NOT NULL,
  `xf_filecode` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `xf_fleg` char(1) DEFAULT NULL,
  `xf_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='script python working';

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `generated_data`
--
ALTER TABLE `generated_data`
  ADD PRIMARY KEY (`HJ`),
  ADD UNIQUE KEY `hj_id` (`hj_id`),
  ADD KEY `fk_generated_images` (`hj_id`);

--
-- Indici per le tabelle `generated_data_background`
--
ALTER TABLE `generated_data_background`
  ADD PRIMARY KEY (`HF`),
  ADD KEY `hf_id` (`hf_id`);

--
-- Indici per le tabelle `generated_images`
--
ALTER TABLE `generated_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ai_model` (`ai_model`);

--
-- Indici per le tabelle `generated_input`
--
ALTER TABLE `generated_input`
  ADD PRIMARY KEY (`EF`),
  ADD UNIQUE KEY `ef_id_2` (`ef_id`),
  ADD KEY `ef_id` (`ef_id`);

--
-- Indici per le tabelle `generated_prompt`
--
ALTER TABLE `generated_prompt`
  ADD PRIMARY KEY (`XV`),
  ADD KEY `xv_xf` (`xv_xf`);

--
-- Indici per le tabelle `generated_script`
--
ALTER TABLE `generated_script`
  ADD PRIMARY KEY (`XF`),
  ADD UNIQUE KEY `xf_filecode` (`xf_filecode`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `generated_data`
--
ALTER TABLE `generated_data`
  MODIFY `HJ` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `generated_data_background`
--
ALTER TABLE `generated_data_background`
  MODIFY `HF` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `generated_images`
--
ALTER TABLE `generated_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `generated_input`
--
ALTER TABLE `generated_input`
  MODIFY `EF` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `generated_prompt`
--
ALTER TABLE `generated_prompt`
  MODIFY `XV` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `generated_script`
--
ALTER TABLE `generated_script`
  MODIFY `XF` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `generated_data`
--
ALTER TABLE `generated_data`
  ADD CONSTRAINT `fk_generated_images` FOREIGN KEY (`hj_id`) REFERENCES `generated_images` (`id`);

--
-- Limiti per la tabella `generated_data_background`
--
ALTER TABLE `generated_data_background`
  ADD CONSTRAINT `generated_data_background_ibfk_1` FOREIGN KEY (`hf_id`) REFERENCES `generated_images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `generated_input`
--
ALTER TABLE `generated_input`
  ADD CONSTRAINT `generated_input_ibfk_1` FOREIGN KEY (`ef_id`) REFERENCES `generated_images` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;
