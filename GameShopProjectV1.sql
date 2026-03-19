DROP DATABASE IF EXISTS GameShop;
CREATE DATABASE GameShop;
USE GameShop;

-- TABLAS
CREATE TABLE Roles (
    r_id INT PRIMARY KEY AUTO_INCREMENT,
    r_name VARCHAR(50)
);

CREATE TABLE Suppliers (
    s_id INT PRIMARY KEY AUTO_INCREMENT,
    s_name VARCHAR(50)
);

CREATE TABLE Clients (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(25),
    c_lastName VARCHAR(25),
    c_email VARCHAR(100),
    c_BirthDate DATE, -- corregido de c_birthday a c_BirthDate
    c_location VARCHAR(100)
);

CREATE TABLE Category_game (
    cat_id INT PRIMARY KEY AUTO_INCREMENT,
    cat_name VARCHAR(50)
);

CREATE TABLE Products (
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(50),
    p_price DECIMAL(10,2),
    cat_id INT,
    s_id INT,
    FOREIGN KEY (cat_id) REFERENCES Category_game(cat_id),
    FOREIGN KEY (s_id) REFERENCES Suppliers(s_id)
);

CREATE TABLE Branches (
    b_id INT PRIMARY KEY AUTO_INCREMENT,
    b_name VARCHAR(50),
    b_location VARCHAR(100)
);

CREATE TABLE Stock (
    st_id INT PRIMARY KEY AUTO_INCREMENT, -- corregido de s_id a st_id
    p_id INT,
    b_id INT,
    quantity INT,
    FOREIGN KEY (p_id) REFERENCES Products(p_id),
    FOREIGN KEY (b_id) REFERENCES Branches(b_id)
);

CREATE TABLE Employees (
    e_id INT PRIMARY KEY AUTO_INCREMENT,
    e_name VARCHAR(50),
    e_lastName VARCHAR(50),
    e_phone VARCHAR(20),
    e_email VARCHAR(50),
    e_birthday DATE,
    r_id INT,
    FOREIGN KEY (r_id) REFERENCES Roles(r_id)
);

CREATE TABLE Departments (
    d_id INT PRIMARY KEY AUTO_INCREMENT,
    d_name VARCHAR(50),
    e_id INT,
    FOREIGN KEY (e_id) REFERENCES Employees(e_id)
);

CREATE TABLE Tickets (
    t_id INT PRIMARY KEY AUTO_INCREMENT,
    t_date DATETIME,
    c_id INT,
    e_id INT,
    b_id INT,
    FOREIGN KEY (c_id) REFERENCES Clients(c_id),
    FOREIGN KEY (e_id) REFERENCES Employees(e_id),
    FOREIGN KEY (b_id) REFERENCES Branches(b_id)
);

CREATE TABLE Audit_Log (
    l_id INT PRIMARY KEY AUTO_INCREMENT,
    l_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    l_user VARCHAR(100),
    l_table VARCHAR(50),
    l_action VARCHAR(200)
);


-- INSERTS
-- Roles
INSERT INTO Roles (r_name) VALUES
('Manager'),
('Cashier'),
('Warehouse');

-- Sucursales
INSERT INTO Branches (b_name, b_location) VALUES
('Sucursal Otay', 'Plaza Otay'),
('Sucursal Rosarito', 'Pabellón Rosarito'),
('Sucursal Centro', 'Zona Centro'),
('Sucursal Playas', 'Playas de Tijuana'),
('Sucursal Macro', 'Macroplaza'),
('Sucursal 2000', 'Plaza Sendero'),
('Sucursal Río', 'Plaza Río'),
('Sucursal Siglo XXI', 'Plaza Siglo XXI'),
('Sucursal Chapultepec', 'Plaza Chapultepec'),
('Sucursal Pacífico', 'Parque Industrial Pacífico');

-- Categorias juntas en un solo bloque para que los IDs queden correctos
INSERT INTO Category_game (cat_name) VALUES
('Sports'),
('Survival Horror'),
('Adventure'),
('RPG'),
('Terror'),
('Arcade'),
('Shooter'),
('Consolas');

