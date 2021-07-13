data Mapa = Atlas [Provincia] Frontera

data Provincia 
  = Almeria | Cadiz | Cordoba | Granada | Jaen | Huelva | Malaga | Sevilla
    deriving (Show,Enum,Eq)

type Frontera = Provincia -> [Provincia]

frontera p = case p of
        Almeria -> [Granada]
        Cadiz -> [Huelva,Sevilla,Malaga]
        Cordoba -> [Sevilla,Malaga,Jaen,Granada]
        Granada -> [Malaga,Cordoba,Jaen,Almeria]
        Jaen -> [Cordoba,Granada]
        Huelva -> [Cadiz,Sevilla]
        Malaga -> [Cadiz,Sevilla,Cordoba,Granada]
        Sevilla -> [Huelva,Cadiz,Malaga,Cordoba]

andalucia :: Mapa
andalucia = Atlas [Almeria .. Sevilla] frontera

miniA :: Mapa
miniA = Atlas [Cordoba, Malaga, Sevilla] frontera

data Color = Rojo | Verde | Azul 
        deriving (Show,Enum,Eq)

-- Definiremos tres funciones:

-- colorFras:: Provincia -> [(Provincia,Color)] -> Frontera -> [Color]
-- (colorFras p listPC f) devuelve los colores de las provincias que son fronteras de la -- provincia "p� seg�n �listPC� y la funci�n frontera �f�

-- Ejemplos con
-- [(Almeria,Verde),(Cadiz,Azul),(Cordoba,Azul),(Granada,Rojo),(Jaen,Verde),(Huelva,Verde),
-- (Malaga,Verde),(Sevilla,Rojo)]


-- solsColorear :: Mapa -> [Color] -> [[(Provincia,Color)]]
-- (solsColorear m liscolor) da la lista de todas las 
-- formas posibles de colorear el mapa �m� usando colores de la lista �liscolor�

-- colorear:: Mapa -> [Color] -> [(Provincia,Color)]
-- dado un mapa y una lista de colores devuelve una soluci�n, si la hay.
-- Si no hay soluci�n devuelve la lista vac�a

-- sol1 = colorear andalucia [Rojo..Azul]

-- sol2 = colorear andalucia [Rojo,Verde]