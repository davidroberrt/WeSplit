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
    
    let tipPercentages = [0,10,15,20,25]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                    .keyboardType(.decimalPad) // .keyboardType(.decimalPad) Abre o numberpad teclado numérico
                    
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
                Section{
                    Text(amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
