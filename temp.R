# Określ statystyki opisowe zmiennej PM10.
# Zbuduj wykres obrazujący zróżnicowanie wartości PM10. Stwórz też wizualizacje pokazujące relacje pomiędzy PM10 a przedziałami czasowymi pomiarów, oraz relacje pomiędzy PM10 a kategoriami pokrycia terenu.
# Sprawdź czy istnieje różnica pomiędzy wartościami PM10 dla różnych przedziałów czasowych.
# Sprawdź czy istnieje relacja pomiędzy wartościami PM10 a różnymi kategoriami pokrycia terenu.

library("tidyverse")
library("magrittr")
library("tidyr")

raw = read.csv("projekt_stat.csv")
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
  str_replace_all("Agricultural areas", "rolne")


#----------------------------------------------------------
#---- miary położenia ogólne
summary(main$PM10)

#---- miary położenia dla wydzielonych pór dnia
main_rano = subset(main, pora_dnia %in% c("0-8"))
main_poludnie = subset(main, pora_dnia %in% c("8-16"))
main_wieczor = subset(main, pora_dnia %in% c("16-24"))

summary(main_rano$PM10)
summary(main_poludnie$PM10)
summary(main_wieczor$PM10)

#---- rozstęp
max(main$PM10) - min(main$PM10)

#---- rozstęp kwantylny
IQR(main$PM10)

#---- wariancja
var(main$PM10)

#---- odchylenie standardowe
sd(main$PM10)


#----------------------------------------------------------
#----
main %>% 
  ggplot(aes(x=id,y=PM10, group=id)) +
  geom_boxplot() +
  labs(title = "Ogólny rozrzut danych PM10", x="id stacji pomiarowej")
#----
main %>% 
  ggplot(aes(x=pora_dnia, y=PM10)) +
  geom_boxplot() +
  labs(title = "Rozrzut danych PM10 wg pory dnia")
#----
main %>% 
  ggplot(aes(x=lc_name, y=PM10)) +
  geom_boxplot() +
  labs(title = "Rozrzut danych PM10 wg pokrycia terenu", x=NULL)
