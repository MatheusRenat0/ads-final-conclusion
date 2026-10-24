# Minhas anotações: Testes e publicação

Testar é verificar se o aplicativo se comporta como espero em situações normais e também quando recebe dados inesperados. Não basta conferir que a tela abre; preciso conferir as regras, a integração e os fluxos que a pessoa percorre.

## Tipos de teste

- **Unitário:** verifica uma regra ou função isolada, normalmente sem emulador.
- **Instrumentado:** executa código Android em um aparelho ou emulador.
- **De interface:** confere se interações visíveis, como preencher um formulário e tocar em um botão, produzem o resultado esperado.

Um exemplo de teste unitário:

```kotlin
@Test
fun totalMultiplicaPrecoPorQuantidade() {
    assertEquals(37.5, total(12.5, 3), 0.001)
}
```

O exemplo pressupõe que a função `total` e as dependências de teste estejam configuradas. Também quero testar quantidade zero, preço inválido e outros limites da regra.

## Preparação para distribuir

Antes de publicar, é preciso gerar uma versão de release, conferir permissões, nome, ícone, versão e compatibilidade e preparar as informações exigidas pelo canal de distribuição. A chave de assinatura e as senhas precisam ficar protegidas, fora do repositório e dos logs. Também devo instalar e testar a versão de release em aparelhos representativos.

Os requisitos das lojas mudam, então uma lista antiga não substitui a conferência das regras vigentes no momento da publicação. Debug é útil durante o desenvolvimento; release representa a versão preparada para distribuição e pode ter configurações diferentes.

## Checklist que vou usar

1. Testar entradas válidas e inválidas.
2. Percorrer os fluxos principais e os estados de erro.
3. Conferir permissões e dados coletados.
4. Proteger os arquivos e segredos de assinatura.
5. Instalar e abrir o artefato release antes de distribuir.
