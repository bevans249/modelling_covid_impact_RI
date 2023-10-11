# Only runs for DTP3 using each year of code

## Run code until line 1066 for DTP3

## Set plot_year to 2020
fig_2020 <- fig_overall_results

## Set plot_year to 2022
fig_2021 <- fig_overall_results

## Set plot_year to 2021
fig_2022 <- fig_overall_results


# PRODUCE OUTPUT
expected_vs_actuals <- plot_grid(fig_2020, fig_2021, fig_2022, labels = c("A", "B", "C"), ncol = 3, rel_widths = c(1,1,1), width = 9, height = 3)

expected_vs_actuals

ggsave(filename = here::here("4fig_expected_vs_actuals_3_years.png"),
       plot = expected_vs_actuals, 
       width = 60, height = 35, units = "cm")


ggsave(filename = here::here(fig_folder, "paper_fig_4.png"),
       plot = paper_fig_4, 
       width = 30, height = 10, units = "cm")
