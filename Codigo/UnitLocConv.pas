//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocConv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, fcImage,
  fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmLocConv = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel3: TRxLabel;
    cmbCampo: TComboBox;
    RxLabel1: TRxLabel;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton2: TLEDButton;
    btnLocConv: TfcImageBtn;
    DbGridConv: TRxDBGrid;
    btnSair: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure btnLocConvClick(Sender: TObject);
    procedure cmbCampoExit(Sender: TObject);
    procedure DbGridConvGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocConv: TFrmLocConv;
  verTipo : char;
  LocOpts : TLocateOptions;
  cor, PorDesc, PorCod : boolean;
  descTab : string;
  codTab : integer;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmLocConv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmLocConv.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLocConv.EdtValorExit(Sender: TObject);
begin
  btnLocConv.Default:= True;
  btnLocConv.SetFocus;
end;

procedure TFrmLocConv.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocConv.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocConv.btnLocConvClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  btnLocConv.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.tbConvenio.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorDesc Then
      DescTab:=dmDados.TbConvenioDesc .Value;
    If PorCod Then
      CodTab:=dmDados.TbConvenioCodConv .Value;
   Cmbcampo.SetFocus;
   end;
end;

procedure TFrmLocConv.cmbCampoExit(Sender: TObject);
begin
  PorDesc:=False;
  PorCod:=False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodConv';
    End;
  if cmbcampo.text = 'Descri��o' then
    Begin
    VerTipo:='K';
    PorDesc:=True;
    edtCampo.Text:='Desc';
    End;

end;


procedure TFrmLocConv.DbGridConvGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  var
  desc  : string;
  CODIGO : longInt;
  begin
  desc := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Desc').asString;
  codigo :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodConv').asInteger;
  if cor then
    begin
    If PorDesc Then
      If desc = descTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
    end;
end;

procedure TFrmLocConv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    btnSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

end.
