//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitConfProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, EDBFind, fcButton, fcImgBtn, RxDBComb,
  EDBTime, Mask, ToolEdit, RXDBCtrl, RXCtrls, RackCtls, ExtCtrls, SpeedBar,
  jpeg, DB, RxGrdCpt, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TfrmConfProced = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel6: TRxLabel;
    Image2: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnCofirmar: TfcImageBtn;
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
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    btnCadPac: TfcImageBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnCadPacClick(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfProced: TfrmConfProced;

implementation

uses UnitPrincipal, UnitDmdados, UnitAgenda, UnitCadPaciente;

{$R *.dfm}

procedure TfrmConfProced.FormShow(Sender: TObject);
var
 linha:integer;
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Cadastro de Pacientes [End] Gravar [Esc] Sair');
  linha:=FrmAgenda.StringProced.Row;
  dmdados.TbAgeProced.Locate('Paciente',frmAgenda.StringProced.Cells[1,linha],[]);
  dmdados.TbAgeProced.edit;

end;

procedure TfrmConfProced.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TfrmConfProced.BtnConfirmarClick(Sender: TObject);
var
  linha : integer;
begin
dmdados.tbAgeProcedStatus.value:='C';
dmdados.TbAgeProced.Post;
  if DMdados.tbSessao.Locate('codigo',DMdados.tbAgeProcedCodProced.Value,[]) then
    begin
    DMdados.tbSessao.Edit;
    DMdados.tbSessaoAtual.Value:=DMdados.tbSessaoAtual.Value+1;
    DMdados.tbSessao.Post;
    if dmdados.tbSessaoAtual.Value=dmdados.tbSessaoQtde.Value then
       ShowMessage('�ltima sess�o para este procedimento');
    end;
linha:=FrmAgenda.StringProced.Row;
FrmAgenda.StringProced.Cells[3,linha]:=dmdados.tbageProcedStatus.value;
close;


end;

procedure TfrmConfProced.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbAgeProced.Cancel;
close;
end;

procedure TfrmConfProced.btnCadPacClick(Sender: TObject);
begin
if (dmdados.TbAgeProced.State=dsEdit) then
 begin
 if cmbTipo.Text='1a Vez' then
  begin
  dmdados.TbPaciente.Append;
  dmdados.TbPacienteNome.Value:=dmdados.TbAgeProcedPaciente.Value;
  dmdados.TbPacienteDtCad.Value:=date;
  dmdados.TbPacienteTel1.Value:=dmdados.TbAgeProcedTel1.Value;
  dmdados.TbPacienteTel2.Value:=dmdados.TbAgeProcedTel2.Value;
  dmdados.TbPacienteCel.Value:=dmdados.TbAgeProcedCelular.Value;
  dmdados.TbPaciente.Post;
  FrmCadPaciente:=TFrmCadPaciente.create(application);
  FrmCadPaciente.Showmodal;
  end;
  end;
end;

procedure TfrmConfProced.fcImageBtn1Click(Sender: TObject);
var
  linha : integer;
begin
dmdados.tbAgeProcedStatus.value:='C';
dmdados.TbAgeProced.Post;
  if DMdados.tbSessao.Locate('codigo',DMdados.tbAgeProcedCodProced.Value,[]) then
    begin
    DMdados.tbSessao.Edit;
    DMdados.tbSessaoAtual.Value:=DMdados.tbSessaoAtual.Value+1;
    DMdados.tbSessao.Post;
    if dmdados.tbSessaoAtual.Value=dmdados.tbSessaoQtde.Value then
       ShowMessage('�ltima sess�o para este procedimento');
    end;
linha:=FrmAgenda.StringProced.Row;
FrmAgenda.StringProced.Cells[3,linha]:=dmdados.tbageProcedStatus.value;
close;
end;

procedure TfrmConfProced.fcImageBtn2Click(Sender: TObject);
begin
dmdados.tbAgeProced.Cancel;
close;
end;

end.
