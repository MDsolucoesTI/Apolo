//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrAtestado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TQrAtestado = class(TForm)
    rpAtestado: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText2: TQRDBText;
    QRShape5: TQRShape;
    qrC: TQRLabel;
    qrA: TQRLabel;
    qrO: TQRLabel;
    qrF: TQRLabel;
    qrE: TQRLabel;
    qrP: TQRLabel;
    qrD: TQRLabel;
    qrCi: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText7: TQRDBText;
    qrlPac: TQRLabel;
    QRDBText1: TQRDBText;
    qrlDia: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    qrlMes: TQRLabel;
    QRLabel27: TQRLabel;
    qrlAno: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrAtestado: TQrAtestado;

implementation

uses UnitDmdados, UnitProntuario;



{$R *.dfm}

end.
