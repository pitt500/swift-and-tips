

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
    
}






struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
            .fill(.red)
            .frame(width: 200, height: 200)
    }
}
