FROM rocker/hadleyverse

# libv8-dev is needed for package DiagrammR, which xgboost needs
RUN apt-get update \
  && apt-get install -y libv8-dev libgeos-dev libgdal-dev libproj-dev

RUN install2.r --error \
	randomForest \
	glmnet \
	caret \
	gbm \
	e1071 \
	foreach \
	rjson \
	doMC \
	doSNOW \
	Metrics \
	ROCR \
	ff \
	sqldf \
	BayesTree \
	FeatureHashing \
	mice \
	corrgram \
	dummies \
	FNN \
	forecast \
	h2o \
	ipred \
	neuralnet \
	snow \
	snowfall \
	UScensus2010 \
	adehabitatLT \
	AUC \
	AUCRF \
	bartMachine \
	biganalytics \
	bigmemory \
	Boruta \
	doParallel \
	earth \
	FeaLect \
	ffbase \
	fractaldim \
	geosphere \
	GGally \
	ggmap \
	infotheo \
	irlba \
	kernlab \
	kohonen \
	LiblineaR \
	lubridate \
	pls \
	pROC \
	prospectr \
	rattle \
	recommenderlab \
	reshape \
	reshape2 \
	rgenoud \
	rlecuyer \
	rminer \
	ROAuth \
	RSNNS \
	RWeka \
	SnowballC \
	timeSeries \
	tm \
	tree \
	twitteR \
	tau \
	Matrix \
	SOAR \
	abind \
	assertthat \
	BH \
	bit \
	bit64 \
	bitops \
	boot \
	car \
	caTools \
	chron \
	class \
	cluster \
	coda \
	codetools \
	colorspace \
	corrplot \
	DBI \
	devtools \
	dichromat \
	digest \
	dplyr \
	evaluate \
	fastmatch \
	fields \
	foreign \
	formatR \
	Formula \
	functional \
	geoR \
	ggplot2 \
	ggvis \
	googleVis \
	gridExtra \
	gtable \
	hexbin \
	hflights \
	highr \
	htmltools \
	htmlwidgets \
	httpuv \
	httr \
	Imap \
	inline \
	iterators \
	itertools \
	jpeg \
	jsonlite \
	KernSmooth \
	knitr \
	labeling \
	Lahman \
	lattice \
	LatticeKrig \
	lazyeval \
	magic \
	magrittr \
	manipulate \
	mapproj \
	maps \
	markdown \
	MASS \
	MBA \
	memoise \
	mgcv \
	microbenchmark \
	mime \
	missForest \
	munsell \
	nlme \
	nnet \
	nycflights13 \
	plyr \
	png \
	proto \
	pryr \
	R6 \
	RandomFields \
	raster \
	RColorBrewer \
	Rcpp \
	RcppEigen \
	RCurl \
	RgoogleMaps \
	rJava \
	RJSONIO \
	rmarkdown \
	rotations \
	rpart \
	RSQLite \
	rstudioapi \
	scales \
	scrypt \
	shiny \
	sp \
	spam \
	spatial \
	spBayes \
	splancs \
	stringi \
	stringr \
	survival \
	tensor \
	testthat \
	tgp \
	tidyr \
	whisker \
	xlsx \
	xlsxjars \
	XML \
	xtable \
	xts \
	yaml \
	zoo \ 
	rpart \
	signal \
	wordcloud \
	wavelets \
	gam \
	Ckmeans.1d.dp \
	vcd \
	DiagrammeR \
	googleVis \
	animation \
	plot3D \
	directlabels \
	ICEbox \
	klaR \ 
	mefa \
	gridSVG \
	rgeos \
	rgdal
	
ADD RProfile.R /etc/R/Rprofile.site

# package installation using devtools' install_github function
ADD package_installs.R /tmp/package_installs.R 
RUN Rscript /tmp/package_installs.R

CMD ["R"]
