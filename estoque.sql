-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Jun-2023 às 14:25
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carinho`
--

CREATE TABLE `carinho` (
  `id_carrinho` int NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `carinho`
--

INSERT INTO `carinho` (`id_carrinho`, `id_usuario`) VALUES
(1, 4),
(2, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carinho_itens`
--

CREATE TABLE `carinho_itens` (
  `id_carrinho_itens` int NOT NULL,
  `id_produto` int NOT NULL,
  `id_carrinho` int NOT NULL,
  `quantidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `carinho_itens`
--

INSERT INTO `carinho_itens` (`id_carrinho_itens`, `id_produto`, `id_carrinho`, `quantidade`) VALUES
(1, 9, 1, 3),
(2, 3, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int NOT NULL,
  `id_pedidos` int NOT NULL,
  `CEP` int NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`id_entrega`, `id_pedidos`, `CEP`, `rua`, `numero`, `complemento`) VALUES
(1, 11, 89223266, 'sefsef', 85, '5dgj');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedidos` int NOT NULL,
  `id_usuario` int NOT NULL,
  `valor_pedido` decimal(10,2) NOT NULL,
  `status` int NOT NULL,
  `id_entrega` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedidos`, `id_usuario`, `valor_pedido`, `status`, `id_entrega`) VALUES
(1, 7, '0.00', 0, NULL),
(2, 10, '0.00', 0, NULL),
(3, 1, '0.00', 0, NULL),
(4, 2, '0.00', 0, NULL),
(5, 3, '0.00', 0, NULL),
(6, 5, '0.00', 0, NULL),
(7, 4, '0.00', 0, NULL),
(8, 8, '0.00', 0, NULL),
(9, 9, '0.00', 0, NULL),
(10, 6, '0.00', 0, NULL),
(11, 2, '0.00', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `id_pedido_produto` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `Quantidade` int NOT NULL,
  `valor_atual_produto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `pedido_produto`
--

INSERT INTO `pedido_produto` (`id_pedido_produto`, `id_pedido`, `id_produto`, `Quantidade`, `valor_atual_produto`) VALUES
(5, 3, 9, 1, '0.00'),
(6, 3, 8, 3, '0.00'),
(7, 4, 3, 2, '0.00'),
(8, 4, 2, 1, '0.00'),
(9, 6, 9, 4, '0.00'),
(10, 5, 8, 2, '0.00'),
(11, 1, 1, 3, '0.00'),
(12, 2, 5, 1, '0.00'),
(13, 1, 1, 1, '0.00'),
(14, 2, 3, 2, '0.00'),
(15, 7, 4, 3, '0.00'),
(16, 7, 2, 4, '0.00'),
(17, 8, 6, 1, '0.00'),
(18, 8, 8, 3, '0.00'),
(19, 9, 10, 2, '0.00'),
(20, 9, 5, 1, '0.00'),
(21, 10, 5, 4, '0.00'),
(22, 10, 7, 2, '0.00'),
(23, 11, 8, 3, '0.00'),
(24, 11, 11, 1, '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produtos` int NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `descricao_produto` varchar(200) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `Continente` text NOT NULL,
  `Quantidade em g` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produtos`, `nome_produto`, `descricao_produto`, `pais`, `valor`, `Continente`, `Quantidade em g`) VALUES
(1, 'Páprica Picante', 'Levemente picante, uma especiaria nascida na região da América Central e do México.', 'México', '15.00', 'Europa', 100),
(2, 'Lemon Peper', 'Feito com os principais ingredientes: limão e a pimenta, dois ingredientes que melhoram a digestão e', 'Estados unidos', '12.00', 'América do Norte', 500),
(3, 'Canela', 'Essa substância acelera o metabolismo promovendo a queima de gordura corporal.', 'Sri Lanka', '18.00', 'Ásia', 500),
(4, ' Barbecue em pó', 'Indicado para costelinha depois de pronta, temperar frangos, hambúrgueres ou maionese.', 'Estados Unidos ', '13.00', 'América do Norte', 200),
(5, 'Chili em pó', 'Extremamente picante e muito saborosa. ', 'México', '21.00', 'América do Norte', 500),
(6, 'Dry rub', 'Combina quantidades iguais de 6 a 10 ervas, utilizada para temperar a carne.', '', '27.00', 'América do Norte', 250),
(7, 'Pimenta do Reino', 'Tem um sabor suave e picante por dentro', 'Portugal', '49.00', 'Ásia', 100),
(8, 'Alecrim', 'Erva aromática comum na região do Mediterrâneo', 'Países de clima temperado', '7.00', '', 20),
(9, 'Gengibre em pó', 'Esta é uma planta medicinal que possui sabor apimentado, diminuindo a necessidade de sal.', 'Ilha de Java', '12.00', 'Ásia', 500),
(10, 'Pasta de Aji Panca', 'Originária dos Andes, a Pimenta \"Aji Panca\" possui uma leve ardência, com um sabor muito característ', 'Perú', '21.00', 'América do Sul', 227),
(11, 'Cominho em pó', 'Bastante usado para carnes, é preciso tomar cuidado em preparações na frigideira, pois queima rápido.', 'Egito ', '23.00', 'África ', 500),
(12, 'Cúrcuma em pó', 'Muito usada para temperar curry de peixes, frutos do mar e picles, e no frango ensopado mineiro.', 'Índia e Indonésia', '19.00', 'Ásia ', 75),
(13, 'Noz-moscada', 'Ideal para usar em preparações com queijo, batatas, creme de leite, suflês e brownie.', 'Indonésia', '29.00', 'Ásia', 110),
(14, 'Pimenta síria', 'É uma mistura de pimenta-da-Jamaica, canela e pimenta-do-reino, usada largamente na culinária árabe para condimentar quibes e esfihas', 'Golfo Pérsico', '16.00', 'Ásia', 80),
(15, 'Anis-estrelado', 'É muito usado para doces, biscoitos e licores.', 'China ', '19.00', 'Ásia', 200),
(16, 'Hortelã', 'Use para incrementar saladas, molhos à base de iogurte, carnes e legumes cozidos.', '', '2.00', 'Europa', 100),
(17, 'Dill', 'Combina muito bem com salmão defumado, marinado, gravlax e poché, além de ir bem em cremes, omeletes e preparações com iogurte.', 'Rússia ', '15.00', 'Europa', 80);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome_de_usuario` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `CEP` varchar(8) NOT NULL,
  `Endereço` varchar(150) NOT NULL,
  `complemento` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome_completo`, `email`, `nome_de_usuario`, `senha`, `CPF`, `CEP`, `Endereço`, `complemento`) VALUES
(1, 'Arthur de Lima Pereira', 'arthurreeylima8@gmail.com', 'arthur', 'robo13', '32525584252', '58723484', 'Rua tijucas', 'casa\r\n'),
(2, 'Alberto Dalmarco Neto', 'albertomarco10@hotmail.com', 'bebeto', 'betinho1', '15249358752', '85493578', 'Rua linda prata', 'apartamento'),
(3, 'Leticia Oliveira', 'lele10@gmail.com', 'lelezinha', 'linda123', '54987623548', '87596321', 'Rua Blumenau', 'casa'),
(4, 'Victor Henrique Will', 'victor.will@gmail.com', 'bigode', 'hellboy18', '12345678910', '12345678', '', ''),
(5, 'Geovana da Silva Jochem', 'geovanajochem78@gmail.com', 'geo', 'victor123', '98765432110', '98765432', 'Rua Louca Branca', 'germinado'),
(6, 'Gabriel Arantes', 'arantesloko@gmail.com', 'arantes', 'vidaloka', '12453821458', '95324857', 'Rua Nicoli bebada', 'casa'),
(7, 'Leonardo Winters', 'leonardowinters@hotmail.com', 'leleo', 'leleodelas', '58301200556', '78003498', 'Rua isabela', 'Loja'),
(8, 'Breno Souza', 'brenosouza@hotmal.com', 'breninho', 'breno1245', '12457896301', '12457896', 'Rua felix', 'apartamente'),
(9, 'Ana Julia Briesemeister Xavier', 'anajuliab.xavier@gmail.com', 'AJ', 'aaaaa11', '32165465498', '32165498', 'Rua America', 'casa'),
(10, 'Sor Felipe', 'gilvanibaldis@hotmail.com', 'calvo', 'é.meu.jeitinho', '36925814709', '36925814', 'Rua belaza pura', 'prédio');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carinho`
--
ALTER TABLE `carinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `carinho_itens`
--
ALTER TABLE `carinho_itens`
  ADD PRIMARY KEY (`id_carrinho_itens`),
  ADD KEY `id_carrinho` (`id_carrinho`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_pedidos` (`id_pedidos`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedidos`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_entrega` (`id_entrega`);

--
-- Índices para tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD PRIMARY KEY (`id_pedido_produto`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produtos`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carinho`
--
ALTER TABLE `carinho`
  MODIFY `id_carrinho` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `carinho_itens`
--
ALTER TABLE `carinho_itens`
  MODIFY `id_carrinho_itens` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id_entrega` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedidos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  MODIFY `id_pedido_produto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produtos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carinho`
--
ALTER TABLE `carinho`
  ADD CONSTRAINT `carinho_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `carinho_itens`
--
ALTER TABLE `carinho_itens`
  ADD CONSTRAINT `carinho_itens_ibfk_1` FOREIGN KEY (`id_carrinho`) REFERENCES `carinho` (`id_carrinho`),
  ADD CONSTRAINT `carinho_itens_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produtos`);

--
-- Limitadores para a tabela `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id_pedidos`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_entrega`) REFERENCES `entrega` (`id_entrega`);

--
-- Limitadores para a tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `pedido_produto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedidos`),
  ADD CONSTRAINT `pedido_produto_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produtos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
