drop database IF EXISTS dm1;
CREATE DATABASE dm1 /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE dm1;
create table `Vehicle` (
 vehicleId int(11) not null ,
 make longtext  default null,
 model longtext  default null,
 year int(11) not null,
 plate longtext  default null,
 color longtext  default null,
 primary key (vehicleId)    
) engine=InnoDB default charset=utf8mb4;


create table `RentalDetails` (
 rentalDetailsId int(11) not null ,
 location longtext  default null,
 duration int(11) not null,
 rate int(11) not null,
 currency longtext  default null,
 primary key (rentalDetailsId)    
) engine=InnoDB default charset=utf8mb4;


create table `Address` (
 addressId int(11) not null ,
 no int(11) not null,
 street longtext  default null,
 area longtext  default null,
 district longtext  default null,
 city longtext  default null,
 zip int(11) not null,
 primary key (addressId)    
) engine=InnoDB default charset=utf8mb4;


create table `CustomerDetails` (
 customerDetailsId int(11) not null ,
 age int(11) not null,
 addressId int(11) not null,
 phone int(11) not null,
 primary key (customerDetailsId),
 KEY IX_CustomerDetails_addressId (addressId),
 CONSTRAINT FK_CustomerDetails_Address_addressId FOREIGN KEY (addressId) REFERENCES `Address` (addressId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Table1` (
 table1Id int(11) not null ,
 rentId longtext  default null,
 customerName longtext  default null,
 vehicleId int(11) not null,
 rentalDetailsId int(11) not null,
 customerDetailsId int(11) not null,
 primary key (table1Id),
 KEY IX_Table1_vehicleId (vehicleId),
 KEY IX_Table1_rentalDetailsId (rentalDetailsId),
 KEY IX_Table1_customerDetailsId (customerDetailsId),
 CONSTRAINT FK_Table1_Vehicle_vehicleId FOREIGN KEY (vehicleId) REFERENCES `Vehicle` (vehicleId) ON DELETE CASCADE,
 CONSTRAINT FK_Table1_RentalDetails_rentalDetailsId FOREIGN KEY (rentalDetailsId) REFERENCES `RentalDetails` (rentalDetailsId) ON DELETE CASCADE,
 CONSTRAINT FK_Table1_CustomerDetails_customerDetailsId FOREIGN KEY (customerDetailsId) REFERENCES `CustomerDetails` (customerDetailsId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;

