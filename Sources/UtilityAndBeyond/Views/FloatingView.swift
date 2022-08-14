//
//  FloatingView.swift
//  
//
//  Created by Matt Pfeiffer on 8/13/22.
//

import SwiftUI

struct FloatingTailerView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTailerView {
            Image(systemName: "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct TrailerData: Hashable {
    var animationDuration: TimeInterval
    var blurRadiusFactor: CGFloat
    var opacity: CGFloat
    var rotateAmount: CGFloat
    
    
    static func getTrailerArray(numberOfTails: Int) -> [TrailerData] {
        var data = [TrailerData]()
        for index in 0...numberOfTails-1 {
            let animationDuration = 0.75 + 0.025 * Double(index)
            let blurRadiusFactor = 0.001 * Double(index)
            let opacity = 1.0 - Double(index) / Double(numberOfTails+2)
            let rotateAmount = 360 * Double(index) / Double(numberOfTails)
            let newTail = TrailerData(animationDuration: animationDuration,
                                      blurRadiusFactor: blurRadiusFactor,
                                      opacity: opacity,
                                      rotateAmount: rotateAmount)
            data.append(newTail)
        }
        return data
    }
}

struct FloatingTailerView<Content: View>: View {
//    @State private var trailerOffset: CGSize = .zero
    @State private var mainOffset: CGSize = .zero
    let trailData = TrailerData.getTrailerArray(numberOfTails: 30)
    
    var content: () -> Content

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    ForEach(trailData, id: \.self) { data in
                        content()
                            .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.4)
                            .blur(radius: geo.size.width * data.blurRadiusFactor)
                            .opacity(data.opacity)
                            .foregroundColor(.red)
                            .saturation(7.0)
                            .hueRotation(Angle(degrees: data.rotateAmount))
                            .animation(.easeInOut(duration: data.animationDuration), value: mainOffset)
                    }
                }
                .offset(mainOffset)
                
                .foregroundColor(.white)
                .frame(width: geo.size.width, height: geo.size.height)
            }
//            .blendMode(.hue)
            
            .blendMode(.hue)
//            .blendMode(.saturation)
            .drawingGroup()
            
            .frame(width: geo.size.width, height: geo.size.height)
            .onAppear {
                stepOffset(frameSize: geo.size)
            }
        }
    }
    
    func stepOffset(frameSize: CGSize, flipY: Bool = true) {
        let delayValue = CGFloat.random(in: 0.5...0.75)
        let scale = 0.2
        let xOffset = CGFloat.random(in: -0.5...0.5)
        let yOffset = CGFloat.random(in: flipY ? -1 ... -0.75 : 0.75 ... 1)

        mainOffset = CGSize(width: frameSize.width*xOffset*scale, height: frameSize.height*yOffset*scale)

        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayValue)) {
            self.stepOffset(frameSize: frameSize, flipY: !flipY)
        }
    }
}

struct FloatingView<Content: View>: View {
    @State private var offsetAmount: CGSize = .zero
    var content: () -> Content

    var body: some View {
        GeometryReader { geo in
            ZStack {
                content()
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
            }
            .offset(offsetAmount)
            .foregroundColor(.white)
            .animation(.easeInOut(duration: 1.75), value: offsetAmount)
            .frame(width: geo.size.width, height: geo.size.height)
            .onAppear {
                stepOffset(frameSize: geo.size)
            }
        }
    }
    
    func stepOffset(frameSize: CGSize, flipY: Bool = true) {
        let delayValue = CGFloat.random(in: 0.35...0.65)
        let scale = 0.2
        let xOffset = CGFloat.random(in: -0.5...0.5)
        let yOffset = CGFloat.random(in: flipY ? -1 ... -0.75 : 0.75 ... 1)
        offsetAmount = CGSize(width: frameSize.width*xOffset*scale, height: frameSize.height*yOffset*scale)

        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayValue)) {
            self.stepOffset(frameSize: frameSize, flipY: !flipY)
        }
    }
}

struct FloatingView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingView {
            Image(systemName: "brain.head.profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct FloatingBrainView: View {
    @State private var offsetAmount: CGSize = .zero

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(systemName: "brain")
                    .resizable()
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
            }
            .offset(offsetAmount)
            .foregroundColor(.white)
            .animation(.easeInOut(duration: 1.75), value: offsetAmount)
            .frame(width: geo.size.width, height: geo.size.height)
            .onAppear {
                stepOffset(frameSize: geo.size)
            }
        }
    }
    
    func stepOffset(frameSize: CGSize, flipY: Bool = true) {
        let delayValue = CGFloat.random(in: 0.5...0.75)
        let scale = 0.2
        let xOffset = CGFloat.random(in: -0.5...0.5)
        let yOffset = CGFloat.random(in: flipY ? -1 ... -0.75 : 0.75 ... 1)
        offsetAmount = CGSize(width: frameSize.width*xOffset*scale, height: frameSize.height*yOffset*scale)

        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delayValue)) {
            self.stepOffset(frameSize: frameSize, flipY: !flipY)
        }
    }
}

struct FloatingBrainView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingBrainView()
    }
}

