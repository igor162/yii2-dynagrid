/**
 * @package   yii2-dynagrid
 * @author    Kartik Visweswaran <kartikv2@gmail.com>
 * @copyright Copyright &copy; Kartik Visweswaran, Krajee.com, 2015
 * @version   1.4.1
 */
--
-- Table structure for table `tbl_dynagrid`
--
DROP TABLE IF EXISTS `tbl_dynagrid`;
CREATE TABLE `tbl_dynagrid` (
  `id` varchar(100) NOT NULL COMMENT 'Уникальный id',
  `filter_id` varchar(100) COMMENT 'id фильтра',
  `sort_id` varchar(100) COMMENT 'id сортировки',
  `data` varchar(5000) DEFAULT NULL COMMENT 'Json закодированные данные для настройки dynagrid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dynagrid настройки персонализации';

--
-- Table structure for table `tbl_dynagrid_dtl`
--
DROP TABLE IF EXISTS `tbl_dynagrid_dtl`;
CREATE TABLE `tbl_dynagrid_dtl` (
  `id` varchar(100) NOT NULL COMMENT 'Уникальный id',
  `category` varchar(10) NOT NULL COMMENT 'Dynagrid детальные настройки категорий "фильтра" или "сортировки"',
  `name` varchar(150) NOT NULL COMMENT '"Имя" для детальной настройки dynagrid',
  `data` varchar(5000) DEFAULT NULL COMMENT 'Json закодированные данные для детальной настройки dynagrid',
  `dynagrid_id` varchar(100) NOT NULL COMMENT 'Связанный id dynagrid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_dynagrid_dtl_UK1` (`name`,`category`,`dynagrid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dynagrid детальные настройки';

ALTER TABLE `tbl_dynagrid`
ADD CONSTRAINT `tbl_dynagrid_FK1` 
FOREIGN KEY (`filter_id`) 
REFERENCES `tbl_dynagrid_dtl` (`id`) 
, ADD INDEX `tbl_dynagrid_FK1` (`filter_id` ASC);

ALTER TABLE `tbl_dynagrid`
ADD CONSTRAINT `tbl_dynagrid_FK2` 
FOREIGN KEY (`sort_id`) 
REFERENCES `tbl_dynagrid_dtl` (`id`) 
, ADD INDEX `tbl_dynagrid_FK2` (`sort_id` ASC);
