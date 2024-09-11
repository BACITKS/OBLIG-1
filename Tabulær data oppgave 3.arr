use context starter2024
include shared-gdrive(
  "dcic-2021",
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

personale = load-table: ID, NAVN, ETTERNAVN, EMAIL, KJONN, IP, ALDER
  source: load-spreadsheet(ssid).sheet-by-name("o1-oppg3", true)
end
personale
ny_kolonne = build-column(personale, "Fodselsdato", lam(row): 2024 - row["ALDER"] end)
ny_kolonne


# Lage en tabell med de fra 30 til 80 år
fun fjern-viss-alder():
  doc: "Fjerner de under 30 og over 80 år gamle."
  block:
    filtered = filter-with(ny_kolonne, lam(r): (r["ALDER"] >= 30) and (r["ALDER"] <= 80) end)
    ny_tabell = select-columns(filtered, [list: "NAVN", "Fodselsdato", "ALDER"])
    ny_tabell
  end
end

fjern-viss-alder()

#oppgave 2
fun navn-og-mail(status):
  tabell = block:
    if status == "gammel":
      sortertabell = order personale:
        ALDER descending
      end
      sortertabell.row-n(1)
    else if status == "ung":
      sortertabell = order personale:
        ALDER ascending
      end
      sortertabell.row-n(1)
    end
  end
  tabell
end
navn-og-mail("gammel")

#oppgave 3
fun snitt_alder():
  doc: "tar og beregner gjennomsnitt/median av alle aldrene."
  average = mean(personale, "ALDER")
  average
where:
  mean(personale, "ALDER") is 55.9
end

#oppgave 4
fun bar_chart():
  doc: "lager et stolpediagram av metadata i tabellen."
  bar-chart(personale, "NAVN", "ALDER")
end
bar_chart()

