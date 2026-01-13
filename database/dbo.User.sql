USE [C:\USERS\USER\DESKTOP\LOTTERY-DRAW-SYSTEM\LOTTERY\APP_DATA\CARD.MDF]
GO

/****** Object: Table [dbo].[User] Script Date: 1/13/2026 6:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User] (
    [Id]           NVARCHAR (50)  NOT NULL,
    [Username]     NVARCHAR (50)  NULL,
    [Password]     NVARCHAR (255) NULL,
    [RegisterDate] DATETIME       NULL
);


