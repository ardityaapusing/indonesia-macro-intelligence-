# 🇮🇩 Indonesia Macro Economic Intelligence Dashboard

> **R Shiny dashboard analyzing Indonesia's macroeconomic indicators: GDP, inflation, unemployment, investment, and regional inequality (2014–2023)**

[![R Shiny](https://img.shields.io/badge/Built%20with-R%20Shiny-276DC3)](https://shiny.posit.co)
[![Live Demo](https://img.shields.io/badge/🚀%20Live%20Demo-shinyapps.io-blue)](https://ardityaapusing.shinyapps.io/indonesia-macro-intelligence)

---

## 📊 Dashboard Sections

| Tab | Analysis |
|-----|----------|
| 📈 **PDB & Pertumbuhan** | GDP growth 2014–2023, sector breakdown, post-pandemic recovery |
| 🗺️ **Peta Provinsi** | Interactive provincial map: PDRB, growth rate, Gini coefficient |
| 🔥 **Inflasi** | Monthly inflation 2022–2023, component breakdown, provincial heatmap |
| 💼 **Ketenagakerjaan** | Unemployment trends, urban-rural gap, investment-employment correlation |
| 💰 **Investasi** | FDI + DDI trends, sector allocation, Gini vs investment analysis |

---

## 🔑 Key Findings

- **Sulawesi Tengah** grew **13.06%** in 2023 — fastest in Indonesia — driven by nickel downstream processing, but Gini rising
- **Inflation peaked at 5.95%** (Sep 2022) due to energy price shock; Bank Indonesia raised rates 225bps in 7 months
- **Eastern Indonesia** consistently records higher inflation (Maluku Utara 3.71% vs DKI Jakarta 2.31%) — structural logistics gap
- **Investment hit Rp 2,092 trillion** in 2023 (+18.9%) — 3rd consecutive year beating BKPM target
- **Banten & West Java paradox**: highest unemployment (7.97%, 7.44%) despite being top-5 GDP provinces

---

## 🚀 Run Locally

```r
install.packages(c("shiny","ggplot2","plotly","dplyr","tidyr","DT","scales"))
shiny::runApp(".")
```

---

## 📁 Structure

```
indonesia-macro-intelligence/
├── app.R      ← UI + Server
├── global.R   ← All data + helpers (BPS, BI, BKPM)
└── README.md
```

---

## 👤 Author

**Arditya Sulistya Ningsih Apusing, S.Stat.**  
[linkedin.com/in/ardityaapusing](https://linkedin.com/in/ardityaapusing) · [github.com/ardityaapusing](https://github.com/ardityaapusing)
