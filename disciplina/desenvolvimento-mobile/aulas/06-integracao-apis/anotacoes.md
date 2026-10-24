# Anotações de estudo — Integração com APIs

## Conceitos

Uma API permite trocar dados com serviço remoto. Requisições podem falhar por conectividade, autenticação, servidor, formato ou timeout; a interface deve representar carregamento, sucesso, vazio e erro.

## Desenvolvimento e prática

Use cliente HTTP mantido e serializador configurado, coroutines para operações assíncronas e repositório para encapsular rede. Respeite códigos HTTP, timeout e política de retry; retry automático deve considerar idempotência.

```kotlin
interface CatalogoApi {
    @GET("produtos/{id}")
    suspend fun produto(@Path("id") id: Long): ProdutoDto
}
```

Exemplo Retrofit: requer dependência, imports e configuração de base URL. DTOs representam contrato remoto e não precisam ser modelo de domínio. Não inclua chave privada no APK; cliente móvel não consegue manter segredo estático.

**Exercícios:** desenhe estados de tela; proponha tratamento para HTTP 404 e 500; explique por que timeout e cancelamento importam.
