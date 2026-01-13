USE [C:\USERS\USER\DESKTOP\LOTTERY-DRAW-SYSTEM\LOTTERY\APP_DATA\CARD.MDF]
GO

/****** Object: Table [dbo].[Card] Script Date: 1/13/2026 6:56:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Card] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (100) NULL,
    [Rarity]    INT            NULL,
    [ImagePath] NVARCHAR (200) NULL
);


