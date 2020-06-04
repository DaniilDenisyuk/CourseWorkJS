CREATE TABLE Book (
  Id   serial,
  Title varchar(255) NOT NULL,
  Description text NOT NULL,
  Published date NOT NULL,
  Price float(2) NOT NULL CHECK(Price>0)
);
ALTER TABLE Book ADD CONSTRAINT pkBook PRIMARY KEY (Id);

CREATE TABLE Author (
  Id   serial,
  AuthorName varchar(255) NOT NULL,
  Address varchar(255) NOT NULL,
  URL varchar(255)
);
ALTER TABLE Author ADD CONSTRAINT pkAuthor PRIMARY KEY (Id);
CREATE UNIQUE INDEX akAuthor ON Author (AuthorName);

CREATE TABLE Publisher (
  Id   serial,
  PublisherName varchar(255) NOT NULL,
  Address varchar(255) NOT NULL,
  Phone varchar(64) NOT NULL,
  URL varchar(255)
);
ALTER TABLE Publisher ADD CONSTRAINT pkPublisher PRIMARY KEY (Id);
CREATE UNIQUE INDEX akPublisher ON Publisher (PublisherName);

CREATE TABLE Customer (
  Id   serial,
  FirstName varchar(64) NOT NULL,
  SecondName varchar(64),
  Address varchar(255),
  Phone varchar(64)
);
ALTER TABLE Customer ADD CONSTRAINT pkCustomer PRIMARY KEY (Id);
CREATE UNIQUE INDEX akCustomer ON Customer (Phone);

CREATE TABLE CartOrder (
  Id   serial,
  CreatedAt date NOT NULL,
  ShippingAddress varchar(255)
);
ALTER TABLE CartOrder ADD CONSTRAINT pkCartOrder PRIMARY KEY (Id);

CREATE TABLE OrderBook (
  OrderId integer NOT NULL,
  BookId integer NOT NULL
);
ALTER TABLE OrderBook ADD CONSTRAINT pkOrderBook PRIMARY KEY (OrderId, BookId);
ALTER TABLE OrderBook ADD CONSTRAINT fkOrderBookOrderId FOREIGN KEY (OrderId) REFERENCES CartOrder (Id) ON DELETE CASCADE;
ALTER TABLE OrderBook ADD CONSTRAINT fkOrderBookBookId FOREIGN KEY (BookId) REFERENCES Book (Id) ON DELETE CASCADE;

CREATE TABLE Warehouse (
  Id   serial
);
ALTER TABLE Warehouse ADD CONSTRAINT pkWarehouse PRIMARY KEY (Id);

CREATE TABLE WarehouseBook (
  WarehouseID integer NOT NULL,
  BookId integer NOT NULL
);
ALTER TABLE WarehouseBook ADD CONSTRAINT pkWarehouseBook PRIMARY KEY (WarehouseId, BookId);
ALTER TABLE WarehouseBook ADD CONSTRAINT fkWarehouseBookWarehouseId FOREIGN KEY (WarehouseId) REFERENCES Warehouse (Id) ON DELETE CASCADE;
ALTER TABLE WarehouseBook ADD CONSTRAINT fkWarehouseBookBookId FOREIGN KEY (BookId) REFERENCES Book (Id) ON DELETE CASCADE;
