//
//  ContentView.swift
//  WeSplitt
//
//  Created by David Robert on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amountOfValue = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0,10,15,20,25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage) // transformando em valor Double
        
        let tipValue = amountOfValue / 100 * tipSelection
        let grandTotal = amountOfValue + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Valor da Conta", value: $amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                    .keyboardType(.decimalPad) // .keyboardType(.decimalPad) Abre o numberpad teclado numérico
                    .focused($amountIsFocused)
                    .toolbar {
                        if amountIsFocused {
                            Button("Done") {
                                amountIsFocused = false
                            }
                        }
                    }
                    
                    Picker("Quantidade de pessoas", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) pessoas")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Quanto de gorjeta você quer deixar?"){
                    Picker("Porcentagem de gorjeta", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total por pessoa"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}


/* os usuários precisam poder inserir o valor do cheque, quantas pessoas vão dividir o valor e quanta gorjeta querem deixar.
 **/
