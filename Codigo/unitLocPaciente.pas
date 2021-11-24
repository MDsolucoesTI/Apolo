//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocPaciente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, fcImage,
  fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmLocPaciente = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image2: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel3: TRxLabel;
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    RxLabel1: TRxLabel;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton2: TLEDButton;
    fclLocCli: TfcImageBtn;
    fclSair: TfcImageBtn;
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure fclLocCliClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);

  private
    { Private declarations }
     fresultado : longint;
        nomeCli : string;
        rest    : string;
        fcpf    : string;
  public
    { Public declarations }
     Property Resultado:longint Read Fresultado Write Fresultado;
     Property Nome : string Read  NomeCli Write NomeCli;
     Property Restricao : string Read rest Write rest;
     Property CPF : string read fcpf write fcpf;
  end;

var
  FrmLocPaciente: TFrmLocPaciente;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
  NomeTab, CpfTab, CnpjTab : String;
  CodTab : LongInt;
  VerTipo : Char;

implementation

uses UnitDmdados, unitPrincipal ;

{$R *.DFM}

procedure TFrmLocPaciente.EdtValorExit(Sender: TObject);
begin
  fclLocCli.Default:= True;
  fclLocCli.SetFocus;
end;

procedure TFrmLocPaciente.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.TbPacienteCodPac.Value;
  nome:=dmdados.tbpacientenome.Value;
  CPF:=dmdados.TbPacienteCpf.value;
  Close;
end;

procedure TFrmLocPaciente.CmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  PorCPF:= False;

  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodPac';

    End
  Else if cmbcampo.text = 'Nome' then
    Begin
    VerTipo:='K';
    PorNome:=True;
    edtCampo.Text:='Nome';
    End
  Else if cmbcampo.text = 'CPF' then
    Begin
    VerTipo:='K';
    PorCpf:=True;
    edtCampo.Text:='CPF';
    End;
end;

procedure TFrmLocPaciente.fclLocCliClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  fclLocCli.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.tbpaciente.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.TbPacienteNome .Value;
    If PorCod Then
      CodTab:=dmDados.TbPacienteCodPac .Value;
    If PorCpf Then
      CpfTab:=dmDados.TbPacienteCpf .Value;
    End;
  Cmbcampo.SetFocus;
end;

procedure TFrmLocPaciente.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME, CPF  : string;
  CODIGO : longInt;
begin
  NOME := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Codpac').asInteger;
  CPF :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cpf').asString;
  if cor then
    begin
    If PorNome Then
      If NOME = NomeTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
    If PorCpf Then
      If CPF = cPFTab Then
        background:=$00D2E2FF;
    end;
end;

procedure TFrmLocPaciente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TFrmLocPaciente.FormShow(Sender: TObject);
begin
//  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [ESC] Sai');
end;

procedure TFrmLocPaciente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocPaciente.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocPaciente.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
