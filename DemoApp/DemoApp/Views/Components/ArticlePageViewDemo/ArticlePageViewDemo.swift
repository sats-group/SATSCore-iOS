import SwiftUI

struct ArticlePageViewDemo: View {
    func getViewData(includeImage: Bool, includeExternalUrl: Bool) -> ArticlePageViewData {
        ArticlePageViewData(
            title: "Er du klar for en utfordring?",
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

            Da du blir belønnet med et ekstra PT-klipp for hver fjerde PT-time fullført,
            betyr dette at du får to PT-klipp om du fullfører 8 PT-klipp
            og 3 PT-klipp om du fullfører 12 PT-timer.

            Vilkår

            *PT-timen(e) du får som belønning vil være av samme PT-level og varighet som de du har fullført.
            Eksempel: hvis du fullfører fire PT60-klipp med en PT på level 4,
            vil du få ett PT-klipp av PT60 level 4 som belønning.
            PT-klippet du får i belønning er gyldig fra og med 12. april 2021.
            """),
            image: includeImage ? UIImage(named: "articlePageCover") : nil,
            externalUrl:
                includeExternalUrl
                ? SATSExternalUrlViewData(
                    title: "Les hele saken",
                    url: "https://www.sats.no/campaign/personal-training-boost/"
                )
                : nil
        )
    }

    private func getArticlePage() -> UIView {
        let articlePageView = ArticlePageView()
        articlePageView.configure(with: getViewData(includeImage: true, includeExternalUrl: true))
        return articlePageView
    }

    var body: some View {
        DemoWrapperView(view: getArticlePage())
            .navigationBarHidden(true)
    }
}

struct ArticlePageViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ArticlePageViewDemo()
    }
}
