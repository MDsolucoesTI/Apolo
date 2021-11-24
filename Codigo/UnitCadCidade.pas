//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls, SpeedBar,
  jpeg, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  fcButton, fcImgBtn, dbtables,db,dbutils, RxGrdCpt, fcImage, fcimageform,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadCidade = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel3: TLMDBackPanel;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fcidade:longint;
  public
    { Public declarations }
    Property Cidade:longint read fcidade write fcidade;
  end;

var
  FrmCadCidade: TFrmCadCidade;
  NovoItem:boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadCidade.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCidade.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  Tabela := TTable.Create(Application);
	If dbNome.Text='' Then
  	Begin
	  ShowMessage('O Campo CIDADE n�o tem Valor!');
	  dbNome.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.TbCidade.DatabaseName;
    Tabela.TableName := dmDados.TbCidade.TableName;
    Tabela.Open;
    If Tabela.Locate('CIDADE',dbNome.Text,[]) Then
      Begin
      Showmessage('CIDADE j� Cadastrada!!');
      dbNome.Clear;
      dbNome.setfocus;
      End
    else
      Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
	  Begin
    dmdados.tbCidade.Post;
    NovoItem:=False;
    btngravar.Enabled:=False;
    dbNome.Enabled:=False;
    cidade:=dmdados.TbCidadeCodCidade.value;
    close;
  	End;
end;

procedure TFrmCadCidade.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbCidade.cancel;
  NovoItem:= False;
  {Desabilitando os Bot�es}
  btngravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  dbNome.Enabled:=False;
  close;
end;


procedure TFrmCadCidade.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.TbCidade.Append;
  NovoItem:=true;
  dbnome.SetFocus;

end;

procedure TFrmCadCidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : btnCancelar.Click;
      Vk_END    : btnGravar.Click;
    end;
end;


end.
