// Fragmento didático de Integração com APIs.
// Consulte anotacoes.md para pressupostos, dependências e limitações.
// Exemplo Retrofit; requer configuração e imports.
interface CatalogoApi {
    @GET("produtos/{id}")
    suspend fun produto(@Path("id") id: Long): ProdutoDto
}

