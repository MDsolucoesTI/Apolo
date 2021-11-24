//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitConfCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EDBFind, EDBTime, DBCtrls, ExtCtrls, RackCtls,
  SpeedBar, jpeg, ToolEdit, RXDBCtrl, Mask, RXCtrls, fcButton, fcImgBtn,
  RxDBComb,db, RxGrdCpt, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmConfCons = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel10: TRxLabel;
    Image2: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnConfirmar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel8: TRxLabel;
    dbHora: TEvDBTimeEdit;
    RxLabel9: TRxLabel;
    cmbTipo: TRxDBComboBox;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    dbConv: TEvDBFind;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    btnCadPac: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadPacClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfCons: TFrmConfCons;

implementation

uses UnitPrincipal, UnitDmdados, UnitAgenda, UnitCadPaciente;

{$R *.dfm}

procedure TFrmConfCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmConfCons.btnCadPacClick(Sender: TObject);
begin
if (dmdados.TbAgenda.State=dsEdit) then
 begin
 if cmbTipo.Text='1a Vez' then
  begin
  dmdados.TbPaciente.Append;
  dmdados.TbPacienteNome.Value:=dmdados.TbAgendaPaciente.Value;
  dmdados.TbPacienteDtCad.Value:=date;
  dmdados.TbPacienteCodConv.Value:=dmdados.TbAgendaCodConv.Value;
  dmdados.TbPacienteTel1.Value:=dmdados.TbAgendaTel1.Value;
  dmdados.TbPacienteCodConv.Value:=dmdados.TbAgendaCodConv.Value;
  dmdados.TbPacienteTel2.Value:=dmdados.TbAgendaTel2.Value;
  dmdados.TbPacienteCel.Value:=dmdados.TbAgendaCelular.Value;
  dmdados.TbPaciente.Post;
  FrmCadPaciente:=TFrmCadPaciente.create(application);
  FrmCadPaciente.Showmodal;
  end;
  end;
end;

procedure TFrmConfCons.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : BtnConfirmar.Click;
      VK_F2     : btnCadPac.Click;
    end;
end;

procedure TFrmConfCons.FormShow(Sender: TObject);
var
  linha : integer;
begin
  linha:=FrmAgenda.StringAgenda.Row;
  FrmPrincipal.StatusTeclas(True,'[F2] Cadastro de Pacientes [End] Gravar [Esc] Sair');
  dmdados.TbAgenda.Locate('Paciente',frmAgenda.StringAgenda.Cells[1,linha],[]);
  dmdados.TbAgenda.edit;
end;

procedure TFrmConfCons.BtnConfirmarClick(Sender: TObject);
var
  linha : integer;
begin
dmdados.tbAgendaStatus.value:='C';
dmdados.TbAgenda.Post;
  if DMdados.TbPaciente.Locate('Nome',dbnome.Text,[loPartialKey]) then
    begin
    DMdados.TbPaciente.Edit;
    DMdados.TbPacienteConsConf.Value:=DMdados.TbPacienteConsConf.Value+1;
    DMdados.TbPaciente.Post;
    end;
linha:=FrmAgenda.StringAgenda.Row;
FrmAgenda.StringAgenda.Cells[3,linha]:=dmdados.tbagendaStatus.value;
close;
end;

procedure TFrmConfCons.btnGravarClick(Sender: TObject);
var
  linha : integer;
begin
dmdados.tbAgendaStatus.value:='C';
dmdados.TbAgenda.Post;
  if DMdados.TbPaciente.Locate('Nome',dbnome.Text,[loPartialKey]) then
    begin
    DMdados.TbPaciente.Edit;
    DMdados.TbPacienteConsConf.Value:=DMdados.TbPacienteConsConf.Value+1;
    DMdados.TbPaciente.Post;
    end;
linha:=FrmAgenda.StringAgenda.Row;
FrmAgenda.StringAgenda.Cells[3,linha]:=dmdados.tbagendaStatus.value;
close;
end;

end.
