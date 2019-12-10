# Określ statystyki opisowe zmiennej PM10.
# Zbuduj wykres obrazujący zróżnicowanie wartości PM10. Stwórz też wizualizacje pokazujące relacje pomiędzy PM10 a przedziałami czasowymi pomiarów, oraz relacje pomiędzy PM10 a kategoriami pokrycia terenu.
# Sprawdź czy istnieje różnica pomiędzy wartościami PM10 dla różnych przedziałów czasowych.
# Sprawdź czy istnieje relacja pomiędzy wartościami PM10 a różnymi kategoriami pokrycia terenu.

library("tidyverse")
library("magrittr")
raw = read.csv("projekt_stat.csv")
summary(raw)

