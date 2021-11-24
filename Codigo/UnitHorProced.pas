//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitHorProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EDBFind, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg,
  ToolEdit, RXDBCtrl, fcButton, fcImgBtn, Mask, RXCtrls;

type
  TFrmHorProced = class(TForm)
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
    btnLocPaciente: TfcImageBtn;
    dbData: TDBDateEdit;
    cmbTipo: TDBComboBox;
    dbHora: TDBEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    Image2: TImage;
    db: TLabel;
    cmbLkPac: TEvDBFind;
    EvDBFind1: TEvDBFind;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocPacienteClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHorProced: TFrmHorProced;

implementation

uses UnitCadPaciente;

{$R *.dfm}

procedure TFrmHorProced.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmHorProced.btnLocPacienteClick(Sender: TObject);
begin
FrmCadPaciente:=TFrmcadPaciente.create(application);
FrmCadPaciente.Showmodal;
end;

procedure TFrmHorProced.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
