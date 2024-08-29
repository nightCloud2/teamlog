CREATE TABLE `tag` (
                       `sn`	bigint	NOT NULL,
                       `contents`	varchar(25)	NULL,
                       `state`	char(1)	NULL	DEFAULT 'Y',
                       `first_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                       `first_idno` varchar(10) NOT NULL,
                       `last_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                       `last_idno` varchar(10) NOT NULL
);

ALTER TABLE `tag` ADD CONSTRAINT `PK_TAG` PRIMARY KEY (
                                                       `sn`
    );

CREATE TABLE `community_tag` (
                                 `post_no`	bigint	NOT NULL,
                                 `tag_no`	bigint	NOT NULL,
                                 `first_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 `first_idno` varchar(10) NOT NULL,
                                 `last_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 `last_idno` varchar(10) NOT NULL
);

ALTER TABLE `community_tag` ADD CONSTRAINT `PK_COMMUNITY_TAG` PRIMARY KEY (
                                                                           `post_no`
    );

CREATE TABLE `sale_tag` (
                                 `sal_no`	bigint	NOT NULL,
                                 `tag_no`	bigint	NOT NULL,
                                 `first_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 `first_idno` varchar(10) NOT NULL,
                                 `last_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 `last_idno` varchar(10) NOT NULL
);

ALTER TABLE `sale_tag` ADD CONSTRAINT `PK_SALE_TAG` PRIMARY KEY (
                                                                           `sal_no`
    );

ALTER TABLE `community_tag` ADD CONSTRAINT `FK_post_TO_community_tag_1` FOREIGN KEY (
                                                                                     `post_no`
    ) REFERENCES `post` (`sn`);

ALTER TABLE `community_tag` ADD CONSTRAINT `FK_tag_TO_community_tag_1` FOREIGN KEY (
                                                                                     `tag_no`
    ) REFERENCES `tag` (`sn`);

ALTER TABLE `sale_tag` ADD CONSTRAINT `FK_sale_TO_community_tag_1` FOREIGN KEY (
                                                                                     `sal_no`
    ) REFERENCES `sale` (`sn`);

ALTER TABLE `sale_tag` ADD CONSTRAINT `FK_tag_TO_sale_tag_1` FOREIGN KEY (
                                                                                    `tag_no`
    ) REFERENCES `tag` (`sn`);
