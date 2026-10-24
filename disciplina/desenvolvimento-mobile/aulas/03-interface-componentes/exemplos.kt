// Fragmento didático de Interfaces e componentes Android.
// Consulte anotacoes.md para pressupostos, dependências e limitações.
@Composable
fun Contador() {
    var valor by remember { mutableIntStateOf(0) }
    Column {
        Text("Valor: $valor")
        Button(onClick = { valor++ }) { Text("Adicionar") }
    }
}

