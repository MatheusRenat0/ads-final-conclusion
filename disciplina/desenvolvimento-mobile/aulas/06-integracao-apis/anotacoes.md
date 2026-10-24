# Minhas anotações — Integração com APIs

Uma API é uma forma combinada de trocar dados com outro sistema. No aplicativo, isso normalmente envolve enviar uma requisição HTTP, receber uma resposta e transformar os dados para exibição. Como a rede pode falhar ou demorar, a tela precisa mostrar o que está acontecendo em vez de parecer travada.

## Estados que preciso prever

Para uma consulta de catálogo, por exemplo, penso em quatro estados: carregando; resultado disponível; consulta sem resultados; e erro. Um erro 404 pode significar que o item não existe; um 500 indica problema no serviço. A reação correta depende do contrato da API e deve ser explicada de forma útil para a pessoa.

## Organização da chamada

Um cliente HTTP e um serializador ajudam a fazer a requisição e converter a resposta. Uma camada de repositório pode esconder os detalhes da rede das telas. O DTO representa o formato recebido do servidor; posso convertê-lo para um modelo de domínio que faça mais sentido dentro do aplicativo.

```kotlin
interface CatalogoApi {
    @GET("produtos/{id}")
    suspend fun produto(@Path("id") id: Long): ProdutoDto
}
```

Este exemplo usa Retrofit e pressupõe imports, dependência, configuração de base URL e tratamento de falhas. Como a chamada é suspensa, ela deve ser feita em um contexto assíncrono apropriado. Timeout e cancelamento evitam manter trabalho desnecessário indefinidamente.

## Segurança e tentativas

O aplicativo não consegue esconder uma chave privada que esteja embutida no APK. Credenciais devem ser tratadas de acordo com o modelo de autenticação, e o servidor precisa validar as permissões de cada ação. Uma nova tentativa automática também precisa ser pensada com cuidado: repetir uma leitura costuma ser diferente de repetir uma operação que cria ou cobra algo.

## Exercícios

1. Desenhar os estados de uma tela que carrega dados de uma API.
2. Explicar o que a tela faria em respostas 404 e 500.
3. Definir o que deve acontecer se a pessoa sair da tela antes da resposta.
4. Distinguir DTO da API do modelo usado pelas regras do aplicativo.
