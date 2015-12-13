infix operator ** { associativity left precedence 160 }

func ** (base: Int, expoente: Int) -> Int {
    var soma = base
    if(expoente==1){
        return base
    }
    if(expoente==0){
        return 1
    }
    for _ in 1...expoente-1{
        soma *= base
    }
    return soma
}

class Armstrong {
    
    func isArmstrong(number: Int) -> Bool{
        var soma = 0
        let numberStr = String(number)
        for algarismo in numberStr.characters{
            let algarismoInt = Int(String(algarismo))
            soma += algarismoInt! ** numberStr.characters.count
        }
        return (soma == number)
    }

}


let armstrong = Armstrong()
print(armstrong.isArmstrong(370))