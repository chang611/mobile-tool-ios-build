//
//  ContentView.swift
//  长须鲸手机工具
//
//  Created by 长须鲸 on 2026/8/14.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var deviceInfo: [String: String] = [:]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("设备信息")) {
                    DeviceInfoRow(title: "设备名称", value: UIDevice.current.name)
                    DeviceInfoRow(title: "系统版本", value: "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)")
                    DeviceInfoRow(title: "设备型号", value: UIDevice.current.model)
                    DeviceInfoRow(title: "设备标识符", value: UIDevice.current.identifierForVendor?.uuidString ?? "未知")
                    DeviceInfoRow(title: "应用版本", value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.1")
                }
                
                Section(header: Text("功能")) {
                    NavigationLink(destination: VerifyReportView()) {
                        Label("设备验机", systemImage: "checkmark.shield")
                    }
                    NavigationLink(destination: FlashToolView()) {
                        Label("刷机工具", systemImage: "arrow.down.circle")
                    }
                    NavigationLink(destination: HardwareTestView()) {
                        Label("硬件检测", systemImage: "wrench.and.screwdriver")
                    }
                    NavigationLink(destination: AppManageView()) {
                        Label("应用管理", systemImage: "square.grid.2x2")
                    }
                }
                
                Section(header: Text("关于")) {
                    HStack {
                        Text("版本")
                        Spacer()
                        Text("1.0.1")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("开发者")
                        Spacer()
                        Text("长须鲸")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("长须鲸手机工具")
            .listStyle(InsetGroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DeviceInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundColor(.gray)
                .font(.system(size: 14))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
    }
}

struct VerifyReportView: View {
    var body: some View {
        List {
            Section(header: Text("验机结果")) {
                VerifyRow(name: "基础信息", status: "正常", isNormal: true)
                VerifyRow(name: "主板情况", status: "正常", isNormal: true)
                VerifyRow(name: "电池情况", status: "正常", isNormal: true)
                VerifyRow(name: "屏幕情况", status: "正常", isNormal: true)
                VerifyRow(name: "前摄像头", status: "正常", isNormal: true)
                VerifyRow(name: "后摄像头", status: "正常", isNormal: true)
                VerifyRow(name: "面容", status: "正常", isNormal: true)
            }
        }
        .navigationTitle("验机报告")
        .listStyle(InsetGroupedListStyle())
    }
}

struct VerifyRow: View {
    let name: String
    let status: String
    let isNormal: Bool
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(status)
                .foregroundColor(isNormal ? .green : .red)
        }
    }
}

struct FlashToolView: View {
    var body: some View {
        List {
            Section(header: Text("刷机选项")) {
                Button("普通刷机") { }
                Button("保留资料刷机") { }
                Button("专业刷机") { }
            }
            Section(header: Text("注意")) {
                Text("刷机前请备份重要数据")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("刷机工具")
        .listStyle(InsetGroupedListStyle())
    }
}

struct HardwareTestView: View {
    var body: some View {
        List {
            Section(header: Text("硬件检测")) {
                Button("屏幕测试") { }
                Button("触摸测试") { }
                Button("扬声器测试") { }
                Button("麦克风测试") { }
                Button("摄像头测试") { }
                Button("振动测试") { }
            }
        }
        .navigationTitle("硬件检测")
        .listStyle(InsetGroupedListStyle())
    }
}

struct AppManageView: View {
    var body: some View {
        List {
            Section(header: Text("已安装应用")) {
                Text("应用列表加载中...")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("应用管理")
        .listStyle(InsetGroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
