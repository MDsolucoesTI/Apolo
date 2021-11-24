//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadProf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls, SpeedBar,
  jpeg, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  fcButton, fcImgBtn , dbtables , db , dbutils, RxGrdCpt, fcImage,
  fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadProf = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image3: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    LMDBackPanel3: TLMDBackPanel;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    dbNome: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fprofissao:longint;
  public
    { Public declarations }
    Property Profissao:longint read fprofissao write fprofissao;
  end;

var
  FrmCadProf: TFrmCadProf;
  NovoItem:boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadProf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmCadProf.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  Tabela := TTable.Create(Application);
	If dbNome.Text='' Then
  	Begin
	  ShowMessage('O Campo NOME n�o tem Valor!');
	  dbNome.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.TbProfissao.DatabaseName;
    Tabela.TableName := dmDados.TbProfissao.TableName;
    Tabela.Open;
    If Tabela.Locate('PROF',dbNome.Text,[]) Then
      Begin
      Showmessage('NOME j� Cadastrado!!');
      dbNome.Clear;
      dbNome.setfocus;
      End
    else
      Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
	  Begin
    dmdados.tbProfissao.Post;
    NovoItem:=False;
    dmdados.vTabStt:= True;
    btngravar.Enabled:=False;
    dbNome.Enabled:=False;
    profissao:=dmdados.TbProfissaoCodProf.value;
    close;
  	End;
End;


procedure TFrmCadProf.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbProfissao.cancel;
  NovoItem:= False;
  dmdados.vTabStt:= True;
  {Desabilitando os Bot�es}
  btngravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  dbNome.Enabled:=False;
  close;

end;

procedure TFrmCadProf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END     : btnGravar.Click;
    end;
end;

procedure TFrmCadProf.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.TbProfissao.Append;
  NovoItem:=true;
  dbnome.SetFocus;
end;

end.
