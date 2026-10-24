# Resumo da aula 01 — Introdução ao desenvolvimento mobile

Nesta primeira aula conheci a proposta da disciplina e fizemos uma revisão de conceitos que vão aparecer durante o desenvolvimento de aplicativos. O foco será Android, com Kotlin e Android Studio. Ao longo do curso, os conteúdos devem se conectar: primeiro entendemos a lógica e o ambiente; depois construímos interfaces, organizamos dados, conectamos serviços e pensamos em segurança, testes e publicação.

## Programas e algoritmos

Um programa reúne instruções para executar uma tarefa. O algoritmo descreve, em uma sequência finita e organizada, como chegar à solução de um problema. Antes de escrever código, é útil identificar as entradas, as regras que precisam ser aplicadas e o resultado esperado.

A eficiência também depende de como o trabalho cresce quando aumenta o volume de dados. A notação Big O descreve esse crescimento de forma aproximada e permite comparar soluções. Ela não é uma medida exata de tempo de execução em um celular específico.

## Ecossistema mobile

Revisamos a evolução das redes móveis: 1G era analógica e voltada a chamadas; 2G trouxe comunicação digital e SMS; 3G ampliou o acesso à internet móvel; 4G aumentou a capacidade de transmissão; e 5G busca oferecer mais capacidade e menor latência para diferentes usos. O desempenho real depende também da cobertura, do aparelho e da rede disponível.

Android e iOS são os sistemas móveis mais conhecidos. Nesta disciplina vamos trabalhar com Android, mas a escolha de plataforma em um projeto real depende de quem vai usar o aplicativo e das necessidades do produto.

## Formas de desenvolver aplicativos

- **Nativo:** desenvolvido para uma plataforma, usando suas ferramentas e APIs. Kotlin e Java são comuns no Android; Swift é usado no ecossistema Apple.
- **Híbrido:** utiliza tecnologias web junto de uma estrutura para funcionar como aplicativo móvel.
- **Multiplataforma:** permite compartilhar parte da implementação entre sistemas, com ferramentas como Flutter e React Native.

Cada opção envolve decisões sobre desempenho, acesso aos recursos do aparelho, reaproveitamento de código, custo e manutenção. A categoria sozinha não determina a qualidade do aplicativo.

## Organização de um aplicativo

Uma forma inicial de pensar no projeto é separar a interface, as regras e o acesso aos dados. A interface apresenta informações e recebe ações; a lógica aplica as regras; a camada de dados conversa com armazenamento local ou serviços externos. Essa separação facilita localizar responsabilidades e manter o código.

## Ferramentas e próximos passos

Kotlin será usada para escrever as regras do aplicativo. Android Studio é a IDE que reúne editor, ferramentas de build, SDK, emulador e depuração. A próxima etapa é praticar a linguagem e conhecer a estrutura de um projeto, antes de avançar para telas mais completas.

**Para conferir:** consigo descrever um problema como algoritmo? Sei explicar a diferença entre nativo, híbrido e multiplataforma? Consigo identificar qual parte de um app corresponde à interface, às regras e aos dados?
