//
//  ContentView.swift
//  CalculratorSwiftUI
//
//  Created by 박연배 on 2021/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var value = "0"
    @State var currentOperation: Operation? = Operation.none
    @State var tempValue = 0
    
    
    let buttons: [[CalButton]] = [
        [.clear, .abs, .persentize, .div],
        [.seven, .eight, .nine, .mul],
        [.four, .five, .six, .sub],
        [.one, .two, .three, .add],
        [.zero, .demical, .equal]
    ]
    
    func getWidth(item: CalButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func getHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonTap(item: CalButton) {
        switch item {
        case .clear:
            self.value = "0"
        case .mul, .add, .sub, .equal, .div:
            if item == .mul {
                self.currentOperation = .mul
                self.tempValue = Int(self.value) ?? 0
            }
            else if item == .add {
                self.currentOperation = .add
                self.tempValue = Int(self.value) ?? 0
            }
            else if item == .sub {
                self.currentOperation = .sub
                self.tempValue = Int(self.value) ?? 0
            }
            else if item == .div {
                self.currentOperation = .div
                self.tempValue = Int(self.value) ?? 0
            }
            else if item == .equal {
                let tempNumber = self.tempValue
                let currentNumber = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add:
                    self.value = "\(tempNumber + currentNumber)"
                case .sub:
                    self.value = "\(tempNumber - currentNumber)"
                case .mul:
                    self.value = "\(tempNumber * currentNumber)"
                case .div:
                    self.value = "\(tempNumber / currentNumber)"
                default:
                    break
                }
            }
            if item != .equal {
                self.value = "0"
            }
            
        case .demical, .persentize, .abs:
            break
        default:
            let number = item.rawValue
            if self.value == "0" {
                self.value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(value)
                        .foregroundColor(.white)
                        .font(.system(size: 64, weight: .bold))
                }
                .padding([.bottom, .trailing], 6)
                ForEach(buttons, id:\.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id:\.self) { item in
                            Button(action: { self.buttonTap(item: item) }, label: {
                                Text("\(item.rawValue)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 48, weight: .bold))
                                    .frame(width: self.getWidth(item: item), height: self.getHeight())
                                    .background(item.buttonColor)
                                    .clipShape(Capsule())
                            })
                            
                        }
                        .padding(.bottom, 6)
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
