INSERT INTO productos VALUES ('I8469', 'Ewen', 'porttitor id', 3644147642, 'Flowdesk','Q92','<?xml version="1.0"?>
<!DOCTYPE Detalles_Adicionales[
<!ELEMENT Detalles_Adicionales (Producto)>
<!ELEMENT Producto (Colores+,Fecha_Lanzamiento,Opiniones,Tallas,Materiales+,Pais_Fabricacion,Genero)>
<!ELEMENT Colores (Color+)>
<!ELEMENT Color (#PCDATA)>
<!ATTLIST Color nombre CDATA #REQUIRED>
<!ELEMENT Fecha_Lanzamiento (#PCDATA)>
<!ATTLIST Fecha_Lanzamiento Fecha CDATA #REQUIRED>
<!ELEMENT Opiniones (Opinion+)>
<!ELEMENT Opinion (#PCDATA)>
<!ELEMENT Tallas (Talla)>
<!ELEMENT Talla (#PCDATA)>
<!ATTLIST Talla numero CDATA #REQUIRED>
<!ELEMENT Materiales (Material+)>
<!ELEMENT Material (#PCDATA) >
<!ATTLIST Material nombre CDATA #REQUIRED>
<!ELEMENT Pais_Fabricacion (#PCDATA) >
<!ATTLIST Pais_Fabricacion nombre CDATA #REQUIRED>
<!ELEMENT Genero (#PCDATA) >
<!ATTLIST Genero nombre (masculino | femenino) #REQUIRED>
]>
<Detalles_Adicionales>
	<Producto>
		<Colores>
			<Color 
      	nombre = "Azul">
      </Color>
			<Color 
      	nombre = "Verde">
      </Color>
      <Color 
      	nombre = "Amarillo">
      </Color>
		</Colores>
		<Fecha_Lanzamiento 
			Fecha = "1999/06/10">
		</Fecha_Lanzamiento>
		<Opiniones>
			<Opinion> El producto es muy bueno </Opinion>
			<Opinion> El producto es muy malo </Opinion>
		</Opiniones>
		<Tallas>
			<Talla
				numero = "35">
			</Talla>
		</Tallas>
		<Materiales>
			<Material
				nombre = "Plastico">
			</Material>
		</Materiales>
		<Pais_Fabricacion
			nombre = "Colombia">
		</Pais_Fabricacion>
		<Genero
			nombre = "masculino">
		</Genero>
	</Producto>
</Detalles_Adicionales>');
		
