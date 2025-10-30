<?php
/**
 * Valida si una cadena es un correo electrónico válido.
 * 
 * @param string $email El correo electrónico a validar
 * @return bool True si es válido, false en caso contrario
 */
function validarEmail($email) {
    // Primero verifica si tiene el formato básico de un correo electrónico
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return false;
    }
    
    // Verifica si el dominio tiene un registro MX o A
    $domain = substr(strrchr($email, "@"), 1);
    if (!checkdnsrr($domain, "MX") && !checkdnsrr($domain, "A")) {
        return false;
    }
    
    return true;
}

// Ejemplo de uso:
// echo validarEmail("usuario@ejemplo.com") ? "Válido" : "Inválido";
?>