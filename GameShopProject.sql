CREATE DATABASE GameShop;
USE GameShop;
 
CREATE TABLE Roles (
r_id INT PRIMARY KEY AUTO_INCREMENT,
r_name VARCHAR (50)
);

CREATE TABLE Suppliers(
s_id INT PRIMARY KEY AUTO_INCREMENT,
s_name VARCHAR (50)
);

CREATE TABLE Clients (
c_id INT PRIMARY KEY AUTO_INCREMENT,
c_name VARCHAR (25),
c_lastName VARCHAR (25),
c_email VARCHAR (100),
c_birthday DATE,
c_location VARCHAR (100)
);

CREATE TABLE Category_game (
cat_id INT PRIMARY KEY AUTO_INCREMENT,
cat_name VARCHAR (50)
);

CREATE TABLE Products (
p_id INT PRIMARY KEY AUTO_INCREMENT,
p_name VARCHAR (50),
p_price DECIMAL (10,2),
cat_id INT,
s_id INT,
FOREIGN KEY (cat_id) REFERENCES Category_game (cat_id),
FOREIGN KEY (s_id) REFERENCES Suppliers (s_id)
);

CREATE TABLE Branches (
b_id INT PRIMARY KEY AUTO_INCREMENT,
b_name VARCHAR (50),
b_location VARCHAR (100)
);

CREATE TABLE Stock (
s_id INT PRIMARY KEY AUTO_INCREMENT,
p_id INT, 
b_id INT, 
quantity INT,
FOREIGN KEY (p_id) REFERENCES Products (p_id),
FOREIGN KEY (b_id) REFERENCES Branches (b_id)
);

CREATE TABLE Employees (
e_id INT PRIMARY KEY AUTO_INCREMENT,
e_name VARCHAR (50),
e_lastName VARCHAR (50),
e_phone VARCHAR(20),
e_email VARCHAR (50),
e_birthday DATE,
r_id INT,
FOREIGN KEY (r_id) REFERENCES Roles (r_id)
);

CREATE TABLE Departments (
d_id INT PRIMARY KEY AUTO_INCREMENT,
d_name VARCHAR (50),
e_id INT,
FOREIGN KEY (e_id) REFERENCES Employees (e_id)
);

CREATE TABLE Tickets (
t_id INT PRIMARY KEY AUTO_INCREMENT,
t_date DATETIME,
c_id INT,
e_id INT,
b_id INT,
FOREIGN KEY (c_id) REFERENCES Clients (c_id),
FOREIGN KEY (e_id) REFERENCES Employees (e_id),
FOREIGN KEY (b_id) REFERENCES Branches (b_id)
);

CREATE TABLE Audit_Log (
l_id INT PRIMARY KEY AUTO_INCREMENT,
l_date DATETIME DEFAULT CURRENT_TIMESTAMP,
l_user VARCHAR(100),
l_table VARCHAR(50),
l_action VARCHAR(200)
);

################################
#Inserts de datos

-- 1. Roles básicos
INSERT INTO Roles (r_name) VALUES 
('Manager'), 
('Cashier'), 
('Warehouse');

-- 2. Las 10 Sucursales 
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

-- 3. Categorías de videojuegos
INSERT INTO Category_game (cat_name) VALUES
('MOBA'), 
('Soulslike'), 
('Metroidvania'), 
('RPG'), 
('Shooter');
INSERT INTO Category_game (cat_name) VALUES ('Consolas');


-- 4. Proveedores
INSERT INTO Suppliers (s_name) VALUES
('Riot Games'), 
('FromSoftware'), 
('Team Cherry'), 
('Nintendo'), 
('Sony');
INSERT INTO Suppliers (s_name) VALUES ('Microsoft');

