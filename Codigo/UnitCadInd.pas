//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadInd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, RackCtls, ExtCtrls, SpeedBar,
  jpeg, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  fcButton, fcImgBtn,dbTables,db,dbutils, RxGrdCpt, fcImage, fcimageform,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadInd = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image2: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    LMDBackPanel3: TLMDBackPanel;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    findicacao:longint;
  public
    { Public declarations }
    Property Indicacao:longint read findicacao write findicacao ;
  end;

var
  FrmCadInd: TFrmCadInd;
  NovoItem:boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadInd.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=false;
  Tabela := TTable.Create(Application);
	If dbNome.Text='' Then
  	Begin
	  ShowMessage('O Campo NOME n�o tem Valor!');
	  dbNome.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.TbIndicacao.DatabaseName;
    Tabela.TableName := dmDados.TbIndicacao.TableName;
    Tabela.Open;
    If Tabela.Locate('Indicacao',dbNome.Text,[]) Then
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
    dmdados.tbIndicacao.Post;
    NovoItem:=False;
    btngravar.Enabled:=False;
    dbNome.Enabled:=False;
    Indicacao:=dmdados.TbIndicacaoCodIndic.value;
    close;
  	End;
End;

procedure TFrmCadInd.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbIndicacao.cancel;
  NovoItem:= False;
  {Desabilitando os Bot�es}
  btngravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  dbNome.Enabled:=False;
  close;

end;

procedure TFrmCadInd.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.TbIndicacao.Append;
  NovoItem:=true;
  dbnome.SetFocus;
end;

procedure TFrmCadInd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmCadInd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : btnGravar.Click;
    end;
end;

end.
