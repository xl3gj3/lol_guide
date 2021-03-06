create database lol_guide;

CREATE TABLE `build_guide` (
  `build_id` int(11) NOT NULL auto_increment,
  `champion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_create` datetime not null default '0000-00-00',
  `build_name` varchar(256) NOT NULL,
  `skin_id` int(11) NOT NULL,
  `update_time` datetime not null default '0000-00-00',
  PRIMARY KEY  (`build_id`),
  FOREIGN KEY (`champion_id`) REFERENCES champions (champion_id) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES user (user_id) ON DELETE CASCADE
) ENGINE=Innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(128) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=Innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `spell_set` (
  `spell_set_id` int(11) NOT NULL auto_increment,
  `build_id` int(11) NOT NULL,
  `spell_id_1` int(11) NOT NULL,
  `spell_id_2` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY  (`spell_set_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `rune_set` (
  `rune_set_id` int(11) NOT NULL auto_increment,
  `build_id` int(11) NOT NULL,
  `primary` varchar(128),
  `secondary` varchar(128),
  `note_id` int(11) NOT NULL,
  PRIMARY KEY  (`rune_set_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `item_set` (
  `item_set_id` int(11) NOT NULL auto_increment,
  `build_id` int(11) NOT NULL,
  `set_name` varchar(64) NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY  (`item_set_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `item_detail_set` (
  `detail_id` int(11) NOT NULL auto_increment,
  `item_set_id` int(11) NOT NULL,
  `items` TEXT NOT NULL,
  PRIMARY KEY  (`detail_id`),
  FOREIGN KEY (`item_set_id`) REFERENCES item_set(item_set_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `against_champion` (
  `against_id` int(11) NOT NULL auto_increment,
  `build_id` int(11) NOT NULL,
  `champion_id` int(11) NOT NULL,
  `diffculty` tinyint UNSIGNED default 1 NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY  (`against_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `skill_order_table` (
  `order_id` int(11) NOT NULL auto_increment,
  `build_id` int(11) NOT NULL,
  `order_list` varchar(128),
  `note_id` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*skill enum*/
/*move background to build, 1 build 1 skin*/
CREATE TABLE `skin` (
  `db_skin_id` int(11) NOT NULL auto_increment,
  `skin_id` int(11) NOT NULL,
  `champion_id` int(11) NOT NULL,
  PRIMARY KEY  (`db_skin_id`),
  FOREIGN KEY (`champion_id`) REFERENCES champions(champion_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `skill_order_link_to_note` (
  `skill_order_id` int(11) NOT NULL auto_increment,
  `build_id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY  (`skill_order_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE,
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `spell` (
  `spell_id` int(11) NOT NULL,
  `spell_name` varchar(64) NOT NULL,
  `spell_data` TEXT NOT NULL,
  PRIMARY KEY  (`spell_id`)
) ENGINE=innodb DEFAULT CHARSET=latin1;

CREATE TABLE `champions` (
  `champion_id` int(11) NOT NULL,
  `champion_name` varchar(64) NOT NULL,
  `data` TEXT NOT NULL,
  PRIMARY KEY  (`champion_id`)
) ENGINE=innodb DEFAULT CHARSET=latin1;

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `base_cost` int(11) NOT NULL,
  `sell_price` int(11) NOT NULL,
  `description` TEXT NOT NULL,
  `tags` TEXT NOT NULL,
  `_from_` varchar(128) NOT NULL,
  `_into_` varchar(128) NOT NULL,
  PRIMARY KEY  (`item_id`)
) ENGINE=innodb DEFAULT CHARSET=latin1;

CREATE TABLE `runes` (
  `rune_id` int(11) NOT NULL auto_increment,
  `rune_name` varchar(128),
  `description` varchar(512),
  `type` enum('keystone', 'tier1', 'tier2', 'tier3') not null default 'tier3',
  `category` enum('precision','domination','sorcery','resolve','inspiration') not null default 'precision',
  PRIMARY KEY  (`rune_id`),
  key `type` (`type`),
  key `category` (`category`)
) ENGINE=innodb DEFAULT CHARSET=latin1;

CREATE TABLE `note` (
  `note_id` int(11) NOT NULL auto_increment,
  `note` TEXT NOT NULL,
  `build_id` int(11) NOT NULL,
  PRIMARY KEY (`note_id`),
  FOREIGN KEY (`build_id`) REFERENCES build_guide(build_id) ON DELETE CASCADE
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

/*
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=innodb AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
*/



CREATE TABLE `runes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128),
  `description` varchar(512),
  `type` enum('keystone', 'tier1', 'tier2', 'tier3') not null default 'tier3',
  `category` enum('precision','domination') not null default 'precision',
  PRIMARY KEY  (`id`),
  key `type` (`type`),
  key `category` (`category`),
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

select * from runes where category='precision' and type='tier1';

--
-- [keystone id]-[tier1]-[tier2]-[tier3]
-- $runeSet = [
--    1,
--    3,
--    7,
--    9
-- ]
-- implode('-',$runeSet)
-- explode('-',$data['primary'])
