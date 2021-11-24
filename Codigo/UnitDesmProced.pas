//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDesmProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg, ToolEdit,
  RXDBCtrl, Mask, RXCtrls, EDBFind, EDBTime, RxLookup, fcButton, fcImgBtn,
  RxGrdCpt, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmDesmProced = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel10: TRxLabel;
    Image3: TImage;
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
    dbNome: TDBEdit;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    dbTipoProc: TDBMemo;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesmProced: TFrmDesmProced;

implementation

uses UnitPrincipal, UnitDmdados, UnitAgenda;

{$R *.dfm}

procedure TFrmDesmProced.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmDesmProced.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesmProced.FormShow(Sender: TObject);
var
 linha:integer;
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  linha:=FrmAgenda.StringProced.Row;
  dmdados.TbAgeProced.Locate('Paciente;Data',VarArrayOf([FrmAgenda.StringProced.Cells[1,linha],FrmAgenda.Calendario.Date]),[]);
end;

procedure TFrmDesmProced.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : BtnConfirmar.Click;
    end;
end;

procedure TFrmDesmProced.BtnConfirmarClick(Sender: TObject);
var
  linha : integer;

begin
dmdados.TbAgeProced.Delete;
linha:=FrmAgenda.StringProced.Row;
FrmAgenda.StringProced.Cells[1,linha]:= '';
FrmAgenda.StringProced.Cells[2,linha]:= '';
FrmAgenda.StringProced.Cells[3,linha]:='';
FrmAgenda.StringProced.Cells[4,linha]:= '';
close;


end;

procedure TFrmDesmProced.fcImageBtn1Click(Sender: TObject);
var
  linha : integer;
begin
dmdados.TbAgeProced.Delete;
linha:=FrmAgenda.StringProced.Row;
FrmAgenda.StringProced.Cells[1,linha]:= '';
FrmAgenda.StringProced.Cells[2,linha]:= '';
FrmAgenda.StringProced.Cells[3,linha]:='';
FrmAgenda.StringProced.Cells[4,linha]:= '';
close;
end;

procedure TFrmDesmProced.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
