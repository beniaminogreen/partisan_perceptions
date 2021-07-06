report.pdf: report.Rmd ./data/cleaned_data.Rdata data/estimated_models.Rdata
	R -e "require(rmarkdown); render('report.Rmd')"

./data/cleaned_data.Rdata: ./scripts/clean_data.R ./data/UCL_Carville_June_21_US_Client.sav
	cd scripts; R CMD BATCH --vanilla clean_data.R

data/estimated_models.Rdata: data/cleaned_data.Rdata scripts/estimate_models.R
	cd scripts; R CMD BATCH --vanilla estimate_models.R

clean:
	rm -f *.html *.pdf *.tex *.aux *.log *.docx *.Rout scripts/*.Rout
