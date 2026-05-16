# global.R — Indonesia Macro Economic Intelligence
# Author: Arditya Sulistya Ningsih Apusing, S.Stat.
# Data: BPS RI · Bank Indonesia · BKPM · Kemnaker

library(shiny); library(ggplot2); library(plotly)
library(dplyr); library(tidyr); library(DT); library(scales)

C1<-"#059669";C2<-"#0F172A";C3<-"#3B82F6";C4<-"#D97706";C5<-"#DC2626";C6<-"#8B5CF6"
PAL<-c(C1,C3,C4,C5,C6,"#14B8A6","#F59E0B","#6366F1","#EC4899","#10B981","#F97316")

# GDP ANNUAL (BPS)
gdp_annual<-data.frame(
  year=2014:2023,
  growth=c(5.01,4.88,5.03,5.07,5.17,5.02,-2.07,3.69,5.31,5.05),
  nominal=c(10542,11541,12407,13589,14838,15833,15435,16970,19588,20892)
)

# GDP BY SECTOR (BPS, triliun Rp)
gdp_sector<-data.frame(
  sector=c("Industri Pengolahan","Pertanian","Perdagangan",
           "Konstruksi","Tambang & Galian","Transportasi",
           "Keuangan","Informasi & Komunikasi","Real Estate","Jasa Lainnya"),
  gdp_2020=c(2769,2590,1636,1412,1257,620,631,628,314,538),
  gdp_2021=c(2919,2674,1774,1531,1399,677,679,729,333,578),
  gdp_2022=c(3168,2902,1978,1712,1776,859,757,847,371,638),
  gdp_2023=c(3312,2987,2087,1828,1821,976,812,951,392,687),
  stringsAsFactors=FALSE
) %>% mutate(
  g21=round((gdp_2021-gdp_2020)/gdp_2020*100,2),
  g22=round((gdp_2022-gdp_2021)/gdp_2021*100,2),
  g23=round((gdp_2023-gdp_2022)/gdp_2022*100,2)
)

# PROVINCIAL GDP (BPS, triliun Rp)
provincial_gdp<-data.frame(
  province=c("DKI Jakarta","Jawa Timur","Jawa Barat","Jawa Tengah",
             "Kalimantan Timur","Sumatera Utara","Riau","Sulawesi Selatan",
             "Banten","Sumatera Selatan","Papua","Kalimantan Selatan",
             "Sulawesi Tengah","Bali","Lampung","Kepulauan Riau",
             "NTB","Kalimantan Barat","Aceh","Maluku"),
  pdrb=c(3774,2774,2139,1401,869,712,666,511,489,446,
         432,287,278,194,192,141,152,179,138,67),
  growth=c(4.96,5.24,5.01,5.11,6.22,4.88,4.12,6.74,4.95,5.36,
           3.97,5.86,13.06,5.71,4.21,4.77,5.89,5.03,3.82,5.87),
  gini=c(0.432,0.374,0.379,0.365,0.335,0.312,0.326,0.362,
         0.358,0.332,0.394,0.319,0.343,0.382,0.329,0.331,
         0.381,0.314,0.318,0.325),
  lat=c(-6.21,-7.54,-6.91,-7.15,-1.68,2.10,0.29,-5.14,
        -6.20,-2.99,-4.27,-3.09,-1.43,-8.34,-4.56,0.92,
        -8.65,-0.05,4.69,-3.24),
  lon=c(106.85,112.24,107.61,110.14,116.42,98.67,101.70,119.43,
        106.15,104.48,136.18,115.51,121.90,115.09,105.41,104.46,
        116.35,109.33,96.75,130.15),
  stringsAsFactors=FALSE
) %>% mutate(rank=dense_rank(desc(pdrb)),share=round(pdrb/sum(pdrb)*100,2))

# INFLATION (BPS)
inflation_annual<-data.frame(
  year=2018:2023,
  rate=c(3.13,2.72,1.68,1.87,5.51,2.61),
  food=c(3.41,4.65,1.57,4.47,5.61,4.03),
  energy=c(2.98,0.51,-0.28,0.87,13.64,-0.46),
  core=c(2.99,3.02,1.60,1.56,3.36,1.94)
)

inflation_monthly<-data.frame(
  period=c("Jan 22","Feb 22","Mar 22","Apr 22","May 22","Jun 22",
           "Jul 22","Aug 22","Sep 22","Oct 22","Nov 22","Dec 22",
           "Jan 23","Feb 23","Mar 23","Apr 23","May 23","Jun 23",
           "Jul 23","Aug 23","Sep 23","Oct 23","Nov 23","Dec 23"),
  idx=1:24,
  rate=c(2.18,2.06,2.64,3.47,3.55,4.35,4.94,4.69,5.95,5.71,5.42,5.51,
         5.28,5.47,4.97,4.33,4.00,3.52,3.08,3.27,2.28,2.56,2.86,2.61),
  stringsAsFactors=FALSE
)

