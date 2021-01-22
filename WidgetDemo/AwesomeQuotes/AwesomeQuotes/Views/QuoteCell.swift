//
//  QuoteCell.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import SwiftUI

struct QuoteCell: View {
    let quote: Quote
    
    var body: some View {
        ZStack {
            Color.black
            Image("image\(quote.imageNumber)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.6)
                .frame(maxHeight: 170)
                .clipped()
            VStack {
                Text("\"\(quote.description)\"")
                    .font(.custom("SignPainter", fixedSize: 38))
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity)
                    
                
                Text("\(quote.author)/\(quote.profession)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.padding()
        }
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote.sample[0])
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
