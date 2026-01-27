import Foundation

// Protocolo para dispositivos conectables
protocol Conectable {
    var nombre: String { get set }
    var direccionMAC: String { get set }
    
    func conectar()
    func desconectar()
    func estadoConexion() -> Bool
}

// Protocolo extendido para dispositivos con capacidad de transmisión de datos
protocol Transmisible: Conectable {
    func enviarDatos(_ datos: Data) throws
    func recibirDatos() throws -> Data
}

// Protocolo para dispositivos con batería
protocol ConBateria: Conectable {
    var nivelBateria: Int { get set }  // Porcentaje del 0 al 100
    
    func cargarBateria(horas: Int)
    func consumoEnergetico() -> Double
}

// Implementación base de dispositivo conectable
class DispositivoBase: Conectable {
    var nombre: String
    var direccionMAC: String
    private var conectado: Bool = false
    
    init(nombre: String, direccionMAC: String) {
        self.nombre = nombre
        self.direccionMAC = direccionMAC
    }
    
    func conectar() {
        print("Conectando a \(nombre) con dirección MAC \(direccionMAC)")
        conectado = true
    }
    
    func desconectar() {
        print("Desconectando \(nombre)")
        conectado = false
    }
    
    func estadoConexion() -> Bool {
        return conectado
    }
}

// Ejemplo de dispositivo inteligente que cumple múltiples protocolos
class SmartDevice: Conectable, Transmisible, ConBateria {
    var nombre: String
    var direccionMAC: String
    var nivelBateria: Int = 100
    private var conectado: Bool = false
    
    init(nombre: String, direccionMAC: String) {
        self.nombre = nombre
        self.direccionMAC = direccionMAC
    }
    
    func conectar() {
        if nivelBateria > 0 {
            print("Conectando \(nombre)...")
            conectado = true
        } else {
            print("No se puede conectar: bateria agotada")
        }
    }
    
    func desconectar() {
        print("Desconectando \(nombre)")
        conectado = false
    }
    
    func estadoConexion() -> Bool {
        return conectado
    }
    
    func enviarDatos(_ datos: Data) throws {
        guard conectado else {
            throw NSError(domain: "DispositivoError", code: 1, userInfo: [NSLocalizedDescriptionKey: "El dispositivo no está conectado"])
        }
        
        let tamanoKB = Double(datos.count) / 1024.0
        print("Enviando \(tamanoKB) KB de datos desde \(nombre)")
        consumoEnergetico()
    }
    
    func recibirDatos() throws -> Data {
        guard conectado else {
            throw NSError(domain: "DispositivoError", code: 1, userInfo: [NSLocalizedDescriptionKey: "El dispositivo no está conectado"])
        }
        
        print("Recibiendo datos en \(nombre)")
        return Data(count: 1024 * 5)  // Simulamos recibir 5KB
    }
    
    func cargarBateria(horas: Int) {
        let cargaTotal = horas * 20  // Suponemos carga rápida
        nivelBateria = min(100, nivelBateria + cargaTotal)
        print("\(nombre) cargado al \(nivelBateria)% después de \(horas) horas")
    }
    
    func consumoEnergetico() -> Double {
        let consumo = conectado ? 0.5 : 0.1
        nivelBateria = max(0, nivelBateria - Int(consumo))
        return consumo
    }
}

// Uso del protocolo
func testProtocolo() {
    let dispositivo = SmartDevice(nombre: "SmartWatch Pro", direccionMAC: "AA:BB:CC:DD:EE:FF")
    
    dispositivo.conectar()
    print("Estado: \(dispositivo.estadoConexion())")
    
    do {
        try dispositivo.enviarDatos(Data("Hola Mundo".utf8))
        let recibidos = try dispositivo.recibirDatos()
        print("Datos recibidos: \(recibidos.count) bytes")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
    
    dispositivo.cargarBateria(horas: 2)
    dispositivo.desconectar()
}

testProtocolo()