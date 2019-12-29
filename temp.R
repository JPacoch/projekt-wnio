# Określ statystyki opisowe zmiennej PM10.
# Zbuduj wykres obrazujący zróżnicowanie wartości PM10. Stwórz też wizualizacje pokazujące relacje pomiędzy PM10 a przedziałami czasowymi pomiarów, oraz relacje pomiędzy PM10 a kategoriami pokrycia terenu.
# Sprawdź czy istnieje różnica pomiędzy wartościami PM10 dla różnych przedziałów czasowych.
# Sprawdź czy istnieje relacja pomiędzy wartościami PM10 a różnymi kategoriami pokrycia terenu.

library("tidyverse")
library("magrittr")
library("tidyr")
library("dplyr")

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
  geom_boxplot(fill = "deepskyblue2") +
  labs(title = "Ogólny rozrzut danych PM10", x="id stacji pomiarowej")
#----
main %>% 
  ggplot(aes(x=pora_dnia, y=PM10)) +
  geom_boxplot(notch = TRUE, fill = "deepskyblue2") +
  labs(title = "Rozrzut danych PM10 wg pory dnia")
#----
main %>% 
  ggplot(aes(x=lc_name, y=PM10)) +
  geom_boxplot(notch = TRUE, fill = "deepskyblue2") +
  labs(title = "Rozrzut danych PM10 wg pokrycia terenu", x=NULL)


#----------------------------------------------------------
#---- histogram udowadniający że rozkład danych jest zbliżony do rozkładu normalnego
main %>% 
  ggplot(aes(x = PM10)) +
  geom_histogram(binwidth = 2.5)


#---- zależność między wartościami PM10 a pokryciem terenu
t.test(PM10 ~ lc_name, data = main)

#p-value > 0.05, czyli nie możemy odrzucić naszej hipotezy 0
#tzn, że pokrycie terenu nie ma znacznego wpływu na zmianę wartości


#---- zależność między wartościami PM10 a porami dnia
ANOVA <- summary(aov(PM10 ~ pora_dnia, data = main))
ANOVA <- ANOVA[[1]]
ANOVA <- ANOVA[1, 5]
ANOVA                 #p-value testu ANOVA

#odrzucamy hipozezę 0 bo p-value jest niskie i przyjmujemy hipotezę alternatywną
#tzn, że istnieją różnice w wartościach PM10 między wartościami z różnych pór dnia
#??? chyba


#---- test post-hoc dla ANOVA
ANOVA_2 <- aov(PM10 ~ pora_dnia, data = main)
posthoc_ANOVA = TukeyHSD(ANOVA_2, which = "pora_dnia", conf.level = 0.95)
par(mar = c(5, 7, 4, 2))                #marginesy
plot(posthoc_ANOVA, las = 1)

#z wykresu wynika, że istnieją różnice w wartościach:
#między grupą nocną a poranną (16-24 : 0-8)
#między grupą popołudniową a nocną (8-16 : 16-24)


#----------------------------------------------------------
#---- wartości dziwne
main_odstajace <- pivot_wider(main, names_from = pora_dnia, values_from = PM10)
main_odstajace <- filter(main_odstajace, main_odstajace$`0-8` == main_odstajace$`8-16`)
main_fixed <- filter(main, !main$id %in% c(178, 38, 88))

