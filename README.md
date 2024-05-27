# Projeto de Listagem das Casas de Game of Thrones

## Visão Geral
Bem-vindo ao projeto de estudos Listagem das Casas de Game of Thrones! Este aplicativo fornece uma listagem das casas e seus membros da icônica série Game of Thrones. O aplicativo utiliza gerenciamento de estado, obtenção de dados, filtragem e animações para garantir uma experiência de usuário contínua e envolvente. Foi utilizado clean architecture nesse projeto.

![Simulator Screenshot - iPhone 15 - 2024-05-27 at 09 15 47](https://github.com/CamileBarros/got-app-studies/assets/103670262/810150b3-402c-4d56-859d-ffc2411f7c2b) ![Simulator Screenshot - iPhone 15 - 2024-05-27 at 09 15 29](https://github.com/CamileBarros/got-app-studies/assets/103670262/8ad69b50-a67b-413a-845d-065c7344b15e) ![Simulator Screenshot - iPhone 15 - 2024-05-27 at 09 15 39](https://github.com/CamileBarros/got-app-studies/assets/103670262/a39f0d5d-9f2e-44bb-9074-de9c2fc8d17e)


## Funcionalidades

### Gerenciamento de Estado com ValueListenable
Para gerenciar eficientemente o estado dentro do aplicativo, utilizei `ValueListenable`. Esta abordagem é simples, utilizando o gerenciamento nativo do flutter, garante que o aplicativo reaja às mudanças no estado de maneira responsiva e eficiente, mantendo a interface do usuário consistente com os dados.

### Obtenção e Filtragem de Dados
O aplicativo obtém dados de múltiplos endpoints:
- **Endpoint de Casas e Membros**: Fornece informações detalhadas sobre as casas e seus membros.
- **Endpoint de Imagens dos Membros**: Fornece imagens dos membros.

Para filtrar e corresponder dados entre esses endpoints, usei `firstWhereOrNull`, o que permite um manuseio de dados simplificado e eficiente, garantindo que cada casa e membro seja representado com precisão com suas respectivas imagens.

### Temas Personalizados com Enum
Um enum é usado para definir temas personalizados para cada casa, incluindo:
- **Cores**: Cada casa é associada a um esquema de cores específico.
- **Imagens SVG**: Imagens SVG únicas são usadas para cada casa para melhorar a representação visual.

### Animação de Carregamento Personalizada
Para melhorar a experiência do usuário durante o carregamento de dados, uma animação de carregamento personalizada usando um GIF foi implementada. Isso garante que os usuários tenham uma experiência visualmente atraente mesmo enquanto aguardam o carregamento dos dados.

### Transições Animadas
Para proporcionar uma experiência de usuário suave e envolvente, o aplicativo apresenta uma transição animada da visualização do card da casa para a visualização detalhada dos membros usando `AnimatedSwitcher`. Esta animação melhora o fluxo visual e torna a navegação entre telas mais interativa e agradável.

### Testes
O aplicativo consta com testes para garantir o desempenho:
- **Testes Unitários**: Focados na camada de dados para garantir a integridade dos dados.

## Começando
Para começar com o projeto, clone o repositório e siga as instruções de configuração abaixo.

### Pré-requisitos
- Flutter SDK
- Dart SDK

### Instalação
1. Clone o repositório:
   ```sh
   git clone https://github.com/CamileBarros/got-app-studies.git

