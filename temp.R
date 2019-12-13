# Określ statystyki opisowe zmiennej PM10.
# Zbuduj wykres obrazujący zróżnicowanie wartości PM10. Stwórz też wizualizacje pokazujące relacje pomiędzy PM10 a przedziałami czasowymi pomiarów, oraz relacje pomiędzy PM10 a kategoriami pokrycia terenu.
# Sprawdź czy istnieje różnica pomiędzy wartościami PM10 dla różnych przedziałów czasowych.
# Sprawdź czy istnieje relacja pomiędzy wartościami PM10 a różnymi kategoriami pokrycia terenu.

library("tidyverse")
library("magrittr")

raw = read.csv("projekt_stat.csv")
summary(raw)
main = raw

#$pora_dnia cleanup
main$pora_dnia %<>% 
  str_replace_all("\\[0,8\\)", "0-8") %>% 
  str_replace_all("\\[16,24\\]", "16-24") %>% 
  str_replace_all("\\[8,16\\)", "8-16") %>% 
  as.factor()

#lc_name cleanup
main$lc_name %<>% 
  str_replace_all("Artificial surfaces", "sztuczne") %>% 
  str_replace_all("Agricultural areas", "naturalne")
#----------------------------------------------------------