province_inflation<-data.frame(
  province=c("Maluku Utara","Papua Barat","Sulawesi Utara","NTT","Maluku",
             "Kalimantan Utara","Sulawesi Tenggara","Papua","Kepulauan Riau",
             "Bengkulu","NTB","Jambi","Sulawesi Barat","Sulawesi Tengah",
             "Riau","Kalimantan Barat","Aceh","Sumatera Barat",
             "Kalimantan Timur","Sulawesi Selatan","Sumatera Utara",
             "Kalimantan Selatan","Sumatera Selatan","Lampung","DI Yogyakarta",
             "Jawa Tengah","Banten","Kalimantan Tengah","Jawa Barat",
             "Bali","DKI Jakarta","Jawa Timur"),
  rate=c(3.71,3.52,3.48,3.44,3.42,3.38,3.31,3.28,3.25,3.19,3.18,3.12,
         3.08,3.04,2.98,2.92,2.88,2.81,2.79,2.76,2.71,2.68,2.65,2.58,
         2.52,2.48,2.44,2.41,2.38,2.35,2.31,2.28),
  stringsAsFactors=FALSE
)

# UNEMPLOYMENT (BPS)
unemployment<-data.frame(
  year=2014:2023,
  national=c(5.94,6.18,5.61,5.50,5.34,5.28,7.07,6.49,5.86,5.32),
  urban=c(7.28,7.34,6.74,6.72,6.43,6.31,8.98,8.08,7.39,6.66),
  rural=c(4.31,4.75,4.26,4.01,3.97,3.98,4.95,4.71,3.96,3.44)
)

prov_unemployment<-data.frame(
  province=c("Banten","Jawa Barat","DKI Jakarta","Kepulauan Riau",
             "Maluku","Sulawesi Utara","Sumatera Barat","Aceh",
             "Kalimantan Timur","Jawa Timur","Jawa Tengah","Lampung",
             "Sumatera Utara","Kalimantan Selatan","Sulawesi Tengah",
             "Sulawesi Selatan","DI Yogyakarta","Bali","NTT","Nasional"),
  tpt=c(7.97,7.44,6.53,6.21,5.72,5.92,5.48,6.03,5.43,4.95,
        5.13,4.31,4.82,4.17,2.95,3.87,3.47,2.69,3.89,5.32),
  stringsAsFactors=FALSE
) %>% arrange(desc(tpt))

# INVESTMENT (BKPM, triliun Rp)
investment<-data.frame(
  year=2018:2023,
  fdi=c(392.7,423.1,412.8,901.0,1207.2,1418.9),
  ddi=c(328.6,386.5,413.5,500.0,552.8,672.9),
  total=c(721.3,809.6,826.3,1401.0,1760.0,2091.8)
) %>% mutate(
  fdi_share=round(fdi/total*100,1),
  total_growth=c(NA,round(diff(total)/head(total,-1)*100,1))
)

invest_sector<-data.frame(
  sector=c("Industri Logam Dasar","Industri Kimia",
           "Transportasi & Telekomunikasi","Pertambangan",
           "Listrik, Gas & Air","Perumahan & Kawasan Industri",
           "Industri Makanan","Tanaman Pangan","Hotel & Restoran","Jasa Lainnya"),
  value=c(171.3,142.8,138.4,127.6,118.2,107.9,98.4,76.5,62.1,87.3),
  type=c("Manufaktur","Manufaktur","Jasa","Tambang","Infrastruktur",
         "Properti","Manufaktur","Pertanian","Jasa","Jasa"),
  stringsAsFactors=FALSE
) %>% arrange(desc(value))

# GINI (BPS)
gini_annual<-data.frame(
  year=2014:2023,
  national=c(0.414,0.408,0.397,0.393,0.389,0.380,0.381,0.381,0.381,0.388),
  urban=c(0.430,0.428,0.410,0.406,0.401,0.393,0.399,0.402,0.396,0.401),
  rural=c(0.336,0.329,0.316,0.320,0.319,0.315,0.302,0.314,0.314,0.321)
)

plotly_cfg<-function(p){
  p%>%layout(paper_bgcolor="white",plot_bgcolor="white",
    font=list(family="Plus Jakarta Sans"),
    margin=list(t=24,b=24,l=10,r=10))%>%
  config(displayModeBar=FALSE)
}
