---
date: 2015-05-11T01:33:16+02:00
title: Neue Blogengine
vgwort: 6ca041b2352e4e149b5e2f94ce323144
aliases:
  - /2015/05/neue-blogengine.html
  - /blog/2015/05/neue-blogengine.html
---

Lange Zeit war auf meinem Blog eine vollkommene Ruhe und man hat nichts mehr von mir gelesen. Ob sich das in Zukunft wieder aendert, kann ich noch nicht sagen aber auf jeden Fall habe ich mal dafuer gesorgt, dass dieser Blog beim Bloggen kein Geld mehr verbraucht.

Bisher wurde der Blog durch den Amazon Simple Storage Service ausgeliefert, hatte im Hintergrund fuers Erstellen von Posts immer noch eine Applikation in der Google App-Engine laufen. Diese Applikation stammt aus einer laengst vergangenen Zeit und kam so langsam auch nicht mehr wirklich mit der Menge von Posts klar, die ich hier im Blog habe.

Statt dass ein Blogbeitrag einfach geschrieben und veroeffentlicht werden konnte musste eine muehsame Generierung aller Posts folgen, die ich jemals geschrieben habe. (Das sind inzwischen in diesem Blog knapp 950 Stueck in 7 Jahren...) Dadurch hat mich die Generierung eines jeden Blogposts immer einen Betrag von unter 2 USD gekostet aber auch Kleinviel macht bekanntlich Mist.

In Zukunft (bzw. mit diesem Artikel) wird mein Blog durch [Hugo](http://gohugo.io/) generiert. Hugo ist in Go geschrieben, kann meinen Blog innerhalb von 1-2 Sekunden generieren und laeuft auf meinem Rechner. Die Artikel brauche ich auch nicht mehr in einem uralten WYSIWYG-Editor schreiben sondern tippe sie einfach in einer Textdatei im Markdown-Format. Sekunden spaeter ist aus dem Markdown ein fertiger Artikel geworden und ich kann den Artikel in die S3 synchronisieren.

Was sich demnaechst noch aendern soll ist das Theme meines Blogs. So langsam geht mir auch dieses vor Ewigkeiten selbst gestrickte Template auf den Geist und ich will zu einem moderneren Template wechseln. Von der Gestaltung wird sich der Blog dann wohl dem Bootstrap-Standard mit ein paar wenigen Aenderungen annaehern. Mit anderen Worten es gibt besser lesbare Typographie, ein aufgeraeumteres Template und auch bessere Unterstuetzung fuer mobile Browser.

Ausserdem soll das neue Theme sich dann meiner [Kontakt-Seite](https://ahlers.me/) annaehern und im Prinzip beide Seiten Designtechnisch verschmelzen, auch wenn sie weiterhin getrennt bleiben. Wann genau das alles passiert kann ich allerdings noch nciht genau sagen, da aktuell meine [Projektliste](https://trello.com/b/paMKbDFl) noch einige andere Tasks hat um die ich mich auch mal kuemmern muesste...
