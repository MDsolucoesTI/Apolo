//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit rel;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQR = class(TQuickRep)
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRRT: TQRRichText;
  private

  public

  end;

var
  QR: TQR;

implementation

uses princ;

{$R *.DFM}

end.
