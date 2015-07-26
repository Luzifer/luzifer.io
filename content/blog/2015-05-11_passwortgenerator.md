---
date: 2015-05-11T10:56:19+02:00
title: "Projekt: Secure Password"
vgwort: 1734a2da063a4278b40fce45e72c805c
aliases:
  - /2015/05/projekt-secure-password.html
  - /blog/2015/05/projekt-secure-password.html
---

_Der eine oder andere wird eventuell meinen alten Passwortgenerator noch kennen und sich an das grausame Design aus dem Jahr 2010 erinnern. Auch in der Technik dahinter war nicht alles so wie ich es gerne haette..._

[{{< img src="/uploads/2015/05/11/pwd_luzifer_io.png" alt="Neues Interface im Passwortgenerator" >}}](https://pwd.luzifer.io/)


Im Endeffekt stand in meiner [Projektliste](https://trello.com/b/paMKbDFl) schon seit einer ganzen Weile der Task den [Passwortgenerator](https://pwd.luzifer.io/) mal "ordentlich" zu machen. Er sollte ein besseres Interface bekommen, der alte Python-Code in Python 2.5 sollte weg, dazu sollte das Projekt nicht mehr auf der AppEngine laufen, die Passwort-Generierung sollte schneller werden, die Seite sollte ausschliesslich via HTTPs erreichbar sein und schlussendlich sollte sie zuverlaessig gute Passwoerter liefern.

Eine ganz gute Liste von Punkten, die sich verbessern sollten. Da ich in letzter Zeit in der Hauptsache mit [Go](https://golang.org/) arbeite und die Geschwindigkeit von Go-Programmen im Gegensatz zu Python-Scripten doch sehr viel hoeher ist, stand fest, dass ich die neue Version in Go schreiben werde. Dadurch war es mir auch moeglich die Bibliothek zur Passwort-Generierung mit ordentlichen Tests zu versehen und damit dafuer zu sorgen, dass bei einer Aenderung am Code nicht zufaellig auch die Qualitaet der Passwoerter Schaden nimmt.

Das Interface basiert in der neuen Version auf [Bootstrap](http://getbootstrap.com/) mit dem Paper-Theme von [Bootswatch](https://bootswatch.com/) und ist so angelegt, dass es auch auf mobilen Endgeraeten gut funktioniert. Weichen musste dabei der Flash-Button zum Kopieren der Passwoerter, da dieser auf allen mobilen Endgeraeten und auch in immer mehr Browsern nicht funktioniert.

Meine [Alfred 2 Extension](https://github.com/Luzifer/alfred-pwdgen/blob/master/PasswordGenerator.alfredworkflow?raw=true) zum Erzeugen von Passwoertern hat damit auch ein Update bekommen und fragt die Passwoerter jetzt nicht mehr an einer API im Internet ab sondern enthaelt eine kompilierte Version des Passwortgenerators. Damit lassen sich die Passwoerter jetzt auch ohne Internetzugriff generieren. Einziger Nachteil: Verbesserungen an der Sicherheit der Passwoerter erfordern jetzt ein Update der Extension statt wie bisher nur die Aenderung der API.

Als netter kleiner Nebeneffekt habe ich damit auch gleich eine [Bibliothek](https://github.com/Luzifer/password/tree/master/lib) geschaffen, die Go-Entwickler in ihren Projekten nutzen koennen um Passwoerter in genau diesem Sicherheitsstandard zu schaffen ohne sich dabei selbst Gedanken ueber die verschiedenen Sicherheitspruefungen machen zu muessen.

Wer sich von der Sicherheit der generierten Passwoerter selbst ueberzeugen moechte, ist gerne eingeladen sich die Tests in der Bibliothek anzuschauen und mir dazu Feedback zu geben. Jede Anmerkung ist in den [Issues auf GitHub](https://github.com/Luzifer/password/issues) willkommen und wird beachtet.
