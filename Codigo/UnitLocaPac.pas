//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocaPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, StdCtrls, jpeg, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  RackCtls, fcButton, fcImgBtn, RXCtrls;

type
  TFrmLocPac = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    fclSair: TfcImageBtn;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocPac: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel15: TRxLabel;
    cmbCampo: TComboBox;
    DbGridPac: TRxDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fclSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCampoEnter(Sender: TObject);
    procedure cmbCampoExit(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocPac: TFrmLocPac;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmLocPac.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmLocPac.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLocPac.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmLocPac.cmbCampoEnter(Sender: TObject);
begin
(Sender as TComboBox).color:=$00d2e2ff;
end;

procedure TFrmLocPac.cmbCampoExit(Sender: TObject);
begin
(Sender as TComboBox).color:=clwindow;
end;

procedure TFrmLocPac.EdtValorExit(Sender: TObject);
begin
(Sender as TEdit).color:=clwindow;
end;

procedure TFrmLocPac.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).color:=$00d2e2ff;
end;

end.
