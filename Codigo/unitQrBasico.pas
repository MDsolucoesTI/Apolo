//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TqrBasico = class(TForm)
    rpBasico: TQuickRep;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qrBasico: TqrBasico;

implementation

uses UnitDmdados, UnitProntuario;

{$R *.dfm}

end.
