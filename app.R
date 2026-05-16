source("global.R")

ui <- fluidPage(
  tags$head(tags$title("Indonesia Macro Intelligence"),
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap');
      *{font-family:'Plus Jakarta Sans',sans-serif!important}
      body{background:#F8FAFC;margin:0;padding:0}
      .hdr{background:#0F172A;padding:1.1rem 2rem;border-bottom:2px solid #059669;
        display:flex;align-items:center;justify-content:space-between}
      .hdr-t{color:white;font-size:1.05rem;font-weight:800}
      .hdr-t span{color:#10B981}
      .hdr-sub{color:rgba(255,255,255,.4);font-size:.7rem;margin-top:.1rem}
      .hdr-badge{background:rgba(16,185,129,.12);border:1px solid rgba(16,185,129,.25);
        color:#10B981;padding:.3rem .9rem;border-radius:99px;font-size:.7rem;font-weight:700}
      .kpi-row{display:grid;grid-template-columns:repeat(5,1fr);background:white;
        border-bottom:1px solid #E2E8F0}
      .kpi{padding:1.1rem 1.5rem;border-right:1px solid #E2E8F0;text-align:center}
      .kpi:last-child{border-right:none}
      .kpi-n{font-size:1.55rem;font-weight:800;color:#0F172A;line-height:1}
      .kpi-n.g{color:#059669}.kpi-n.r{color:#DC2626}.kpi-n.b{color:#3B82F6}
      .kpi-l{font-size:.62rem;color:#64748B;font-weight:600;letter-spacing:.05em;
        text-transform:uppercase;margin-top:.2rem}
      .kpi-d{font-size:.7rem;font-weight:600;margin-top:.15rem}
      .dup{color:#059669}.ddn{color:#DC2626}
      .main{padding:1.5rem 2rem}
      .panel{background:white;border-radius:12px;padding:1.5rem;
        border:1px solid #E2E8F0;margin-top:1rem}
      .ins{background:#F0FDF4;border:1px solid #BBF7D0;border-radius:8px;
        padding:.85rem 1.1rem;margin:.75rem 0;font-size:.82rem;color:#166534;
        border-left:3px solid #059669}
      .ins-w{background:#FFFBEB;border-color:#FDE68A;color:#92400E;border-left-color:#D97706}
      .ins-r{background:#FEF2F2;border-color:#FECACA;color:#991B1B;border-left-color:#DC2626}
      .slbl{font-size:.65rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;
        color:#059669;margin-bottom:.4rem}
      .nav-tabs{border-bottom:2px solid #E2E8F0!important}
      .nav-tabs>li>a{color:#64748B!important;font-weight:600!important;font-size:.82rem!important}
      .nav-tabs>li.active>a{color:#059669!important;border-bottom:2px solid #059669!important}
      .ftr{background:#0F172A;color:rgba(255,255,255,.35);font-size:.7rem;
        padding:.85rem 2rem;text-align:center;margin-top:2rem}
      .ftr a{color:#10B981!important;text-decoration:none}
    "))
  ),

  # HEADER
  div(class="hdr",
    div(div(class="hdr-t","🇮🇩 Indonesia Macro Economic ",tags$span("Intelligence")),
      div(class="hdr-sub","Data: BPS RI · Bank Indonesia · BKPM · Kemnaker | 2014–2023")),
    div(class="hdr-badge","Portfolio · Arditya Apusing")),

  # KPI STRIP
  div(class="kpi-row",
    div(class="kpi",div(class="kpi-n g","5.05%"),div(class="kpi-l","PDB Growth 2023"),
      div(class="kpi-d dup","▲ 4th consecutive year above 5%")),
    div(class="kpi",div(class="kpi-n","Rp 20,892T"),div(class="kpi-l","PDB Nominal 2023"),
      div(class="kpi-d dup","▲ Largest economy in ASEAN")),
    div(class="kpi",div(class="kpi-n r","2.61%"),div(class="kpi-l","Inflasi 2023"),
      div(class="kpi-d dup","▼ Turun dari 5.51% (2022)")),
    div(class="kpi",div(class="kpi-n","5.32%"),div(class="kpi-l","TPT 2023"),
      div(class="kpi-d dup","▼ Terendah sejak pandemi")),
    div(class="kpi",div(class="kpi-n b","Rp 2,092T"),div(class="kpi-l","Total Investasi 2023"),
      div(class="kpi-d dup","▲ Record tertinggi (+18.9%)"))),

  # TABS
  div(class="main",
    tabsetPanel(
      tabPanel("📈 PDB & Pertumbuhan",div(class="panel",
        fluidRow(
          column(7,div(class="slbl","Pertumbuhan PDB 2014–2023 (%, yoy)"),
            plotlyOutput("gdp_growth",height="300px")),
          column(5,div(class="slbl","PDB Nominal (Triliun Rp)"),
            plotlyOutput("gdp_nominal",height="300px"))),
        div(class="ins","💡 ",tags$strong("Key Insight: "),
          "Indonesia rebound kuat pasca COVID-19 (-2.07% di 2020) dengan pertumbuhan 3.69% (2021), 5.31% (2022), dan 5.05% (2023). Stabilitas ini menjadikan Indonesia salah satu ekonomi G20 paling resilient. PDB nominal menembus Rp 20,892 triliun — setara USD ~1.37 triliun."),
        hr(),
        fluidRow(
          column(6,div(class="slbl","PDB per Sektor 2023 (Triliun Rp)"),
            plotlyOutput("gdp_sector",height="340px")),
          column(6,div(class="slbl","Pertumbuhan Sektor 2021–2023 (%)"),
            plotlyOutput("gdp_sector_growth",height="340px"))),
        div(class="ins","💡 ",tags$strong("Sektor Highlight: "),
          "Informasi & Komunikasi tumbuh paling cepat (2021–2023) didorong digitalisasi pasca-pandemi. Transportasi rebound paling dramatis dari -15.5% (2020) ke +15.6% (2022). Tambang & Galian menikmati windfall komoditas di 2022 (+17.1%) meski 2023 mulai normalisasi (+2.5%).")
      )),

      tabPanel("🗺️ Peta Provinsi",div(class="panel",
        div(class="slbl","Pilih Indikator untuk Visualisasi Provinsi"),
        fluidRow(
          column(3, selectInput("prov_var","Indikator:",
            choices=c("PDRB (Triliun Rp)"="pdrb",
                      "Pertumbuhan PDRB (%)"="growth",
                      "Koefisien Gini"="gini"),
            selected="pdrb")),
          column(9)),
        fluidRow(
          column(7,div(class="slbl","Peta Sebaran Provinsi"),
            plotlyOutput("prov_map",height="420px")),
          column(5,div(class="slbl","Ranking Provinsi"),
            plotlyOutput("prov_bar",height="420px"))),
        div(class="ins","💡 ",tags$strong("Sulawesi Tengah Alert: "),
          "Sulawesi Tengah mencatat pertumbuhan PDRB tertinggi nasional: 13.06% di 2023, jauh melampaui rata-rata nasional 5.05%. Mesin pertumbuhannya adalah industri pengolahan nikel (smelter) pasca kebijakan larangan ekspor bijih mentah. Namun Gini ratio ikut meningkat (0.343) — sinyal ketimpangan antara pekerja tambang dan masyarakat lokal."),
        div(class="ins-w","⚠️ ",tags$strong("Ketimpangan Regional: "),
          "DKI Jakarta sendirian menyumbang 18.1% total PDB nasional. Lima provinsi Jawa (DKI, Jatim, Jabar, Jateng, Banten) menghasilkan 57.4% PDB — ketimpangan Jawa vs luar Jawa tetap menjadi tantangan struktural terbesar ekonomi Indonesia.")
      )),

      tabPanel("🔥 Inflasi",div(class="panel",
        fluidRow(
          column(8,div(class="slbl","Tren Inflasi Bulanan 2022–2023 (%, yoy)"),
            plotlyOutput("inf_monthly",height="300px")),
          column(4,div(class="slbl","Inflasi per Komponen 2018–2023"),
            plotlyOutput("inf_component",height="300px"))),
        div(class="ins-r","🚨 ",tags$strong("Inflasi Peak September 2022: "),
          "Inflasi mencapai 5.95% YoY — tertinggi sejak 2014 — dipicu lonjakan harga energi global (komponen energi +13.64%) akibat perang Rusia-Ukraina dan kenaikan harga BBM domestik. Bank Indonesia merespons dengan menaikkan suku bunga acuan 225 bps dalam 7 bulan (Agustus 2022 – Februari 2023)."),
        hr(),
        div(class="slbl","Inflasi per Provinsi 2023 (%, yoy) — Wilayah Timur Paling Terdampak"),
        plotlyOutput("inf_province",height="380px"),
        div(class="ins","💡 ",tags$strong("Pola Regional: "),
          "Indonesia timur (Maluku Utara 3.71%, Papua Barat 3.52%) konsisten mencatat inflasi lebih tinggi dibanding Jawa. Faktor struktural: rantai distribusi yang panjang, ketergantungan impor barang kebutuhan pokok dari Jawa, dan infrastruktur logistik yang belum memadai. DKI Jakarta dan Jawa Timur justru mencatat inflasi terendah nasional (2.31-2.28%) berkat jaringan distribusi yang efisien.")
      )),

      tabPanel("💼 Ketenagakerjaan",div(class="panel",
        fluidRow(
          column(6,div(class="slbl","Tren Pengangguran Nasional 2014–2023 (%)"),
            plotlyOutput("unemp_trend",height="300px")),
          column(6,div(class="slbl","Urban vs Rural Unemployment Gap"),
            plotlyOutput("unemp_gap",height="300px"))),
        div(class="ins","💡 ",tags$strong("Pemulihan Pasar Kerja: "),
          "TPT nasional turun ke 5.32% (2023) — level pra-pandemi. Namun gap urban-rural masih lebar: pekerja kota (6.66%) hampir 2x lebih rengan pengangguran vs desa (3.44%). Ini mencerminkan kelebihan supply tenaga kerja di kota akibat urbanisasi tanpa diimbangi penciptaan lapangan kerja formal yang memadai."),
        hr(),
        fluidRow(
          column(6,div(class="slbl","TPT per Provinsi 2023 — Banten & Jabar Tertinggi"),
            plotlyOutput("unemp_prov",height="340px")),
          column(6,div(class="slbl","Korelasi Investasi vs Pengangguran"),
            plotlyOutput("invest_unemp",height="340px"))),
        div(class="ins-w","⚠️ ",tags$strong("Banten & Jawa Barat Anomaly: "),
          "Banten (7.97%) dan Jawa Barat (7.44%) adalah provinsi dengan pengangguran tertinggi — padahal keduanya masuk 10 provinsi dengan PDRB terbesar. Paradoks ini terjadi karena industrialisasi padat modal di kedua provinsi tidak mampu menyerap gelombang urbanisasi dari Jawa Tengah, Jawa Timur, dan NTT.")
      )),

      tabPanel("💰 Investasi",div(class="panel",
        fluidRow(
          column(7,div(class="slbl","Realisasi Investasi 2018–2023 (Triliun Rp)"),
            plotlyOutput("invest_trend",height="300px")),
          column(5,div(class="slbl","Komposisi PMA vs PMDN 2023"),
            plotlyOutput("invest_pie",height="300px"))),
        div(class="ins","💡 ",tags$strong("Investment Supercycle: "),
          "Total investasi 2023 mencapai Rp 2,092 triliun (+18.9% YoY) — melampaui target BKPM untuk ketiga kalinya berturut-turut. PMA (Foreign Direct Investment) mendominasi di 67.8% — menunjukkan kepercayaan investor asing terhadap stabilitas dan prospek ekonomi Indonesia pasca-pandemi."),
        hr(),
        fluidRow(
          column(6,div(class="slbl","Top 10 Sektor Investasi 2023"),
            plotlyOutput("invest_sector",height="340px")),
          column(6,div(class="slbl","Tren Gini Koefisien vs Investasi"),
            plotlyOutput("gini_invest",height="340px"))),
        div(class="ins-w","⚠️ ",tags$strong("Investment-Inequality Trade-off: "),
          "Lonjakan investasi tambang dan logam dasar mendorong pertumbuhan, tetapi Gini ratio mulai naik kembali ke 0.388 (2023) setelah sempat turun ke 0.380 (2019). Investasi yang terkonsentrasi di sektor kapital-intensif dan wilayah tertentu belum cukup mendorong pemerataan pendapatan lintas lapisan masyarakat.")
      ))
    ),

    div(class="ftr",
      HTML("Built by <strong style='color:#10B981'>Arditya Sulistya Ningsih Apusing, S.Stat.</strong> &nbsp;·&nbsp;
      Data: BPS RI (bps.go.id) · Bank Indonesia (bi.go.id) · BKPM &nbsp;·&nbsp;
      <a href='https://github.com/ardityaapusing/indonesia-macro-intelligence'>GitHub</a> &nbsp;·&nbsp;
      <a href='https://linkedin.com/in/ardityaapusing'>LinkedIn</a>"))
  )
)

server <- function(input, output, session) {

  # PDB GROWTH
  output$gdp_growth <- renderPlotly({
    colors <- ifelse(gdp_annual$growth < 0, C5, C1)
    p <- plot_ly(gdp_annual, x=~year, y=~growth, type="bar",
      marker=list(color=colors, line=list(width=0)),
      text=~paste0(growth,"%"), textposition="outside",
      hovertemplate="<b>%{x}</b><br>Growth: %{y:.2f}%<extra></extra>") %>%
    add_trace(x=~year, y=~growth, type="scatter", mode="lines+markers",
      line=list(color=C2, width=2, dash="dot"),
      marker=list(color=C2, size=5), showlegend=FALSE) %>%
    layout(yaxis=list(title="% YoY", zeroline=TRUE,
        zerolinecolor="#E2E8F0", zerolinewidth=2),
      xaxis=list(title="", dtick=1), showlegend=FALSE,
      shapes=list(list(type="line",x0=0,x1=1,xref="paper",y0=0,y1=0,
        line=list(color="#DC2626",width=1,dash="dot"))))
    plotly_cfg(p)
  })

  output$gdp_nominal <- renderPlotly({
    p <- plot_ly(gdp_annual, x=~year, y=~nominal, type="scatter",
      mode="lines+markers", fill="tozeroy",
      line=list(color=C3, width=2.5),
      fillcolor="rgba(59,130,246,0.08)",
      marker=list(color=C3, size=7),
      text=~paste0("Rp ",format(nominal,big.mark=","),"T"),
      hoverinfo="text") %>%
    layout(yaxis=list(title="Triliun Rp"),
      xaxis=list(title="", dtick=1))
    plotly_cfg(p)
  })

  output$gdp_sector <- renderPlotly({
    df <- gdp_sector %>% arrange(gdp_2023)
    p <- plot_ly(df, x=~gdp_2023, y=~reorder(sector,gdp_2023),
      type="bar", orientation="h",
      marker=list(color=~gdp_2023,
        colorscale=list(list(0,"#BBF7D0"),list(1,"#059669")),
        showscale=FALSE, line=list(width=0)),
      text=~paste0(format(gdp_2023,big.mark=","),"T"),
      textposition="outside",
      hovertemplate="<b>%{y}</b><br>Rp %{x:,}T<extra></extra>") %>%
    layout(xaxis=list(title="Triliun Rp"), yaxis=list(title=""), bargap=.28)
    plotly_cfg(p)
  })

  output$gdp_sector_growth <- renderPlotly({
    df_long <- gdp_sector %>%
      select(sector, g21, g22, g23) %>%
      pivot_longer(-sector, names_to="year", values_to="growth") %>%
      mutate(year=case_when(year=="g21"~"2021",year=="g22"~"2022",TRUE~"2023"))
    p <- plot_ly(df_long, x=~growth, y=~sector, color=~year,
      colors=c("2021"=C4,"2022"=C1,"2023"=C3),
      type="bar", orientation="h", barmode="group",
      hovertemplate="<b>%{y}</b> %{color}<br>%{x:.1f}%<extra></extra>") %>%
    layout(xaxis=list(title="% Growth"), yaxis=list(title=""),
      legend=list(orientation="h",y=1.1,font=list(size=10)), bargap=.2)
    plotly_cfg(p)
  })

  # PETA PROVINSI
  output$prov_map <- renderPlotly({
    df <- provincial_gdp
    var_sel <- input$prov_var
    val <- df[[var_sel]]
    lbl <- switch(var_sel,
      "pdrb"="PDRB (Triliun Rp)","growth"="Growth (%)","gini"="Gini")
    pal <- if(var_sel=="gini") list(list(0,"#BBF7D0"),list(0.5,"#FDE68A"),list(1,"#DC2626"))
           else list(list(0,"#BBF7D0"),list(1,"#059669"))
    sz  <- scales::rescale(val, to=c(6,22))
    p <- plot_ly(df, x=~lon, y=~lat, type="scatter", mode="markers",
      marker=list(size=sz, color=val,
        colorscale=pal, showscale=TRUE,
        colorbar=list(title=lbl, len=0.6),
        line=list(color="white",width=1.5), opacity=.85),
      text=~paste0("<b>",province,"</b><br>PDRB: Rp ",pdrb,"T<br>",
        "Growth: ",growth,"%<br>Gini: ",gini,"<br>Rank: #",rank),
      hoverinfo="text") %>%
    layout(
      xaxis=list(title="",showgrid=FALSE,zeroline=FALSE,range=c(94,142)),
      yaxis=list(title="",showgrid=FALSE,zeroline=FALSE,range=c(-12,7),
        scaleanchor="x",scaleratio=1),
      plot_bgcolor="#EFF6FF",
      shapes=list(list(type="rect",x0=94,x1=142,y0=-12,y1=7,
        line=list(color="#BFDBFE",width=1),fillcolor="transparent"))
    )
    plotly_cfg(p)
  })

  output$prov_bar <- renderPlotly({
    var_sel <- input$prov_var
    
    # FIX: extract value dulu ke kolom baru, hindari !!sym() di plotly
    df <- provincial_gdp
    df$val <- df[[var_sel]]
    df <- df %>% arrange(val) %>% head(15)
    df$province <- factor(df$province, levels = df$province)
    
    lbl <- switch(var_sel,
                  "pdrb"   = "Triliun Rp",
                  "growth" = "% Growth",
                  "gini"   = "Gini")
    
    pal <- if(var_sel == "gini")
      list(list(0,"#BBF7D0"), list(1,"#DC2626"))
    else
      list(list(0,"#BBF7D0"), list(1,"#059669"))
    
    p <- plot_ly(df,
                 x = ~val,
                 y = ~province,
                 type = "bar", orientation = "h",
                 marker = list(
                   color     = ~val,
                   colorscale = pal,
                   showscale  = FALSE,
                   line       = list(width=0)
                 ),
                 hovertemplate = paste0("<b>%{y}</b><br>",lbl,": %{x}<extra></extra>")
    ) %>%
      layout(
        xaxis = list(title=lbl),
        yaxis = list(title=""),
        bargap = .25
      )
    plotly_cfg(p)
  })
  # INFLASI
  output$inf_monthly <- renderPlotly({
    df <- inflation_monthly %>% arrange(idx)
    shade_x <- c(6,12,12,6)
    shade_y <- c(-1,-1,8,8)
    p <- plot_ly(df, x=~reorder(period,idx), y=~rate,
      type="scatter", mode="lines+markers",
      line=list(color=C1, width=2.5),
      marker=list(color=~ifelse(rate>4,C5,C1), size=8,
        line=list(color="white",width=1.5)),
      text=~paste0(period,": ",rate,"%"), hoverinfo="text") %>%
    add_segments(x=12.5,xend=12.5,y=0,yend=6.5,
      line=list(color="#94A3B8",width=1.5,dash="dash"),showlegend=FALSE) %>%
    layout(
      yaxis=list(title="Inflasi YoY (%)",range=c(0,7)),
      xaxis=list(title="",tickangle=-45),
      shapes=list(
        list(type="rect",x0=0,x1=12,y0=0,y1=7,xref="x",yref="y",
          fillcolor="rgba(254,242,242,0.5)",line=list(width=0)),
        list(type="line",x0=0,x1=1,xref="paper",y0=2.5,y1=2.5,
          line=list(color=C1,width=1.5,dash="dot"))),
      annotations=list(
        list(x=6,y=6.6,text="Peak 2022",showarrow=FALSE,
          font=list(size=10,color=C5),xref="x"),
        list(x=18,y=3.2,text="Target BI 3%",showarrow=FALSE,
          font=list(size=9,color=C1),xref="x"))
    )
    plotly_cfg(p)
  })

  output$inf_component <- renderPlotly({
    df_long <- inflation_annual %>%
      pivot_longer(-year, names_to="comp", values_to="rate") %>%
      mutate(comp=case_when(comp=="rate"~"Umum",comp=="food"~"Makanan",
        comp=="energy"~"Energi",TRUE~"Inti"))
    p <- plot_ly(df_long, x=~year, y=~rate, color=~comp,
      colors=c("Umum"=C2,"Makanan"=C4,"Energi"=C5,"Inti"=C3),
      type="scatter", mode="lines+markers",
      line=list(width=2), marker=list(size=6)) %>%
    layout(yaxis=list(title="%, yoy",zeroline=TRUE,zerolinecolor="#E2E8F0"),
      xaxis=list(title="",dtick=1),
      legend=list(orientation="h",y=-.2,font=list(size=10)))
    plotly_cfg(p)
  })

  output$inf_province <- renderPlotly({
    df <- province_inflation %>% arrange(rate)
    colors <- ifelse(df$rate > 3.0, C5, ifelse(df$rate > 2.7, C4, C1))
    p <- plot_ly(df, x=~rate, y=~reorder(province,rate),
      type="bar", orientation="h",
      marker=list(color=colors, line=list(width=0)),
      text=~paste0(rate,"%"), textposition="outside",
      hovertemplate="<b>%{y}</b><br>Inflasi: %{x:.2f}%<extra></extra>") %>%
    layout(xaxis=list(title="Inflasi YoY 2023 (%)", range=c(0,4.5)),
      yaxis=list(title=""), bargap=.2,
      shapes=list(list(type="line",x0=2.61,x1=2.61,y0=0,y1=1,yref="paper",
        line=list(color=C2,width=2,dash="dash"))),
      annotations=list(list(x=2.63,y=.98,text="Nasional 2.61%",
        showarrow=FALSE,font=list(size=9,color=C2),xref="x",yref="paper")))
    plotly_cfg(p)
  })

  # KETENAGAKERJAAN
  output$unemp_trend <- renderPlotly({
    p <- plot_ly(unemployment, x=~year, y=~national, name="Nasional",
      type="scatter", mode="lines+markers",
      line=list(color=C2,width=2.5), marker=list(color=C2,size=7)) %>%
    add_trace(y=~urban, name="Perkotaan",
      line=list(color=C5,width=2,dash="dash"),marker=list(color=C5,size=5)) %>%
    add_trace(y=~rural, name="Pedesaan",
      line=list(color=C1,width=2,dash="dot"),marker=list(color=C1,size=5)) %>%
    layout(yaxis=list(title="TPT (%)"),xaxis=list(title="",dtick=1),
      legend=list(orientation="h",y=1.15,font=list(size=10)),
      shapes=list(list(type="rect",x0=2019.5,x1=2020.5,y0=0,y1=8,
        fillcolor="rgba(254,242,242,0.5)",line=list(width=0))),
      annotations=list(list(x=2020,y=7.5,text="COVID-19",
        showarrow=FALSE,font=list(size=9,color=C5),xref="x")))
    plotly_cfg(p)
  })

  output$unemp_gap <- renderPlotly({
    df <- unemployment %>% mutate(gap=round(urban-rural,2))
    p <- plot_ly(df, x=~year, y=~gap, type="bar",
      marker=list(color=C4, line=list(width=0)),
      text=~paste0(gap,"%"), textposition="outside",
      name="Urban–Rural Gap") %>%
    layout(yaxis=list(title="Gap TPT Urban vs Rural (pp)"),
      xaxis=list(title="",dtick=1), showlegend=FALSE)
    plotly_cfg(p)
  })

  output$unemp_prov <- renderPlotly({
    df <- prov_unemployment
    colors <- ifelse(df$province=="Nasional",C2,
              ifelse(df$tpt>6,C5,ifelse(df$tpt>5,C4,C1)))
    p <- plot_ly(df %>% arrange(tpt),
      x=~tpt, y=~reorder(province,tpt),
      type="bar", orientation="h",
      marker=list(color=rev(colors), line=list(width=0)),
      text=~paste0(tpt,"%"), textposition="outside",
      hovertemplate="<b>%{y}</b><br>TPT: %{x:.2f}%<extra></extra>") %>%
    layout(xaxis=list(title="TPT 2023 (%)",range=c(0,9.5)),
      yaxis=list(title=""), bargap=.25)
    plotly_cfg(p)
  })

  output$invest_unemp <- renderPlotly({
    df <- data.frame(
      year=2018:2023,
      invest=investment$total,
      tpt=c(5.34,5.28,7.07,6.49,5.86,5.32)
    )
    p <- plot_ly(df, x=~invest, y=~tpt, type="scatter", mode="markers+text",
      text=~year, textposition="top center",
      marker=list(color=~year, colorscale=list(list(0,C3),list(1,C1)),
        size=16, showscale=FALSE,
        line=list(color="white",width=2))) %>%
    layout(
      xaxis=list(title="Total Investasi (Triliun Rp)"),
      yaxis=list(title="TPT (%)"),
      annotations=list(list(x=1401,y=6.62,text="COVID peak",
        showarrow=TRUE,arrowhead=2,font=list(size=9,color=C5)))) %>%
    add_lines(x=~invest, y=fitted(lm(tpt~invest,data=df)),
      line=list(color=C4,width=1.5,dash="dot"),
      name="Trend", showlegend=FALSE)
    plotly_cfg(p)
  })

  # INVESTASI
  output$invest_trend <- renderPlotly({
    p <- plot_ly(investment, x=~year, y=~fdi, name="PMA (FDI)",
      type="bar", marker=list(color=C1,line=list(width=0))) %>%
    add_trace(y=~ddi, name="PMDN",
      marker=list(color=C3,line=list(width=0))) %>%
    add_trace(y=~total, type="scatter", mode="lines+markers",
      name="Total", line=list(color=C2,width=2.5),
      marker=list(color=C2,size=7), yaxis="y2") %>%
    layout(barmode="stack",
      yaxis=list(title="Triliun Rp"),
      yaxis2=list(title="Total", overlaying="y", side="right", showgrid=FALSE),
      xaxis=list(title="",dtick=1),
      legend=list(orientation="h",y=1.12,font=list(size=10)))
    plotly_cfg(p)
  })

  output$invest_pie <- renderPlotly({
    df <- data.frame(
      type=c("PMA (Foreign)","PMDN (Domestic)"),
      val=c(investment$fdi[6], investment$ddi[6])
    )
    p <- plot_ly(df, labels=~type, values=~val, type="pie", hole=.5,
      marker=list(colors=c(C1,C3),line=list(color="white",width=2)),
      textinfo="label+percent",
      hovertemplate="<b>%{label}</b><br>Rp %{value:.1f}T<extra></extra>") %>%
    layout(showlegend=FALSE,
      annotations=list(list(text="2023",x=.5,y=.5,font=list(size=16,color=C2),
        showarrow=FALSE)))
    plotly_cfg(p)
  })

  output$invest_sector <- renderPlotly({
    p <- plot_ly(invest_sector %>% arrange(value),
      x=~value, y=~reorder(sector,value),
      type="bar", orientation="h",
      color=~type, colors=c("Manufaktur"=C1,"Jasa"=C3,"Tambang"=C4,
        "Infrastruktur"=C6,"Properti"=C5,"Pertanian"="#F59E0B"),
      text=~paste0("Rp ",value,"T"), textposition="outside") %>%
    layout(xaxis=list(title="Triliun Rp"),yaxis=list(title=""),
      legend=list(orientation="h",y=-.15,font=list(size=9)),bargap=.25)
    plotly_cfg(p)
  })

  output$gini_invest <- renderPlotly({
    df <- data.frame(
      year=2018:2023,
      gini=gini_annual$national[5:10],
      invest=investment$total/100
    )
    p <- plot_ly(df, x=~year) %>%
    add_trace(y=~gini, name="Gini Koefisien", type="scatter",
      mode="lines+markers", line=list(color=C5,width=2.5),
      marker=list(color=C5,size=7)) %>%
    add_trace(y=~invest, name="Investasi (x100T)", type="bar",
      marker=list(color=C1,opacity=.3,line=list(width=0)), yaxis="y2") %>%
    layout(yaxis=list(title="Gini",range=c(0.35,0.42)),
      yaxis2=list(title="Investasi x100T", overlaying="y",
        side="right", showgrid=FALSE),
      xaxis=list(title="",dtick=1),
      legend=list(orientation="h",y=1.12,font=list(size=10)))
    plotly_cfg(p)
  })
}

shinyApp(ui=ui, server=server)
