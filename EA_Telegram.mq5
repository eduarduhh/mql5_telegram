﻿#property copyright "EDUARDO COSTA CARVALHO"
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade/SymbolInfo.mqh>
#include <Telegram.mqh>


CCustomBot    bot;      // BOT TELEGRAM


/********************************
 * CONFIGURAÇÃO TELEGRAM        *
 * 
******************************/
string id_telegram = "000000000000000";                                      //ID do Canal
string Token       = "00000000000000000000000"; // Chave do bot
int    setupmode   = 0;

int  Periodo     =  2;
int  LimiteInf   = 10;
int  LimiteSup   = 90;
int  handle_rsi  = INVALID_HANDLE ;
int  resutlado   = 0;

datetime candle_atual, candle_novo;

//total trader por candle
int tot_trade_candle = 1;


// Estruturas de tempo para manipulação de horários
MqlDateTime horario_inicio, horario_termino, horario_fechamento, horario_atual;
MqlRates rates[];


int OnInit(){ 
   
   bot.Token(Token);
  
   print();
   return(INIT_SUCCEEDED);
}
   
//FUNCAO DE SAIR
void OnDeinit(const int reason){
   
}

//FUNCAO TICK A CADA TICK DO MERCADO
void OnTick(){
   
  
 } 
     
// classe para tirar foto e enviar para o telegram
void print(){
  ChartScreenShot(0,"Print.png",400,400,ALIGN_CENTER);
   
  string filename="Print.png" ;   
  string photo_id;
  
   int result=bot.SendPhoto(photo_id, id_telegram,filename);
      if(result==0)
         Print("Photo ID: ",photo_id);
      else
         Print("Error: ",GetErrorDescription(result));

 }
