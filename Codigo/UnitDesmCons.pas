//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDesmCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg, ToolEdit,
  RXDBCtrl, fcButton, fcImgBtn, Mask, RXCtrls, EDBTime, RxLookup, DB,
  RxGrdCpt, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmDesmCons = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel10: TRxLabel;
    Image2: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnConfirmar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel2: TRxLabel;
    dbPac: TDBEdit;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    dbConv: TDBMemo;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    dbTipo: TDBEdit;
    RxLabel9: TRxLabel;
    RxLabel8: TRxLabel;
    dbHora: TEvDBTimeEdit;
    btnCadPac: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesmCons: TFrmDesmCons;

implementation

uses UnitPrincipal, UnitDmdados, UnitAgenda;

{$R *.dfm}

procedure TFrmDesmCons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmDesmCons.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesmCons.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : BtnConfirmar.Click;
    end;
end;

procedure TFrmDesmCons.FormShow(Sender: TObject);
var
  linha:integer;
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  linha:=FrmAgenda.StringAgenda.Row;
  dmdados.TbAgenda.Locate('Paciente;Data',VarArrayOf([FrmAgenda.StringAgenda.Cells[1,linha],FrmAgenda.Calendario.Date]),[]);
end;

procedure TFrmDesmCons.BtnConfirmarClick(Sender: TObject);
var
  linha : integer;

begin
dmdados.TbAgenda.Delete;
dmdados.TbPaciente.Open;
  if DMdados.TbPaciente.Locate('Nome',dbPac.Text,[loPartialKey]) then
    begin
    DMdados.TbPaciente.Edit;
    DMdados.TbPacienteConsCanc.Value:=DMdados.TbPacienteConsCanc.Value+1;
    DMdados.TbPaciente.Post;
    end;
linha:=FrmAgenda.StringAgenda.Row;
FrmAgenda.StringAgenda.Cells[1,linha]:= '';
FrmAgenda.StringAgenda.Cells[2,linha]:= '';
FrmAgenda.StringAgenda.Cells[3,linha]:='';
FrmAgenda.StringAgenda.Cells[4,linha]:= '';
close;
end;

procedure TFrmDesmCons.fcImageBtn1Click(Sender: TObject);
var
  linha : integer;

begin
dmdados.TbAgenda.Delete;
dmdados.TbPaciente.Open;
  if DMdados.TbPaciente.Locate('Nome',dbPac.Text,[loPartialKey]) then
    begin
    DMdados.TbPaciente.Edit;
    DMdados.TbPacienteConsCanc.Value:=DMdados.TbPacienteConsCanc.Value+1;
    DMdados.TbPaciente.Post;
    end;
linha:=FrmAgenda.StringAgenda.Row;
FrmAgenda.StringAgenda.Cells[1,linha]:= '';
FrmAgenda.StringAgenda.Cells[2,linha]:= '';
FrmAgenda.StringAgenda.Cells[3,linha]:='';
FrmAgenda.StringAgenda.Cells[4,linha]:= '';
close;
end;

procedure TFrmDesmCons.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
