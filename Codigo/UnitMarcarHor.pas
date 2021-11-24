//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitMarcarHor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls,
  SpeedBar, jpeg, fcButton, fcImgBtn, Animate, GIFCtrl, ToolEdit, RXDBCtrl;

type
  TFrmMarcarHor = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    RxLabel2: TRxLabel;
    Panel2: TPanel;
    Image2: TImage;
    db: TLabel;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    RxLabel6: TRxLabel;
    cmbConv: TDBLookupComboBox;
    btnLocPaciente: TfcImageBtn;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    cmbTipo: TDBComboBox;
    dbHora: TDBEdit;
    cmbLkPac: TDBLookupComboBox;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    RxLabel7: TRxLabel;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbNomeEnter(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure dbTel1Enter(Sender: TObject);
    procedure dbTel1Exit(Sender: TObject);
    procedure dbTel2Enter(Sender: TObject);
    procedure dbTel2Exit(Sender: TObject);
    procedure dbCelEnter(Sender: TObject);
    procedure dbCelExit(Sender: TObject);
    procedure cmbConvEnter(Sender: TObject);
    procedure cmbConvExit(Sender: TObject);
    procedure cmbPlanoEnter(Sender: TObject);
    procedure cmbPlanoExit(Sender: TObject);
    procedure btnLocPacienteClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarcarHor: TFrmMarcarHor;

implementation

uses UnitCadPaciente, UnitLocaPac, UnitAgenda, UnitDmdados;

{$R *.dfm}

procedure TFrmMarcarHor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmMarcarHor.fcImageBtn1Click(Sender: TObject);
begin
FrmCadPaciente:=TFrmCadPaciente.create(application);
FrmCadPaciente.Showmodal;
end;

procedure TFrmMarcarHor.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMarcarHor.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmMarcarHor.dbNomeEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmMarcarHor.dbNomeExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmMarcarHor.dbTel1Enter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmMarcarHor.dbTel1Exit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmMarcarHor.dbTel2Enter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmMarcarHor.dbTel2Exit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmMarcarHor.dbCelEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmMarcarHor.dbCelExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmMarcarHor.cmbConvEnter(Sender: TObject);
begin
(Sender as TDBLookupComboBox).color:=$00d2e2ff;
end;

procedure TFrmMarcarHor.cmbConvExit(Sender: TObject);
begin
(Sender as TDBLookupComboBox).color:=clwindow;
end;

procedure TFrmMarcarHor.cmbPlanoEnter(Sender: TObject);
begin
(Sender as TDBLookupComboBox).color:=$00d2e2ff;
end;

procedure TFrmMarcarHor.cmbPlanoExit(Sender: TObject);
begin
(Sender as TDBLookupComboBox).color:=clwindow;
end;

procedure TFrmMarcarHor.btnLocPacienteClick(Sender: TObject);
begin
FrmCadPaciente:=TFrmCadPaciente.create(application);
FrmCadPaciente.Showmodal;
end;

procedure TFrmMarcarHor.BtnGravarClick(Sender: TObject);
var
  linha:integer;
begin
  linha:=FrmAgenda.StringAgenda.Row;
  FrmAgenda.StringAgenda.Cells[1,linha]:='Teste';
  FrmAgenda.StringAgenda.FontColors[1,linha]:=clRed;
  close;
end;

end.
