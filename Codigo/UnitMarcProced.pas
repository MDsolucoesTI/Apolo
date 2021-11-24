//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitMarcProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EDBFind, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg,
  ToolEdit, RXDBCtrl, fcButton, fcImgBtn, Mask, RXCtrls, EDBTime, RxLookup,
  RxDBComb, RxGrdCpt, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmMarcProced = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Image1: TImage;
    RxLabel10: TRxLabel;
    LMDBackPanel3: TLMDBackPanel;
    btnConfirmar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel4: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    dbData: TDBDateEdit;
    dbHora: TEvDBTimeEdit;
    lookTipo: TRxDBComboBox;
    dbNome: TDBEdit;
    lookConv: TRxDBLookupCombo;
    dbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbCel: TDBEdit;
    dbObs: TDBMemo;
    EvDBFind1: TEvDBFind;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocPacienteClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure dbPacienteExit(Sender: TObject);
    procedure EvDBFind1Enter(Sender: TObject);
    procedure EvDBFind1Exit(Sender: TObject);
    procedure fcImageBtn2Clic(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarcProced: TFrmMarcProced;

implementation

uses UnitPrincipal, UnitDmdados, UnitAgenda, UnitCadPaciente;

{$R *.dfm}

procedure TFrmMarcProced.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMdados.tbSessao.Filtered:=False;
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmMarcProced.btnLocPacienteClick(Sender: TObject);
begin
  FrmCadPaciente:=TFrmcadPaciente.create(application);
  FrmCadPaciente.Showmodal;
end;

procedure TFrmMarcProced.BtnCancelarClick(Sender: TObject);
begin
  dmdados.TbAgeProced.Cancel;
  Close;
end;

procedure TFrmMarcProced.FormShow(Sender: TObject);
begin
  dmdados.TbPaciente.Close;
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.TbAgeProced.Append;
  dmdados.TbAgeProcedHora.Value:=StrToTime(FrmAgenda.StringProced.Cells[0,FrmAgenda.StringProced.Row]);
  dmdados.TbAgeProcedData.Value:=frmAgenda.Calendario.Date;
  dmdados.tbageProcedStatus.value:='A';
  EvDBFind1.SetFocus;
end;

procedure TFrmMarcProced.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : BtnConfirmar.Click;
    end;
end;

procedure TFrmMarcProced.BtnConfirmarClick(Sender: TObject);
var
  linha:integer;
begin
  dmDados.TbAgeProced.Post;
  linha:=FrmAgenda.StringProced.Row;
  FrmAgenda.StringProced.Cells[1,linha]:= dmdados.TbAgeProcedPaciente.Value;
  FrmAgenda.StringProced.Cells[2,linha]:= IntToStr(dmdados.tbAgeProcedlksecAtual.Value);
  FrmAgenda.StringProced.Cells[3,linha]:= dmdados.tbAgeProcedStatus.Value;
  FrmAgenda.StringProced.FontColors[1,linha]:=clBlue;
  FrmAgenda.StringProced.FontColors[2,linha]:=clBlue;
  FrmAgenda.StringProced.FontColors[3,linha]:=clBlue;
  close;
end;

procedure TFrmMarcProced.dbPacienteExit(Sender: TObject);
begin
  DMdados.tbAgeProcedPaciente.Value:=DMdados.TbPacienteNome.Value;
  DMdados.tbSessao.Filtered:=False;
  DMdados.tbSessao.Filter:='(CodPac='''+IntToStr(DMdados.TbPacienteCodPac.Value)+''')';
  DMdados.tbSessao.Filtered:=True;
end;

procedure TFrmMarcProced.EvDBFind1Enter(Sender: TObject);
begin
  dmdados.TbPaciente.Open;
end;

procedure TFrmMarcProced.EvDBFind1Exit(Sender: TObject);
Begin
dmdados.TbAgeProcedPaciente.Value:=EvDBFind1.Text;
if dmdados.TbPaciente.Locate('Nome',EvDBFind1.Text,[]) then
  begin
  dmdados.TbAgeProcedTel1.Value:=dmdados.TbPacienteTel1.Value;
  dmdados.TbAgeProcedTel2.Value:=dmdados.TbPacienteTel2.Value;
  dmdados.TbAgeProcedCelular.Value:=dmdados.TbPacienteCel.Value;
  lookTipo.SetFocus;
  end;
end;

procedure TFrmMarcProced.fcImageBtn2Clic(Sender: TObject);
var
  linha:integer;
begin
  dmDados.TbAgeProced.Post;
  linha:=FrmAgenda.StringProced.Row;
  FrmAgenda.StringProced.Cells[1,linha]:= dmdados.TbAgeProcedPaciente.Value;
  FrmAgenda.StringProced.Cells[2,linha]:= IntToStr(dmdados.tbAgeProcedlksecAtual.Value);
  FrmAgenda.StringProced.Cells[3,linha]:= dmdados.tbAgeProcedStatus.Value;
  FrmAgenda.StringProced.FontColors[1,linha]:=clBlue;
  FrmAgenda.StringProced.FontColors[2,linha]:=clBlue;
  FrmAgenda.StringProced.FontColors[3,linha]:=clBlue;
  close;
end;

end.
