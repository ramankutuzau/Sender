unit SmsSender;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  mySQLDbTables, Vcl.DBCtrls,Vcl.ExtCtrls,IdHTTP,System.NetEncoding;



type
  TSmsSender = class(TForm)

  Constructor Create();
  function SendSMS(number, sms : String):Boolean;
  end;

var
 RSUsername,RSPassword,RSSender,URL,text:string;

implementation

Constructor TSmsSender.Create();
begin
 RSUsername := '591022987';
 RSPassword := '7eNEMpyH';
 RSSender := 'smsInfo';
end;



function TSmsSender.SendSMS(number, sms : String): Boolean;
var
  mStream: TMemoryStream;
  idHttp : TidHTTP;
begin
  TSmsSender.Create;
  text := TNetEncoding.URL.Encode(sms);
  mStream := TMemoryStream.Create;
  try
    idHttp := TIdHTTP.Create(nil);
    URL := 'http://api.rocketsms.by/simple/send?username='+RSUsername+'&password='
      +RSPassword+'&phone='+number+'&sender='+RSSender+'&text='+text+'';
    try
    idHttp.Get(URL,mStream);
    showmessage('Отправлено');
    finally
      idHttp.Free;
    end;
  finally
   mStream.Free;
  end;

end;




end.
