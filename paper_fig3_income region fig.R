# only runs for DTP3 using each year of code

heterogeneity_fig_2020 <- heterogeneity_fig

heterogeneity_fig_2021 <- heterogeneity_fig

heterogeneity_fig_2022 <- heterogeneity_fig

paperfig3 <- plot_grid(heterogeneity_fig_2020, heterogeneity_fig_2021, heterogeneity_fig_2022,
                       nrow = 3, ncol = 1)

paperfig3


ggsave(filename = here::here(fig_folder, "3fig_region_income_trends.png"),
       plot = paperfig3, 
       width = 25, height = 40, units = "cm")
