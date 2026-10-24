# Anotações de estudo — Navegação entre telas

## Conceitos

Navegação conecta telas e mantém uma pilha de retorno. O Android pode usar Navigation component ou outra abordagem compatível com a arquitetura do app.

## Desenvolvimento e prática

Modele destinos e argumentos explicitamente. Evite passar objetos grandes entre telas; passe identificadores e carregue os dados pela camada de dados. O botão voltar deve respeitar a pilha e fluxos de deep link devem validar parâmetros.

Com Navigation Compose, destinos são registrados em um `NavHost` e navegados por rotas. A biblioteca e versões devem ser configuradas no Gradle do projeto.

```kotlin
NavHost(navController, startDestination = "inicio") {
    composable("inicio") { InicioScreen(onAbrir = { id ->
        navController.navigate("detalhe/$id")
    }) }
    composable("detalhe/{id}") { entrada ->
        val id = entrada.arguments?.getString("id")
        DetalheScreen(id = id)
    }
}
```

O código é ilustrativo e omite imports, tipos seguros de rota e tratamento de argumento inválido.

**Exercícios:** desenhe fluxo lista/detalhe; defina o que ocorre ao pressionar voltar; trate identificador ausente.
