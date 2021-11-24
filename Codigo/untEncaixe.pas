//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untEncaixe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, JvComponent, JvEnterTab, fcLabel, ExtCtrls,
  fcpanel, EDBTime, StdCtrls, DBCtrls, EDBFind, Mask, ToolEdit, RXDBCtrl,
  RXCtrls, fcButton, fcImgBtn;

type
  TfrmEncaixe = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    pnCentro: TfcPanel;
    MsgDlg: TEvMsgDlg;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    cmbPaciente: TEvDBFind;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    dbTel2: TDBEdit;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    cmbTipo: TDBComboBox;
    RxLabel9: TRxLabel;
    dbHora: TEvDBTimeEdit;
    RxLabel8: TRxLabel;
    btnCadRap: TfcImageBtn;
    dbConv: TDBEdit;
    FindPac: TEvDBFind;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncaixe: TfrmEncaixe;

implementation

{$R *.dfm}

procedure TfrmEncaixe.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
