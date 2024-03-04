Panové, málem jsem umřeli, ale máme to... Tímto skriptem spustíte doom jediné co je třeba: mít ve sdílenou složku ve virtualce ze které si muže vzít soubory DOOM a pak stačí jen spustit tento skritpt .. taky nejspíše nakopírovaní ve sdílené složce a je to... ale kvůli přenositelnosti se to spouští jako
"./doom.sh <váš věc nejspíš vboxfs> <název sdílené složky>"

změna první krok je vytvoření složky a mount :D abychom vůbec získali files


1.ve složce root 
mkdir DOOM
2.mount sdílené složky 
mount -t <váš věc nejspíš vboxfs> <název sdílené složky> /root/DOOM
3.spustění skriptu
./doom.sh (pokud není mount napsat to zde, ale asi to odstraním, když se stejně provede na začátku... a nebo ho projistotu necháme, kdyby se náhodou smazal xd)
