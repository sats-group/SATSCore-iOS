import SwiftUI

struct ArticlePageViewDemo: View {
    var includeImage: Bool = true

    // swiftlint:disable:next function_body_length
    func getViewData(includeImage: Bool, includeExternalUrl: Bool) -> ArticlePageViewData {
        let externalUrls = [
            ExternalUrlViewData(title: "Les hele saken", url: URL(string: "https://sats.com")!),
            ExternalUrlViewData(title: "Les halve saken", url: URL(string: "https://sats.com")!),
            ExternalUrlViewData(title: "Les kvarte saken", url: URL(string: "https://sats.com")!),
        ]

        return ArticlePageViewData(
            title: "Er du klar for en skikkelig utfordring?",
            // swiftlint:disable:next line_length
            introduction: "Man må nesten ha superkrefter for å finne ro i sitt eget hjem om dagen. Fortvil ikke! Det finnes håp og det heter Yoga Nidra. Best av alt - du skal ikke gjøre noen ting!",
            description: NSAttributedString(string: """
            Å trene med en personlig trener er en investering i helsen din, og virker booster treningseffektene.
            Vi ønsker nå å gi deg ett ekstra PT-klipp for hver fjerde PT-time du bruker mellom 1.-31. mars.
            Hvordan fungerer det?

            Tilbudet er tidsbegrenset og gjelder når du fullfører fire PT-timer av PT30, PT60 eller PTDuo.
            For hver fjerde PT-time du fullfører, får du et ekstra PT-klipp som belønning*.
            Jo mer du trener - desto mer får du

            Da du blir belønnet med et ekstra PT-klipp for hver fjerde PT-time fullført,
            betyr dette at du får to PT-klipp om du fullfører 8 PT-klipp
            og 3 PT-klipp om du fullfører 12 PT-timer.

            Vilkår

            *PT-timen(e) du får som belønning vil være av samme PT-level og varighet som de du har fullført.
            Eksempel: hvis du fullfører fire PT60-klipp med en PT på level 4,
            vil du få ett PT-klipp av PT60 level 4 som belønning.
            PT-klippet du får i belønning er gyldig fra og med 12. april 2021.

            Å trene med en personlig trener er en investering i helsen din, og virker booster treningseffektene.
            Vi ønsker nå å gi deg ett ekstra PT-klipp for hver fjerde PT-time du bruker mellom 1.-31. mars.
            Hvordan fungerer det?

            Tilbudet er tidsbegrenset og gjelder når du fullfører fire PT-timer av PT30, PT60 eller PTDuo.
            For hver fjerde PT-time du fullfører, får du et ekstra PT-klipp som belønning*.
            Jo mer du trener - desto mer får du

            Vilkår

            *PT-timen(e) du får som belønning vil være av samme PT-level og varighet som de du har fullført.
            Eksempel: hvis du fullfører fire PT60-klipp med en PT på level 4,
            vil du få ett PT-klipp av PT60 level 4 som belønning.
            PT-klippet du får i belønning er gyldig fra og med 12. april 2021.

            Å trene med en personlig trener er en investering i helsen din, og virker booster treningseffektene.
            Vi ønsker nå å gi deg ett ekstra PT-klipp for hver fjerde PT-time du bruker mellom 1.-31. mars.
            Hvordan fungerer det?

            Tilbudet er tidsbegrenset og gjelder når du fullfører fire PT-timer av PT30, PT60 eller PTDuo.
            For hver fjerde PT-time du fullfører, får du et ekstra PT-klipp som belønning*.
            Jo mer du trener - desto mer får du
            """),
            image: includeImage ? UIImage(named: "articlePageCover") : nil,
            externalUrls: includeExternalUrl ? externalUrls : nil
        )
    }

    private func getArticlePage() -> UIView {
        let articlePageView = ArticlePageView()
        articlePageView.topBar.addRightButton(.closeFloatingButton())
        articlePageView.configure(
            with: getViewData(includeImage: includeImage, includeExternalUrl: true)
        )

        return articlePageView
    }

    var body: some View {
        DemoWrapperView(view: getArticlePage())
            .navigationBarHidden(true)
    }
}

struct ArticlePageViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticlePageViewDemo()

            ArticlePageViewDemo(includeImage: false)

            ArticlePageViewDemo()
                .preferredColorScheme(.dark)

            ArticlePageViewDemo(includeImage: false)
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")

            ArticlePageViewDemo()
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
        .ignoresSafeArea()
    }
}
