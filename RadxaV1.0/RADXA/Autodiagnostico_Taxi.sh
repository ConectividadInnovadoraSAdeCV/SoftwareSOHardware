#!bash
#cada 1 minutos
ArchivoStatus=/etc/weon/pppStatus
Minutos=3
Couter=0
sleep 6m #por que se executa al iniciar y hay que darle tiempo a la BAM

DiagnosticaRed(){
        ifconfig ppp>$ArchivoStatus
	if grep '255.' $ArchivoStatus;then
           Counter=0
	   printf 'Todo en orden\n'
        else
          Counter=$((Counter + 1))
          echo $Counter
          if [ "$Counter" -ge "$Minutos" ];then
		printf 'IP Incorrecta, me apagare\n'	  
		sudo /sbin/poweroff -h now
	  else
		printf 'IP incorrecta esperare otro minuto\n'
	  fi
	fi
}
while true
do
	DiagnosticaRed
	sleep 1m
done
