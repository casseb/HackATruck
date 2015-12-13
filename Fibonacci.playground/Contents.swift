class Fibonacci{
    
    var quantNumbers: Int
    
    init(quant: Int){
        quantNumbers.self = quant
    }
    
    func string() -> String{
        var resultado = "Nada a ser exibido"
        if(self.quantNumbers>=2){
            resultado = "1 - "
            var previous = 1
            var current = 1
            var temp = 1
            for _ in 1...quantNumbers-1{
                resultado += (String(current)+" - ")
                temp = current
                current = current+previous
                previous = temp
            }
        }
        resultado.removeAtIndex(resultado.endIndex.predecessor().predecessor())
        return resultado
    }
}

let fibonacci = Fibonacci(quant: 15)
print(fibonacci.string())