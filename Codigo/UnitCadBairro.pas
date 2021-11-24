//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls, SpeedBar,
  jpeg, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  fcButton, fcImgBtn, DB, DBTables, RxGrdCpt, fcImage, fcimageform,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadBairro = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    dbNome: TDBEdit;
    RxLabel2: TRxLabel;
    LMDBackPanel3: TLMDBackPanel;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    procedure btnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Bairr:longint;
  public
    { Public declarations }
    Property Bairro:longint read Bairr write Bairr ;
  end;

var
  FrmCadBairro: TFrmCadBairro;
  NovoItem, Mudar:Boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadBairro.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  Tabela := TTable.Create(Application);
	If dbNome.Text='' Then
  	Begin
	  ShowMessage('O Campo BAIRRO n�o tem Valor!');
	  dbNome.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.tbBairro.DatabaseName;
    Tabela.TableName := dmDados.TbBairro.TableName;
    Tabela.Open;
    If Tabela.Locate('BAIRRO',dbNome.Text,[]) Then
      Begin
      Showmessage('BAIRRO j� Cadastrado!!');
      dbNome.Clear;
      dbNome.setfocus;
      End
    else
      Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
	  Begin
    dmdados.tbBairro.Post;
    NovoItem:=False;
    btngravar.Enabled:=False;
    dbNome.Enabled:=False;
    bairro:=dmdados.TbBairroCodBairro.value;
    close;
  	End;
End;

procedure TFrmCadBairro.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbBairro.cancel;
{Desabilitando os Bot�es}
btngravar.Enabled:=false;
BtnCancelar.Enabled := false;
dbNome.Enabled:=False;
close;
end;

procedure TFrmCadBairro.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.tbBairro.append;
  btngravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  {Habilitando os componentes}
  DbNome.enabled:=True;
  dbNome.SetFocus;
end;


procedure TFrmCadBairro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
end;

procedure TFrmCadBairro.FormKeyDown(Sender: TObject; var Key: Word;
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
