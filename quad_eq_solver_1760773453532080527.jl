function solve_quadratic(a, b, c)
    discriminant=$(echo "$b^2 - 4*$a*$c" | bc -l)
    
    if (( $(echo "$discriminant > 0" | bc -l) )); then
        x1=$(echo "(-$b + sqrt($discriminant)) / (2*$a)" | bc -l)
        x2=$(echo "(-$b - sqrt($discriminant)) / (2*$a)" | bc -l)
        echo "Two real solutions: $x1 and $x2"
    elif (( $(echo "$discriminant == 0" | bc -l) )); then
        x=$(echo "-$b / (2*$a)" | bc -l)
        echo "One real solution: $x"
    else
        real_part=$(echo "-$b / (2*$a)" | bc -l)
        imaginary_part=$(echo "sqrt(-($discriminant)) / (2*$a)" | bc -l)
        echo "Complex solutions: $real_part + ${imaginary_part}i and $real_part - ${imaginary_part}i"
    fi
end
