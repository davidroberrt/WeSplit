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
    @State private var showSplashView: Bool = true
    @FocusState private var amountIsFocused: Bool
    
    //let tipPercentages = [0,10,15,20,25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage) // transformando em valor Double
        
        let tipValue = amountOfValue / 100 * tipSelection
        let grandTotal = amountOfValue + tipValue // total da conta + a porcentagem
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        Group{
            if showSplashView{
                SplashView()
            } else{
                MainView()
            }
        }
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                withAnimation {
                    showSplashView = false
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
