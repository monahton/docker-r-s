# Dockerfile to run R script

FROM vladdsm/docker-r-h2o

MAINTAINER 'Vladimir Zhbanko' <vladimir.zhbanko@gmail.com>

## create directories
RUN mkdir -p /01_data
RUN mkdir -p /02_code
RUN mkdir -p /03_output

## add specific files
ADD /01_data/OrdersResultsT1.csv /01_data/OrdersResultsT1.csv

## copy working script
COPY /02_code/script2run.R /02_code/script2run.R
COPY /02_code/get_profit_factorDF.R /02_code/get_profit_factorDF.R
COPY /02_code/import_data.R /02_code/import_data.R
COPY /02_code/check_if_optimize.R /02_code/check_if_optimize.R

## run the script on running container
#CMD bash #use this command to check if the files are copied
CMD Rscript /02_code/script2run.R

## command to run this container
#docker run -it --rm -v /Users/vladdsm/Shared:/03_output vladdsm/docker-r-s