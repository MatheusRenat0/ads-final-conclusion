// Fragmento didático de Testes e Publicação.
// Consulte anotacoes.md para pressupostos, dependências e limitações.
// Exemplo de teste unitário; requer JUnit e função total no source set.
@Test
fun totalMultiplicaPrecoPorQuantidade() {
    assertEquals(37.5, total(12.5, 3), 0.001)
}

