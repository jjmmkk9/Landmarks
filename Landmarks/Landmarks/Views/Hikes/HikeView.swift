/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition{
    static var moveAndFade: AnyTransition {
        //비대칭 -주입할때: 끝에서 들어오기 -사라질때: 위로 날라감
        AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .scale.combined(with: move(edge: .top)))
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    /// <#Description#>
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {//withAnimation으로 애니메이션 duration 일괄 적용
                    withAnimation(.easeInOut(duration: 0.3)){
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(nil, value: showDetail)//animation(nil)을 데리고 다니면서 애니메이션 부분적으로 적용하기
                        .animation(.easeIn, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade) //이거
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
