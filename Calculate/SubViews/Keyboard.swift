//
//  keyboard.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//
import SwiftUI
import Observation

struct Keyboard: View  {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        Grid {
            if UIDevice.current.userInterfaceIdiom == .phone {
                if verticalSizeClass == .compact {
                    KeyboardTemp(defaultWid: 60, defaultHei: 60, zeroVal: 125, bottomPadding: 0)
                } else {
                    KeyboardTemp(defaultWid: 85, defaultHei: 85, zeroVal: 180, bottomPadding: -15)
                }
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                KeyboardTemp(defaultWid: 185, defaultHei: 85, zeroVal: 378, bottomPadding: -5)
            }
        }
    }
}

struct KeyboardTemp: View {
    @Environment(Calculate.self) var myCalculation
    @Environment(\.modelContext) private var modelContext
    
    var defaultWid: CGFloat
    var defaultHei: CGFloat
    var zeroVal: CGFloat
    var bottomPadding: CGFloat
    
    var new: Bool { myCalculation.finishedOp }

    var body: some View {
        GridRow {
            HStack {
                Button {
                    if myCalculation.finishedOp {
                        myCalculation.finishedOp = false
                        myCalculation.reset()
                    } else {
                        if myCalculation.opExists && !myCalculation.op2Exists {
                            myCalculation.reset()
                        }
                        else {
                        
                            if myCalculation.opExists {
                                myCalculation.resetOp1()
                            } else {
                                myCalculation.resetOp2()
                            }
                        }
                    }
                } label: {
                    ZStack {
                        if myCalculation.opExists && !myCalculation.op2Exists {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .frame(width: defaultWid, height: defaultHei)
                                .transition(.opacity)
                            Text("AC")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .transition(.opacity)
                        } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: defaultWid, height: defaultHei)
                                    .transition(.opacity)
                                Text("C")
                                    .foregroundStyle(.black)
                                    .fontWeight(.semibold)
                                    .font(.largeTitle)
                                    .transition(.opacity)
                            }
                    }
                }
                Button {
                    if !new {
                        if !myCalculation.opExists {
                            myCalculation.operand1IsNegative.toggle()
                        } else {
                            myCalculation.operand2IsNegative.toggle()
                        }
                    } else { }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("+/-")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if !new {
                        if !myCalculation.op2Exists {
                            myCalculation.operation = "%"
                        }
                    } else {
                        let lastAns = myCalculation.result
                        myCalculation.reset()
                        myCalculation.operand1Str = String(lastAns)
                        myCalculation.operation = "%"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("%")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !new {
                        if !myCalculation.op2Exists {
                            myCalculation.operation = "/"
                        }
                    } else {
                        let lastAns = myCalculation.result
                        myCalculation.reset()
                        myCalculation.operand1Str = String(lastAns)
                        myCalculation.operation = "/"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("/")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
            }
        }
        .padding(.bottom, -5)
        
        GridRow {
            HStack {
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "7"
                    } else { myCalculation.operand1Str += "7" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("7")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "8"
                    } else { myCalculation.operand1Str += "8" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("8")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "9"
                    } else { myCalculation.operand1Str += "9" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("9")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !new {
                        if !myCalculation.op2Exists {
                            myCalculation.operation = "x"
                        }
                    } else {
                        let lastAns = myCalculation.result
                        myCalculation.reset()
                        myCalculation.operand1Str = String(lastAns)
                        myCalculation.operation = "x"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("x")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
            }
        }
        .padding(.bottom, -5)
        
        GridRow {
            HStack {
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "4"
                    } else { myCalculation.operand1Str += "4" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("4")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "5"
                    } else { myCalculation.operand1Str += "5" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("5")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "6"
                    } else { myCalculation.operand1Str += "6" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("6")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !new {
                        if !myCalculation.op2Exists {
                            myCalculation.operation = "-"
                        }
                    } else {
                        let lastAns = myCalculation.result
                        myCalculation.reset()
                        myCalculation.operand1Str = String(lastAns)
                        myCalculation.operation = "-"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("-")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
            }
        }
        .padding(.bottom, -5)
        
        GridRow {
            HStack {
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "1"
                    } else { myCalculation.operand1Str += "1" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("1")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "2"
                    } else { myCalculation.operand1Str += "2" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("2")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "3"
                    } else { myCalculation.operand1Str += "3" }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("3")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !new {
                        if !myCalculation.op2Exists {
                            myCalculation.operation = "+"
                        }
                    } else {
                        let lastAns = myCalculation.result
                        myCalculation.reset()
                        myCalculation.operand1Str = String(lastAns)
                        myCalculation.operation = "+"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultWid, height: defaultHei)
                        Text("+")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
            }
        }
        .padding(.bottom, -5)
        
        
        GridRow {
            HStack {
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "0"
                    } else { myCalculation.operand1Str += "0" }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: zeroVal, height: defaultHei)
                            .cornerRadius(35, corners: [.bottomLeft])
                            .cornerRadius(10, corners: [.bottomRight])
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                        Text("0")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                
                Button {
                    if myCalculation.opExists {
                        myCalculation.operand2Str += "."
                    } else { myCalculation.operand1Str += "." }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: defaultWid, height: defaultHei)
                            .cornerRadius(10, corners: [.allCorners])
                
                        Text(".")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    let myStr = "\(myCalculation.operand1 ?? 0) \(myCalculation.operation) \(myCalculation.operand2 ?? 0)"
                    let newCalc = Calculation(operation: myStr, result: myCalculation.result)
                    myCalculation.finishedOp = true; myCalculation.lastCalculation = myStr
                    modelContext.insert(newCalc)
                } label: {
                    ZStack {
                        Rectangle().fill(Color.red)
                            .frame(width: defaultWid, height: defaultHei)
                            .cornerRadius(35, corners: [.bottomRight])
                            .cornerRadius(10, corners: [.bottomLeft])
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                            
                        Text("=")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
            }
        }
        .padding(.bottom, bottomPadding)
    }
}




struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

#Preview {
    Keyboard().environment(Calculate.init())
}
