# Anotações de estudo — Persistência de Dados

## Conceitos

Persistência permite manter dados após fechar o app. Escolha mecanismo conforme formato e consulta: DataStore para preferências ou estado pequeno; Room para dados relacionais locais; arquivos para conteúdo apropriado.

## Desenvolvimento e prática

Não bloqueie a thread principal com I/O. Use coroutines e repositórios para separar UI da fonte de dados. Room define entidades, DAOs e banco; migrações preservam dados ao evoluir esquema. Não apague banco em produção para contornar migração.

```kotlin
@Entity
data class Nota(@PrimaryKey(autoGenerate = true) val id: Long = 0, val texto: String)

@Dao
interface NotaDao {
    @Query("SELECT * FROM Nota ORDER BY id DESC")
    fun observarTodas(): Flow<List<Nota>>

    @Insert suspend fun inserir(nota: Nota)
}
```

O exemplo requer dependências e configuração de Room, kapt ou KSP, e banco. Dados sensíveis exigem estratégia de proteção adequada; preferências comuns não são cofre de segredos.

**Exercícios:** identifique quais dados podem ser recalculados; planeje uma migração de coluna; explique quando escolher Room em vez de DataStore.
