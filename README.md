# Übung 2 – Modernes Frontend

## Lokal starten

Die News werden per `fetch()` aus `assets/news.json` geladen. Deshalb muss die
Website über HTTP statt direkt über `file://` geöffnet werden. In VS Code den
Task **Website lokal starten** ausführen und anschließend
[http://localhost:8000](http://localhost:8000) öffnen.

## Reflexion

- **Light/Night Mode:** CSS-Variablen für die beiden Farbschemata stehen im
  `<style>`-Block von `index.html`. Die JavaScript-Funktion `setTheme()` setzt
  das Theme am `<body>` und speichert die Auswahl im `localStorage`.
- **Klick-Ereignisse:** Der Theme-Button verwendet einen `click`-Eventlistener,
  der zwischen Light und Dark wechselt. Die Tab-Buttons aktualisieren beim
  Klick den aktiven Tab und das dazugehörige Panel.
- **Tabs:** Die Navigation verwendet Buttons mit `role="tab"` innerhalb eines
  `role="tablist"`. Die jeweiligen Inhaltsbereiche sind Elemente mit
  `role="tabpanel"` und werden über `aria-controls`/`aria-labelledby`
  zugeordnet.
- **News:** `loadNews()` ruft `assets/news.json` mit `fetch()` ab. Die
  JSON-Einträge werden geprüft und anschließend mit `renderNews()` als
  Bildkarten mit Bild, Datum, Titel und Kurztext angezeigt. Ein optionales
  `link`-Feld macht eine Karte anklickbar, wenn eine echte Zieladresse
  eingetragen ist.

## Live-URL

Die Website ist über GitHub Pages öffentlich erreichbar:
[https://nele1104.github.io/Nele1104/](https://nele1104.github.io/Nele1104/)
