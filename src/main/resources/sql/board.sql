CREATE TABLE `board`(
    `bno` INT NOT NULL AUTO_INCREMENT,
    `member_id` VARCHAR(20) NOT NULL ,
    `name` VARCHAR(10) NOT NULL ,
    `subject` VARCHAR(100) NOT NULL ,
    `content` text NOT NULL ,
    `hit` INT,
    `ip` VARCHAR(20),
    `add_date` datetime default now(),
    PRIMARY KEY (bno)
)