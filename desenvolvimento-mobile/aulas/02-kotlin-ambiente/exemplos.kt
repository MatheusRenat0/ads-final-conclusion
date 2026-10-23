// Fragmento didático de Kotlin e ambiente Android.
// Consulte anotacoes.md para pressupostos, dependências e limitações.
data class Produto(val nome: String, val preco: Double)

fun total(preco: Double, quantidade: Int): Double {
    require(preco >= 0 && quantidade >= 0)
    return preco * quantidade
}

fun main() {
    println(total(12.5, 3))
}

