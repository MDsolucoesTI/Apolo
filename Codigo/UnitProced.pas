//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, Grids, DBGrids, SpeedBar, jpeg,
  ExtCtrls, RackCtls, fcButton, fcImgBtn, RXSplit, RXCtrls , dbtables , db,
  RxGrdCpt, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmProced = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel3: TRxLabel;
    Image2: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnSair: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    BtnGravar: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel1: TRxLabel;
    dbCodigo: TDBEdit;
    RxLabel2: TRxLabel;
    dbProced: TDBEdit;
    DBGridProc: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure dbProcedExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProced: TFrmProced;
  NovoItem,mudar:boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmProced.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmProced.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProced.dbProcedExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.Tbproced.DatabaseName;
  Tabela.TableName := dmDados.Tbproced.TableName;
  Tabela.IndexName := dmdados.Tbproced.IndexName;
  Tabela.Open;
  If NovoItem Then
    If dbproced.Text = '' Then
      Begin
      ShowMessage('� necess�rio Informar o PROCEDIMENTO');
      Dbproced.setfocus;
      end
    Else
      Begin
      If Tabela.Locate('PROCEDIMENTO',dbproced.Text,[]) Then
        If (DmDados.tbproced.State=dsEdit) And (dmDados.tbproced.RecNo = Tabela.RecNo) Then
          begin
          (Sender as TDbEdit).Color:=clwindow;
          btnGravar.Default:=True;
          btnGravar.SetFocus;
          end
        Else
          Begin
          Showmessage('PROCEDIMENTO j� Cadastrado');
          dbproced.Clear;
          dbproced.setfocus;
          End
      Else
        begin
        btnGravar.Default:=True;
        btnGravar.SetFocus;
        end;
      End;
  Tabela.Free;
end;

procedure TFrmProced.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbProced.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
//  dmdados.vTabStt:=true;

end;

procedure TFrmProced.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbproced.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.Tbproced.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
//  dmdados.vTabStt:=true;

end;

procedure TFrmProced.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbproced.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.Tbproced.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
//  dmdados.vTabStt:=true;

end;

procedure TFrmProced.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbproced.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
// dmdados.vTabStt:=true;

end;

procedure TFrmProced.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbproced.append;
  NovoItem:= True;
  dmdados.vTabStt:=False;
  Mudar:=False;
  btnGravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  //Habilitando os componentes
  Dbproced.enabled:=True;
  DBGridproc.Enabled:=False;
  dbproced.SetFocus;

end;

procedure TFrmProced.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbproced.cancel;
  dmdados.vTabStt:=true;
  NovoItem:= False;
  Mudar:=False;
  btnGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnNovo.Enabled:=True;
  //Habilitando os componentes
  Dbproced.enabled:=false;
end;

procedure TFrmProced.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbproced.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    Mudar:=True;
    dmdados.tbproced.Edit;
    dbproced.Enabled:=True;
    btnGravar.Enabled:=True;
    btnCancelar.Enabled:=true;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    BtnNovo.Enabled:=False;
    end;
end;

procedure TFrmProced.BtnDeletarClick(Sender: TObject);
var
   flag : boolean;
Begin
  NovoItem:=False;
  dmdados.vTabStt:= true;
  flag := false;
  if dmdados.tbproced.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
        dmdados.Tbproced.Delete;
      end
    else
      dmdados.tbproced.cancel;
end;

procedure TFrmProced.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmProced.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

end.
