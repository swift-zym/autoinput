//
//  ContentView.swift
//  autoinput
//
//  Created by 张一鸣 on 2021/1/17.
//

import SwiftUI
import Foundation

func paste(waitTime:useconds_t=100000){
    usleep(waitTime)
    let push = CGEvent(keyboardEventSource: nil, virtualKey: 0x09, keyDown: true)
    push?.flags = CGEventFlags.maskCommand
    if let push = push {
        push.post(tap: .cghidEventTap)
    }
}

func pasteString(str:String, status:inout Bool){
    sleep(3)
    print("pasteboard text:\(str)")
    for i in 0..<str.count{
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("\(str[str.index(str.startIndex, offsetBy: i)])", forType: .string)
        DispatchQueue.main.sync {
            paste()
        }
    }
    status=false
}
struct ContentView: View {
    @State private var fullText: String = "请在这里输入文本..."
    @State private var speed = 100000.00
    @State private var isRunning=false
    @State private var buttonStatus="开始输入"
    var body: some View {
        HStack{
            VStack{
                TextEditor(text: $fullText)
                Button(action: {
                    isRunning=true
                    buttonStatus="开始输入"
                    let serialQueue = DispatchQueue.init(label: "", qos: .default, attributes: [.concurrent], autoreleaseFrequency: .inherit, target: nil)
                    serialQueue.async {
                        pasteString(str: "$"+fullText,status: &isRunning)
                    }
                }, label: {
                    Text(buttonStatus)
                })
            }
            VStack{
                Text(isRunning ? "当前状态:运行中\n" : "当前状态:等待任务\n")
                    .foregroundColor(isRunning ? .red : .blue)
                Text("输入速度")
                Slider(value: $speed,
                       in: 100000...1000000
                )
                Text("\(speed/1000000)秒/字符\n")
                Text("使用帮助可在左上角 \"autoinput\" - \"帮助...\"处查看")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
