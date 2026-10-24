# Minhas anotações — Interfaces e componentes Android

Entendi a interface como a parte do aplicativo que mostra o estado atual e recebe as ações de quem está usando. Uma tela não é só um conjunto de botões: ela também precisa explicar o que está acontecendo quando os dados carregam, quando não há resultado ou quando algo dá errado.

## Componentes e estado

Texto, campos, imagens, listas e botões são componentes que podem ser organizados para formar uma tela. No Android existem projetos com layouts XML e Views, e também projetos que usam Jetpack Compose. A escolha depende do projeto; não devo misturar exemplos de uma tecnologia com outra sem adaptar a configuração.

No Compose, descrevemos a interface por meio de funções composable. Quando o estado usado pela tela muda, a interface pode ser composta novamente para refletir o novo valor. Isso torna importante guardar o estado no lugar adequado, em vez de depender de variáveis locais que desaparecem em recomposições.

```kotlin
@Composable
fun Saudacao(nome: String, aoContinuar: () -> Unit) {
    Column {
        Text(text = "Olá, $nome")
        Button(onClick = aoContinuar) {
            Text("Continuar")
        }
    }
}
```

Esse trecho é apenas ilustrativo: precisa dos imports e de um projeto com Compose configurado. A função recebe o nome e uma ação; ela não deve concentrar regras de negócio ou acesso ao banco.

## Usabilidade e acessibilidade

Uma tela precisa deixar claro o que é título, conteúdo e ação principal. Os botões devem ter rótulos compreensíveis e áreas de toque adequadas. Imagens informativas precisam de uma descrição acessível. Formulários devem relacionar cada campo à sua finalidade, validar o conteúdo e explicar como corrigir erros.

## Prática

1. Desenhar uma tela de lista nos estados carregando, com resultados, vazia e com erro.
2. Conferir se uma pessoa que usa leitor de tela entende a finalidade dos botões.
3. Fazer um campo manter o que foi digitado quando a tela atualiza.
4. Separar o que é apresentação da tela e o que é regra do aplicativo.
