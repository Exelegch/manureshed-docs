# Manureshed Interactive Dashboard
# ================================

library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)
library(DT)
library(manureshed)

# UI Definition
# =============

ui <- dashboardPage(

  dashboardHeader(title = "Manureshed Analysis"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Map",           tabName = "map",   icon = icon("map")),
      menuItem("Statistics",    tabName = "stats", icon = icon("chart-bar")),
      menuItem("Data Table",    tabName = "data",  icon = icon("table")),
      menuItem("Hub Selection", tabName = "hub",   icon = icon("industry")),
      menuItem("Help",          tabName = "help",  icon = icon("question-circle"))
    ),

    hr(),
    h4("Analysis Parameters", style = "padding-left:15px;"),

    selectInput("scale", "Spatial Scale:",
                choices  = c("County"         = "county",
                             "HUC8 Watershed" = "huc8",
                             "HUC2 Region"    = "huc2"),
                selected = "huc8"),

    sliderInput("year", "Year:",
                min = 2007, max = 2016, value = 2016, step = 1, sep = ""),

    selectInput("nutrient", "Nutrient:",
                choices  = c("Nitrogen"   = "nitrogen",
                             "Phosphorus" = "phosphorus"),
                selected = "nitrogen"),

    checkboxInput("include_wwtp",
                  "Include Wastewater Treatment Plants",
                  value = TRUE),

    actionLink("show_advanced", "Show advanced options"),
    conditionalPanel(
      condition = "input.show_advanced % 2 == 1",
      numericInput("threshold", "Cropland Threshold (acres):",
                   value = 1234, min = 0, max = 10000)
    ),

    hr(),
    actionButton("run", "Run Analysis",
                 icon = icon("play"),
                 class = "btn-primary btn-lg btn-block"),
    br(),
    downloadButton("download_data", "Download Data",
                   class = "btn-default btn-sm btn-block")
  ),

  dashboardBody(
    tabItems(

      # ── Map tab ──────────────────────────────────────────────────────────
      tabItem(tabName = "map",
              fluidRow(
                box(title = "Interactive Map", status = "primary",
                    solidHeader = TRUE, width = 12,
                    leafletOutput("map", height = "600px"))
              ),
              fluidRow(
                box(title = "Legend", status = "info", width = 12,
                    htmlOutput("legend_text"))
              )
      ),

      # ── Statistics tab ────────────────────────────────────────────────────
      tabItem(tabName = "stats",
              fluidRow(
                valueBoxOutput("n_sources",         width = 2),
                valueBoxOutput("n_sink_deficit",    width = 2),
                valueBoxOutput("n_sink_fertilizer", width = 2),
                valueBoxOutput("n_balanced",        width = 3),
                valueBoxOutput("n_excluded",        width = 3)
              ),
              fluidRow(
                box(title = "Classification Distribution", status = "primary",
                    solidHeader = TRUE, width = 6,
                    plotlyOutput("pie_chart")),
                box(title = "Surplus/Deficit Distribution", status = "primary",
                    solidHeader = TRUE, width = 6,
                    plotlyOutput("histogram"))
              ),
              fluidRow(
                box(title = "Summary Statistics", status = "info", width = 12,
                    verbatimTextOutput("summary_stats"))
              )
      ),

      # ── Data table tab ────────────────────────────────────────────────────
      tabItem(tabName = "data",
              fluidRow(
                box(title = "Results Data Table", status = "primary",
                    solidHeader = TRUE, width = 12,
                    DTOutput("results_table"))
              )
      ),

      # ── Hub Selection tab ─────────────────────────────────────────────────
      tabItem(tabName = "hub",
              fluidRow(

                # Left panel: controls
                column(3,
                       box(title = "Hub Scoring Parameters", status = "primary",
                           solidHeader = TRUE, width = 12,

                           p(style = "color:#555; font-size:12px; line-height:1.5;",
                             "Scores counties as potential nutrient recovery hub sites.",
                             "Uses county-scale NuGIS + WWTP data with CAFO logistics.",
                             "Click Run to start (~1-2 min for distance calculations)."),
                           hr(),

                           selectInput("hub_score", "Score:",
                                       choices = c(
                                         "S3 Ag+WWTP N&P \u2605 flagship" = "Score9_S3_NP",
                                         "S3 Ag+WWTP N only"              = "Score7_S3_N",
                                         "S3 Ag+WWTP P only"              = "Score8_S3_P",
                                         "S1 Ag N only"                   = "Score1_S1_N",
                                         "S1 Ag P only"                   = "Score2_S1_P",
                                         "S1 Ag N&P"                      = "Score3_S1_NP",
                                         "S2 WWTP N only"                 = "Score4_S2_N",
                                         "S2 WWTP P only"                 = "Score5_S2_P",
                                         "S2 WWTP N&P"                    = "Score6_S2_NP"
                                       ),
                                       selected = "Score9_S3_NP"),

                           sliderInput("hub_catchment",
                                       "Catchment radius (miles):",
                                       min = 25, max = 150, value = 50, step = 25),

                           numericInput("hub_top_n", "Top N sites:",
                                        value = 10, min = 5, max = 25),

                           hr(),
                           actionButton("run_hub", "Run Hub Analysis",
                                        icon  = icon("industry"),
                                        class = "btn-success btn-block"),
                           br(),
                           uiOutput("hub_status"),
                           hr(),
                           downloadButton("hub_dl_csv",
                                          "Download Top Sites CSV",
                                          class = "btn-default btn-sm btn-block"),
                           br(), br(),
                           downloadButton("hub_dl_geojson",
                                          "Download GeoJSON",
                                          class = "btn-default btn-sm btn-block")
                       )
                ),

                # Right panel: outputs
                column(9,
                       tabBox(width = 12,

                              tabPanel(
                                title = tagList(icon("map"), " Suitability Map"),
                                leafletOutput("hub_map", height = "580px")
                              ),

                              tabPanel(
                                title = tagList(icon("table"), " Top Sites"),
                                DTOutput("hub_top_table")
                              ),

                              tabPanel(
                                title = tagList(icon("shield-alt"), " Robustness"),
                                p(style = "color:#666; font-size:12px; padding:8px 0;",
                                  "Counties appearing in the top-N across multiple scores",
                                  "are the most robust candidates regardless of scenario."),
                                DTOutput("hub_robust_table")
                              )
                       )
                )
              )
      ),

      # ── Help tab ──────────────────────────────────────────────────────────
      tabItem(tabName = "help",
              fluidRow(
                box(title = "About Manureshed", status = "info",
                    solidHeader = TRUE, width = 12,
                    h4("Manureshed Analysis Framework"),
                    p("Interactive dashboard for agricultural nutrient balance",
                      "analysis and nutrient recovery hub site selection across",
                      "multiple spatial scales."),
                    h4("How to Use:"),
                    tags$ol(
                      tags$li("Set parameters in the sidebar, click Run Analysis"),
                      tags$li("Explore results in Map, Statistics, and Data tabs"),
                      tags$li("Switch to Hub Selection tab to identify optimal",
                              "nutrient recovery facility locations")
                    ),
                    h4("Classifications:"),
                    tags$ul(
                      tags$li(tags$strong("Source:"), " Nutrient surplus"),
                      tags$li(tags$strong("Sink (Deficit):"), " Deficit, no fertilizer"),
                      tags$li(tags$strong("Sink (Fertilizer):"), " Deficit with fertilizer"),
                      tags$li(tags$strong("Balanced:"), " Balanced flows"),
                      tags$li(tags$strong("Excluded:"), " Below cropland threshold")
                    ),
                    h4("Hub Selection:"),
                    p("Ranks counties using a 3-scenario x 3-nutrient framework.",
                      "Score 9 (S3/NP) integrates agricultural surplus, WWTP effluent,",
                      "demand catchment, and CAFO logistics into 8 equal-weight",
                      "percentile-rank dimensions.",
                      "Catchment radius is user-controlled (default 50 miles)."),
                    hr(),
                    p(tags$code(
                      "vignette('hub-site-selection', package='manureshed')")),
                    p("Package version: ",
                      as.character(packageVersion("manureshed")))
                )
              )
      )
    )
  )
)