INSERT INTO Products (p_name, p_price, cat_id, s_id) VALUES
('PlayStation 5', 10500.00, 6, 5),          
('PlayStation 5 Digital', 8500.00, 6, 5),   
('Xbox Series X', 10500.00, 6, 6),          
('Xbox Series S', 6500.00, 6, 6),           
('Nintendo Switch OLED', 7000.00, 6, 4),    
('Nintendo Switch', 5500.00, 6, 4),         
('Nintendo Switch Lite', 4000.00, 6, 4),    
('PlayStation 4 Slim', 5000.00, 6, 5),      
('Xbox One S', 4500.00, 6, 6),              
('Steam Deck', 12000.00, 6, 6);             

-- 1. Clientes 
INSERT INTO Clients (c_name, c_lastName, c_email, c_birthday, c_location) VALUES
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

-- 2. Empleados
INSERT INTO Employees (e_name, e_lastName, e_phone, e_email, e_birthday, r_id) VALUES
('Fernando', 'Ruiz', '6641112233', 'fer@gameshop.com', '1990-10-10', 1),
('Gabriela', 'Sánchez', '6614445566', 'gaby@gameshop.com', '1995-02-25', 2),
('Héctor', 'Jiménez', '6647778899', 'hector@gameshop.com', '1998-05-14', 3),
('Isabel', 'Luna', '6612223344', 'isa@gameshop.com', '2001-08-30', 2),
('Miguel', 'Castro', '6645556677', 'miguel@gameshop.com', '1985-11-20', 1),
('Daniela', 'Vargas', '6618889900', 'dani@gameshop.com', '1992-03-15', 2),
('Alejandro', 'Méndez', '6643334455', 'alex@gameshop.com', '1996-07-07', 3),
('Valeria', 'Ríos', '6616667788', 'vale@gameshop.com', '1999-09-09', 2);

-- 3. Departamentos 
INSERT INTO Departments (d_name, e_id) VALUES
('Ventas Mostrador', 1),
('Almacén General', 3),
('Atención al Cliente', 2),
('Gerencia', 5),
('Soporte Técnico', 7);

-- 4. Stock 
INSERT INTO Stock (p_id, b_id, quantity) VALUES
(1, 1, 15), (2, 1, 10), (3, 2, 20), (4, 2, 12), (5, 3, 30),
(6, 4, 25), (7, 5, 40), (8, 6, 5),  (9, 7, 8),  (10, 8, 15),
(1, 9, 10), (3, 10, 18), (5, 1, 22), (10, 2, 14), (7, 3, 35);

-- 5. Tickets 
INSERT INTO Tickets (t_date, c_id, e_id, b_id) VALUES
('2026-03-15 10:00:00', 1, 2, 1), ('2026-03-15 11:30:00', 2, 4, 2),
('2026-03-16 12:15:00', 3, 6, 3), ('2026-03-16 14:20:00', 4, 8, 4),
('2026-03-16 16:45:00', 5, 2, 5), ('2026-03-17 09:30:00', 6, 4, 6),
('2026-03-17 13:10:00', 7, 6, 7), ('2026-03-17 15:50:00', 8, 8, 8),
('2026-03-17 18:05:00', 9, 2, 9), ('2026-03-18 10:20:00', 10, 4, 10),
('2026-03-18 11:00:00', 11, 6, 1), ('2026-03-18 12:30:00', 12, 8, 2),
('2026-03-18 13:45:00', 13, 2, 3), ('2026-03-18 14:15:00', 14, 4, 4),
('2026-03-18 15:00:00', 15, 6, 5);

-- 6. Audit_Log 
INSERT INTO Audit_Log (l_user, l_table, l_action) VALUES
('Admin', 'Products', 'INSERT masivo de consolas'),
('Admin', 'Clients', 'Carga inicial de clientes frecuentes'),
('Admin', 'Employees', 'Alta de plantilla laboral'),
('Sistema', 'Stock', 'Actualización de inventario inicial'),
('Sistema', 'Tickets', 'Registro de ventas de apertura');

