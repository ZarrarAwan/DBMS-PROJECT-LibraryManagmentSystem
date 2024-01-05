
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/23/2023 21:55:05
-- Generated from EDMX file: C:\Users\samee\Desktop\Library-Management-System-MVC-master\MVC Project\LibraryMSMVC\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LibraryMSWA];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_tblAdmin_tblUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblAdmin] DROP CONSTRAINT [FK_tblAdmin_tblUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_tblTransactions_tblBooks]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTransactions] DROP CONSTRAINT [FK_tblTransactions_tblBooks];
GO
IF OBJECT_ID(N'[dbo].[FK_tblTransactions_tblUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTransactions] DROP CONSTRAINT [FK_tblTransactions_tblUsers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tblAdmin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblAdmin];
GO
IF OBJECT_ID(N'[dbo].[tblBooks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblBooks];
GO
IF OBJECT_ID(N'[dbo].[tblTransactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblTransactions];
GO
IF OBJECT_ID(N'[dbo].[tblUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblUsers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tblAdmins'
CREATE TABLE [dbo].[tblAdmins] (
    [AdminId] int  NOT NULL,
    [AdminName] varchar(70)  NULL,
    [AdminEmail] varchar(70)  NOT NULL,
    [AdminPass] varchar(50)  NULL
);
GO

-- Creating table 'tblBooks'
CREATE TABLE [dbo].[tblBooks] (
    [BookId] int IDENTITY(1,1) NOT NULL,
    [BookTitle] varchar(50)  NULL,
    [BookCategory] varchar(90)  NULL,
    [BookAuthor] varchar(50)  NULL,
    [BookCopies] int  NULL,
    [BookPub] varchar(50)  NULL,
    [BookPubName] varchar(70)  NULL,
    [BookISBN] varchar(50)  NULL,
    [Copyright] int  NULL,
    [DateAdded] char(10)  NULL,
    [Status] varchar(50)  NULL
);
GO

-- Creating table 'tblTransactions'
CREATE TABLE [dbo].[tblTransactions] (
    [TranId] int IDENTITY(1,1) NOT NULL,
    [BookId] int  NOT NULL,
    [BookTitle] varchar(80)  NULL,
    [BookISBN] varchar(50)  NULL,
    [TranStatus] varchar(50)  NULL,
    [TranDate] varchar(50)  NULL,
    [UserName] varchar(50)  NULL,
    [UserId] int  NOT NULL,
    [tblBooks_BookId] int  NOT NULL
);
GO

-- Creating table 'tblUsers'
CREATE TABLE [dbo].[tblUsers] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [UserName] varchar(70)  NULL,
    [UserGender] varchar(50)  NULL,
    [UserDep] varchar(50)  NULL,
    [UserAdmNo] int  NULL,
    [UserEmail] varchar(50)  NULL,
    [UserPass] varchar(50)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [AdminId] in table 'tblAdmins'
ALTER TABLE [dbo].[tblAdmins]
ADD CONSTRAINT [PK_tblAdmins]
    PRIMARY KEY CLUSTERED ([AdminId] ASC);
GO

-- Creating primary key on [BookId] in table 'tblBooks'
ALTER TABLE [dbo].[tblBooks]
ADD CONSTRAINT [PK_tblBooks]
    PRIMARY KEY CLUSTERED ([BookId] ASC);
GO

-- Creating primary key on [TranId] in table 'tblTransactions'
ALTER TABLE [dbo].[tblTransactions]
ADD CONSTRAINT [PK_tblTransactions]
    PRIMARY KEY CLUSTERED ([TranId] ASC);
GO

-- Creating primary key on [UserId] in table 'tblUsers'
ALTER TABLE [dbo].[tblUsers]
ADD CONSTRAINT [PK_tblUsers]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdminId] in table 'tblAdmins'
ALTER TABLE [dbo].[tblAdmins]
ADD CONSTRAINT [FK_tblAdmin_tblUsers]
    FOREIGN KEY ([AdminId])
    REFERENCES [dbo].[tblUsers]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserId] in table 'tblTransactions'
ALTER TABLE [dbo].[tblTransactions]
ADD CONSTRAINT [FK_tblTransactions_tblUsers]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[tblUsers]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tblTransactions_tblUsers'
CREATE INDEX [IX_FK_tblTransactions_tblUsers]
ON [dbo].[tblTransactions]
    ([UserId]);
GO

-- Creating foreign key on [tblBooks_BookId] in table 'tblTransactions'
ALTER TABLE [dbo].[tblTransactions]
ADD CONSTRAINT [FK_tblTransactions_tblBooks]
    FOREIGN KEY ([tblBooks_BookId])
    REFERENCES [dbo].[tblBooks]
        ([BookId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tblTransactions_tblBooks'
CREATE INDEX [IX_FK_tblTransactions_tblBooks]
ON [dbo].[tblTransactions]
    ([tblBooks_BookId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------