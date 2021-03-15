GO
create database proyecto
GO
use proyecto
GO
create table usuarios(
	idUsuario int identity(1,1) not null primary key,
	nombre nvarchar(25),
	apellidos nvarchar(25),
	usuario nvarchar(25) not null,
	contraseña nvarchar(25)  not null
);

create table clientes(
	idCliente int identity(1,1) not null primary key,
	nombre nvarchar(25),
	apellidos nvarchar(25),
	genero nvarchar(25),
	nacimiento date,
	eMail nvarchar(50),
	contraseña nvarchar(25) not null,
	fechaRegistro datetime NOT NULL DEFAULT GETDATE()
);

create table categorias(
	idCategoria int identity(1,1) not null primary key,
	nombre nvarchar(25),
);

create table proveedores(
	idProveedor int identity(1,1) not null primary key,
	nombre nvarchar(25),
	telefono nvarchar(25),
	eMail nvarchar(50),
	direccion text
);

create table marcas(
	idMarca int identity(1,1) not null primary key,
	nombre nvarchar(25),
	idProveedor int not null foreign key references proveedores(idProveedor)
);

create table productos(
	idProducto int identity(1,1) not null primary key,
	nombre nvarchar(25),
	descripcion text,
	idCategoria int not null foreign key references categorias(idCategoria),
	idMarca int not null foreign key references marcas(idMarca),
	modelo nvarchar(50),
	precio money,
	stock int,
	publico nvarchar(20),
	imagen text
);

create table suscriptores(
	idSuscriptor int identity(1,1) not null primary key,
	nombre nvarchar(25),
	eMail nvarchar(50)
);

create table CompraEncabezado(
idEncabezado int not null primary key,
idCliente int not null foreign key references clientes(idCliente),
fechaCompra date not null,
CompraTotal decimal not null
)


create table CompraDetalle(
idEncabezado int not null foreign key references CompraEncabezado(idEncabezado),
idProducto int not null foreign key references productos(idProducto),
cantidad int not null,
total decimal not null
);


 
/*****************************************************************************************************************/
go
CREATE PROCEDURE agregarUsuario
@nom nvarchar(50),
@ape nvarchar(50),
@usu nvarchar(50),
@pass nvarchar(50)

AS
BEGIN
Insert into usuarios(nombre, apellidos, usuario, contraseña) values
(@nom, @ape, @usu, @pass)
END;



/*****************************************************************************************************************/
go
CREATE PROCEDURE modificarUsuario
@id int, 
@nom nvarchar(50), 
@ape nvarchar(50), 
@usu nvarchar(50), 
@pass nvarchar(50)
AS
BEGIN
Update usuarios set nombre=@nom, apellidos=@ape, usuario=@usu, contraseña=@pass Where
 idUsuario=@id
END;



/*****************************************************************************************************************/
go
CREATE PROCEDURE eliminarUsuario
@id int
AS
BEGIN
Delete from usuarios Where idUsuario=@id
END;

/*****************************************************************************************************************/
go
CREATE PROCEDURE agregarCategoria
@cate nvarchar(50)
AS
BEGIN
Insert into categorias(nombre) values
(@cate)
END;


/*****************************************************************************************************************/
go
CREATE PROCEDURE modificarCategoria
@id int,
@cate nvarchar(50)
AS
BEGIN
Update categorias set nombre=@cate Where
 idCategoria=@id
END;


/*****************************************************************************************************************/
go
CREATE PROCEDURE eliminarCategoria
@id int
AS
BEGIN
Delete from categorias Where idCategoria=@id
END;

/*****************************************************************************************************************/
go
CREATE PROCEDURE agregarProveedor
	@nombre nvarchar(25),
	@telefono nvarchar(25),
	@eMail nvarchar(50),
	@direccion text
AS
BEGIN
Insert into proveedores (nombre, telefono, eMail, direccion) values (@nombre,@telefono,@eMail,@direccion)
END;

/*****************************************************************************************************************/
go

CREATE PROCEDURE modificarProveedor
	@idProveedor int,
	@nombre nvarchar(25),
	@telefono nvarchar(25),
	@eMail nvarchar(50),
	@direccion text
