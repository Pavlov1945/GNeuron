function math.Function(x)
    if(x > 0) then
        return 1
    else
        return 0
    end
end
function neuron3(Entrada1,Entrada2,Entrada3,Peso1,Peso2,Peso3,Umbral)
    return Umbral + Entrada1 * Peso1 + Entrada2 * Peso2 + Entrada3 * Peso3
end
function neuron2(Entrada1,Entrada2,Peso1,Peso2,Umbral)
    return Umbral + Entrada1 * Peso1 + Entrada2 * Peso2
end