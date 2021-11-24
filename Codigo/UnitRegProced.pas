//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRegProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EDBZero, StdCtrls, RxLookup, EDBTime, EDBFind, ExtCtrls,
  RackCtls, SpeedBar, jpeg, Mask, ToolEdit, RXDBCtrl, RXCtrls, DBCtrls,
  EHintBal, fcButton, fcImgBtn, RxGrdCpt, fcImage, fcimageform, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmRegProced = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel5: TRxLabel;
    Image1: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel2: TRxLabel;
    dbPaciente: TDBEdit;
    RxLabel6: TRxLabel;
    dbProced: TRxDBLookupCombo;
    RxLabel1: TRxLabel;
    dbNumSes: TEvDBZeroEdit;
    RxLabel3: TRxLabel;
    dbSesAt: TEvDBZeroEdit;
    dbHora: TEvDBTimeEdit;
    RxLabel8: TRxLabel;
    procedure dbpacienteExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure fcImageBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegProced: TFrmRegProced;
  NovoItem:Boolean;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmRegProced.dbpacienteExit(Sender: TObject);
begin
dmdados.tbSessaoCodPac.value:=dmdados.tbPacienteCodPac.value;
end;

procedure TFrmRegProced.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.TbSessao.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TFrmRegProced.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbSessao.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbSessao.bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TFrmRegProced.BtnProximoClick(Sender: TObject);
begin
dmdados.tbSessao.next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbSessao.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TFrmRegProced.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbSessao.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TFrmRegProced.BtnNovoClick(Sender: TObject);
begin
dmdados.tbSessao.Append;
NovoItem:= True;
dmdados.vTabStt:= False;
{habilitando os bot�es}
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnDeletar.Enabled:=False;
dbData.Enabled:=true;
dbHora.Enabled:=true;
dbPaciente.Enabled:=true;
dbProced.Enabled:=true;
dbNumSes.Enabled:=true;
dbSesAt.Enabled:=true;
dbData.SetFocus;
end;

procedure TFrmRegProced.BtnGravarClick(Sender: TObject);
begin
DMDados.TbSessao.Post;
NovoItem:=False;
dmdados.vTabStt:= True;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
Btndeletar.Enabled:=True;
dbData.Enabled:=true;
dbHora.Enabled:=false;
dbPaciente.Enabled:=false;
dbProced.Enabled:=false;
dbNumSes.Enabled:=false;
dbSesAt.Enabled:=false;
end;

procedure TFrmRegProced.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
dmdados.vTabStt:= True;
DMDados.tbSessao.Cancel;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnDeletar.Enabled:=True;
dbHora.Enabled:=false;
dbPaciente.Enabled:=false;
dbProced.Enabled:=false;
dbNumSes.Enabled:=false;
dbSesAt.Enabled:=false;
end;

procedure TFrmRegProced.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbSessao.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
   begin
   If Application.MessageBox('Tem certeza que deseja excluir esteregistro ?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      dmdados.tbSessao.Delete;
      dmdados.tbSessao.Refresh;
      end
   else
      DMDados.tbSessao.cancel;
   end;
end;

procedure TFrmRegProced.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRegProced.fcImageBtn6Click(Sender: TObject);
begin
DMDados.TbSessao.Post;
NovoItem:=False;
dmdados.vTabStt:= True;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
Btndeletar.Enabled:=True;
dbData.Enabled:=true;
dbHora.Enabled:=false;
dbPaciente.Enabled:=false;
dbProced.Enabled:=false;
dbNumSes.Enabled:=false;
dbSesAt.Enabled:=false;
end;

end.
