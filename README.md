# Badania stężenia PM10.
<!-- badges: start -->
[![Lifecycle:
archived](https://img.shields.io/badge/lifecycle-archived-red.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->
Projekt powstały w ramach zaliczenia zajęć Statystyka i Rachunek Prawdopodobiństwa. Praca zakończona raportem statystycznym.

## Wprowadzenie:

Projekt wykonany został na podstawie danych pozyskanych z serii pomiarów cząstek PM10 z kilku stacji wyznaczonych na obszarach cechujących się różnym pokryciem terenowym (obszary rolnicze bądź sztuczne), informacji zawartych w szeroko dostępnej literaturze, Internecie, wiedzy własnej oraz własnych obserwacji. Głównym źródłem danych były serie pomiarowe, które podzielone zostały na trzy grupy reprezentujące porę dnia, w których się odbywały – grupa pierwsza (od północy do godziny 8:00), grupa druga (od godziny 8:00 włącznie do godziny 16:00) oraz grupa trzecia (od godziny 16:00 włącznie do północy). Zebrane i i przez nas uporządkowane posłużyły nam do przeprowadzenia na nich testów i analiz. Do wykonania projektu wykorzystano wizualizacje za pomocą wykresów, a także metody statystyczne: m.in. analizy wariancji, porównania post hoc, statystyki opisowe. 

## Metody badawcze:

Wszystkie z opisanych powyżej operacji uwzględniających wyliczenia, przekształcenia danych, utworzenie wykresów, przeprowadzenie testów i wykorzystanie metod statystycznych wykonane zostały w języku programowania R przy użyciu IDE R Studio.


## Wyniki:

Wstępne uporządkowanie i eliminacja błędnych wartości pozwoliły na zwiększenie wiarygodności zbioru oraz trafności przeprowadzanych na nim operacji. Rozkład omawianych danych nie jest rozkładem normalnym; negatywny wynik testu Shapiro-Wilka potwierdza tę prawidłowość:


Rozstęp zbioru wynosi 60,37613 µg/m3 (Ryc.1); w odległości jednego odchylenia standardowego (σ ≈ 8,92) od średniej, wynoszącej w przybliżeniu 36,16 - znajduje się 74,78% próby. 	Rozkład danych jest zbyt wysmukły by można było potwierdzić jego podobieństwo do rozkładu Gaussa. Nie obserwuje się znaczących statystycznie różnic pomiędzy grupami pomiarów wykonanych na obszarach rolnych, a tych wykonanych na obszarach sztucznych. Prawidłowość tę potwierdza negatywny wynik testu Wilcoxona, a także wizualizacja zjawiska na wykresie wiolonczelowym. 

Odwrotną tendencję przedstawia jednoczynnikowa analiza wariancji Kruskala-Wallisa przeprowadzona na trzech wyselekcjonowanych ze względu na okres pomiaru grupach. Potwierdza ona brak  podobieństw wszystkich trzech zbiorów danych. Przeprowadzenie porównań post hoc wykazuje statystyczne różnice pomiędzy grupami pomiarów wykonywanych w okresie 0-8, a 16-24 oraz 8-16, a 16-24. Nie obserwuje się znaczących różnic pomiędzy wartościami grup 0-8 i 8-16. Związek ten widoczny jest również na wizualizacji.

## Wnioski:

W przybliżeniu 6,4% pomiarów przekracza próg 50 µg/m3 - dopuszczalnej dobowej normy PM10 według Głównego Inspektoratu Ochrony Środowiska. Wartości danych w zbiorze oscylują pomiędzy około 5 do 65 µg/m3, jednakże w odniesieniu do wspomnianych norm GIOŚ ich maksima wydają się być niewielke. Nie wykazano znaczących statystycznie różnic pomiędzy obszarami rolniczymi, a sztucznymi. Może być to spowodowane podobną odległością stacji pomiarowych od stref przemysłowych, osiedli domów jednorodzinnych lub ulic o dużej przepustowości. 

Przy wykorzystaniu porównań post hoc, a także wizualizacji zjawiska, zaobserwowano istotne różnice pomiędzy grupami pomiarów prowadzonych w różnej porze dnia. Stężenie PM10 w godzinach 16-24 jest większe niż w pozostałych częściach doby. Za taki wynik prawdopodobnie odpowiedzialne jest zjawisko inwersji termicznej. W godzinach popołudniowych, po zmroku, maleje temperatura powietrza przy gruncie; energia zaś emitowana jest ku wyższym partiom troposfery. Powstrzymywane jest pionowe mieszanie się powietrza – pyły i zanieczyszczenia będące produktami emisji zostają zablokowane. Efektem jest zwiększone stężenie aerozoli atmosferycznych przy gruncie oraz powstanie smogu typu londyńskiego. 

Obszar poddany pomiarom to teren o względnie czystym powietrzu.

# Bibliografia

1.	https://goldbook.iupac.org/terms (stan z 4.01.2020)
2.	http://www.grida.no/climate (stan z 4.01.2020)
3.	https://en.wikipedia.org/wiki/Particulates (stan z 4.01.2020) 
4.	https://www.irceline.be/en/documentation/faq (stan z 4.01.2020)
5.	Nowosad, J., (2019). Elementarz programisty: wstęp do programowania używając R.
6.	https://stackoverflow.com
7.	https://nowosad.github.io/dydaktyka/
8.	https://powietrze.gios.gov.pl/pjp/content/annual_assessment_air_acceptable_level

