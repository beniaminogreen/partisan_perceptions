report.pdf: report.Rmd ./data/models.Rdata ./data/cleaned_data.Rdata  ./data/monte_carlo_results.Rdata
	R -e "require(rmarkdown); render('report.Rmd')"

./data/models.Rdata: ./scripts/estimate_models.R ./data/cleaned_data.Rdata
	cd scripts; R CMD BATCH --no-save estimate_models.R

./data/cleaned_data.Rdata: ./scripts/clean_data.R ./data/UCL_Palestine_US_client.sav
	cd scripts; R CMD BATCH --no-save clean_data.R

./data/monte_carlo_results.Rdata: ./scripts/monte_carlo.R
	cd scripts; R CMD BATCH --no-save monte_carlo.R

clean:
	rm -f *.html *.tex *.aux *.log *.docx *.Rout scripts/*.Rout scripts/*.Rdata
