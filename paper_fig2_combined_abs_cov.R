# GET DATA

  ## run code with dtp1 down to line 679
data_dtp1 <- global_cov_data
  ## delete all variables except for this one

  ## run code with dtp3 down to line 679
data_dtp3 <- global_cov_data
  ## delete all variables except for data_dtp1 and data_dtp3

  ## run code with mcv1 down to line 679
data_mcv1 <- global_cov_data
  ## delete all variables except for data_dtp1, data_dtp3, and data_mcv1

# COMBINE DATA
data_dtp1 %<>%
  rename(DTP1 = coverage)

data_dtp3 %<>%
  rename(DTP3 = coverage)

data_mcv1 %<>%
  rename(MCV1 = coverage)

combined <- data_dtp1 %>%
  left_join(data_dtp3, by = c("year", "type")) %>%
  left_join(data_mcv1, by = c("year", "type")) %>%
  select(year, type, DTP1,DTP3,MCV1) %>%
  pivot_longer(cols = c("DTP1", "DTP3", "MCV1"),
               names_to = "vaccine",
               values_to = "value")

## Create chart
global_cov <- ggplot(data = combined, aes(x = year, y = value))+
  geom_point(aes(colour = vaccine), size = 2) +
  geom_line(aes(colour = vaccine, linetype = type), linewidth = 1.2, alpha = 0.5)+
  theme_bw()+
  scale_linetype_manual("Data source", values = c("dotdash", "solid"), 
                        labels = c("Expected", "Reported"))+
  scale_colour_manual("Vaccine", 
                      values = wes_palette(name = "FantasticFox1", n = 3, type = "discrete"))+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1L), 
                     limits = c(0.7,1),
                     n.breaks = 4) +
  labs(y = "Coverage (%)",
       x = "Year") +
  theme(axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14), 
        strip.text.x = element_text(size = 14), 
        axis.title = element_text(size = 18))+
  geom_hline(yintercept = data_dtp3$DTP3[27], linetype = "dashed", color = "grey50")+#NEED TO CHECK WHERE TO DRAW HLINE
  geom_vline(xintercept = 2005, linetype = "dashed", color = "grey30")+
  geom_vline(xintercept = 2022, linetype = "dashed", color = "grey30")+
  annotate("text", x = 2008, y = 0.81, label = "DTP3 2005 coverage = 87.0%", size = 4, color = "grey50")+
  annotate("text", x = 2019, y = 0.81, label = "DTP3 2022 coverage = 87.2%", size = 4, color = "grey50")
  
  
global_cov

ggsave(filename = here::here("2fig_global_cov_fig.png"),
       plot = global_cov, 
       width = 30, height = 20, units = "cm")
