program leer_guardar_aleatorio
    implicit none
    integer, parameter :: max_len = 1000
    character(len=max_len) :: input_line
    character(len=20) :: random_name
    integer :: input_unit = 10
    integer :: output_unit = 20
    integer :: iostat
    integer :: seed_size
    integer, allocatable :: seed(:)
    real :: rand_num

    ! Leer archivo de entrada
    open(unit=input_unit, file='datos_entrada.txt', status='old', iostat=iostat)
    if (iostat /= 0) then
        print *, 'Error: No se pudo abrir el archivo de entrada datos_entrada.txt'
        stop
    end if

    ! Inicializar generador de números aleatorios
    call random_seed(size=seed_size)
    allocate(seed(seed_size))
    call system_clock(count=seed(1))
    call random_seed(put=seed)
    deallocate(seed)

    ! Generar nombre aleatorio para archivo de salida
    call random_number(rand_num)
    write(random_name, '(A,I0,A)') 'salida_', int(rand_num * 1000000), '.txt'

    ! Abrir archivo de salida con nombre aleatorio
    open(unit=output_unit, file=trim(random_name), status='new', iostat=iostat)
    if (iostat /= 0) then
        print *, 'Error: No se pudo crear el archivo de salida ', trim(random_name)
        close(input_unit)
        stop
    end if

    ! Leer línea por línea y escribir en archivo de salida
    do
        read(input_unit, '(A)', iostat=iostat) input_line
        if (iostat /= 0) exit
        write(output_unit, '(A)') trim(input_line)
    end do

    ! Cerrar archivos
    close(input_unit)
    close(output_unit)

    print *, 'Datos leídos de datos_entrada.txt y guardados en ', trim(random_name)

end program leer_guardar_aleatorio