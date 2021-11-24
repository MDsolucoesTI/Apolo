//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDesmHor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg, ToolEdit,
  RXDBCtrl, fcButton, fcImgBtn, Mask, RXCtrls;

type
  TFrmDesmHor = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel7: TRxLabel;
    dbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbCel: TDBEdit;
    cmbConv: TDBLookupComboBox;
    dbData: TDBDateEdit;
    cmbTipo: TDBComboBox;
    dbHora: TDBEdit;
    cmbLkPac: TDBLookupComboBox;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnConfirmar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    dbObs: TDBMemo;
    Panel2: TPanel;
    Image2: TImage;
    db: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesmHor: TFrmDesmHor;

implementation

{$R *.dfm}

procedure TFrmDesmHor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmDesmHor.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
