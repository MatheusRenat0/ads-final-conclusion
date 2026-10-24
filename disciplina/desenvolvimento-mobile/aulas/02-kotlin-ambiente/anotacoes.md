# Minhas anotações: Kotlin e ambiente Android

Nesta aula estou juntando a revisão de lógica com os primeiros elementos de Kotlin e a estrutura do ambiente. O ponto principal para mim é não misturar tudo em uma tela: as regras devem poder ser entendidas e testadas separadamente.

## Kotlin e tipos

Kotlin distingue valores que podem ser nulos daqueles que não podem. Essa diferença ajuda a perceber situações em que um dado talvez não exista e obriga o código a tratar esse caso. `val` cria uma referência que não pode receber outro valor depois da inicialização; `var` pode ser alterada.

Uma função recebe entradas, executa uma tarefa e pode devolver um resultado. Por exemplo:

```kotlin
data class Produto(val nome: String, val preco: Double)

fun aplicarDesconto(produto: Produto, percentual: Double): Double {
    require(percentual in 0.0..100.0)
    return produto.preco * (1 - percentual / 100)
}
```

Aqui, `require` impede que o percentual seja menor que zero ou maior que 100. Se o valor estiver fora do intervalo, a função interrompe a execução com uma exceção. Ainda seria necessário pensar em validações adicionais, como preço negativo e arredondamento monetário.

## Algoritmos e organização

Para escrever uma função, primeiro defino o que ela recebe e o que deve devolver. Funções menores deixam mais claro onde cada regra está. A análise Big O ajuda a comparar o crescimento do trabalho: percorrer uma lista inteira costuma crescer linearmente; buscar por divisão repetida exige que a lista esteja ordenada e costuma crescer mais devagar.

## Android Studio e projeto

O Android Studio reúne o editor, o sistema de build Gradle, o SDK Android, emuladores e ferramentas de depuração. Um projeto costuma ter código-fonte, recursos visuais e textuais, manifesto e arquivos de configuração. O Gradle registra dependências e opções de build.

Para executar o app, posso usar um emulador ou um aparelho conectado com a depuração autorizada. As versões de SDK e dependências precisam corresponder à configuração do projeto; não devo escolher versões no escuro nem colocar senhas e chaves privadas no repositório.

## Exercícios que quero fazer

1. Escrever uma função que calcule o total de um produto pela quantidade.
2. Definir o que deve acontecer se a quantidade ou o preço forem inválidos.
3. Comparar uma busca simples com busca binária e explicar por que a segunda exige uma lista ordenada.
4. Abrir um projeto no Android Studio e localizar o código, os recursos, o manifesto e a configuração Gradle.
