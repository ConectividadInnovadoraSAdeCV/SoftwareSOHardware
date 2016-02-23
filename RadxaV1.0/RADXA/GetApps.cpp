/**
 *************************************************************
 * @file servtcp.c
 * @brief Breve descripción
 * Ejemplo de un cliente TCP usando threads
 *
 *
 * @author Gaspar Fernández <blakeyed@totaki.com>
 * @version 0.1Beta
 * @date 13 ene 2011
 * Historial de cambios:
 *   20110113 - Versión inicial
 *
 *
 *************************************************************/

#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <netinet/in.h>
#include <resolv.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>
#include <string>
#include <fstream>
#include <iostream>
/** Puerto  */
#define PORT       7000

/** Número máximo de hijos */
#define MAX_CHILDS 7

/** Longitud del buffer  */
#define BUFFERSIZE 600



int AtiendeCliente(int socket, struct sockaddr_in addr);
int DemasiadosClientes(int socket, struct sockaddr_in addr);
void error(int code, char *err);
void reloj(int loop);
const int CantPasajeros=50;
const int MaxAppRecord=2000;
int AppCurrentPosition=0;
const std::string FilePath="/etc/weon/Apps";
struct Mac_IP {
    std::string Mac;
    std::string IP;
};
struct Mac_APP{
    std::string Mac;
    std::string App;
};
Mac_IP Diccionario[CantPasajeros];
Mac_APP Apps[MaxAppRecord];

//estas 2 funciones se agregaron por que IOS no permite obtener la MAC
std::string getCmdOutput(const std::string& mStr)
{
    std::string result,file;
    FILE * pipe {popen(mStr.c_str(),"r")};
    char buffer[256];
    
    while(fgets(buffer,sizeof(buffer),pipe)!=NULL)
    {
        file=buffer;
        result+=file.substr(0,file.size()-1);
    }
    
    pclose(pipe);
    return result;
}
std::string GetFromDiccionario(std::string IP)
{
    for(int i=0;i<CantPasajeros;i++)
    {
        if(Diccionario[i].IP==IP|| IP=="-1")
        {
            return Diccionario[i].Mac;
        }
    }
    return "-1";
}
void SetDiccionario()
{
    std::string txt="arp -n";
    std::string resultado;
    std::string linea;
    //getCmdOutput("( ping "+oneIP+" -c 1 )");
    resultado=getCmdOutput("( "+txt+" )");
    resultado=resultado.substr(resultado.find("Iface")+5);
    int i=0;    
    Diccionario[i].IP="127.0.0.1";
    Diccionario[i].Mac="localhost";
    i++;
    Diccionario[i].IP="0.0.0.0";
    Diccionario[i].Mac="loopback";
    i++;
    while (resultado.length()>17)
    {
        Diccionario[i].IP=resultado.substr(0,resultado.find(" "));
        Diccionario[i].Mac=resultado.substr(resultado.find("ether")+8);
        Diccionario[i].Mac=Diccionario[i].Mac.substr(0,Diccionario[i].Mac.find(" "));
        resultado=resultado.substr(resultado.find("eth0")+4);
        i++;
    }
    while(i<CantPasajeros)        
    {
        Diccionario[i].IP="-1";
        Diccionario[i].Mac="-1";
        i++;
    }
}
void SendLineToFile(std::string Linea)
{
    std::string aux=Linea.substr(Linea.find("0")+1);
    aux=aux.substr(aux.find("0")+2); 
    std::string ip=aux.substr(0,aux.find(":"));
    std::string programa=aux.substr(aux.find("/")+1,aux.find(" "));
    ip=GetFromDiccionario(ip);
    int i=0;
    if(ip!="-1")
    {
        i=0;
        for (i=0;i<AppCurrentPosition;i++)
        {
            if(Apps[i].Mac==ip&&Apps[i].App==programa)
                break;
        }
        std::cout<<"Posicion: "<<AppCurrentPosition<<"i: "<<i<<"\n";
        if(i==AppCurrentPosition)//significa que no estava registrado previamente
        {
            Apps[i].Mac=ip;
            Apps[i].App==programa;
            AppCurrentPosition++;
            std::string newline="echo '"+ip+"|"+programa+"!'>>"+FilePath;
            getCmdOutput("( "+newline+" )");
        }
    }
}
void SetApps()
{
   std::string txt="netstat -atpn";
   std::string file=getCmdOutput("( "+txt+" )");
   std::string linea;    
   file=file.substr(file.find("tcp")+4);
   //for(int i=0;i<5;i++)
   while(true)
   {
      linea=file.substr(0,file.find("tcp"));
      SendLineToFile(linea);
      if(file.find("tcp")>100)
      {
          break;
      }
      file=file.substr(file.find("tcp")+4);
   }
}
void LoadFile()
{
   printf("Loading file...\n");
   std::string txt="cat "+FilePath;
   std::string file=getCmdOutput("( "+txt+" )");
   std::string linea;        
   while (file.length()>1)
   {
      linea=file.substr(0,file.find("!"));
      Apps[AppCurrentPosition].Mac=linea.substr(0,linea.find("|"));
      Apps[AppCurrentPosition].App=linea.substr(linea.find("|")+1);
      
      if(AppCurrentPosition<MaxAppRecord)
         AppCurrentPosition++;
      file=file.substr(linea.length()+1);
   }
}
//funciones para la mac
int main(int argv, char** argc){

    SetDiccionario();
    LoadFile();
    SetApps();
    /*ESTAS LINEAS LAS USO SOLO PARA PROBAR QUE EL DICCIONARIO SE LLENO BIEN*/
    /*
    for(int i=0;i<CantPasajeros;i++)
    {
        if(Diccionario[i].IP=="-1")
            break;
        printf("IP: ");
        printf(Diccionario[i].IP.c_str());
        printf(" Mac: ");
        printf(+Diccionario[i].Mac.c_str());
        printf("\n");
    }
    
    for(int i=0;i<AppCurrentPosition;i++)
    {
        printf("MAC: ");
        printf(Apps[i].Mac.c_str());
        printf(" APP: ");
        printf(+Apps[i].App.c_str());
        printf("\n");
    }
    */
    
    return 0;
}