-- Proveedores juntos en un solo bloque
INSERT INTO Suppliers (s_name) VALUES
('Riot Games'),
('FromSoftware'),
('Team Cherry'),
('Nintendo'),
('Sony'),
('Microsoft');

-- Productos
-- Sports Categoria 1
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('FIFA 26', 1300.00, 1, 4),
('NBA 2K26', 1300.00, 1, 5),
('WWE 2K26', 1300.00, 1, 5),
('Madden NFL 26', 1300.00, 1, 6),
('F1 25', 1200.00, 1, 5),
('Gran Turismo 7', 1300.00, 1, 5),
('Forza Horizon 6', 1400.00, 1, 6),
('Mario Kart World', 1300.00, 1, 4),
('Mario Tennis Fever', 1200.00, 1, 4),
('Mario Strikers Battle League', 1000.00, 1, 4),
('eFootball 2025', 800.00, 1, 5),
('MotoGP 25', 1100.00, 1, 5),
('NHL 25', 1100.00, 1, 6),
('UFC 5', 1200.00, 1, 5),
('PGA Tour 2K25', 1000.00, 1, 6),
('Riders Republic', 900.00, 1, 6),
('Tony Hawk Pro Skater 1+2', 900.00, 1, 6),
('Sonic Racing CrossWorlds', 1000.00, 1, 5),
('Football Manager 2025', 1000.00, 1, 6),
('MLB The Show 25', 1200.00, 1, 5),
('Steep', 700.00, 1, 6),
('Dirt 5', 900.00, 1, 6),
('Rocket League Collection', 700.00, 1, 5),
('Olympic Games Tokyo 2020', 700.00, 1, 4),
('Tennis World Tour 2', 800.00, 1, 6);

-- Survival Horror Categoria 2
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('Resident Evil Requiem', 1500.00, 2, 5),
('Silent Hill f', 1400.00, 2, 5),
('Reanimal', 1200.00, 2, 4),
('The Last of Us Part I', 1500.00, 2, 5),
('The Last of Us Part II Remastered', 1400.00, 2, 5),
('Alan Wake 2', 1300.00, 2, 6),
('Dead Space Remake', 1300.00, 2, 6),
('Resident Evil 4 Remake', 1400.00, 2, 5),
('Resident Evil Village', 1200.00, 2, 5),
('Outlast Trials', 900.00, 2, 6),
('Little Nightmares II', 800.00, 2, 4),
('Amnesia The Bunker', 700.00, 2, 6),
('Dying Light 2', 1200.00, 2, 6),
('Back 4 Blood', 900.00, 2, 6),
('Pathologic 3', 1100.00, 2, 6),
('Evil Dead The Game', 800.00, 2, 6),
('Man of Medan', 800.00, 2, 5),
('Little Hope', 800.00, 2, 5),
('House of Ashes', 900.00, 2, 5),
('The Devil in Me', 900.00, 2, 5),
('Signalis', 650.00, 2, 6),
('Maid of Sker', 700.00, 2, 6),
('Carrion', 600.00, 2, 6),
('Song of Horror', 700.00, 2, 6),
('Observer System Redux', 700.00, 2, 6);

-- Adventure Categoría 3
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('GTA VI', 1800.00, 3, 6),
('Marvel Wolverine', 1500.00, 3, 5),
('007 First Light', 1400.00, 3, 5),
('Pragmata', 1400.00, 3, 5),
('Assassins Creed Shadows', 1400.00, 3, 6),
('God of War Ragnarok', 1500.00, 3, 5),
('Spider-Man 2', 1500.00, 3, 5),
('Ghost of Tsushima', 1300.00, 3, 5),
('Horizon Forbidden West', 1300.00, 3, 5),
('Zelda Tears of the Kingdom', 1400.00, 3, 4),
('Big Hops', 1100.00, 3, 5),
('Yakuza Kiwami 3', 1200.00, 3, 5),
('A Plague Tale Requiem', 1200.00, 3, 6),
('Stray', 700.00, 3, 5),
('It Takes Two', 900.00, 3, 6),
('Kena Bridge of Spirits', 800.00, 3, 5),
('Ratchet and Clank Rift Apart', 1300.00, 3, 5),
('Astro Bot', 1200.00, 3, 5),
('Death Stranding 2', 1500.00, 3, 5),
('Control Ultimate Edition', 900.00, 3, 6),
('Ghostwire Tokyo', 1000.00, 3, 5),
('Far Cry 6', 1000.00, 3, 6),
('Watch Dogs Legion', 900.00, 3, 6),
('Immortals Fenyx Rising', 900.00, 3, 6),
('Sackboy A Big Adventure', 1000.00, 3, 5);

