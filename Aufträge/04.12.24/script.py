import pandas as pd

# Daten einlesen
# file is in the current directory
df = pd.read_csv(
    "/home/ezpz/Nextcloud/NextcloudData/ObsidianVault/NextcloudVault/Schule/Module/164 - Datenbanken erstellen und Daten einfuegen/Aufträge/04.12.24/wir100od1004.csv"
)

distinct_years = df["StichtagDatJahr"].unique()

# write the years in to a new csv file

with open("years.csv", "w") as f:
    f.write('"Jahr"\n')
    for year in distinct_years:
        f.write(f"{year},\n")


# distinct QuarSort, QuarCd, QuarLang
distinct_quarter = df[["QuarSort", "QuarCd", "QuarLang"]].drop_duplicates()

# write the quarters in to a new csv file
with open("quarters.csv", "w") as f:
    f.write('"Sortierung","cd","Quartiername"\n')
    for index, row in distinct_quarter.iterrows():
        f.write(f"{row['QuarSort']},{row['QuarCd']},{row['QuarLang']}\n")

# distinct Steuertarif
distinct_steuer = df[
    ["SteuerTarifSort", "SteuerTarifCd", "SteuerTarifLang"]
].drop_duplicates()

# write the steuertarif in to a new csv file
with open("steuertarif.csv", "w") as f:
    f.write('"Sortierung","cd","Tarifname"\n')
    for index, row in distinct_steuer.iterrows():
        f.write(
            f"{row['SteuerTarifSort']},{row['SteuerTarifCd']},{row['SteuerTarifLang']}\n"
        )


# distinct Steuerart
distinct_steuern = df[
    ["SteuerVermoegen_p50", "SteuerVermoegen_p25", "SteuerVermoegen_p75"]
].drop_duplicates()

# write the steuerart in to a new csv file
with open("steuern.csv", "w") as f:
    f.write('"Vermögen p50","Vermögen p25","Vermögen p75"\n')
    for index, row in distinct_steuern.iterrows():
        f.write(
            f"{row['SteuerVermoegen_p50']},{row['SteuerVermoegen_p25']},{row['SteuerVermoegen_p75']}\n"
        )
