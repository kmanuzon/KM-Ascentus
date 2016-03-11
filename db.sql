CREATE TABLE `eatery_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eatery_owners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eateries` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `city` varchar(255) DEFAULT NULL,
    `state` varchar(255) DEFAULT NULL,
    `type` int(11) unsigned NOT NULL,
    `zip` varchar(255) DEFAULT NULL,
    `owner` int(11) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_type_id` (`type`),
    KEY `fk_owner_id` (`owner`),
    CONSTRAINT `fk_owner_id` FOREIGN KEY (`owner`) REFERENCES `eatery_owners` (`id`),
    CONSTRAINT `fk_type_id` FOREIGN KEY (`type`) REFERENCES `eatery_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `eatery_type`(`id`, `type_name`) VALUES(1, "Bakery");
INSERT INTO `eatery_type`(`id`, `type_name`) VALUES(2, "Restaurant");
INSERT INTO `eatery_type`(`id`, `type_name`) VALUES(3, "Coffee Shop");

INSERT INTO `eatery_owners`(`id`, `first_name`, `last_name`, `phone`) VALUES(1, "Flo", "Smith", "407-985-9556");
INSERT INTO `eatery_owners`(`id`, `first_name`, `last_name`, `phone`) VALUES(2, "Jimmy", "Fallon", "695-595-3521");
INSERT INTO `eatery_owners`(`id`, `first_name`, `last_name`, `phone`) VALUES(3, "Joel", "Monty", "456-652-5223");
INSERT INTO `eatery_owners`(`id`, `first_name`, `last_name`, `phone`) VALUES(4, "James", "Richardson", "625-653-8594");
INSERT INTO `eatery_owners`(`id`, `first_name`, `last_name`, `phone`) VALUES(5, "Richard", "Robins", "745-569-9821");

INSERT INTO `eateries`(`id`, `name`, `city`, `state`, `type`, `zip`, `owner`) VALUES(1, "Flo's Bakery Shop", "Orlando", "FL", 1, "32801", 1);
INSERT INTO `eateries`(`id`, `name`, `city`, `state`, `type`, `zip`, `owner`) VALUES(2, "Jimmy's Cake Salon", "New York", "NY", 1, "10001", 2);
INSERT INTO `eateries`(`id`, `name`, `city`, `state`, `type`, `zip`, `owner`) VALUES(3, "Joel's Steakhouse", "Atlanta", "Georgia", 2, "30301", 3);
INSERT INTO `eateries`(`id`, `name`, `city`, `state`, `type`, `zip`, `owner`) VALUES(4, "James Coffeehouse", "Tampa", "FL", 3, "33614", 4);
INSERT INTO `eateries`(`id`, `name`, `city`, `state`, `type`, `zip`, `owner`) VALUES(5, "The Pit Stop", "San Francisco", "CA", 2, "94101", 5);
