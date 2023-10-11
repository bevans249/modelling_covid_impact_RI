# Run code with DTP3 down to line 658, then the code at end of this file
dtp3 <- fig_large_pops
dtp3

# Select all and delete except for dtp3

# Run code with DTP1 to line 658, then the code at end of this file
dtp1 <- fig_large_pops
dtp1

# Select all and delete except for dtp1 and dtp3

# Run code with MCV1 down to line 705 but with "fixed" instead of "free_y" and strip title size 9
mcv1_1 <- fig_large_pops
mcv1_1

#lazy option
pop_fig <- plot_grid(dtp1, dtp3, mcv1_1,
                     labels = c("DTP1", "DTP3", "MCV1"),
                     nrow = 3,
                     rel_heights = c(1, 1, 1))
pop_fig


# less lazy option

pop_fig <- plot_grid(dtp1, dtp3, mcv1,
                     labels = c("DTP1", "DTP3", "MCV1"),
                     nrow = 3,
                     rel_heights = c(1, 1, 1.3)),
                     scale = c(1, 1, 0.9))
pop_fig

ggsave(filename = here::here("1fig_pop_fig.png"),
       plot = pop_fig, 
       width = 30, height = 20, units = "cm")

### Adapted code
# Indentify largest countries in dataset
unwpp_ordered <- unwpp %>%
  arrange(-surviving_infants) %>%
  right_join(res2021, by = "iso_code") %>%  #filter to only those in the final results
  select(iso_code, surviving_infants) %>%
  head(5)

# Select countries for inclusion in plot
large_pops <- unwpp_ordered$iso_code

x_large <- x %>%
  filter(iso_code %in% large_pops)

res_large <- res_all %>%   #change back to res
  filter(iso_code %in% large_pops)

# Generate plot
arima_color <- "#ac3973"

fig_large_pops <- ggplot(data = x_large, aes(x = year, y = coverage)) +
  theme_bw() +
  geom_point(alpha = 0.8) +
  geom_line(alpha = 0.3) +
  geom_errorbar(data = res_large, aes(x = year, ymin = lower_ci, ymax = upper_ci),
                color = arima_color) +
  geom_point(data = res_large, aes(y = mean), shape = 3, color = arima_color) +
  facet_wrap(~ country, nrow = 1, scales = "fixed",
             labeller = label_wrap_gen(25)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1L), 
                     limits = c(NA,1),
                     n.breaks = 5) +
  labs(y = "Coverage (%)")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_text(size = 14), 
        axis.title.y = element_text(size = 18),
        axis.title.x = element_blank())

fig_large_pops