-- RPG Categoría 4
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('Clair Obscur Expedition 33', 1400.00, 4, 5),
('Elden Ring Nightreign', 1400.00, 4, 2),
('Nioh 3', 1400.00, 4, 4),
('Final Fantasy Tactics Ivalice Chronicles', 1300.00, 4, 4),
('Baldurs Gate 3', 1400.00, 4, 6),
('Hades II', 1200.00, 4, 6),
('Citizen Sleeper 2', 900.00, 4, 6),
('Dragon Age Veilguard', 1300.00, 4, 6),
('Cyberpunk 2077 Phantom Liberty', 1300.00, 4, 6),
('Persona 5 Royal', 1200.00, 4, 5),
('Elden Ring', 1400.00, 4, 2),
('Dark Souls III', 1100.00, 4, 2),
('Sekiro Shadows Die Twice', 1200.00, 4, 2),
('Monster Hunter Wilds', 1500.00, 4, 5),
('Pokemon Scarlet', 1200.00, 4, 4),
('Pokemon Violet', 1200.00, 4, 4),
('Fire Emblem Engage', 1100.00, 4, 4),
('Xenoblade Chronicles 3', 1100.00, 4, 4),
('Tales of Arise', 1200.00, 4, 4),
('Octopath Traveler II', 1000.00, 4, 4),
('Star Wars Jedi Survivor', 1300.00, 4, 6),
('Mass Effect Legendary', 1100.00, 4, 6),
('The Witcher 3 Next Gen', 1200.00, 4, 6),
('Diablo IV', 1300.00, 4, 6),
('Like a Dragon Ishin', 1100.00, 4, 5);

-- Terror Categoría 5
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('Until Dawn Remake', 1200.00, 5, 5),
('The Seance of Blake Manor', 1100.00, 5, 5),
('Phasmophobia', 700.00, 5, 6),
('Layers of Fear', 800.00, 5, 5),
('The Dark Pictures Anthology', 900.00, 5, 5),
('Five Nights at Freddys Security Breach', 900.00, 5, 5),
('Alien Isolation', 800.00, 5, 6),
('Prey', 900.00, 5, 6),
('Martha is Dead', 800.00, 5, 6),
('The Medium', 900.00, 5, 6),
('Visage', 700.00, 5, 6),
('Soma', 700.00, 5, 6),
('Superliminal', 600.00, 5, 6),
('Dredge', 700.00, 5, 6),
('Poppy Playtime', 600.00, 5, 6),
('Sons of the Forest', 800.00, 5, 6),
('The Forest', 700.00, 5, 6),
('Grounded', 800.00, 5, 6),
('Subnautica Below Zero', 700.00, 5, 6),
('Bendy and the Ink Machine', 600.00, 5, 6),
('Inscryption', 650.00, 5, 6),
('Mundaun', 650.00, 5, 6),
('Tormented Souls', 700.00, 5, 5),
('Hellblade Senuas Sacrifice', 900.00, 5, 6),
('Remothered Broken Porcelain', 650.00, 5, 5);

