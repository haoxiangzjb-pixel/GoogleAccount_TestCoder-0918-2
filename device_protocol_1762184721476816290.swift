import Foundation

/// Protocolo que define las capacidades básicas de un dispositivo conectable
protocol ConnectableDevice {
    /// Indica si el dispositivo está actualmente conectado
    var isConnected: Bool { get }
    
    /// Nombre del dispositivo
    var name: String { get }
    
    /// ID único del dispositivo
    var identifier: String { get }
    
    /// Intenta conectar al dispositivo
    /// - Returns: True si la conexión fue exitosa, false en caso contrario
    func connect() -> Bool
    
    /// Desconecta del dispositivo
    /// - Returns: True si la desconexión fue exitosa, false en caso contrario
    func disconnect() -> Bool
    
    /// Verifica si el dispositivo es alcanzable
    /// - Returns: True si el dispositivo está disponible, false en caso contrario
    func isReachable() -> Bool
}

/// Implementación por defecto para algunos métodos del protocolo
extension ConnectableDevice {
    func isReachable() -> Bool {
        // Implementación por defecto puede ser simplemente verificar si está conectado
        return isConnected
    }
}