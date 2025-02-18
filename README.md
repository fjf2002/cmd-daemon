CMD-Daemon
===========

Liest zeilenweise aus dem FIFO /opt/plcnext/cmd-daemon Kommandos
und führt sie mittels bash aus.

Installation
------------
* Dateien watchdog.sh und cmd-daemon.sh nach /opt/cmd-daemon kopieren
* ausführbar machen: `cd /opt/plcnext/cmd-daemon && chmod a+x *.sh`

* crontab (Hintergrundprozesse bei Rechnerstart starten)
  * Crontab öffnen:
    ```bash
    # editor wählen - eher joe oder nano für Laien wählen:
    select-editor
    # crontab editieren:
    crontab -e
    ```
  * Zeile hinzufügen:
    ```
    @reboot /opt/cmd-daemon/watchdog.sh /opt/cmd-daemon/cmd-daemon.sh
    ```
