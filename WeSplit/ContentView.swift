//
//  ContentView.swift
//  WeSplitt
//
//  Created by David Robert on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amountOfValue = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var body: some View {
        Form{
            Section{
                TextField("Amount", value: $amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                
                    .keyboardType(.decimalPad) // .keyboardType(.decimalPad) Abre o numberpad teclado numérico
            }
            Section{
                Text(amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}

#Preview {
    ContentView()
}


/* os usuários precisam poder inserir o valor do cheque, quantas pessoas vão dividir o valor e quanta gorjeta querem deixar.
 **/
