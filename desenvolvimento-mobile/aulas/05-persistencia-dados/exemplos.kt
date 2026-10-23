// Fragmento didático de Persistência de Dados.
// Consulte anotacoes.md para pressupostos, dependências e limitações.
// Entidades e DAO ilustrativos (Room).
@Entity
data class Nota(@PrimaryKey(autoGenerate = true) val id: Long = 0, val texto: String)

@Dao
interface NotaDao {
    @Query("SELECT * FROM Nota ORDER BY id DESC")
    fun observarTodas(): Flow<List<Nota>>

    @Insert suspend fun inserir(nota: Nota)
}

