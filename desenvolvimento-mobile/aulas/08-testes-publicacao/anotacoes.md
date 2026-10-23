# Anotações de estudo — Testes e Publicação

## Conceitos

Testes cobrem regras, integração e fluxos de UI. Publicação envolve build de release, assinatura, metadados, política de privacidade aplicável, compatibilidade e distribuição.

## Desenvolvimento e prática

Testes unitários verificam funções sem aparelho; testes instrumentados exercitam Android e integração; testes de UI validam interação observável. Prefira dependências substituíveis e resultados determinísticos.

Antes de publicar, gere variante release, proteja chave de assinatura, revise permissões, nome/ícone, versão, compatibilidade e política da loja vigente. Não compartilhe keystore nem senhas no repositório. Teste o artefato de release em dispositivos representativos. Requisitos da loja mudam e devem ser verificados no momento da publicação.

```kotlin
@Test
fun totalMultiplicaPrecoPorQuantidade() {
    assertEquals(37.5, total(12.5, 3), 0.001)
}
```

**Exercícios:** escreva casos de teste para entradas inválidas; monte checklist de release; explique diferença entre build debug e release.
