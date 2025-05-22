//
//  keyboard.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//
import SwiftUI
import Observation

struct Keyboard: View  {
    var body: some View {
        Grid {
            if UIDevice.current.userInterfaceIdiom == .phone {
                KeyboardTemp(defaultVal: 85, zeroVal: 180, bottomPadding: -15)
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                KeyboardTemp(defaultVal: 185, zeroVal: 378, bottomPadding: -5)
            }
        }
    }
}

struct KeyboardTemp: View {
    @Environment(Calculate.self) var myCalculation
    var defaultVal: CGFloat
    var zeroVal: CGFloat
    var bottomPadding: CGFloat

    var body: some View {
        GridRow {
            HStack {
                Button {
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
                } label: {
                    ZStack {
                        if myCalculation.opExists && !myCalculation.op2Exists {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .frame(width: defaultVal, height: 85)
                                .transition(.opacity)
                            Text("AC")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .transition(.opacity)
                        } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: defaultVal, height: 85)
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
                    if !myCalculation.opExists {
                        myCalculation.operand1IsNegative.toggle()
                    } else {
                        myCalculation.operand2IsNegative.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultVal, height: 85)
                        Text("+/-")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Button {
                    if !myCalculation.op2Exists {
                        myCalculation.operation = "%"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: defaultVal, height: 85)
                        Text("%")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !myCalculation.op2Exists {
                        myCalculation.operation = "/"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
                        Text("9")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !myCalculation.op2Exists {
                        myCalculation.operation = "x"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
                        Text("6")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !myCalculation.op2Exists {
                        myCalculation.operation = "-"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
                        Text("3")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button {
                    if !myCalculation.op2Exists {
                        myCalculation.operation = "+"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.red)
                            .frame(width: defaultVal, height: 85)
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
                            .frame(width: zeroVal, height: 85)
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
                            .frame(width: defaultVal, height: 85)
                            .cornerRadius(10, corners: [.allCorners])
                
                        Text(".")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                Spacer()
                    .frame(width: 15)
                Button { } label: {
                    ZStack {
                        Rectangle().fill(Color.red)
                            .frame(width: defaultVal, height: 85)
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