AS
BEGIN
Update proveedores set nombre=@nombre, telefono=@telefono, eMail=@eMail, direccion=@direccion
 Where idProveedor=@idProveedor
END;


/*****************************************************************************************************************/
go

CREATE PROCEDURE eliminarProveedor
	@idProveedor int
AS
BEGIN
Delete from proveedores Where idProveedor=@idProveedor
END;

/*****************************************************************************************************************/
go

CREATE PROCEDURE agregarMarca
@marca nvarchar(50),
@idPro int
AS
BEGIN
Insert into marcas(nombre, idProveedor) values
(@marca, @idPro)
END;



/*****************************************************************************************************************/
go
CREATE PROCEDURE modificarMarca
@id int,
@nombre nvarchar(50),
@idPro int
AS
BEGIN
Update marcas set nombre=@nombre, idProveedor=@idPro Where
 idMarca=@id
END;

/*****************************************************************************************************************/
go
CREATE PROCEDURE eliminarMarca
@id int
AS
BEGIN
Delete from marcas Where idMarca=@id
END;


/*****************************************************************************************************************/
go
CREATE PROCEDURE agregarSuscriptor
@nom nvarchar(50),
@email nvarchar(50)
AS
BEGIN
Insert into suscriptores(nombre, email) values
(@nom, @email)
END;


/*****************************************************************************************************************/
go
CREATE PROCEDURE modificarSuscriptor
@id int,
@nom nvarchar(50),
@email nvarchar(50)
AS
BEGIN
Update suscriptores set nombre=@nom, eMail=@email  Where
 idSuscriptor=@id
END;


/*****************************************************************************************************************/
go
CREATE PROCEDURE eliminarSuscriptor
@id int
AS
BEGIN
Delete from suscriptores Where idSuscriptor=@id
END;



/*****************************************************************************************************************/
go
CREATE PROCEDURE agregarCliente
@nom nvarchar(50),
@ape nvarchar(50),
@genero nvarchar(25),
@nacimiento date,
@email nvarchar(50),
@pass nvarchar(50)
AS
BEGIN
Insert into clientes(nombre, apellidos, genero, nacimiento, eMail, contraseña) values
(@nom, @ape, @genero, @nacimiento, @email, @pass)
END;



/*****************************************************************************************************************/
go




/*****************************************************************************************************************/
go
CREATE PROCEDURE eliminarCliente
@id int
AS
BEGIN
Delete from clientes Where idCliente=@id
END;

GO
/*****************************************************************************************************************/
CREATE PROCEDURE agregarProducto	
	@nombre nvarchar(25),
	@descripcion text,
	@idCategoria int,
	@idMarca int,
	@modelo nvarchar(50),
	@precio money,
	@stock int,
	@publico nvarchar(20),
	@imagen text	
AS
BEGIN
	Insert into productos(nombre, descripcion, idCategoria, idMarca, modelo, precio, stock, publico, imagen) 
	values (@nombre, @descripcion, @idCategoria, @idMarca, @modelo, @precio, @stock, @publico, @imagen) 
END;

/*****************************************************************************************************************/
GO

CREATE PROCEDURE modificarProducto	
	@idProducto int,
	@nombre nvarchar(25),
	@descripcion text,
	@idCategoria int,
	@idMarca int,
	@modelo nvarchar(50),
	@precio money,
	@stock int,
	@publico nvarchar(20),
	@imagen text
AS
BEGIN
	Update productos set nombre=@nombre, descripcion=@descripcion, idCategoria=@idCategoria, idMarca=@idMarca,
	modelo=@modelo, precio=@precio, stock=@stock,publico=@publico,imagen=@imagen where idProducto=@idProducto
END;

/*****************************************************************************************************************/
GO

CREATE PROCEDURE eliminarProducto
	@idProducto int
AS
BEGIN
	Delete from productos where idProducto=@idProducto
END;
GO



EXEC agregarUsuario @nom='Default', @ape='Default',@usu='userdefault', @pass='passdefault';