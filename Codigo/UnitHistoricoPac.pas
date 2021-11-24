//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitHistoricoPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, DBCtrls, Mask, ToolEdit, fcButton, fcImgBtn,
  EDBFind;

type
  TFrmHistoricoPac = class(TForm)
    RxLabel4: TRxLabel;
    RxLabel6: TRxLabel;
    DBMemo1: TDBMemo;
    edtpac: TEvDBFind;
    btnLocPac: TfcImageBtn;
    edtData: TDateEdit;
    RxLabel7: TRxLabel;
    btnCadastrar: TfcImageBtn;
    RxLabel1: TRxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistoricoPac: TFrmHistoricoPac;

implementation

{$R *.dfm}

end.
