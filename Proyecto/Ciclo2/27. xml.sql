<!DOCTYPE Requisitos[
<!ELEMENT Requisitos (Opiniones+,Edades,Estaturas,Pesos,Experiencia,Genero)>
<!ELEMENT Edades (#PCDATA)>
<!ATTLIST Edades edadMinima CDATA #REQUIRED>
<!ATTLIST Edades edadMaxima CDATA #REQUIRED>
<!ELEMENT Estaturas (#PCDATA)>
<!ATTLIST Estaturas estaturaMinima CDATA #REQUIRED>
<!ATTLIST Estaturas estaturaMaxima CDATA #REQUIRED>
<!ELEMENT Opiniones (Opinion+)>
<!ELEMENT Opinion (#PCDATA)>
<!ELEMENT Pesos (#PCDATA)>
<!ATTLIST Pesos pesoMaximo CDATA #REQUIRED>
<!ATTLIST Pesos pesoMinimo CDATA #REQUIRED>
<!ELEMENT Experiencia (#PCDATA) >
<!ATTLIST Experiencia nombre (novato | experto) #REQUIRED>
<!ATTLIST Experiencia categoria (A | B | C | D | E) #REQUIRED>
<!ELEMENT Genero (#PCDATA) >
<!ATTLIST Genero nombre (masculino | femenino) #REQUIRED>
]>
<Requisitos>
		<Opiniones>
				<Opinion> No apto para personas viejas </Opinion>
		</Opiniones>
		<Edades
			edadMinima = "15"
			edadMaxima = "30">
		</Edades>
		<Estaturas
      estaturaMinima = "80"
			estaturaMaxima = "230">
		</Estaturas>
		<Pesos
			pesoMaximo = "80"
			pesoMinimo = "130">
		</Pesos>
		<Experiencia
			nombre = "novato"
			categoria = "A">
		</Experiencia>
		<Genero
			nombre = "masculino">
		</Genero>
</Requisitos>