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
    @State private var splashView: Bool = true
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0,10,15,20,25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage) // transformando em valor Double
        
        let tipValue = amountOfValue / 100 * tipSelection
        let grandTotal = amountOfValue + tipValue // total da conta + a porcentagem
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.black.opacity(1.8),.blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                 Form{
                    Section{
                            TextField("R$ 0,00", value: $amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
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
                            ForEach(2..<101){
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
                        .colorMultiply(.cyan)
                    }
                    .foregroundColor(.white)
                    Section("valor por pessoa"){
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    .foregroundColor(.white)
                    Section("Total da conta"){
                        Text(amountOfValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    .foregroundColor(.white)
                }
             .scrollContentBackground(.hidden) // Oculta o fundo do conteúdo rolável para permitir que o gradiente seja visível
             .preferredColorScheme(.dark)

            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Image("logoWhite")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .padding()
                }
            }
        }

    }
}

#Preview {
    ContentView()
}


/* os usuários precisam poder inserir o valor do cheque, quantas pessoas vão dividir o valor e quanta gorjeta querem deixar.
 **/
