# Minhas anotações: Introdução ao desenvolvimento mobile

Nesta aula comecei a organizar o que vamos estudar na disciplina. O foco será criar aplicativos para dispositivos móveis, principalmente para Android, usando Kotlin e Android Studio. A ideia é acompanhar o caminho desde os conceitos básicos até testar e preparar um aplicativo para publicação.

## O que entendi

Um aplicativo é um programa feito para resolver uma necessidade de quem usa o celular. Para isso, ele recebe dados, aplica regras e mostra um resultado pela interface. Por exemplo, em um app de compras, a pessoa escolhe produtos, o aplicativo calcula o pedido e apresenta o valor final.

Antes de programar, preciso entender o problema e descrever uma sequência de passos para resolvê-lo. Essa sequência é o algoritmo. Também apareceu a ideia de analisar como o custo de um algoritmo cresce quando aumenta a quantidade de dados. A notação Big O ajuda a comparar esse crescimento; ela não informa exatamente quantos segundos uma tarefa vai levar em qualquer aparelho.

## Tipos de aplicativo

- **Nativo:** feito para uma plataforma específica. No Android, podemos usar Kotlin ou Java. A integração com os recursos do aparelho costuma ser direta, mas manter versões diferentes para Android e iOS pode exigir mais trabalho.
- **Híbrido:** combina tecnologias web com uma estrutura que permite distribuir o aplicativo em plataformas móveis. A escolha pode facilitar o reaproveitamento de código, mas precisa considerar o desempenho e os recursos necessários.
- **Multiplataforma:** permite compartilhar parte do código entre plataformas. Flutter e React Native são exemplos de tecnologias dessa categoria; isso não significa que todo aplicativo terá exatamente a mesma experiência ou implementação em cada sistema.

Essas categorias têm diferenças e não existe uma escolha melhor para todos os casos. É preciso considerar a equipe, o prazo, o público, o desempenho esperado e os recursos do aparelho que o projeto vai usar.

## Como um aplicativo se organiza

Anotei uma divisão simples: interface, regras do aplicativo e dados. A interface recebe as ações da pessoa e apresenta informações. A lógica aplica as regras do negócio. A parte de dados guarda ou busca o que o aplicativo precisa. Separar essas responsabilidades ajuda a entender e alterar o projeto depois.

Também revisamos a evolução das redes móveis (1G a 5G) e os sistemas Android e iOS. Para esta disciplina, o desenvolvimento será voltado a Android. Kotlin será a linguagem de programação, e o Android Studio será a ferramenta usada para editar, executar e depurar os projetos.

## Para revisar

1. Escolher uma tarefa simples do cotidiano e escrever os passos que um aplicativo poderia seguir para resolvê-la.
2. Comparar os tipos nativo, híbrido e multiplataforma pensando em um aplicativo conhecido.
3. Abrir o Android Studio e identificar onde ficam o código, os recursos e as configurações de um projeto.

Ainda preciso praticar mais a lógica e me acostumar com a IDE antes de começar projetos maiores.
