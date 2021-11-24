//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls, SpeedBar,
  jpeg, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  fcButton, fcImgBtn , dbtables , db , dbutils, RxGrdCpt, fcImage,
  fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadEnd = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel10: TRxLabel;
    Image1: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fendereco:longint;
  public
    { Public declarations }
    Property endereco:longint read fendereco write fendereco;
  end;

var
  FrmCadEnd: TFrmCadEnd;
  NovoItem:boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadEnd.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=false;
  Tabela := TTable.Create(Application);
	If dbNome.Text='' Then
  	Begin
	  ShowMessage('O Campo ENDERE�O n�o tem Valor!');
	  dbNome.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.TbEndereco.DatabaseName;
    Tabela.TableName := dmDados.TbEndereco.TableName;
    Tabela.Open;
    If Tabela.Locate('END',dbNome.Text,[]) Then
      Begin
      Showmessage('ENDERE�O j� Cadastrado!!');
      dbNome.Clear;
      dbNome.setfocus;
      End
    else
      Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
	  Begin
    dmdados.tbEndereco.Post;
    NovoItem:=False;
    btngravar.Enabled:=False;
    dbNome.Enabled:=False;
    endereco:=dmdados.TbEnderecoCodEnd.value;
    close;
  	End;
End;

procedure TFrmCadEnd.btncancelarClick(Sender: TObject);
begin
  dmdados.TbEndereco.cancel;
  NovoItem:= False;
  {Desabilitando os Bot�es}
  btngravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  dbNome.Enabled:=False;
close;

end;

procedure TFrmCadEnd.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.TbEndereco.Append;
  NovoItem:=true;
  dbnome.SetFocus;
end;

procedure TFrmCadEnd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END     : btnGravar.Click;
    end;
end;

procedure TFrmCadEnd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

end.
