report.pdf: report.Rmd ./data/cleaned_data.Rdata data/estimated_models.Rdata
	R -e "require(rmarkdown); render('report.Rmd')"

./data/cleaned_data.Rdata: ./code/clean_data.R ./data/UCL_Carville_June_21_US_Client.sav
	cd code; R CMD BATCH --vanilla clean_data.R

data/estimated_models.Rdata: ./data/cleaned_data.Rdata ./code/estimate_models.R
	cd code; R CMD BATCH --vanilla estimate_models.R

clean:
	rm -f *.html *.pdf *.tex *.aux *.log *.docx *.Rout scripts/*.Rout