# Server Logic
# ============

server <- function(input, output, session) {

  rv <- reactiveValues(
    results     = NULL,
    hub_results = NULL,
    hub_running = FALSE
  )

  # ── Run main analysis ─────────────────────────────────────────────────────
  observeEvent(input$run, {
    withProgress(message = "Running analysis...", value = 0, {
      incProgress(0.3, detail = "Loading data...")
      tryCatch({
        results <- run_builtin_analysis(
          scale              = input$scale,
          year               = input$year,
          nutrients          = input$nutrient,
          include_wwtp       = input$include_wwtp,
          cropland_threshold = if (input$show_advanced %% 2 == 1)
            input$threshold else NULL,
          verbose = FALSE
        )
        incProgress(0.7, detail = "Processing results...")
        rv$results <- results
        incProgress(1.0, detail = "Complete!")
        showNotification("Analysis complete!", type = "message")
      }, error = function(e) {
        showNotification(paste("Error:", e$message),
                         type = "error", duration = NULL)
      })
    })
  })

  # ── Hub status indicator ──────────────────────────────────────────────────
  output$hub_status <- renderUI({
    if (rv$hub_running) {
      tags$p(style = "color:#e67e22; font-size:12px;",
             icon("spinner", class = "fa-spin"), " Scoring in progress...")
    } else if (!is.null(rv$hub_results)) {
      tags$p(style = "color:#27ae60; font-size:12px;",
             icon("check"), " Done (",
             format(rv$hub_results$params$timestamp, "%H:%M"), ")")
    }
  })

  # ── Run hub analysis ──────────────────────────────────────────────────────
  observeEvent(input$run_hub, {
    rv$hub_running <- TRUE

    withProgress(message = "Hub site scoring...", value = 0, {

      incProgress(0.05, detail = "Checking inputs...")

      ms_ready <- tryCatch({
        !is.null(rv$results) &&
          !is.null(rv$results$integrated$nitrogen) &&
          !is.null(rv$results$integrated$phosphorus) &&
          "FIPS" %in% names(rv$results$agricultural)
      }, error = function(e) FALSE)

      ms <- if (ms_ready) {
        incProgress(0.05, detail = "Using existing county results...")
        rv$results
      } else {
        incProgress(0.05, detail = "Running county/N+P/WWTP analysis...")
        run_builtin_analysis(
          scale        = "county",
          year         = input$year,
          nutrients    = c("nitrogen", "phosphorus"),
          include_wwtp = TRUE,
          verbose      = FALSE
        )
      }

      incProgress(0.10, detail = "Building distance matrix (~30-60 s)...")

      tryCatch({
        hub <- score_hub_sites(
          ms_output       = ms,
          catchment_miles = input$hub_catchment,
          top_n           = input$hub_top_n,
          verbose         = FALSE
        )
        incProgress(0.70, detail = "Rendering outputs...")
        rv$hub_results <- hub
        rv$hub_running <- FALSE
        incProgress(1.00, detail = "Done!")
        showNotification("Hub scoring complete!", type = "message")
      }, error = function(e) {
        rv$hub_running <- FALSE
        showNotification(paste("Hub error:", e$message),
                         type = "error", duration = NULL)
      })
    })
  })

  # ── Hub Leaflet map ───────────────────────────────────────────────────────
  output$hub_map <- renderLeaflet({
    req(rv$hub_results)
    req(input$hub_score %in% names(rv$hub_results$score_registry))

    hub       <- rv$hub_results
    sc        <- hub$score_registry[[input$hub_score]]
    s_sf      <- hub$scored_sf          # already EPSG:4326
    top_df    <- hub$top_n[[input$hub_score]]
    top_fips  <- top_df$FIPS
    score_col <- sc$col

    # ── Pull score as plain numeric -- avoids units/non-numeric errors ──────
    score_vals <- as.numeric(s_sf[[score_col]])

    # Colour palette
    pal_name <- switch(sc$scenario,
                       S1_Ag       = "PuRd",
                       S2_WWTP     = "Blues",
                       S3_Combined = "YlGn",
                       "YlGn")

    pal <- leaflet::colorNumeric(
      palette  = pal_name,
      domain   = score_vals,
      na.color = "#d3d3d3"
    )

    # All-county popups -- format numeric fields safely
    s_sf$popup <- paste0(
      "<strong>", s_sf$NAME, "</strong>",
      "<br/><b>Score:</b> ",
      formatC(score_vals, digits = 3, format = "f"),
      "<br/><b>CAFO count:</b> ",
      as.integer(s_sf$cafo_count),
      "<br/><b>N demand catchment:</b> ",
      formatC(as.numeric(s_sf$demand_N_catchment), digits = 1, format = "f"),
      "<br/><b>P demand catchment:</b> ",
      formatC(as.numeric(s_sf$demand_P_catchment), digits = 1, format = "f")
    )

    # Top-N subset for red outlines
    # Join rank/score from top_df; use match() to stay in sf row order
    top_sf <- s_sf[s_sf$FIPS %in% top_fips, ]
    m      <- match(top_sf$FIPS, top_df$FIPS)
    top_sf$rank  <- top_df$rank[m]
    top_sf$score <- as.numeric(top_df$score[m])

    top_sf$top_popup <- paste0(
      "<strong>#", top_sf$rank, " ", top_sf$NAME, "</strong>",
      "<br/><b>Score:</b> ",
      formatC(top_sf$score, digits = 3, format = "f"),
      "<br/><b>CAFO count:</b> ",
      as.integer(top_sf$cafo_count)
    )

    # Centroids for rank labels -- compute safely from top_sf geometry
    top_centroids <- tryCatch({
      cents <- suppressWarnings(sf::st_centroid(top_sf))
      coords <- sf::st_coordinates(cents)
      data.frame(
        lng  = as.numeric(coords[, 1]),
        lat  = as.numeric(coords[, 2]),
        rank = top_sf$rank,
        stringsAsFactors = FALSE
      )
    }, error = function(e) NULL)

    # Build map
    m <- leaflet::leaflet() |>
      leaflet::addProviderTiles(leaflet::providers$CartoDB.Positron) |>

      # All counties choropleth
      leaflet::addPolygons(
        data        = s_sf,
        fillColor   = pal(score_vals),
        fillOpacity = 0.75,
        color       = "white",
        weight      = 0.4,
        popup       = s_sf$popup,
        highlightOptions = leaflet::highlightOptions(
          weight = 2, color = "#444",
          fillOpacity = 0.9, bringToFront = FALSE)
      ) |>

      # Top-N red outlines
      leaflet::addPolygons(
        data        = top_sf,
        fillColor   = pal(top_sf$score),
        fillOpacity = 0.85,
        color       = "#e31a1c",
        weight      = 2.5,
        popup       = top_sf$top_popup,
        highlightOptions = leaflet::highlightOptions(
          weight = 4, color = "#900",
          fillOpacity = 0.95, bringToFront = TRUE)
      ) |>

      leaflet::addLegend(
        pal      = pal,
        values   = score_vals,
        title    = paste0("Hub Suitability<br/>", input$hub_score),
        position = "bottomright",
        na.label = "No data"
      )

    # Rank number labels -- only add if centroid extraction succeeded
    if (!is.null(top_centroids) && nrow(top_centroids) > 0) {
      m <- m |>
        leaflet::addLabelOnlyMarkers(
          data    = top_centroids,
          lng     = ~lng,
          lat     = ~lat,
          label   = ~paste0("#", rank),
          labelOptions = leaflet::labelOptions(
            noHide    = TRUE,
            direction = "center",
            textOnly  = TRUE,
            style     = list(
              "font-weight" = "bold",
              "font-size"   = "12px",
              "color"       = "#c0392b"
            )
          )
        )
    }

    m
  })

  # ── Hub top sites table ───────────────────────────────────────────────────
  output$hub_top_table <- renderDT({
    req(rv$hub_results)
    req(input$hub_score %in% names(rv$hub_results$top_n))
    df <- rv$hub_results$top_n[[input$hub_score]]
    # Round only genuinely numeric columns (guards against list/sfc columns)
    num_cols <- which(sapply(df, function(x) is.numeric(x) && !is.integer(x)))
    for (j in num_cols) df[[j]] <- round(as.numeric(df[[j]]), 3)
    datatable(df, options = list(pageLength = 10, scrollX = TRUE),
              rownames = FALSE)
  })

  # ── Robustness table ──────────────────────────────────────────────────────
  output$hub_robust_table <- renderDT({
    req(rv$hub_results)
    datatable(rv$hub_results$robustness,
              options = list(pageLength = 10, scrollX = TRUE),
              rownames = FALSE)
  })

  # ── Hub downloads ─────────────────────────────────────────────────────────
  output$hub_dl_csv <- downloadHandler(
    filename = function()
      paste0(input$hub_score, "_top", input$hub_top_n, ".csv"),
    content = function(file) {
      req(rv$hub_results)
      utils::write.csv(rv$hub_results$top_n[[input$hub_score]],
                       file, row.names = FALSE)
    }
  )

  output$hub_dl_geojson <- downloadHandler(
    filename = function()
      paste0(input$hub_score, "_top", input$hub_top_n, ".geojson"),
    content = function(file) {
      req(rv$hub_results)
      top_fips <- rv$hub_results$top_n[[input$hub_score]]$FIPS
      top_sf   <- rv$hub_results$scored_sf |>
        dplyr::filter(FIPS %in% top_fips)
      sf::st_write(top_sf, file, quiet = TRUE)
    }
  )

  # ── Main nutrient Leaflet map ─────────────────────────────────────────────
  output$map <- renderLeaflet({
    req(rv$results)

    data      <- rv$results$agricultural
    nutrient  <- input$nutrient
    class_col <- paste0(toupper(substr(nutrient, 1, 1)), "_class")
    surpl_col <- paste0(toupper(substr(nutrient, 1, 1)), "_surplus")

    data_wgs84 <- sf::st_transform(data, 4326)

    if (input$scale == "county") {
      id_col <- "FIPS"; id_label <- "County FIPS"; name_label <- "County"
    } else if (input$scale == "huc8") {
      id_col <- "huc8"; id_label <- "HUC8 ID"; name_label <- "HUC8 Name"
    } else {
      id_col <- "huc2"; id_label <- "HUC2 ID"; name_label <- "HUC2 Name"
    }

    data_wgs84$popup_text <- paste0(
      "<strong>", id_label,   ":</strong> ", data_wgs84[[id_col]], "<br/>",
      "<strong>", name_label, ":</strong> ", data_wgs84[["NAME"]], "<br/>",
      "<strong>Classification:</strong> ",
      gsub("_", " ", data_wgs84[[class_col]]), "<br/>",
      "<strong>Surplus:</strong> ",
      format(as.numeric(data_wgs84[[surpl_col]]),
             big.mark = ",", scientific = FALSE), " kg<br/>",
      "<strong>Cropland:</strong> ",
      format(as.numeric(data_wgs84$cropland),
             big.mark = ",", scientific = FALSE), " acres"
    )

    colors <- get_nutrient_colors(nutrient)
    pal    <- leaflet::colorFactor(palette = colors,
                                   domain  = data_wgs84[[class_col]])

    leaflet::leaflet(data_wgs84) |>
      leaflet::addProviderTiles(leaflet::providers$CartoDB.Positron) |>
      leaflet::addPolygons(
        fillColor   = pal(data_wgs84[[class_col]]),
        fillOpacity = 0.7,
        color       = "white",
        weight      = 1,
        popup       = data_wgs84$popup_text,
        highlightOptions = leaflet::highlightOptions(
          weight = 3, color = "#666",
          fillOpacity = 0.9, bringToFront = TRUE)
      ) |>
      leaflet::addLegend(
        pal      = pal,
        values   = data_wgs84[[class_col]],
        title    = paste(tools::toTitleCase(nutrient), "Classification"),
        position = "bottomright"
      )
  })

  # ── Helper: pick correct data layer ───────────────────────────────────────
  .get_class_data <- function() {
    req(rv$results)
    if (input$include_wwtp &&
        "integrated" %in% names(rv$results) &&
        !is.null(rv$results$integrated[[input$nutrient]])) {
      pfx <- paste0("combined_", toupper(substr(input$nutrient, 1, 1)))
      list(data      = rv$results$integrated[[input$nutrient]],
           class_col = paste0(pfx, "_class"),
           surpl_col = paste0(pfx, "_surplus"))
    } else {
      pfx <- toupper(substr(input$nutrient, 1, 1))
      list(data      = rv$results$agricultural,
           class_col = paste0(pfx, "_class"),
           surpl_col = paste0(pfx, "_surplus"))
    }
  }

  # ── Value boxes ───────────────────────────────────────────────────────────
  output$n_sources <- renderValueBox({
    d <- .get_class_data()
    valueBox(sum(d$data[[d$class_col]] == "Source", na.rm = TRUE),
             "Sources", icon = icon("arrow-up"), color = "red")
  })
  output$n_sink_deficit <- renderValueBox({
    d <- .get_class_data()
    valueBox(sum(d$data[[d$class_col]] == "Sink_Deficit", na.rm = TRUE),
             "Sink (Deficit)", icon = icon("arrow-down"), color = "blue")
  })
  output$n_sink_fertilizer <- renderValueBox({
    d <- .get_class_data()
    valueBox(sum(d$data[[d$class_col]] == "Sink_Fertilizer", na.rm = TRUE),
             "Sink (Fertilizer)", icon = icon("arrow-down"), color = "purple")
  })
  output$n_balanced <- renderValueBox({
    d     <- .get_class_data()
    wcls  <- if (input$scale == "county") "Within_County" else "Within_Watershed"
    label <- if (input$scale == "county") "Within County"  else "Within Watershed"
    valueBox(sum(d$data[[d$class_col]] == wcls, na.rm = TRUE),
             label, icon = icon("balance-scale"), color = "green")
  })
  output$n_excluded <- renderValueBox({
    d <- .get_class_data()
    valueBox(sum(d$data[[d$class_col]] == "Excluded", na.rm = TRUE),
             "Excluded", icon = icon("ban"), color = "light-blue")
  })

  # ── Charts ────────────────────────────────────────────────────────────────
  output$pie_chart <- renderPlotly({
    d      <- .get_class_data()
    counts <- table(d$data[[d$class_col]])
    plot_ly(labels = names(counts), values = as.numeric(counts),
            type   = "pie",
            marker = list(colors = get_nutrient_colors(input$nutrient))) |>
      layout(title     = paste(tools::toTitleCase(input$nutrient),
                               "Classification"),
             showlegend = TRUE)
  })

  output$histogram <- renderPlotly({
    d <- .get_class_data()
    s <- as.numeric(d$data[[d$surpl_col]])
    s <- s[!is.na(s) & is.finite(s)]
    plot_ly(x = s, type = "histogram") |>
      layout(title = paste(tools::toTitleCase(input$nutrient), "Surplus/Deficit"),
             xaxis = list(title = "Surplus (kg, negative = deficit)"),
             yaxis = list(title = "Count"))
  })

  output$summary_stats <- renderPrint({
    req(rv$results)
    d     <- .get_class_data()
    dtype <- if (input$include_wwtp &&
                 "integrated" %in% names(rv$results) &&
                 !is.null(rv$results$integrated[[input$nutrient]]))
      "Integrated (Agricultural + WWTP)" else "Agricultural Only"
    cat("Analysis Summary\n================\n\n")
    cat("Data type:", dtype,         "\n")
    cat("Scale:",     input$scale,    "\n")
    cat("Year:",      input$year,     "\n")
    cat("Nutrient:",  input$nutrient, "\n\n")
    cat("Total units:", nrow(d$data), "\n")
    cat("Excluded:",
        sum(d$data[[d$class_col]] == "Excluded", na.rm = TRUE), "\n\n")
    cat("Classification counts:\n")
    print(table(d$data[[d$class_col]]))
    cat("\nSurplus statistics (kg):\n")
    print(summary(as.numeric(d$data[[d$surpl_col]])))
  })

  # ── Data table ────────────────────────────────────────────────────────────
  output$results_table <- renderDT({
    req(rv$results)
    datatable(sf::st_drop_geometry(rv$results$agricultural),
              options = list(pageLength = 25, scrollX = TRUE,
                             searchHighlight = TRUE),
              filter  = "top")
  })

  # ── Legend ────────────────────────────────────────────────────────────────
  output$legend_text <- renderUI({
    HTML("
      <strong>Classification Legend:</strong><br/>
      Source: Nutrient surplus &nbsp;|&nbsp;
      Sink (Deficit): Nutrient deficit, no fertilizer &nbsp;|&nbsp;
      Sink (Fertilizer): Deficit despite fertilizer &nbsp;|&nbsp;
      Balanced: Near-zero balance &nbsp;|&nbsp;
      Excluded: Below cropland threshold
    ")
  })

  # ── Data download ─────────────────────────────────────────────────────────
  output$download_data <- downloadHandler(
    filename = function()
      paste0("manureshed_", input$scale, "_", input$year,
             "_", input$nutrient, ".csv"),
    content = function(file) {
      req(rv$results)
      utils::write.csv(sf::st_drop_geometry(rv$results$agricultural),
                       file, row.names = FALSE)
    }
  )
}

shinyApp(ui = ui, server = server)
