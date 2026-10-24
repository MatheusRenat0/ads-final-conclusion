# Minhas anotações: Navegação entre telas

Estou pensando na navegação como um fluxo: quais telas existem, como a pessoa chega a cada uma e para onde volta. A pilha de retorno guarda o caminho de telas visitadas. Preciso decidir se, ao voltar de um detalhe, a lista continua no mesmo lugar ou é carregada de novo.

## Destinos e argumentos

Cada tela é um destino. Se uma tela de detalhe precisa mostrar um produto, é melhor passar seu identificador e buscar os dados na camada apropriada do que transportar um objeto inteiro. Também é importante verificar o argumento, pois um link externo pode abrir o aplicativo com um valor ausente ou inválido.

Com Navigation Compose, os destinos ficam declarados dentro de um `NavHost`:

```kotlin
NavHost(navController, startDestination = "inicio") {
    composable("inicio") {
        InicioScreen(onAbrir = { id ->
            navController.navigate("detalhe/$id")
        })
    }
    composable("detalhe/{id}") { entrada ->
        val id = entrada.arguments?.getString("id")
        DetalheScreen(id = id)
    }
}
```

Este é um exemplo para entender a ideia, não uma solução pronta. Ele omite imports, configuração da biblioteca, tipos seguros de rota e comportamento para identificador inválido. Se o projeto usar outra tecnologia de interface, preciso adaptar a abordagem.

## Coisas para conferir na prática

1. Desenhar o caminho de uma lista até um detalhe e de volta.
2. Verificar o comportamento do botão Voltar em cada etapa.
3. Decidir o que fazer se o identificador não chegar.
4. Pensar se a tela precisa receber um link direto (deep link) e validar os dados desse link.
