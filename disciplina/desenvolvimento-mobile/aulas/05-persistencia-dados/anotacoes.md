# Minhas anotações — Persistência de dados

Persistência é o que permite que certas informações continuem disponíveis depois que eu fecho o aplicativo. Antes de escolher onde guardar algo, preciso saber se o dado é pequeno e simples, se precisa de consultas e relações ou se é um arquivo.

## Escolhendo onde guardar

- Preferências como uma opção escolhida pela pessoa podem usar uma solução voltada a configurações, como DataStore.
- Dados estruturados, com registros e consultas, podem ser organizados em banco local usando Room.
- Arquivos podem ser usados para conteúdos apropriados, como documentos ou mídia.

Essa lista é um guia inicial. A escolha depende do ciclo de vida e do uso dos dados. Uma senha ou token não deve ser guardado como se fosse uma preferência comum.

## Room

Em Room, uma entidade representa uma tabela; o DAO declara as operações para consultar ou alterar dados; e o banco reúne essa configuração. Um exemplo simplificado:

```kotlin
@Entity
data class Nota(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val texto: String
)

@Dao
interface NotaDao {
    @Query("SELECT * FROM Nota ORDER BY id DESC")
    fun observarTodas(): Flow<List<Nota>>

    @Insert
    suspend fun inserir(nota: Nota)
}
```

O exemplo pressupõe dependências, imports, configuração de Room e criação do banco. A inserção é suspensa e a consulta retorna um fluxo de resultados; assim, o código pode observar alterações sem bloquear a tela.

## Mudanças no banco e prática

Quando o formato das tabelas muda, uma migração deve conduzir os dados existentes ao novo esquema. Apagar o banco para resolver uma migração pode eliminar informações da pessoa que usa o aplicativo. Operações de leitura e escrita devem acontecer fora da thread principal.

1. Listar os dados de um app de notas e dizer quais podem ser recalculados.
2. Imaginar que uma nova coluna de data foi adicionada e descrever como preservar registros antigos.
3. Explicar se um conjunto de opções simples precisa de Room ou combina melhor com DataStore.
