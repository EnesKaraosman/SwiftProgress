# SwiftProgress

LinearProgress bar & CircularProgress bar for SwiftUI.

**Demo GIF** <br>

![](https://github.com/EnesKaraosman/SwiftProgress/blob/master/Sources/progress-demo.gif)

### Usage

#### LinearProgress

```swift
// Available constructors

LinearProgress(
  progress: CGFloat, 
  foregroundColor: Color, 
  backgroundColor: Color = .clear, 
  cornerRadius: CGFloat = 8
)

LinearProgress(
  progress: CGFloat, 
  gradient: LinearGradient, 
  backgroundColor: Color = .clear, 
  cornerRadius: CGFloat = 8
)
```

#### CircularProgress

```swift
// Available constructors

CircularProgress(
  progress: CGFloat, 
  lineWidth: CGFloat, 
  foregroundColor: Color, 
  backgroundColor: Color = .clear,
  fillAxis: FillAxis = .horizontal // vertical & horizontal options
)

CircularProgress(
  progress: CGFloat, 
  lineWidth: CGFloat, 
  gradient: LinearGradient, 
  backgroundColor: Color = .clear,
  fillAxis: FillAxis = .horizontal // vertical & horizontal options
)
```

#### Full Example (reflects the demo GIF)

```swift
@State private var fillPercentage: CGFloat = 20

var body: some View {


    VStack {

        LinearProgress(
          progress: self.fillPercentage, 
          foregroundColor: .green, 
          backgroundColor: Color.green.opacity(0.2), 
          fillAxis: .vertical
        )
        .frame(width: 40, height: 100)

        LinearProgress(
            progress: self.fillPercentage,
            gradient: LinearGradient(
                gradient: .init(colors: [.yellow, .red]),
                startPoint: .leading,
                endPoint: .trailing
            ),
            backgroundColor: Color.blue.opacity(0.2),
            cornerRadius: 16
        )
        .frame(height: 50)
        .padding()

        LinearProgress(progress: self.fillPercentage, foregroundColor: Color.green.opacity(0.3))
            .clipShape(Capsule())
            .frame(height: 50)
            .padding()

        ZStack {
            LinearProgress(progress: self.fillPercentage, foregroundColor: .blue, cornerRadius: 0)
                .frame(height: 50)
                .padding()

            Text(String(format: "%1.f", self.fillPercentage))
            .font(.title)
            .foregroundColor(.pink)
            .shadow(radius: 4)
        }


        Slider(value: self.$fillPercentage, in: 0...100)
            .padding()

        HStack {
            CircularProgress(currentPercentage: self.fillPercentage, lineWidth: 8, foregroundColor: .orange)
                .rotationEffect(.degrees(-90))

            ZStack {
                CircularProgress(
                    currentPercentage: self.fillPercentage,
                    lineWidth: 16,
                    gradient: LinearGradient(
                        gradient: .init(colors: [.yellow, .red]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    backgroundColor: .gray
                )

                Text(String(format: "%1.f", self.fillPercentage))
                    .font(.title)
                    .foregroundColor(.orange)
                    .shadow(radius: 8)
            }
        }.frame(height: 200)

    }
}
```
