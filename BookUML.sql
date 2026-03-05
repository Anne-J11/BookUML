Use master;
GO;
Create database 'ajuliebd';

CREATE TABLE `book` (
  `idB` integer PRIMARY KEY,
  `titleB` varchar(255),
  `yearB` date,
  `resumB` varchar(255)
);

CREATE TABLE `author` (
  `idA` integer PRIMARY KEY,
  `nameA` varchar(255),
  `lastnameA` varchar(255),
  `birthday` date,
  `countryA` varchar(2)
);

CREATE TABLE `country` (
  `idC` varchar(2) PRIMARY KEY,
  `nameC` varchar(255)
);

CREATE TABLE `type` (
  `idT` integer PRIMARY KEY,
  `idB` integer,
  `nameT` varchar(255)
);

CREATE TABLE `book_author` (
  `idB` integer,
  `idA` integer,
  PRIMARY KEY (`idB`, `idA`)
);

CREATE TABLE `copy` (
  `idCp` varchar(255) PRIMARY KEY,
  `idB` integer,
  `idE` integer
);

CREATE TABLE `edition` (
  `idE` integer PRIMARY KEY,
  `nameE` varchar(255),
  `labelE` varchar(255)
);

CREATE TABLE `borrow` (
  `idBw` integer PRIMARY KEY AUTO_INCREMENT,
  `idCp` varchar(255),
  `idU` integer,
  `dateB` timestamp,
  `delays` integer
);

CREATE TABLE `user` (
  `idU` integer PRIMARY KEY,
  `nameU` varchar(255),
  `lastnameU` varchar(255),
  `addressU` varchar(255),
  `numU` varchar(255),
  `emailU` varchar(255)
);

ALTER TABLE `author` ADD FOREIGN KEY (`countryA`) REFERENCES `country` (`idC`);

ALTER TABLE `type` ADD FOREIGN KEY (`idB`) REFERENCES `book` (`idB`);

ALTER TABLE `book_author` ADD FOREIGN KEY (`idB`) REFERENCES `book` (`idB`);

ALTER TABLE `book_author` ADD FOREIGN KEY (`idA`) REFERENCES `author` (`idA`);

ALTER TABLE `copy` ADD FOREIGN KEY (`idB`) REFERENCES `book` (`idB`);

ALTER TABLE `copy` ADD FOREIGN KEY (`idE`) REFERENCES `edition` (`idE`);

ALTER TABLE `borrow` ADD FOREIGN KEY (`idCp`) REFERENCES `copy` (`idCp`);

ALTER TABLE `borrow` ADD FOREIGN KEY (`idU`) REFERENCES `user` (`idU`);
