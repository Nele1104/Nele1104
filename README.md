# Übung 2 – Modernes Frontend

Persönliche Website von Nele für die Übung im Modul Geoinformatik 2 an der
Hochschule Mainz. Die Website gliedert Inhalte in About, News und Projects
und unterstützt Light-/Dark-Mode, responsive Layouts und dynamische News.

## Technologien

- HTML5 und CSS3 für Struktur und Gestaltung
- JavaScript für Tabs, Theme-Wechsel und dynamische Inhalte
- JSON als Datenquelle für die News
- GitHub Pages für die statische Veröffentlichung

## Lokal testen

`fetch()` kann die News-Datei nicht zuverlässig über `file://` laden. In VS Code
den Task **Website lokal starten** ausführen und
[http://localhost:8000](http://localhost:8000) öffnen. Alternativ kann ein
beliebiger lokaler HTTP-Server aus dem Projektordner verwendet werden.

Neue Meldungen kommen als Eintrag in `assets/news.json` hinzu. Jeder Eintrag
benötigt eine eindeutige `id`, ein Datum im Format `JJJJ-MM-TT`, `title`,
`summary`, `image` und einen `link`. Für interne Meldungen verweist der Link auf
`news.html?id=<id>`; die Detailseite liest Titel, Datum, Bild und Kurztext
ebenfalls aus der JSON-Datei. Die Bilder und IDs müssen im Projekt vorhanden
beziehungsweise eindeutig sein.

## Reflexion

- **Light-/Dark-Mode:** CSS-Variablen definieren die Farbschemata; `setTheme()`
  setzt das Theme und speichert es im `localStorage`.
- **Klick-Ereignisse:** JavaScript-Eventlistener wechseln Themes und Tabs. Die
  Tabs lassen sich auch per Pfeiltasten sowie Home/End bedienen.
- **Tabs:** Buttons mit `role="tab"` steuern die zugeordneten
  `role="tabpanel"`-Bereiche.
- **News:** `fetch('assets/news.json')` lädt und prüft die Einträge. Sie werden
  nach Datum absteigend sortiert und sicher mit DOM-Methoden gerendert.
- **Projects:** Vier Folium-HTML-Karten aus `assets/maps/` sind im responsiven
  Raster per iframe eingebunden. Die aktualisierten Dateien
  `map_1_basiskarte (1).html`, `map_2_punkte (1).html`,
  `map_3_reiseroute (1).html` und `map_4_flaechen_online.html` zeigen eine
  Basiskarte, Mainzer Marker, eine Schottland-Route und GeoJSON-Länderflächen.
  `map_5_3d_gebaeude.html` bindet die Cesium-3D-Gebäudeansicht für Mainz ein;
  Cesium und Gebäudedaten werden von externen Diensten geladen.

## Veröffentlichte Website

[https://nele1104.github.io/Nele1104/](https://nele1104.github.io/Nele1104/)

## GitHub Pages aktivieren oder prüfen

Im Repository auf **Settings → Pages** gehen. Unter **Build and deployment**
die Veröffentlichung aus dem Branch `main` und dem Ordner `/(root)` auswählen
und speichern. Nach erfolgreichem Deployment ist die Seite unter der oben
genannten Adresse erreichbar. Änderungen an HTML-, JSON- und Bilddateien
werden als statische Dateien veröffentlicht; ein eigener Server ist nicht
erforderlich.
