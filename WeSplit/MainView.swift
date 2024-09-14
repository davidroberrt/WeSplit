//
//  ContentView.swift
//  WeSplitt
//
//  Created by David Robert on 10/09/24.
//

import SwiftUI

struct MainView: View {
    @State private var amountOfValue = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    @State private var showSplashView: Bool = true
    @FocusState private var amountIsFocused: Bool
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = amountOfValue * (tipSelection / 100)
        
        return amountOfValue + tipValue
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage) // transformando em valor Double
        let grandTotal = Double(grandTotal)
        
        return grandTotal / peopleCount
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
                            ForEach(0..<101){
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .foregroundColor(.white)
                    Section("valor por pessoa"){
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    .foregroundColor(.white)
                    Section("Valor total da conta"){
                        Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
    MainView()
}
