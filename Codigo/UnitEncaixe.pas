//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEncaixe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg, ToolEdit,
  RXDBCtrl, Mask, RXCtrls, EDBFind, EDBTime, RxGrdCpt, fcButton, fcImgBtn,
  fcImage, fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmEncaixe = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel10: TRxLabel;
    Image1: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnConfirmar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel8: TRxLabel;
    dbHora: TEvDBTimeEdit;
    RxLabel9: TRxLabel;
    cmbTipo: TDBComboBox;
    RxLabel2: TRxLabel;
    cmbPaciente: TEvDBFind;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    cmbConv: TDBLookupComboBox;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEncaixe: TFrmEncaixe;

implementation

uses UnitPrincipal, UnitDmdados;

{$R *.dfm}

procedure TFrmEncaixe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmEncaixe.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEncaixe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : BtnConfirmar.Click;
    end;
end;

procedure TFrmEncaixe.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
end;

end.