-- Arcade Categoría 6
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('Mortal Kombat Legacy Kollection', 1100.00, 6, 6),
('Street Fighter 6', 1200.00, 6, 5),
('Tekken 8', 1300.00, 6, 4),
('Dragon Ball FighterZ', 900.00, 6, 4),
('Guilty Gear Strive', 1000.00, 6, 5),
('Hollow Knight Silksong', 900.00, 6, 3),
('Cuphead The Delicious Last Course', 500.00, 6, 6),
('Sonic Superstars', 1000.00, 6, 5),
('Crash Bandicoot 4', 900.00, 6, 5),
('Kirby Forgotten Land', 1100.00, 6, 4),
('Donkey Kong Bananza', 1200.00, 6, 4),
('New Super Mario Bros U Deluxe', 1000.00, 6, 4),
('Yoshi Crafted World', 900.00, 6, 4),
('Celeste', 600.00, 6, 6),
('Shovel Knight Treasure Trove', 700.00, 6, 6),
('Ori and the Will of the Wisps', 700.00, 6, 6),
('Rayman Legends', 650.00, 6, 6),
('Wario Ware Get it Together', 850.00, 6, 4),
('Contra Anniversary Collection', 600.00, 6, 6),
('Metal Slug Anthology', 650.00, 6, 4),
('Mega Man 11', 700.00, 6, 5),
('Castlevania Anniversary Collection', 600.00, 6, 6),
('Pac-Man 99', 500.00, 6, 4),
('Rift of the NecroDancer', 700.00, 6, 6),
('Mighty Morphin Power Rangers Ritas Rewind', 800.00, 6, 6);

-- Shooter Categoría 7
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('Marathon', 1400.00, 7, 5),
('Halo Infinite', 1200.00, 7, 6),
('Call of Duty Black Ops 6', 1500.00, 7, 6),
('Battlefield 2025', 1300.00, 7, 6),
('Doom The Dark Ages', 1300.00, 7, 6),
('Splatoon 3', 1100.00, 7, 4),
('ARC Raiders', 1200.00, 7, 6),
('Titanfall 2', 800.00, 7, 6),
('Deathloop', 1100.00, 7, 5),
('Ghostrunner 2', 1000.00, 7, 6),
('Returnal', 1300.00, 7, 5),
('Wolfenstein II New Colossus', 900.00, 7, 6),
('Metro Exodus', 1000.00, 7, 6),
('Borderlands 3', 1000.00, 7, 6),
('Tiny Tinas Wonderlands', 1100.00, 7, 6),
('Neon White', 800.00, 7, 4),
('Turbo Overkill', 750.00, 7, 6),
('Ultrakill', 700.00, 7, 6),
('Ion Fury', 700.00, 7, 6),
('Bioshock Collection', 1000.00, 7, 6),
('Far Cry 5', 900.00, 7, 6),
('Superhot Mind Control Delete', 750.00, 7, 6),
('Apex Legends Collection', 600.00, 7, 5),
('Overwatch 2 Pack', 600.00, 7, 6),
('Fortnite Pack', 500.00, 7, 5);

-- Consolas Categoría 8
INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('PlayStation 5', 10500.00, 8, 5),
('PlayStation 5 Digital', 8500.00, 8, 5),
('Xbox Series X', 10500.00, 8, 6),
('Xbox Series S', 6500.00, 8, 6),
('Nintendo Switch OLED', 7000.00, 8, 4),
('Nintendo Switch', 5500.00, 8, 4),
('Nintendo Switch Lite', 4000.00, 6, 4),
('PlayStation 4 Slim', 5000.00, 6, 5),
('Xbox One S', 4500.00, 6, 6),
('Steam Deck', 12000.00, 6, 6);

