import SwiftUI

struct DashedText: View {
    let text: String
    let font: Font
    let dashPattern: [CGFloat]
    let strokeColor: Color
    let lineWidth: CGFloat

    var body: some View {
        ZStack {
            Text(text)
                .font(font)
                .foregroundColor(.clear)
                .background(
                    GeometryReader { geometry in
                        let size = geometry.size
                        let path = textPath(in: size)
                        path
                            .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
                            .foregroundColor(strokeColor)
                    }
                )
            Text(text)
                .font(font)
        }
    }

    func textPath(in size: CGSize) -> Path {
        var path = Path()
        let attrString = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: UIFont.systemFontSize)
        ])
        let line = CTLineCreateWithAttributedString(attrString)
        let runs = CTLineGetGlyphRuns(line) as! [CTRun]
        var x: CGFloat = 0

        for run in runs {
            let glyphCount = CTRunGetGlyphCount(run)
            for index in 0..<glyphCount {
                let glyphRange = CFRangeMake(index, 1)
                var glyph = CGGlyph()
                var position = CGPoint()
                CTRunGetGlyphs(run, glyphRange, &glyph)
                CTRunGetPositions(run, glyphRange, &position)

                if let glyphPath = CTFontCreatePathForGlyph(run.font, glyph, nil) {
                    let translation = CGAffineTransform(translationX: position.x + x, y: position.y)
                    path.addPath(Path(glyphPath).applying(translation))
                }
            }
            x += CGFloat(CTRunGetTypographicBounds(run, CFRangeMake(0, glyphCount), nil, nil, nil))
        }
        return path
    }
}

extension CTRun {
    var font: CTFont {
        let attributes = CTRunGetAttributes(self) as NSDictionary
        return attributes[kCTFontAttributeName as NSAttributedString.Key] as! CTFont
    }
}

