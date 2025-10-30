! Função Fortran para calcular a raiz quadrada
real function calcular_raiz_quadrada(x)
    implicit none
    real, intent(in) :: x
    
    ! Verifica se o número é negativo
    if (x < 0.0) then
        print *, 'Erro: Não é possível calcular a raiz quadrada de um número negativo'
        calcular_raiz_quadrada = -1.0  ! Valor de erro
        return
    end if
    
    ! Calcula a raiz quadrada
    calcular_raiz_quadrada = sqrt(x)
end function calcular_raiz_quadrada

! Programa principal para testar a função
program teste_raiz_quadrada
    implicit none
    real :: numero, resultado
    
    ! Teste com um número positivo
    numero = 25.0
    resultado = calcular_raiz_quadrada(numero)
    print *, 'Raiz quadrada de ', numero, ' = ', resultado
    
    ! Teste com zero
    numero = 0.0
    resultado = calcular_raiz_quadrada(numero)
    print *, 'Raiz quadrada de ', numero, ' = ', resultado
    
    ! Teste com número negativo
    numero = -4.0
    resultado = calcular_raiz_quadrada(numero)
    print *, 'Raiz quadrada de ', numero, ' = ', resultado
end program teste_raiz_quadrada