# Anotações de estudo — Interfaces e componentes Android

## Conceitos

A UI apresenta estado e recebe interação. No Android atual, Jetpack Compose é uma opção declarativa; projetos também podem usar layouts XML e Views. Siga a tecnologia definida pelo projeto.

## Desenvolvimento e prática

Uma interface acessível comunica hierarquia, mantém alvos de toque confortáveis, oferece rótulos para leitor de tela e mostra estados de carregamento, vazio e erro. Em Compose, composables descrevem UI a partir do estado; mudanças de estado provocam recomposição.

```kotlin
@Composable
fun Saudacao(nome: String, aoContinuar: () -> Unit) {
    Column {
        Text(text = "Olá, $nome")
        Button(onClick = aoContinuar) { Text("Continuar") }
    }
}
```

O exemplo pressupõe imports Compose e execução dentro de uma Activity configurada. Mantenha lógica de negócio fora do composable. Para formulários, associe rótulo, validação e mensagem de erro ao campo correspondente.

**Exercícios:** desenhe estados de uma tela de lista; acrescente texto alternativo a uma imagem; descreva como evitar que recomposição apague entrada digitada.