-- Clientes con c_BirthDate corregido
INSERT INTO Clients (c_name, c_lastName, c_email, c_BirthDate, c_location) VALUES
('Juan', 'Pérez', 'juan@email.com', '1995-05-15', 'Otay'),
('Ana', 'García', 'ana@email.com', '1998-08-20', 'Rosarito'),
('Luis', 'Ramírez', 'luis.r@email.com', '2001-01-06', 'Playas de Tijuana'),
('María', 'Gómez', 'maryg@email.com', '1990-11-12', 'Centro'),
('Carlos', 'López', 'clopez@email.com', '1985-03-22', 'Macroplaza'),
('Sofía', 'Martínez', 'sofi.m@email.com', '1999-07-30', 'Rosarito'),
('Jorge', 'Hernández', 'jorgeh@email.com', '2003-09-14', 'Otay'),
('Laura', 'Díaz', 'laurad@email.com', '1992-12-05', 'Santa Fe'),
('Diego', 'Torres', 'diegot@email.com', '1988-04-18', 'Playas de Tijuana'),
('Elena', 'Flores', 'elenaf@email.com', '1996-06-25', 'Zona Río'),
('Raúl', 'Vázquez', 'raulv@email.com', '1991-02-10', 'Rosarito'),
('Carmen', 'Morales', 'carmenm@email.com', '1989-08-08', 'Otay'),
('Roberto', 'Ortiz', 'robertoo@email.com', '2000-10-31', 'Centro'),
('Patricia', 'Cruz', 'patyc@email.com', '1994-01-19', 'Macroplaza'),
('Ricardo', 'Reyes', 'ricardor@email.com', '1997-05-28', 'Playas de Tijuana');

-- Empleados
INSERT INTO Employees (e_name, e_lastName, e_phone, e_email, e_birthday, r_id) VALUES
('Fernando', 'Ruiz', '6641112233', 'fer@gameshop.com', '1990-10-10', 1),
('Gabriela', 'Sánchez', '6614445566', 'gaby@gameshop.com', '1995-02-25', 2),
('Héctor', 'Jiménez', '6647778899', 'hector@gameshop.com', '1998-05-14', 3),
('Isabel', 'Luna', '6612223344', 'isa@gameshop.com', '2001-08-30', 2),
('Miguel', 'Castro', '6645556677', 'miguel@gameshop.com', '1985-11-20', 1),
('Daniela', 'Vargas', '6618889900', 'dani@gameshop.com', '1992-03-15', 2),
('Alejandro', 'Méndez', '6643334455', 'alex@gameshop.com', '1996-07-07', 3),
('Valeria', 'Ríos', '6616667788', 'vale@gameshop.com', '1999-09-09', 2);

-- Departamentos
INSERT INTO Departments (d_name, e_id) VALUES
('Ventas Mostrador', 1),
('Almacén General', 3),
('Atención al Cliente', 2),
('Gerencia', 5),
('Soporte Técnico', 7);

-- Stock
INSERT INTO Stock (p_id, b_id, quantity) VALUES
(1, 1, 15), (2, 1, 10), (3, 2, 20), (4, 2, 12), (5, 3, 30),
(6, 4, 25), (7, 5, 40), (8, 6, 5),  (9, 7, 8),  (10, 8, 15),
(1, 9, 10), (3, 10, 18), (5, 1, 22), (10, 2, 14), (7, 3, 35);

-- Tickets
INSERT INTO Tickets (t_date, c_id, e_id, b_id) VALUES
('2026-03-15 10:00:00', 1, 2, 1), ('2026-03-15 11:30:00', 2, 4, 2),
('2026-03-16 12:15:00', 3, 6, 3), ('2026-03-16 14:20:00', 4, 8, 4),
('2026-03-16 16:45:00', 5, 2, 5), ('2026-03-17 09:30:00', 6, 4, 6),
('2026-03-17 13:10:00', 7, 6, 7), ('2026-03-17 15:50:00', 8, 8, 8),
('2026-03-17 18:05:00', 9, 2, 9), ('2026-03-18 10:20:00', 10, 4, 10),
('2026-03-18 11:00:00', 11, 6, 1), ('2026-03-18 12:30:00', 12, 8, 2),
('2026-03-18 13:45:00', 13, 2, 3), ('2026-03-18 14:15:00', 14, 4, 4),
('2026-03-18 15:00:00', 15, 6, 5);

-- Audit Log
INSERT INTO Audit_Log (l_user, l_table, l_action) VALUES
('Admin', 'Products', 'INSERT masivo de consolas'),
('Admin', 'Clients', 'Carga inicial de clientes frecuentes'),
('Admin', 'Employees', 'Alta de plantilla laboral'),
('Sistema', 'Stock', 'Actualización de inventario inicial'),
('Sistema', 'Tickets', 'Registro de ventas de apertura');