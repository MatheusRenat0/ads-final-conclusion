# Anotações de estudo — Kotlin e ambiente Android

## Conceitos

Kotlin modela dados e regras; Android Studio fornece editor, Gradle, SDK, emulador e ferramentas de depuração. Um projeto Android costuma separar código-fonte, recursos, manifesto e configuração de build.

## Desenvolvimento e prática

Kotlin distingue valores anuláveis e não anuláveis. `val` declara referência somente leitura; `var`, mutável. Use funções pequenas e tipos explícitos quando melhorarem a clareza. Algoritmos devem ter entradas, passos e resultados definidos. Complexidade Big O descreve como custo cresce com entrada, não o tempo exato em um aparelho.

```kotlin
data class Produto(val nome: String, val preco: Double)

fun aplicarDesconto(produto: Produto, percentual: Double): Double {
    require(percentual in 0.0..100.0)
    return produto.preco * (1 - percentual / 100)
}
```

`require` valida argumento e lança `IllegalArgumentException` se inválido. Em app, a regra deve ser chamada fora da camada visual e testada com entradas válidas e inválidas.

No Android Studio, SDK e emulador precisam estar instalados; o projeto também pode ser executado em dispositivo com depuração autorizada. Guarde configuração e dependências no Gradle; não versione segredos nem dados locais.

**Exercícios:** implemente uma função de total com quantidade; trate preço inválido; compare laço linear com busca binária em lista ordenada.
