-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2019 at 06:02 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajdutdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `codigo`
--

CREATE TABLE `codigo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codigo`
--

INSERT INTO `codigo` (`id`, `nombre`, `codigo`, `descripcion`, `fechaUltimaModificacion`, `fechaBaja`) VALUES
(1, 'Mehadrin', 'M', NULL, '2019-05-31 10:24:04', NULL),
(5, 'Bitul 60', 'B60', NULL, '2019-05-31 10:24:52', NULL),
(6, 'NO KOSHER', 'NK', NULL, '2019-05-31 10:24:52', NULL),
(8, 'Kashrut Abierto', 'KA', NULL, '2019-05-31 10:24:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lecheparve`
--

CREATE TABLE `lecheparve` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecheparve`
--

INSERT INTO `lecheparve` (`id`, `nombre`, `codigo`, `fechaUltimaModificacion`, `fechaBaja`) VALUES
(1, 'Leche Común', 'LC', '2019-05-31 12:29:07', NULL),
(2, 'Leche en Polvo', 'LP', '2019-05-31 12:29:07', NULL),
(3, 'Jalav Israel', 'JI', '2019-05-31 12:29:07', NULL),
(4, 'Parve', 'P', '2019-05-31 12:29:07', NULL),
(5, 'Kelim Lácteo', 'KL', '2019-05-31 12:29:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `rubroId` int(11) NOT NULL,
  `nivelId` int(11) NOT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL,
  `lecheparveId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rubro`
--

CREATE TABLE `rubro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rubro`
--

INSERT INTO `rubro` (`id`, `nombre`, `descripcion`, `fechaUltimaModificacion`, `fechaBaja`) VALUES
(1, 'Aceites', '<p>Los aceites vegetales que se elaboran en el país, en general no presentan problemas de Cashrut. Por lo tanto se permiten. Como en todos los casos recomendamos comprar productos de marcas reconocidas ya que esto garantiza en gran medida la calidad del artículo y de sus ingredientes.  Cuando aparece en la etiqueta <strong>“Aceite comestible mezcla”</strong>, esto significa que el aceite está elaborado a partir de aceites vegetales que pueden ser:  soja, girasol, maíz, maní, algodón, etc. Según la opinión del Jatam Sofer, está permitido el uso de aceite de uva. <strong> Ciertas opiniones recomiendan utilizar únicamente aceites de girasol.</strong>   </p><p>Dado que el aceite es un producto de uso cotidiano y se envasa para “marcas blancas” de supermercados y “segundas marcas”, hemos incluido aquí los códigos de la plantas de elaboración en las cuales no encontramos elementos prohibidos y se podrán consumir todos los aceites que allí se elaboren: RNE o RPE  02-030.678; 02-031.588; 21- 001.794; 02-032.427; 02-032.607;  04002.089; 02-032607; 18-000735; 02-030025; 02-031512;   Recomendamos: </p>', '2019-05-31 11:13:00', NULL),
(2, 'Aceitunas', 'Algunas aceitunas (tipo griego, español o en aceite) pueden contener productos prohibidos o dudosos. Por lo tanto se autorizan las aceitunas en salmuera, verdes o negras, con carozos o descarozadas, o rellenas con morrón. <br /> Recomendamos:', '2019-05-31 11:13:00', NULL),
(3, 'Aderezos', NULL, '2019-05-31 11:13:00', NULL),
(4, 'Alfajores', 'Habitualmente, los alfajores se elaboran con tapas que contienen grasa animal, por lo tanto, se permiten <strong>únicamente</strong> los alfajores elaborados en partidas con supervisión especial (Hashgajá).', '2019-05-31 11:13:00', NULL),
(5, 'Alimentos liquidos de soja y frutales', 'ver también \"bebidas con sabores frutales\" y \"jugos\"', '2019-05-31 11:13:00', NULL),
(6, 'Alimentos para bebes', 'Los alimentos para bebés en frascos de vidrio de producción nacional contienen carne u otros elementos que los hacen prohibidos o se preparan en las mismas maquinarias que los productos con carne. Por lo tanto, sólo se permiten los alimentos de frasco de vidrio importados de Estados Unidos con el símbolo (OU) o los importados de Israel.<br>En el caso de leche en polvo para bebes algunas se elaboran con grasas de origen animal.<br>En casos de necesidad médica consultar con un Rabino acerca de otras leches en polvo (naturales o de soja) que se permiten.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(7, 'Articulos para la limpieza de vajilla', 'Los polvos de limpieza, por lo general, contienen ingredientes de origen animal cuyo uso esta prohibido por ciertas autoridades rabínicas. Los detergentes sintéticos no tienen este tipo de problemas.<br>', '2019-05-31 11:13:00', NULL),
(8, 'Avena', 'Permitidos:<br />(ver también \"cereales\" y \"polenta\")', '2019-05-31 11:13:00', NULL),
(9, 'Aves y huevos', 'Las especies de aves prohibidas están especificadas en la Tora. Los Sabios del Talmud incluso nos han transmitido las señales que caracterizan a las aves casher, a diferencia de las que no lo son. Sin embargo, es menester tener una \"Masoret\" tradición clara que cierto ave es casher para ser consumido.<br />Los judíos hemos estado exiliados durante dos mil años, y no en todos los países en los que hemos vivido existieron todas las especies de aves que conocemos hoy. Por lo tanto, hemos perdido la tradición respecto a ciertas especies. <br />Durante el último siglo, la mayoría de los judíos hemos emigrado de los países de \"origen\" en donde hemos habitado durante varias generaciones y gozábamos de costumbres establecidas. Una de las consecuencias tristes de esta emigración, fue el alejamiento de muchos judíos de sus raíces. Recién en los últimos años, hemos visto una vuelta a sus raíces de muchos judíos, y nos hemos constituido en comunidades formadas por descendientes de muchos orígenes.<br />Entre tantas preguntas, una de ellas se formula sobre si los integrantes de una comunidad pueden utilizar la costumbre anuente de otra comunidad para autorizar cierta especie.<br />Dado que tenemos una regla que permite consumir solamente aquello que se deriva de lo permitido y no lo que proviene de una especie prohibida (\"Kol haiotze min hatamé, tamé\"), la preocupación - en nuestro caso - se extiende sobre los huevos al igual que sobre las aves mismas.<br />La siguiente lista responde a las especies autorizadas por la \"Orthodox Union\", que es la certificadora más grande a nivel mundial, pero no quita a costumbres especificas de otras comunidades.<br />En todos los casos (al igual que en los mamíferos), no hay diferencia entre machos y hembras de cierta especie, y siempre deberá ser faenada por un Shojet (matarife) experimentado. Asimismo, se debe cortar las venas principales y salar la carne del ave de acuerdo a la ley judía para extraerle la sangre, salvo el hígado que debe ser asado como en el caso del hígado de los mamíferos.<br />El Rabino (veterinario) Israel Meir Levinger shlit\"a ha recopilado un texto extenso e ilustrado acerca de las especies permitida.<br />Permitidos:<br />-Codorniz (no todas las codornices son casher, sino solamente las que ponen huevos con manchas - su nombre en latín es “coturnix coturnix” “coturnix japónica”)<br /> -Gallina (no la gallina de Guinea)<br /> -Ganso<br /> -Paloma<br /> -Pato (no el pato criollo)<br /> -Pavo (no el pavo real)<br /> <br /> Codorniz<br /><img src=\"http://www.kosher.org.ar/j_15/images/guia_kosher/codorniz.jpg\" border=\"0\" alt=\"Codorniz\" title=\"Codorniz\" width=\"200\" height=\"175\" /><br /><br /> Huevos de Codorniz:<br /><img src=\"http://www.kosher.org.ar/j_15/images/guia_kosher/huevo-codorniz.jpg\" border=\"0\" alt=\"Huevos de Codorniz\" title=\"Huevos de Codorniz\" width=\"252\" height=\"211\" />', '2019-05-31 11:13:00', NULL),
(10, 'Barras de cereales', NULL, '2019-05-31 11:13:00', NULL),
(11, 'Bebidas alcohólicas', 'Permitidos:<br>(Para conocer más información sobre bebidas alcohólicas permitidas, se puede visitar la página www.kashrut.com <br>', '2019-05-31 11:13:00', NULL),
(12, 'Bebidas con sabores frutales ', 'Permitidos:<br>(ver también \"alimentos de soja\" y \"jugos\")<br>', '2019-05-31 11:13:00', NULL),
(13, 'Bishul yisrael', 'Una de las leyes que restringen el consumo de alimentos, es la exigencia de los Sabios en el sentido que ciertos alimentos cocidos o asados deben estar cocinados por una persona judía íntegramente observante de los preceptos. En el caso que cierto alimento fuera considerado vedado por este motivo (\"Bishulei Akum\"), pueden estar comprometidos también los utensilios que se emplean en dicha elaboración.<br />Según las circunstancias, esta restricción se puede aplicatr en el hogar, en un establecimiento de catering o en una fábrica.<br />Existen ciertas excepciones a esta regla:<br />1.Comida que se come cruda: aun en el caso que se torne más sabrosa a través de la cocción, (p.ej. manzanas asadas o puré de manzanas, frutas enlatadas).<br />2.Comida cuyo sabor y forma no se modifican por la cocción, (p.ej. leche pasteurizada)<br />3.Comida que aun requiere cocción adicional para ser comestible: esto se aplica en comidas cuya preparación ha sido comenzada por un Iehudí - aun si no la terminó, o que el Iehudí le da la terminación. <br />4.Comida que no se sirve en menús importantes (\"dignos de mesas reales\" p.ej: copos de maíz, doughnuts, gran parte de las verduras enlatadas).<br />5.Comida que habitualmente no se consume con una cena, o no pertenecen a una nutrición sana (p.ej. caramelos, papas fritas), según muchas opiniones rabínicas no caen en la categoría de Bishulei Akum.<br />6.Comida combinada, cuyo componente principal no esta sujeto a Bishulei Akum, siempre y cuando los componentes estén mezclados, (p.ej. café torrado al servirse, el componente principal es el agua - que no está sujeta a Bishulei Akum, y el café que le da el sabor).<br />7.Comida cocinada en microonda: la prohibición de Bishulei Akum solo se aplica a los métodos convencionales de cocción: cocinar, freír, asar. El microonda no está incluido.<br />8.Comida preparada salando o humeándola.<br />También existe una diferencia de opinión respecto a qué participación del judío convierte a la comida en permitida. Según la opinión del Bet Iosef (Shuljan Aruj 113:7 - que siguen los judíos Sefaradim), se requiere que el Iehudí coloque la comida dentro del horno, mientras que según el Ramá (ibid - - que siguen los judíos Ashkenazim), alcanza con que colabore en la cocción - tal como \"echar una asilla al fuego\".', '2019-05-31 11:13:00', NULL),
(14, 'Cacao en polvo y preparados para leche', 'El \"cacao amargo\" puro proveniente de Brasil es casher. Lo que sigue es una nomina de polvos a base de caco que contienen otros ingredientes para preparar las populares bebidas de \"chocolatada\".<br>Permitidos:<br>(Debemos aclarar que los chocolates y capuchinos que se venden en máquinas expendedoras suelen tener problemas de Cashrut. Por lo tanto, no se deberán consumir sin supervisión)<br>', '2019-05-31 11:13:00', NULL),
(15, 'Cafes y sustitutos', 'Por lo general los cafés no contienen aditivos prohibidos y se consideran neutros. Algunos pueden contener azúcar.<br>Permitidos:<br>(Debemos aclarar que los chocolates y capuchinos que se venden en máquinas expendedoras suelen tener problemas de Cashrut. Por lo tanto, no se deberán consumir sin supervisión)<br>', '2019-05-31 11:13:00', NULL),
(16, 'Caldos en Polvo', NULL, '2019-05-31 11:13:00', NULL),
(17, 'Caramelos y pastillas', 'Permitidos:<br />(ver también \"Chicles\", \"Chocolates\" y \"Golosinas\")', '2019-05-31 11:13:00', NULL),
(18, 'Caviar', 'ver \"pescados frescos\"<br>', '2019-05-31 11:13:00', NULL),
(19, 'Cereales', '(ver también \"Productos de copetín\",\"Turrones\", etc.)<br />Permitidos:', '2019-05-31 11:13:00', NULL),
(20, 'Cerveza', 'Recomendamos:<br>A su vez, las marcas provenientes de los EE.UU. y los de Alemania que no estén saborizados con sabor adicional.<br>', '2019-05-31 11:13:00', NULL),
(21, 'Chicles', 'Los chicles suelen contener emulsionantes, gelatina de origen animal en la goma base, en particular los dietéticos.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(22, 'Chocolates', 'Los chocolates con leche aquí autorizados se elaboran con leche en polvo. Los chocolates amargos no contienen leche (aunque en algunos casos se elaboran en las mismas maquinarias que los chocolates con leche, razón por la cual no agregamos la letra M en muchos de ellos).<br>Atención: En ciertos lugares se elaboran chocolates con formas de Torá y de Maguén David dando la impresión de tratarse de algo \"ritual\" - a pesar de no gozar de supervisión alguna.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(23, 'Chocolates para taza', 'Permitidos:<br>(ver también \"Productos de repostería\")<br>', '2019-05-31 11:13:00', NULL),
(24, 'Comida de aviones', 'Llegan muchas consultas acerca de las comidas que se ofrecen en los viajes aéreos que provienen de distintos países.<br>Es difícil incluir una lista acabada de certificaciones kosher de los diferentes orígenes. Sin embargo, es menester - al menos - controlar que la caja lleve el sello de un rabinato.<br>Jamás algo es 100 % a falta de pruebas. Aun siendo confiado, se debe utilizar el sentido común. En cierta oportunidad, hemos encontrado un paquete de galletitas (estilo \"snack\") que contenían derivados de leche en una bandeja de comida de carne...<br>', '2019-05-31 11:13:00', NULL),
(25, 'Cosmeticos y crema dental', 'Una de las consultas frecuentes se refiere al uso de cosméticos y dentífricos con ingredientes que no son casher. A continuación citamos las palabras del Kashrus Kurrents que lleva el aval del Rabino Moshé Heinemann shlit\"a de Star-K:<br>Conocemos la ley de la Torá que prohibe la ingesta de alimento no casher. Sin embargo, la Halajá solamente prohíbe comer la comida no casher y no prohíbe tener beneficio de él (Sin embargo, no se debe tener provecho de sustancias en las que se mezclaron derivados de carne vacuna y leche en un medio de calor, y según algunas autoridades, no se debe tener provecho de vino y derivados de uva no casher). La costumbre es incluir los cosméticos no casher en esta categoría (Biur Halajá 326:10 \"Besha´ar\"). P.ej.: está permitido aplicarse crema facial y loción que contiene derivados animales. Está aun permitido aplicar ingredientes no casher a los labios (lápiz labial). Esto es así, aun si existiera la posibilidad de de tragar inadvertidamente rastros de lápiz labial con la comida. Estos restos de lápiz labial quedarían anulados 1 en 60 (dado que es un \"davar sheeinó mitkavén\", sin certeza que ocurra).<br>Si no se tiene la intención de ingerir producto no casher (p.ej. pasta dentífrica, líquido de enjuague, hilo dental), no hay necesidad de preocuparse por los ingredientes (no es apto para consumo humano y no se califica como tal). No obstante, es un Hidur (preferencia) utilizar productos casher si existe la posibilidad de tragarlos distraídamente. Si se tratara de un producto que se ingiere intencionalmente (spray bucal), el producto debe ser casher.<br>CREMA LACTEA (Ver explicación leche y manteca)<br>', '2019-05-31 11:13:00', NULL),
(26, 'Crema láctea', 'Ver explicación leche y manteca', '2019-05-31 11:13:00', NULL),
(27, 'Crema no lactea y saborizante de cafe', 'Los sustitutos de la crema habitualmente contienen ingredientes que no son casher y, a su vez, lácteos según la Halajá, aun cuando sobre el envase pueda decir que no lo sean.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(28, 'Dulce de batata, membrillo y más', 'Si bien nos hemos referido con los dulces de batata, zapallo y membrillo con la M, existen opiniones que la requieren con participación de un supervisor judío en su cocción.<br>Permitidos:<br>DULCE de LECHE<br>Estos productos se autorizan para los miembros de comunidades en las que se permite el consumo de leche común (Ver Leche)<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(29, 'Dulce de leche', 'Estos productos se autorizan para los miembros de comunidades en las que se permite el consumo de leche común (Ver Leche)<br /><br />Permitidos:', '2019-05-31 11:13:00', NULL),
(30, 'Edulcorantes', 'Los edulcorantes artificiales no tienen, por lo general, problemas de Cashrut. No obstante aquellos a base de sacarina sódica y muy especialmente los de ciclamato de calcio son perjudiciales para la salud cuando se consumen en cantidades importantes y por lo tanto recomendamos evitar su consumo periódico.<br>Hoy en día se utiliza generalmente el aspartamo que es un edulcorante compuesto de aminoácidos. En su fórmula original no presenta problemas de Cashrut.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(31, 'Encurtidos', NULL, '2019-05-31 11:13:00', NULL),
(32, 'Ensaladas de frutas en lata', 'Permitidas:<br>(ver \"frutas y verduras enlatadas\")<br>', '2019-05-31 11:13:00', NULL),
(33, 'Especias', 'Permitidas:<br>', '2019-05-31 11:13:00', NULL),
(34, 'Fideos', 'Se advierten en el mercado fideos grises que contienen \"tinta de calamares\", que obviamente no son casher.<br>Permitidos:<br>En el caso de las pastas húmedas se debe tomar especial precaución, pues suelen contener ingredientes prohibidos o compartir el lugar de elaboración con productos prohibidos.<br>Permitidos:<br>(Ver también \"Tapas para empanadas\")<br>', '2019-05-31 11:13:00', NULL),
(35, 'Flanes y postres', 'Los flanes pueden contener emulsionantes u otros aditivos para su conservación y consistencia en proporciones que hacen al producto prohibido.<br>Estos productos se autorizan para los miembros de comunidades en las que se permite el consumo de leche común.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(36, 'Frutas de israel', 'El mercado ofrece ocasionalmente frutas importadas de Israel. Si bien, desde el aspecto emotivo, muchos tienen la inclinación de consumir estos productos, es importante destacar que no se puede consumir fruta, verdura, cereales y derivados que crecieron en Israel sin haberles quitado adecuadamente (recitando el texto correspondiente) la Terumá y el diezmo correspondiente. El año hebreo 5761 (a partir de setiembre de 2.000) es Shmitá, y la tierra de Israel debe \"reposar\", o sea, que no se deben realizar muchas de las tareas agrícolas. Está prohibido comerciar con los frutos de la tierra que crecen en dicho año (y hasta la mayor parte del 2.002) y cuando se consumen, se debe tener ciertas precauciones rituales.<br>Al no ser experto en este tema, es preferible abstenerse de consumir dichos productos, salvo que (como en muchos productos envasados) estén avalados por una autoridad rabínica seria.<br>Aun cuando no está señalado sobre la fruta misma, al adquirir limones, naranjas y pomelos, se debe observar el cajón que dice la inscripción del origen de la fruta.<br>', '2019-05-31 11:13:00', NULL),
(37, 'Frutas disecadas', 'Ciertas frutas disecadas (especialmente las ciruelas y pasas de uva) habitualmente suelen llevar un agregado para no pegarse una a la otra o para agregarle brillo. Este aditivo puede no ser casher.<br>Pasas de uva permitidas:<br>', '2019-05-31 11:13:00', NULL),
(38, 'Frutas y verduras enlatadas', 'Las frutas en almíbar (duraznos, damascos, peras) no presentan problemas de Cashrut siempre que figure que el jarabe está elaborado a base de azúcar o jarabe de maíz. Recomendamos marcas nacionales reconocidas. En el caso de legumbres y verdura, se debe tener la certeza que no se elabore productos que contengan carne u otros elementos prohibidos en esas instalaciones.<br>Permitidos:<br>(ver también \"tomates en lata\" y \"ensalada de frutas\")<br>', '2019-05-31 11:13:00', NULL),
(39, 'Galletas de arroz', 'En su fórmula natural no presentan problemas de Cashrut, se recomiendan las de marcas reconocidas.<br>', '2019-05-31 11:13:00', NULL),
(40, 'Galletitas', 'Casi todas las galletitas que se producen en el país se elaboran con grasa animal. Incluso aquellas marcas que declaran ser elaboradas con aceite vegetal hemos comprobado que a veces, al no poder conseguirlo, utilizan grasa animal sin declararlo expresamente. En algunos casos también se ha observado que el aceite vegetal se elabora en las mismas maquinarias que el de origen animal, lo cual las hace no Casher.<br>Por consiguiente, se autorizan únicamente las galletitas elaboradas en partidas especiales supervisadas (con Hashgajá) ya que aun cuando tienen el mismo nombre que las que se comercializan en cualquier comercio, se modifican o se ratifican sus componentes.<br>Permitidas:<br>', '2019-05-31 11:13:00', NULL),
(41, 'Gaseosas', 'Las bebidas gaseosas se elaboran con una emulsión de sabores, colores, ácidos y gomas, a lo cual se le agregan el agua, gas y jarabe de maíz, azúcares o edulcorantes artificiales. La lista de ingredientes de las emulsiones es sumamente extensa y no siempre abierta a ser controlada. En ciertas bebidas populares de fama mundial, mucha gente se apoya en el hecho que alguna de sus emulsiones tienen certificación en su país de origen por las certificadoras reconocidas mundialmente. Es difícil decir en todos estos casos cuáles de las bebidas pueden contar con la categoría M de Mehadrin. Pasamos a enumerar ciertas bebidas, sin que esto inhiba necesariamente las bebidas de otras marcas.<br />Permitidas:', '2019-05-31 11:13:00', NULL),
(42, 'Gelatinas', 'Bajo el nombre gelatinas se elaboran los postres de fantasía a base del colágeno de origen animal, el cual está prohibido por casi todas las autoridades halájicas en las circunstancias en las cuales es elaborado. A pesar de las opiniones rabínicas validas que lo autorizan, todas las supervisiones de alimentos de cierta jerarquía, se abstienen de emplearlo. En su reemplazo, está autorizado el uso de carragenatos y el agar agar, siempre y cuando sean puros.<br />Muchos jugos de fruta son clarificados con gelatina que suele ser de origen animal como procedimiento estandarizado de clarificación. La gelatina luego es arrastrada mediante tierras filtrantes.<br />La fuente halájica de esta anuencia está en el libro Nodá B´Iehudá, Ioré Deá 26, y Pitjé Teshuvá 99:4. <br /> (ver también productos naturistas)<br />', '2019-05-31 11:13:00', NULL),
(43, 'Golosinas', '<p>ver tambien Caramelos, Chocolates, Productos de Copetín, Turrones, etc.</p><p>Las golosinas son alimentos de fantasia a base de una amplisima variedad de ingredientes y aditivos saborizantes, colorantes o emulsionantes. </p>', '2019-05-31 11:13:00', NULL),
(44, 'Harinas y Premezclas', 'En la Torá existe una ley no conocida por todos que prohibe el consumo de los cereales (trigo, cebada, avena, espelta y centeno) y sus derivados que no hayan echado raíces antes del segundo día de Pesaj hasta el Pesaj siguiente.  Estos productos se los suele llamar \"jadash\".  Si esta ley se restringe a la tierra de Israel o si tiene aplicación fuera de ella, es materia de discusión de los Sabios hace ya varias generaciones (Shulján Aruj, Oraj Jaím, 489:10).  En el hemisferio sur (como en la Argentina), la nueva cosecha de la primavera/verano llega a los estantes de los almacenes en diciembre y no ha echado raíces antes del Pesaj pasado.   Dado que el Mishná Brurá recomienda seguir las opiniones más severas respecto a esta ley, se ha organizado desde ya 6 años una comisión que se ocupa de proveer a los establecimientos casher interesados con esta harina para los meses de verano.  Estos productos se denominan \"iashán\" (\"viejo\") a diferencia de los que son \"jadash\".  Quien ya está observando correctamente las demás leyes del Cashrut, puede avanzar en este sentido.<br />Desde hace un tiempo, la ley nacional obliga a que casi todas las harinas posean nutrientes de hierro. Estos no son objetables para su Cashrut.<br />Otro tema que pasó a ser común respecto a las harinas, son la cantidad de harinas emulsionadas, en especial a las que se usan a nivel de panadería como mejorador de pan.  Después de varias consultas con los Poskim, sabemos que esto no prohibe su consumo.  De todas maneras, podemos recomendar la Favorita 0000, que no posee dichos emulsionantes.  No obstante, no se deben utilizar pre-mezclas para pizza o para tortas.<br />', '2019-05-31 11:13:00', NULL),
(45, 'Heladerias', '<br />Permitidos:', '2019-05-31 11:13:00', NULL),
(46, 'Higado', 'Si bien en las carnicerías casher se expende el hígado faenado casher, esto no debe ser considerado casher en la práctica para comerlo de esa manera, y solo puede ser consumido después que se le efectuara la preparación correspondiente.<br>La Torá prohíbe terminantemente el consumo de sangre. A diferencia del resto de la carne, no es posible extraer la sangre del hígado por medio del remojo y salado, y, por lo tanto, se debe asarlo exponiéndolo al fuego abierto a fin de extraerle la sangre que contiene.<br>Si se preparara un hígado vacuno completo, se le deben hacer cortes cruzados para que la sangre fluya libremente. Esto no es necesario en caso de asar un bife de hígado o de tratarse de hígado de ave.<br>El primer paso consiste en lavar el trozo de hígado con agua fría. Luego es colocado en una parilla que está estructurada de manera tal que no impide el flujo libre de la sangre y de otros líquidos que emanan del hígado. Los líquidos deben fluir a un sitio en el cual no tienen contacto físico con el hígado. Se acostumbra poner sal en cantidad como para darle un buen sabor al hígado. La sal ayuda al fuego a extraer la sangre. Si se quiere, se puede colocar más sal.<br>Sin embargo, no es obligatorio salar el hígado, Por lo tanto, está permitido asar el hígado sin salarlo para personas que deben cumplir una dieta de bajo sodio por razones médicas. (Sin embargo, no se puede obviar el paso del salado si se extrae la sangre por medio del salado mismo).<br>Es preferible asar el hígado mediante una fuente de fuego situada directamente debajo del hígado. Sin embargo, si no es posible, se puede asar con fuego que se origina encima del hígado. Por lo tanto, si es la única opción, está permitido en un grill o en un horno eléctrico.<br>Si el grill o el horno se utilizan también para comida casher, se debe tener cuidado que no salpique sangre en la cavidad del horno, pues si así ocurriere, lo podría convertir en no-casher. Se puede colocar una asadera debajo del hígado a fin de recibir la sangre que salpica, pero esta asadera se convertirá en taref.<br>No se debe utilizar la parrilla que se usa para asar el hígado para otro uso (casher), a menos que se la haya vuelto a purgar para hacerla casher. Asimismo, no se debe utilizar los utensilios (p.ej tenedores) empleados en asar el hígado para otros alimentos casher.<br>Se acostumbra dar vuelta el hígado sobre el fuego de modo que quede asado en forma pareja de todos lados. Asimismo, se suele asar e hígado hasta que haya dejado de fluir el líquido y esté seco en su periferia. No es necesario que esté quemado.<br>Si se hacen casher varios trozos de hígado simultáneamente, estos pueden estar tocándose mientras están sobre la parilla.<br>Si el hígado estaba congelado, se debe descongelarlo totalmente antes de comenzar el proceso.<br>Después de hacerlo casher, se lava el hígado tres veces bajo el agua para quitar la sangre de la superficie que está impregnada con sangre. El líquido que sale posteriormente, no se considera sangre y estará permitido consumirlo.<br>Al cortar el hígado asado, uno se encuentra con distintos matices en su interior. Las partes que están verdes, beiges, o rosadas, son casher, pero si esta marrón oscuro, tal como cuando estaba crudo, se debe quitar esa parte.<br>Después de asar el hígado tal como hemos indicado, se lo considera como cualquier trozo de carne, y puede ser frito o cocinado en cualquier olla, sartén o utensilio, sin reserva alguna. <br>', '2019-05-31 11:13:00', NULL),
(47, 'Jugos de frutas', 'Cuando el jugo es natural obviamente se autoriza, no obstante el problema de Cashrut se presenta en algunos jugos que poseen jugo de uva, lo cual no siendo de elaboración judía está prohibido como el vino.<br>Permitidos:<br>(ver también \"bebidas\" y \"leche\")<br>', '2019-05-31 11:13:00', NULL),
(48, 'Ketchup', 'Permitidos:<br>(ver también \"tomates\" y \"salsas\")<br>', '2019-05-31 11:13:00', NULL),
(49, 'Leche', 'La Halajá indica que en principio la leche a consumir debe ser supervisada desde el momento del ordeñe. No obstante, es necesario aclarar algunos puntos técnicos que nos ayudarán a entender las disquisiciones posteriores. Esta prohibición tiene como objeto evitar que se mezcle la leche de un animal Tahor (puro, apto para el consumo judío: por ejemplo: vaca, cabra, oveja) con la leche de un animal Tamé (prohibido para el consumo judío: por ejemplo: cerda, camella, burra, etc.) lo cual antiguamente, dadas las condiciones caseras de la comercialización de la leche y cierta conveniencia económica en zonas en las cuales estos últimos animales eran tan comunes como las vacas, era una práctica habitual. Por lo tanto los Rabinos establecieron que en el momento de la ordeña debe haber un judío presente o facultado a estarlo para evitar la posibilidad de una mezcla. <br>Las autoridades rabínicas contemporáneas se dividen en cuanto a la vigencia y condición actual de esta prohibición: Por un lado están los Rabinos que sostienen que esta prohibición se mantiene exactamente igual que al ser decretada ya que, jurídicamente hablando cualquier decreto rabínico para caducar debe ser derogado por una corte Rabínica similar a la que lo promulgo y no es suficiente con que las condiciones hayan cambiado (Taamá Batelá, Guezerá la Batelá) por lo tanto solo autorizan la leche especialmente supervisada.<br>Una segunda opinión sostiene que las normas actuales de salubridad gubernamental cumplen el mismo objetivo preventivo que el supervisor judío presente a la hora de la ordeñe y por lo tanto autoriza la leche común (Jalab Stam, Rab Moshé Feinstein z\"l, Iguerot Moshé, Ioré Deá, 1, 47. No obstante recomienda en principio el consumo de leche supervisada, lo cual era su costumbre personal). <br>La postura más permisiva se basa en que en las circunstancias actuales es muy remoto que una empresa mezcle su leche vacuna con la de animales Tamé (económicamente sería una variante más cara, un despropósito en función de la antigua conveniencia). La plataforma técnica fundamental de esta última postura es que la prohibición de la leche no fue un decreto rabínico formal y promulgado sino una prohibición coyuntural. Lo cual avalaría su derogación de facto ante circunstancias diferentes, donde estos animales no son muy comunes. (Esta opinión se expone magistralmente en el libro Tashbets, Hajut Hameshulash, Hatur Harishón 32) basándose en un minucioso análisis de la Guemará y en una comparación entre lo formulado por Maimónides respecto al queso y a la leche. Recomendamos ampliamente al iniciado en Halajá la lectura de esta Teshubá para una mejor comprensión del tema). También el Perí Jadash (Rabí Jizquiá da Silva, siglo XVI) sostuvo esta misma postura (en su país, Holanda, era prácticamente imposible pensar en estas mezclas). El Rab Obadiá Iosef, si bien sugiere que en principio se opte por la opción más severa, dice que es válido apoyarse en los Rabinos que autorizan el consumo de leche común aun cuando se pueda conseguir leche supervisada (Teshubá personal por escrito, a disposición del lector).<br>Ya que el tema es discutible, en nuestra lista optamos por incluir los productos que contienen leche, (dulce de leche, helados, yogures) pero marcando esta diferencia con las siglas LC después de LÁCTEO. De manera que cada cual pueda o no consumir estos productos ad referendum de la instrucción rabínica de su propia comunidad.<br>', '2019-05-31 11:13:00', NULL),
(50, 'Leche chocolatada', 'Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(51, 'Leche en polvo', 'Muchos de los Rabinos que sostienen la vigencia de la prohibición de leche, autorizan, no obstante el consumo de la leche en polvo (Rab Tzvi Pésaj Frank, Shu\"t Har Tzví, Ioré Deá 113) ya que como tal no fue incluida en la prohibición rabínica original. El Rab Iosef Oppenheimer z\"l, por ejemplo, prohibió la leche común en nuestro país y se esforzó por supervisar Jalab Israel, no obstante, adhirió a las opiniones rabínicas que autorizan la leche en polvo.<br>En esta lista los productos que llevan leche en polvo han sido categorizados como LACTEOS con el agregado de las siglas LP.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(52, 'Legumbres', NULL, '2019-05-31 11:13:00', NULL),
(54, 'Levadura', NULL, '2019-05-31 11:13:00', NULL),
(55, 'Manteca y margarina', 'La margarina se elabora con emulsionantes (monoesteratos, cuya función es mantener unidas las moléculas del aceite y de otros líquidos) de origen prohibido. Es posible que se le agreguen leche y diversos componentes que mejoran su consistencia o su color haciéndola más parecida a la manteca.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(56, 'Mayonesa', 'Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(57, 'Medicamentos', 'Frecuentemente los consumidores se comunican para consultar acerca de la condición ritual casher de cierto medicamento.<br>Si bien el propósito de esta lista está dedicado exclusivamente a los alimentos, quiero dedicar unos renglones a este aspecto, a fin de aclarar parcialmente y tranquilizar al usuario conciente, especialmente en momentos de urgencia, como suele ser cuando se le recetan fármacos que debe adquirir y utilizar de inmediato.<br>Las situaciones de los \'enfermos\' no son todas idénticas, sino que varían de acuerdo a su gravedad.<br>A su vez, el modo de ingesta de los medicamentos no es siempre la misma, y deberá también ser considerada.<br>Podemos diferenciar a los potenciales enfermos en tres categorías:<br>1. Enfermos graves (cuya vida está en riesgo en este momento, o que de no tratarse puede llegar a esa condición): cardíacos, diabéticos, presión alta, depresión severa, infección, riesgo de aborto, bebés con fiebre<br>Una persona que reviste esta situación, puede y debe ingerir cualquier fármaco aun no casher, si no se consigue fácilmente uno equivalente casher - aun si los síntomas que originaron el estado grave se moderaron. Esto es así, aun si el medicamento tiene buen sabor, y aun si contiene Jametz en Pesaj.<br>2. Enfermos cuya vida no está en riesgo<br>Se refiere a quien necesita guardar cama, o quien notoriamente no puede funcionar correctamente dado su padecimiento, o que está afiebrado, pero sin correr riesgo. También abarca a todo niño menor de 6 años que sufre una molestia y a una mujer embarazada que está sufriendo dificultades. Comprende a una persona que sufre de artritis avanzada y el médico le recetó productos de cartílago. A su vez incluye a una persona que atraviesa una depresión leve o a quien tiene un severo dolor de cabeza. Una persona en estas condiciones puede ingerir fármaco (no casher) que es \'einó raui le´ajilat adam\' (no apto para consumo humano), o aun si lo fuera, pero \'sheló kederej ajilá\' (en un modo no común de consumir). Más adelante aclararemos este término.<br>3. Personas sanas que toman medicamentos por un dolor ligero<br>Están comprendidos en esta categoría las personas que sienten un malestar, pero que pueden mantener una rutina de trabajo, a pesar de aquella molestia. Entre estos estarían quienes sufren una indigestión, un dolor de cabeza leve o la irritación de un resfrío común. Si bien estas personas pueden ingerir medicaciones que sean \'einó raui le´ajilá\', es cuestionable si también pueden tomar otros preparados que sí son agradables para el consumo, apoyándose en el hecho que son \'sheló kederej ajilá\'. Por lo tanto, deben consultar con su rabino (ver \'Jojmat Adam en su comentario Binat Adam Cap. 52).<br>Para que un fármaco califique como \'no apto para consumo humano\' cuando los ingredientes no poseen valor apetitoso, hidratante y nutritivo (p.ej. las tabletas de carbón consisten en 100% carbón activado). Sin embargo, la mayoría de las grageas contienen cierta cantidad de almidón, lo cual es un alimento.<br>A su vez, comida que llegó a un estado de descomposición incomestible, tampoco se denomina \'apto para consumo humano\'.<br>Por otro lado, para que el con sumo de un medicamento se denomine \'un modo no común de consumir\', se deben cumplir una de las siguientes condiciones:<br>1. Es una medicación creada para ser tragada sin masticar. Al ingerir una comprimido, cápsula de gelatina o píldora, lo está haciendo en \'un modo no común de consumir\'.<br>2. Asimismo, líquidos desagradables (p.ej. leche de magnesio sin saborizante), o comprimidos sin azúcar se denominan \'un modo no común de consumir\'. Esto se debe a que comúnmente la gente no consume estos productos.<br>Como regla, aun una persona que sufre solamente de un malestar, puede ingerir medicamentos cuyos ingredientes no casher estén anulados en 60 (o sea: 1.6%).<br>Aquí adelantaremos un breve guía de medicaciones:<br>1. Jarabe para la tos, descongestionante, expectorantes - Habitualmente estos fármacos se toman en su modo habitual, pues contienen aditivos que le dan un sabor agradable. El más problemático de los ingredientes, suele ser la glicerina que puede ser de origen mineral o vegetal, pero que suele utilizarse en su origen animal por ser más económico. En la realidad, no se puede fácilmente determinar su procedencia en cada producto. <br>Dado que en la Argentina no contamos con medicamentos supervisados, y frecuentemente estos que hemos mencionado sí contienen glicerina, si una persona siente malestar y requiere de estos fármacos, puede mezclar una cucharita de estos, en 115 cm3. De líquido (jugo de manzana, naranja o agua) de modo que la glicerina quede anulada en 60 veces su cantidad. Si bien habitualmente no está autorizado anular un elemento prohibido dentro de alimento permitido, en este caso sería un \'mevatel safek Isur\' (Shaj, Ioré Deiá 92:8). Este método (de anular una sustancia prohibida) no se debe aplicar a otras circunstancias (Ramá, Ioré Deiá 92:4). En caso de tratarse de un infa', '2019-05-31 11:13:00', NULL),
(58, 'Mermeladas', 'Si bien nos hemos referido con las mermeladas de zapallo y membrillo con la M, existen opiniones que la requieren con participación de un supervisor judío en su cocción.<br>Permitidos:<br> (ver también \"Productos dietéticos\")<br>', '2019-05-31 11:13:00', NULL),
(59, 'Miel y Productos de la colmena', '<div>La miel de abejas está autorizada, salvo que esté saborizada, en cuyo caso requerirá que se investiguen los sabores agregados. </div><div>No así la jalea real, que proviene de la secreción de una glándula. Tampoco la Apis Mellifica.</div><div>Tanto el propóleo como el polen , dado que suele existir adulteración en su comercialización , requieren de autorización Rabínica .</div>', '2019-05-31 11:13:00', NULL),
(60, 'Milanesas de soja', '(ver \"productos naturistas\")<br />', '2019-05-31 11:13:00', NULL),
(61, 'Mostaza', NULL, '2019-05-31 11:13:00', NULL),
(62, 'Palitos Helados ', NULL, '2019-05-31 11:13:00', NULL),
(63, 'Pan', 'El pan común tiene dos inconvenientes de Cashrut. El primero es que en muchas de sus variedades (tipo casero, pebetes, etc.) se lo elabora con grasa animal. O en otras (pan francés etc) las bandejas son untadas con este tipo de grasa. Este es también el principal problema del pan tipo lactal, todos contienen grasa animal por lo cual sólo se autorizan los elaborados en partidas especiales con Hashgajá.<br>El otro inconveniente es que la Halajá (ley judía, Ioré Deá 112, 2) autoriza el consumo del pan común de la panadería (cuando no hay problemas de grasa) sólo cuando no es posible conseguir pan elaborado por judíos. Estas restricciones son leyes Rabínicas que tienen que ver con consideraciones socio-religiosas (Mishum Jatnut). <br>Por todo lo expuesto, sólo se permitiría el consumo de pan común de la panadería con dos condiciones:<br>1. cuando se sabe que el pan y las bandejas donde se lo horneó no contienen grasa animal. <br>2. en lugares donde no se puede conseguir pan elaborado por judíos.<br>En este último caso se permite el pan de La Esquina de las Flores que posee únicamente productos naturales sin agregados de grasa animal.<br>Permitidos:<br> (ver \"pastas\")<br>', '2019-05-31 11:13:00', NULL),
(64, 'Pan rallado y rebozadores', 'En muchos casos se utiliza pan viejo para elaborarlos. Este puede contener grasa o estar elaborado sobre chapas engrasadas.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(65, 'Panadería y pastelería', NULL, '2019-05-31 11:13:00', NULL),
(66, 'Papas fritas', 'No hemos referido a las papas fritas como M, dadas las opiniones que la requieren con participación de un supervisor judío en su cocción.<br>', '2019-05-31 11:13:00', NULL),
(67, 'Papas pre-fritas', NULL, '2019-05-31 11:13:00', NULL),
(68, 'Pasta de mani y sesamo, mani y chocolate', NULL, '2019-05-31 11:13:00', NULL),
(69, 'Pastas frescas', 'Casi todas las pastas frescas, tapas de empanadas, prepizza etc. caseras o industriales que hemos analizado poseen grasas de origen animal, por lo tanto sólo se autoriza a consumir las pastas frescas de negocios o restaurantes Casher, con la correspondiente Hashgajá.<br />(ver \"fideos\")<br />Permitido:<br />(ver \"pan\")<br />', '2019-05-31 11:13:00', NULL),
(70, 'Pescado ahumado', 'Permidos: <br>Respecto a los pescados que se denominan \"ahumados\", es menester aclarar que en muchos casos no utilizan el método de ahumar con humo frío, que esta exento de la prohibición de Bishulei Akum (Iore Deia 113:13), sino que se preparan en hornos calientes.<br>En los últimos tiempos se ha puesto de moda consumir \"sushi\", una comida preprada a base pescado crudo con arroz, vinagre, hojas de alga (\"Nori\"), salsa de soja, y una hierba japonesa molida llamada Wasabi.<br>Por distintos motivos, no se debe consumir sin supervisión adecuada:<br>El Wasabi no suele ser puro, dada la dificultad en crecerlo. La salsa de soja puede contener vinagre de vino estar preparada en utensilios prohibidos. En el caso del \"Nori\", se debe tener la certeza que no tenga insectos y que no este saborizado (cosa frecuenta en el lejano oriente). El arroz entra dentro de las comidas limitadas por la ley de Bishul Yisrael. Por ultimo, el pescado puede haber sido conservado en salmuera.<br>Otra moda reciente, es consumir \"Surimi\", que es carne de pescado molido con sabor imitación de cangrejo (un crustáceo prohibido). Dado que no se reconoce el pescado original (ni los demás ingredientes), no se debe consumir si no cuenta con una certificación aceptada.<br>', '2019-05-31 11:13:00', NULL),
(71, 'Pescados envasados', 'Los problemas con los pescados enlatados pueden ser varios. En primer lugar, si el pescado declarado es realmente el pescado que se presenta, caso común en el Atún, que a veces se reemplaza por pescados no Casher muy semejantes en su forma y sabor a éste.<br>La cocción de los pescados (ahumados), y las latas de pescado casher que se cocinan con vapor, si se considera o no Bishul Goím, es un punto conflictivo de consideración rabínica.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(72, 'Pescados Frescos', '<p>     (especies permitidas, según la denominación local) </p><p>La Torá permite únicamente el consumo de pescados que tienen escamas y aletas.     <br />No todas las escamas son idénticas. Los ictiólogos dividen las escamas de peces en cuatro categorías: cicloides, ctenoides, ganoideas y placoideas.Ambas las escamas cicloideas y ctenoideas, tienen aspecto redondeado parecido a una uña, y se cubren tal como las tejas de un techo. Las escamas están insertas en saquillos externos, con un borde conectado a la piel y el otro libre. Estas escamas están unidas muy someramente, y se quitan con facilidad.Por otro lado, las escamas ganoideas y placoideas están fuertemente implantas en la piel y no pueden quitarse sin arrancar la piel del pescado. Solamente las especies con las dos primeras clases de escamas (cicloideas y ctenoideas) pueden ser consumidas. <br />             No es necesario que todo el pez esté cubierto con escamas. Aun si tuviera una sola escama, en una de estas tres áreas del pez, es casher: la cola, la aleta o la mandíbula.     <img src=\"http://www.kosher.org.ar/j_15/images/guia_kosher/peces.gif\" border=\"0\" alt=\"Escamas de pez\" title=\"Escamas de pez\" width=\"592\" height=\"316\" /> <br />         <strong>ATENCION: </strong>             En países limítrofes, pueden usar la misma denominación para otros peces no casher, por lo cual se debe tomar la precaución de cerciorarse que éstos posean las escamas que lo identifican como pez casher. <br />        A su vez, es importante saber que existen pescados con parásitos que deben ser controlados antes de ser cocinados.         (ver “verduras frescas y congeladas” al respecto)             </p><p><strong>Permitidos:</strong>             Anchoa             Anchoíta             Arenque             Atún             Boga             Brótola             Caballa             Cornalitos             Corvina             Dorado             Jurel             Lenguado             Lisa             Merluza             Mero             Palometa             Pejerrey             Salmón             Sardinas             Trilla             Trucha         (Esta lista no es completa) </p><p><strong>        ATENCION: </strong>No se deben moler los pescados en la picadora de una pescadería en la cual se comercian pescados casher y no casher.         El caviar está permitido únicamente si está supervisado, para tener la certeza que proviene de una especie de peces casher. </p>', '2019-05-31 11:13:00', NULL),
(73, 'Polenta', 'Permitidas:<br>', '2019-05-31 11:13:00', NULL),
(74, 'Polvo para preparar flanes', 'Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(75, 'Polvo para preparar jugos', NULL, '2019-05-31 11:13:00', NULL),
(76, 'Polvo para preparar postres', NULL, '2019-05-31 11:13:00', NULL),
(77, 'Polvos para preparar tortas', 'Actualmente no hay productos autorizados.', '2019-05-31 11:13:00', NULL),
(78, 'Productos aptos Celiacos', NULL, '2019-05-31 11:13:00', NULL),
(79, 'Productos de copetin', 'Permitidos:<br> (ver también \"productos de repostería\")<br>', '2019-05-31 11:13:00', NULL),
(80, 'Productos de reposteria', 'En este rubro muchos consumidores suelen ser poco cuidadosos en la elección de los insumos, pues sienten que son elementos \"inocuos\" en materia de Cashrut.<br>Permitidos:<br>(ver también \"chocolate para taza\")<br>', '2019-05-31 11:13:00', NULL),
(81, 'Productos naturistas y varios', 'Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(82, 'Pure de papa', 'Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(83, 'Quesos', 'El Talmud establece la prohibición formal de comer quesos elaborados por no judíos ya que se utilizaba, y en muchos casos se sigue usando hasta hoy, cuajo animal en su elaboración. Según todas las opiniones (a diferencia de la leche), ésta es una Guezerá o prohibición rabínica promulgada. Por consiguiente, aunque las circunstancias cambien y hoy en día se elaboren algunos quesos cuajados a base de otros productos químicos, la prohibición sigue vigente. Por este motivo, sólo se pueden consumir quesos Casher supervisados especialmente.<br>¿Cuánto tiempo se debe esperar después de comer queso para volver a comer carne?<br>Es sabido que se debe esperar después de comer carne, si uno desea comer productos lácteos. Según la mayoría de las opiniones, se suele esperar 6 horas.<br>Si el queso es \"duro\", también se debe esperar 6 horas (Ioré Deá 89;4). <br>\"Duro\" se llama cuando solo se rallar, y no se puede cortar en rebanadas.<br>', '2019-05-31 11:13:00', NULL),
(84, 'Rollos y bandejas de alumino y material de cocina', 'Los rollos de papel de aluminio habitualmente no presentan problemas de Cashrut. Por otro lado, las bandejas descartables de aluminio, sí pueden estar cubiertas con una lámina residual de lubricante que puede contener elementos de origen animal. Por lo tanto, si no gozan de supervisión rabínica, se recomienda lavarlas con agua y detergente tibios antes de usarlas.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(85, 'Salsas', 'Permitidos:<br> (ver también \"Tomates\" y \"ketchup\")<br>', '2019-05-31 11:13:00', NULL),
(86, 'Sidras y afines', 'Permitidas:<br>', '2019-05-31 11:13:00', NULL),
(87, 'Surimi', '(Ver \"pescados\")<br>', '2019-05-31 11:13:00', NULL),
(88, 'Sushi', '(Ver \"pescados\")<br>', '2019-05-31 11:13:00', NULL),
(89, 'Te saborizado', NULL, '2019-05-31 11:13:00', NULL),
(90, 'Tomates en lata, en tetrabrick, salsas y pure', '(ver la explicación en \"frutas y verduras enlatados\")<br>Dado que el puré de tomate es un producto de uso cotidiano y se envasa para \"marcas blancas\" de supermercados y \"segundas marcas\", hemos incluido aquí los códigos de la plantas de elaboración en las cuales no encontramos elementos prohibidos y se podrán consumir todos los productos de tomate que allí se elaboren: RNE 180000663, RNE 13004920, RNE 03000043, RNE 16000317, RNE 13004857, o RNPA 03000859/6, RNE 13001989, RNE 1331103<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(91, 'Turrones', NULL, '2019-05-31 11:13:00', NULL),
(92, 'Verduras frescas y congeladas', 'Las verduras frescas (coliflor, brócoli, alcaucil) y especialmente las de hoja (espinaca, acelga, lechuga etc.), deben ser estrictamente supervisadas antes de su consumo para verificar que no tengan gusanos u otros insectos cuya ingestión se considera una severa transgresión a las normas del Cashrut, razón por la cual este año los hemos dejado fuera de la lista. El Centro Comunitario Sucat David (Tel. 4961-1265) ha editado un libro para uso doméstico que explica minuciosamente como debe ser revisada cada clase de verdura y fruta.<br>Dado que las verduras congeladas son productos de uso cotidiano y se envasa para \"marcas blancas\" de supermercados y \"segundas marcas\", hemos incluido aquí los códigos de la plantas de elaboración en las cuales no encontramos elementos prohibidos y se podrán consumir todos los vegetales que no posean riesgo de infestación de insectos que allí se elaboren: RNE 21-000868<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(93, 'Vinagre', 'El vinagre de vino, como cualquier otro producto derivado de este último, se prohibe. Se permite el vinagre de Alcohol o de manzana, pero no los saborizados o aromatizados ni el aceto balsámico.<br>Permitidos:<br>', '2019-05-31 11:13:00', NULL),
(94, 'Vinos', 'Los vinos deben ser de elaboración judía para estar permitidos, con la supervisión correspondiente que figura normalmente en la etiqueta del producto.<br>', '2019-05-31 11:13:00', NULL),
(95, 'Vitaminas y Nutrientes', NULL, '2019-05-31 11:13:00', NULL),
(96, 'Yerba Mate', NULL, '2019-05-31 11:13:00', NULL),
(97, 'Yogures', 'El yogur, por lo general, posee una cantidad mínima de gelatina (1/ 250 o 1/ 500, en los aquí autorizados). De acuerdo a algunas opiniones la gelatina en éste y otros casos cumple la función de un gelificante o estabilizante que entraría en la categoría de <strong>Maamid</strong> (que no se anula con 60 veces más). No obstante, para otras distinguidas autoridades rabínicas, la gelatina <strong>es un elemento prescindible para la elaboración básica del yogur</strong> y no se considera como Ma’amid. En esta postura se basa nuestra autorización. (Para una mejor comprensión del tema ver libro Itsjac Ieranén, 73 y 74, del Rab Itsjac Chehebar z\"l y la respuesta del Rab Obadiá Iosef).', '2019-05-31 11:13:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `fechaBaja`) VALUES
(1, 'admin', '613mitzvot', NULL),
(2, 'dami', 'dami', NULL),
(5, 'DANDANIEL2', 'DANIEL', NULL),
(6, 'DANDANIEL3', 'DAN1213', NULL),
(7, 'DANDANIEL', 'DANIEL21', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `codigo`
--
ALTER TABLE `codigo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indexes for table `lecheparve`
--
ALTER TABLE `lecheparve`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`),
  ADD KEY `fk_producto_categoria` (`rubroId`),
  ADD KEY `fk_producto_nivel` (`nivelId`),
  ADD KEY `fk_producto_lecheparveId` (`lecheparveId`);

--
-- Indexes for table `rubro`
--
ALTER TABLE `rubro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `codigo`
--
ALTER TABLE `codigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lecheparve`
--
ALTER TABLE `lecheparve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `rubro`
--
ALTER TABLE `rubro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`rubroId`) REFERENCES `rubro` (`id`),
  ADD CONSTRAINT `fk_producto_lecheparveId` FOREIGN KEY (`lecheparveId`) REFERENCES `lecheparve` (`id`),
  ADD CONSTRAINT `fk_producto_nivel` FOREIGN KEY (`nivelId`) REFERENCES `codigo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
