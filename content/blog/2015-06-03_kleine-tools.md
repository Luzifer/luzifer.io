---
date: 2015-06-03T23:08:06+02:00
title: "Kleine Tools erleichtern den Alltag"
vgwort: 21cf8993c63a427b9b2362c9e55eb060
aliases:
  - /2015/06/kleine-tools-erleichtern-den-alltag.html
  - /blog/2015/06/kleine-tools-erleichtern-den-alltag.html
---

![Terminal](/uploads/2015/06/03/terminal_820.png)

Wer mich kennt, der weiss, dass ich mich beruflich und auch privat mit der Optimierung von Arbeitsprozessen beschaeftige und keine "Monkey-Tasks" mag. Wem ein Monkey-Task nichts sagt: Ein Monkey-Task ist eine Taetigkeit, die von Hand ausgefuehrt wird. Und zwar immer und immer wieder exakt das gleiche. In der Regel so anspruchsvoll, dass ein halbwegs trainierter Affe diesen Task auch machen koennte. Allerdings ist es ja wieder aufwaendig den Affen zu trainieren und ueberhaupt so mit Tierschutz und so...

Genau deswegen ueberlaesst man die Monkey-Tasks am Besten gleich dem Computer und dafuer moechte ich hier mal drei meiner Tools vorstellen, die in der letzten Zeit entstanden sind. Alle Projekte finden sich natuerlich auch in meinem [Github-Profil](https://github.com/Luzifer?tab=repositories) und sind unter einer Apache 2.0 Lizenz veroeffentlicht, was euch ermoeglicht sie auch im kommerziellen ohne Probleme nutzen zu koennen.

## [awsenv](https://github.com/Luzifer/awsenv)

Der erste Prozess, der mir auf den Geist ging, war das Einloggen an der AWS Web-Konsole. Ich habe aktuell Zugriffsrechte auf 5 verschiedene AWS-Accounts, die natuerlich alle ihre eigenen Credentials haben und zum Teil noch unterschiedlich zu bedienen sind. Jedes Mal also raus suchen welche Credentials nun fuer den Account anzuwenden sind und wie der Account heisst. Kann man mal machen aber auf Dauer geht das ziemlich auf den Senkel.

Nun erwaehnte ich ja schon, dass ich mir solche Aufgaben gerne vom Hals schaffe und somit entstand `awsenv`. `awsenv` ist ein kleines Tool, welches aus dem Terminal bedient wird und sich die ganzen Credentials merken kann. Natuerlich alles mit AES256 (aktuelle Verschluesselungsstufe fuer "geheime Dokumente" des DoD) verschluesselt, damit die Daten nicht offen irgendwo auf dem Rechner herum liegen.

## [license](https://github.com/Luzifer/license)

Wenn man wie ich viele kleine Projekte betreibt und auch immer wieder neue Projekte anfaengt, kommt man schnell dazu, dass diesen Projekten immer wieder Lizenzen zugewiesen werden sollten. Hier ging mir auf den Keks, dass ich immer wieder die Lizenztexte im Netz suchte bzw. mich erinnern musste in welchen Projekten ich die Lizenz schon einmal verwendet habe, um die jeweilige Lizenzdatei zu kopieren. So war ein wenig Zeit und ein paar Zeilen Quellcode spaeter `license` entstanden.

`license` automatisiert das hinzufuegen dieser Lizenzdateien und uebernimmt dabei auch gleich noch das laestige Ausfuellen der Felder wie dem aktuellen Jahr und dem Author der Software. Die Daten dafuer kommen aus der git-Konfiguration des aktuellen users. Natuerlich muss man ein wenig dran editieren, wenn man die Datei fuer eine Organisation braucht aber nunja. Es ist halt doch nicht alles komplett automatisierbar.

## [github-masswatch](https://github.com/Luzifer/github-masswatch)

Das einzige Tool aus dieser Reihe, welches nicht in Go geschrieben ist, dient dazu auf Github fuer Ordnung zu sorgen, wenn es darum geht welche Repositories "watched" werden. Standardmaessig hat Github die Funktion, dass alle neu erstellten Repositories "watched" sind. Wenn man wie ich in diversen Organzisationen ist und dort immer wieder Repositories erstellt werden, mit denen man im Zweifel gar nichts zu tun hat, dann schaltet man dieses automatische watching relativ schnell ab. (Oder lebt damit sie manuell weg zu klicken... Hallo Monkey-Task!)

Nachdem man diese Funktion aber deaktiviert hat, wird kein neues Repository mehr automatisch "watched" und auch die selbst angelegten sind da keine Ausnahme. Also fuehrt das schnell dazu, dass man keine Notifications mehr bekommen wenn jemand ein Issue in einem der eigenen Projekte auf macht. Jetzt geht das Spiel anders herum los: Man klickt sich durch die Liste und sucht danach, wo man doch wieder watchen sollte...

`github-masswatch` kann diese Arbeit abnehmen, solange man in der Lage ist die Repositories, die man abonnieren moechte in einer RegEx zu beschreiben. Wenn ich zum Beispiel meine eigenen Repositories automatisch watchen moechte waere das `^Luzifer/.*$`, da die Repositories alle mit meinem Github-Nick beginnen. Man kann sogar so weit gehen, wie ich und einen Jenkins-Job einrichten, der einmal am Tag eine Liste von RegEx durch geht und alle passenden Repositories abonniert...
