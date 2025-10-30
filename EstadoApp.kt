/**
 * Classe selada que representa diferentes estados em um aplicativo
 */
sealed class EstadoApp {
    object Carregando : EstadoApp()
    data class Sucesso(val dados: Any) : EstadoApp()
    data class Erro(val mensagem: String) : EstadoApp()
    object Nenhum : EstadoApp()
}