USE [C:\USERS\USER\DESKTOP\LOTTERY-DRAW-SYSTEM\LOTTERY\APP_DATA\CARD.MDF]
GO

/****** Object: Table [dbo].[GachaHistory] Script Date: 1/13/2026 6:56:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GachaHistory] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [UserId]   NVARCHAR (50) NULL,
    [CardId]   INT           NULL,
    [DrawTime] DATETIME      NULL
);


