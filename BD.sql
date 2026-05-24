IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Duenios] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(100) NOT NULL,
    [Telefono] nvarchar(20) NOT NULL,
    [Contacto] nvarchar(100) NOT NULL,
    CONSTRAINT [PK_Duenios] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Mascotas] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(100) NOT NULL,
    [Raza] nvarchar(50) NOT NULL,
    [Edad] int NOT NULL,
    [Tamano] nvarchar(20) NOT NULL,
    [Observaciones] nvarchar(max) NOT NULL,
    [EstadoSalud] nvarchar(max) NOT NULL,
    [DuenioId] int NULL,
    CONSTRAINT [PK_Mascotas] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Mascotas_Duenios_DuenioId] FOREIGN KEY ([DuenioId]) REFERENCES [Duenios] ([Id])
);
GO

CREATE TABLE [Estancias] (
    [Id] int NOT NULL IDENTITY,
    [MascotaId] int NOT NULL,
    [FechaIngreso] datetime2 NOT NULL,
    [FechaEgreso] datetime2 NULL,
    [Observaciones] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Estancias] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Estancias_Mascotas_MascotaId] FOREIGN KEY ([MascotaId]) REFERENCES [Mascotas] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Cuidados] (
    [Id] int NOT NULL IDENTITY,
    [EstanciaId] int NOT NULL,
    [Descripcion] nvarchar(max) NOT NULL,
    [Hora] datetime2 NULL,
    CONSTRAINT [PK_Cuidados] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Cuidados_Estancias_EstanciaId] FOREIGN KEY ([EstanciaId]) REFERENCES [Estancias] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Cuidados_EstanciaId] ON [Cuidados] ([EstanciaId]);
GO

CREATE INDEX [IX_Estancias_MascotaId] ON [Estancias] ([MascotaId]);
GO

CREATE INDEX [IX_Mascotas_DuenioId] ON [Mascotas] ([DuenioId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260522055029_InitialCreate', N'8.0.8');
GO

COMMIT;
GO

