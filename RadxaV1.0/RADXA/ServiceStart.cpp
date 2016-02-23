/* 
 * File:   main.cpp
 * Author: jalvarez
 *
 * Created on June 10, 2015, 12:09 PM
 */

#include <cstdlib>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <string>

#define BUFFERSIZE 600

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {

    char buffer[BUFFERSIZE];
    memset(buffer, 0, BUFFERSIZE);
    std::string txt(buffer);
    //primero espero 4 minutos a que todo arranque    
    printf("Inicio el sistema esperare 4 minutos\n");
    usleep(240000000);
    
    
    //Arranco la bam y espero 2 minutos
    txt="sudo ifup gprs";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer);
    printf(" -> Arranco la bam y esperare 2 minutos\n");
    usleep(120000000);

       
    //concedo permisos a los directorios
    txt="sudo chmod -R 7777 /etc/weon";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer);
    printf(" -> Concedo permisos al directorio principal\n");
    
    //concedo permisos a los directorios
    txt="sudo chmod -R 7777 /dev/ttyS0";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer);
    printf(" -> Concedo permisos al directorio principal\n");
    
    //iniciliazo la hora
    txt="sudo ntpdate ntp.ubuntu.com   ";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer); 
    printf(" -> Inicie la hora esperare 15 segundos\n");   
    usleep(15000000);
    
    //arranco iptables
    txt="sudo sh /etc/weon/iptables.sh";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer); 
    printf(" -> Inicie iptables\n"); 
    
    //arranco el demonio
    txt="sudo /etc/weon/Demonio.o &";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer); 
    printf(" -> Inicio el demonio en background\n");  
    
    
    //arranco GPS
    txt="sudo /etc/weon/GpsClient.o &";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer); 
    printf(" -> Inicie GPS en background\n");
    
    
    //arranco squid
    txt="sudo /usr/local/squid/sbin/squid &";
    txt.copy(buffer,txt.length(),0);
    system(buffer);
    printf(buffer); 
    printf(" -> Inicie squid\n"); 
    
    
    return 0;
}

