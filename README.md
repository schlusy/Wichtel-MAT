# Wichtel-Mat
Wichtelauslosung mit Partnererkennung

Das Skript wurde zunächst in PowerShell geschrieben, um erstmal zu einem Ergebis zu kommen. Eine Erweiterung war schon, dass die Textdateien als Input gelten. Damit habe ich das "Problem" aus der Welt geschafft, Namen im Quelltext hart zu coden. Das Skript nutzt als Basis die Teilnehmer(.txt) und würfelt zufällige Wichtel. Dabei wird geprüft, ob die schenkende Person gleichzeitig auch die beschenkte ist. In dem Fall startet der Durchgang neu. Er startet AUCH neu, wenn die Ehepaare(.txt) einander zugelost wurden.

Perspektivisch möchte ich das kleine Helferlein in ein festes Frontend migrieren, damit die Input.txt entfallen. =)